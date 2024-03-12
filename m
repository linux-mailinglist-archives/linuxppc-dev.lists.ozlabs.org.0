Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616A8798DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 17:23:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OW4iOzSu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvJpy2gF4z3vX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 03:23:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OW4iOzSu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvJpF3yJGz3cN9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 03:22:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 83ADFCE189A;
	Tue, 12 Mar 2024 16:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97175C433F1;
	Tue, 12 Mar 2024 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710260560;
	bh=Ipf9zvhfvGw0qCLSPFs+Ov5pJgxtwIC4HDz+MvRXcl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OW4iOzSuv4zzNFrLCz3VFKXt6F0ivI5jn4vCa1mqs2H6hgz2795jLI6HYxlb64Fwp
	 nkbwtAtOuyivEwR1x8+/ZzmhqijkPRkUFUQeov6NPZy1axHDC8QpnbQEBsvpq95PWD
	 beuftpHwgPAQ+PXkbHtiPZcRr5HxAhqF8xwJzJEEENED2oo+oooatgb8CrRr6+Njnu
	 luU0iIyj6rtK/80WTEqIicYC4BdtDnpsGaySgtRRRVtawTW0siGOAEnBGEWCwlxMjX
	 lFaFzgKirwKjAKcR46cYWc7zxjB6hRfIseNIVtwtdVDBNdZ3GzCS7VnrBea0SZU9zL
	 C9OvBJqVWR7wA==
Date: Tue, 12 Mar 2024 10:22:38 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Message-ID: <20240312162238.GA2308643-robh@kernel.org>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
 <87jzmenx2c.fsf@mail.lhotse>
 <20240307215214.GB3110385-robh@kernel.org>
 <851536a5-ad8f-4d65-8c33-707e2fe762df@linux.ibm.com>
 <20240308205751.GA1249866-robh@kernel.org>
 <87a5n34u5p.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5n34u5p.fsf@mail.lhotse>
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
Cc: rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 09:32:50PM +1100, Michael Ellerman wrote:
> Rob Herring <robh@kernel.org> writes:
> > On Fri, Mar 08, 2024 at 07:23:35AM -0500, Stefan Berger wrote:
> >> On 3/7/24 16:52, Rob Herring wrote:
> >> > On Thu, Mar 07, 2024 at 09:41:31PM +1100, Michael Ellerman wrote:
> >> > > Stefan Berger <stefanb@linux.ibm.com> writes:
> >> > > > linux,sml-base holds the address of a buffer with the TPM log. This
> >> > > > buffer may become invalid after a kexec and therefore embed the whole TPM
> >> > > > log in linux,sml-log. This helps to protect the log since it is properly
> >> > > > carried across a kexec with both of the kexec syscalls.
> >> > > > 
> >> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> > > > ---
> >> > > >   arch/powerpc/kernel/prom_init.c | 8 ++------
> >> > > >   1 file changed, 2 insertions(+), 6 deletions(-)
> >> > > > 
> >> 
> >> > 
> >> > 
> >> > > Also adding the new linux,sml-log property should be accompanied by a
> >> > > change to the device tree binding.
> >> > > 
> >> > > The syntax is not very obvious to me, but possibly something like?
> >> > > 
> >> > > diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> >> > > index 50a3fd31241c..cd75037948bc 100644
> >> > > --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> >> > > +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> >> > > @@ -74,8 +74,6 @@ required:
> >> > >     - ibm,my-dma-window
> >> > >     - ibm,my-drc-index
> >> > >     - ibm,loc-code
> >> > > -  - linux,sml-base
> >> > > -  - linux,sml-size
> >> > 
> >> > Dropping required properties is an ABI break. If you drop them, an older
> >> > OS version won't work.
> >> 
> >> 1) On PowerVM and KVM on Power these two properties were added in the Linux
> >> code. I replaced the creation of these properties with creation of
> >> linux,sml-log (1/2 in this series). I also replaced the handling of
> >> these two (2/2 in this series) for these two platforms but leaving it for
> >> powernv systems where the firmware creates these.
> >
> > Okay, I guess your case is not a ABI break if the kernel is populating 
> > it and the same kernel consumes it. 
> >
> > You failed to answer my question on using /reserved-memory. Again, why 
> > can't that be used? That is the standard way we prevent chunks of memory 
> > from being clobbered.
> 
> Yes I think that would mostly work. I don't see support for
> /reserved-memory in kexec-tools, so that would need fixing I think.
> 
> My logic was that the memory is not special. It's just a buffer we
> allocated during early boot to store the log. There isn't anything else
> in the system that relies on that memory remaining untouched. So it
> seemed cleaner to just put the log in the device tree, rather than a
> pointer to it.

My issue is we already have 2 ways to describe the log to the OS. I 
don't see a good reason to add a 3rd way. (Though it might actually be a 
4th way, because the chosen property for the last attempt was accepted 
to dtschema yet the code has been abandoned.)

If you put the log into the DT, then the memory for the log remains 
untouched too because the FDT remains untouched. For reserved-memory 
regions, the OS is free to free them if it knows what the region is and 
that it is no longer needed. IOW, if freeing the log memory is desired, 
then the suggested approach doesn't work.

> 
> Having the log external to the device tree creates several problems,
> like the crash kernel region colliding with it, it being clobbered by
> kexec, etc.

We have multiple regions to pass/maintain thru kexec, so how does having 
one less really matter?

Rob
