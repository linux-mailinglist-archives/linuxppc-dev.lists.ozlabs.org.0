Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F3876C17
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 21:58:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFgAlLmb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trz6N3Gyvz3vcc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 07:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EFgAlLmb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trz5d2ZYcz3dWC
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 07:57:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E79A560DF9;
	Fri,  8 Mar 2024 20:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70676C433C7;
	Fri,  8 Mar 2024 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709931473;
	bh=soccycv4nLOig6ojnBJutZjg8TXzD0ylPNIS8YDUg8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFgAlLmbkGzlO7Eiscu5ySX+Mzfw8MhP+ePPoduF2tExLlaGxE+mdwxke1Hd0CUAg
	 pPCN6ejVjo9ymHHVEdCHscbs9L1UxNWlD1Lq2Et7UP215IOcgG7qC2ZfPKFp33ry9a
	 xTZ1tP/kjLFbZxBEq6UVk2z8hGQf2W01lVR/gJ41Knr7ZpEyvHHIyHSaDZ0yBbWIqm
	 LZZEEFFIcusCCIH+E9DTWbxfw0fTeplNtbVn2FraC0lJKp8OUmL+9D2xCmaRsGUYFn
	 mRAy/ahjRnJMYzJ+wvOAIQmyfNGng78uV2u+RtBa99q6DQawtiF2R2YTb4tu+BmaDf
	 Usg3hv5re5k2Q==
Date: Fri, 8 Mar 2024 14:57:51 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Message-ID: <20240308205751.GA1249866-robh@kernel.org>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
 <87jzmenx2c.fsf@mail.lhotse>
 <20240307215214.GB3110385-robh@kernel.org>
 <851536a5-ad8f-4d65-8c33-707e2fe762df@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <851536a5-ad8f-4d65-8c33-707e2fe762df@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 08, 2024 at 07:23:35AM -0500, Stefan Berger wrote:
> 
> 
> On 3/7/24 16:52, Rob Herring wrote:
> > On Thu, Mar 07, 2024 at 09:41:31PM +1100, Michael Ellerman wrote:
> > > Stefan Berger <stefanb@linux.ibm.com> writes:
> > > > linux,sml-base holds the address of a buffer with the TPM log. This
> > > > buffer may become invalid after a kexec and therefore embed the whole TPM
> > > > log in linux,sml-log. This helps to protect the log since it is properly
> > > > carried across a kexec with both of the kexec syscalls.
> > > > 
> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > ---
> > > >   arch/powerpc/kernel/prom_init.c | 8 ++------
> > > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > > 
> 
> > 
> > 
> > > Also adding the new linux,sml-log property should be accompanied by a
> > > change to the device tree binding.
> > > 
> > > The syntax is not very obvious to me, but possibly something like?
> > > 
> > > diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > > index 50a3fd31241c..cd75037948bc 100644
> > > --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > > +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> > > @@ -74,8 +74,6 @@ required:
> > >     - ibm,my-dma-window
> > >     - ibm,my-drc-index
> > >     - ibm,loc-code
> > > -  - linux,sml-base
> > > -  - linux,sml-size
> > 
> > Dropping required properties is an ABI break. If you drop them, an older
> > OS version won't work.
> 
> 1) On PowerVM and KVM on Power these two properties were added in the Linux
> code. I replaced the creation of these properties with creation of
> linux,sml-log (1/2 in this series). I also replaced the handling of
> these two (2/2 in this series) for these two platforms but leaving it for
> powernv systems where the firmware creates these.

Okay, I guess your case is not a ABI break if the kernel is populating 
it and the same kernel consumes it. 

You failed to answer my question on using /reserved-memory. Again, why 
can't that be used? That is the standard way we prevent chunks of memory 
from being clobbered. There's already support for describing the TPM log 
that way anyways. The only reasoning I can see writing out a node for 
that is harder than just adding a property, but that's not a great 
argument IMO.


> 2) There is an example in the ibm,vtpm.yaml file that has both of these
> and the test case still passes the check when the two entries above are
> removed. I will post v2 with the changes to the DT bindings for
> linux,sml-log including an example for linux,sml-log. [The test cases fail,
> as expected, when an additional property is added, such as when
> linux,sml-base is added when linux,sml-log is there or linux,sml-log is
> added when linux,sml-base is there.]

Sure, removing a required property is never going to break the DT 
checks. What would break is a client (OS) version that only understands 
linux,sml-base and can no longer get the log assuming getting the log 
itself was required. 

Rob
