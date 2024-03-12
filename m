Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B35879214
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 11:33:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WhjR2Xpx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv93G1fGhz3dV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 21:33:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WhjR2Xpx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv92X4rV0z3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 21:32:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710239571;
	bh=WAJdAg2kSVxd3biZa1Q3GiQlxvq8aCBQjEnXtrdMZQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WhjR2XpxEiPKrQ1UxYUIKDVVtrEY/A16XeUHH+p3tVkIPYZbSPSK7huCOZ9+EGJrn
	 jmmBglW76EAQAZA0xMrdgDmIsfa7yJuLAhdZ4QjZXTuYz6VdgH0pQipie0omSQtxi3
	 x0OIJJhmBV1opHy0gGEjVxsiPU5Jz2Cmnu8bJ7d2HyT/sVcCWrZB4t+jwDCorJ/Z7g
	 Uq0eSwfQ4vOLUiMhEG5uX0nWXbzcfKfjE5DJA+PEHbyCPfhMCkz1u54ZfiRFBIN3tS
	 QSJqAF3zo/BRQ3x+xIdcnEKIFkh31tl6eZziDO+eCpeXZtS/mbdIf6EcPtKcnImw6k
	 DwgrCoGA7JCEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tv92W2Nl8z4wcq;
	Tue, 12 Mar 2024 21:32:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
In-Reply-To: <20240308205751.GA1249866-robh@kernel.org>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
 <87jzmenx2c.fsf@mail.lhotse> <20240307215214.GB3110385-robh@kernel.org>
 <851536a5-ad8f-4d65-8c33-707e2fe762df@linux.ibm.com>
 <20240308205751.GA1249866-robh@kernel.org>
Date: Tue, 12 Mar 2024 21:32:50 +1100
Message-ID: <87a5n34u5p.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Rob Herring <robh@kernel.org> writes:
> On Fri, Mar 08, 2024 at 07:23:35AM -0500, Stefan Berger wrote:
>> On 3/7/24 16:52, Rob Herring wrote:
>> > On Thu, Mar 07, 2024 at 09:41:31PM +1100, Michael Ellerman wrote:
>> > > Stefan Berger <stefanb@linux.ibm.com> writes:
>> > > > linux,sml-base holds the address of a buffer with the TPM log. This
>> > > > buffer may become invalid after a kexec and therefore embed the whole TPM
>> > > > log in linux,sml-log. This helps to protect the log since it is properly
>> > > > carried across a kexec with both of the kexec syscalls.
>> > > > 
>> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> > > > ---
>> > > >   arch/powerpc/kernel/prom_init.c | 8 ++------
>> > > >   1 file changed, 2 insertions(+), 6 deletions(-)
>> > > > 
>> 
>> > 
>> > 
>> > > Also adding the new linux,sml-log property should be accompanied by a
>> > > change to the device tree binding.
>> > > 
>> > > The syntax is not very obvious to me, but possibly something like?
>> > > 
>> > > diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
>> > > index 50a3fd31241c..cd75037948bc 100644
>> > > --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
>> > > +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
>> > > @@ -74,8 +74,6 @@ required:
>> > >     - ibm,my-dma-window
>> > >     - ibm,my-drc-index
>> > >     - ibm,loc-code
>> > > -  - linux,sml-base
>> > > -  - linux,sml-size
>> > 
>> > Dropping required properties is an ABI break. If you drop them, an older
>> > OS version won't work.
>> 
>> 1) On PowerVM and KVM on Power these two properties were added in the Linux
>> code. I replaced the creation of these properties with creation of
>> linux,sml-log (1/2 in this series). I also replaced the handling of
>> these two (2/2 in this series) for these two platforms but leaving it for
>> powernv systems where the firmware creates these.
>
> Okay, I guess your case is not a ABI break if the kernel is populating 
> it and the same kernel consumes it. 
>
> You failed to answer my question on using /reserved-memory. Again, why 
> can't that be used? That is the standard way we prevent chunks of memory 
> from being clobbered.

Yes I think that would mostly work. I don't see support for
/reserved-memory in kexec-tools, so that would need fixing I think.

My logic was that the memory is not special. It's just a buffer we
allocated during early boot to store the log. There isn't anything else
in the system that relies on that memory remaining untouched. So it
seemed cleaner to just put the log in the device tree, rather than a
pointer to it.

Having the log external to the device tree creates several problems,
like the crash kernel region colliding with it, it being clobbered by
kexec, etc.

cheers
