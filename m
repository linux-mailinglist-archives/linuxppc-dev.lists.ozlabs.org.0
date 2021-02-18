Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 455A831F312
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 00:29:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhWBF2QZJz30j1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 10:29:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MWJn7fTB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MWJn7fTB; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhW9q2ZmDz30GZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 10:28:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhW9p4XL0z9sRf;
 Fri, 19 Feb 2021 10:28:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613690926;
 bh=D32VQYe7TeZriP6FVSqNq/sNmMNac+rakTOCN0D48VM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=MWJn7fTBHjA4tuIUkAcAOgbOBj7PBPHMOw5sJUiJZx97FE4+LjwAPrckH9YskJEg9
 wgXkR71nvnV71clrFRA8gtIb+fMgvvrhu5m0p2jv6eSEFUJcXqPNnVTLdf0ncbywdI
 KYOwufP4ibYlBPkEIDEcpCM07l8dGf4xFdo693XiwHdKYgzIG7UyJJKvSJhzDq/B0D
 R8y1Ej8vDx0ZZyS12rf+OE0nyxJ+498bKTvOc/bT7rVtgetAWrYgPTRGezgqtehMvz
 ejEWMoP7sEJiG5nZEAeECljfL6qYrLRQnYF81ldXX09egwNUHMMuyzrYelFLrf6X4K
 TlM7ZPUTbuamA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robherring2@gmail.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
In-Reply-To: <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
References: <20210218144815.5673ae6f@canb.auug.org.au>
 <874ki9vene.fsf@mpe.ellerman.id.au>
 <20210218223427.77109d83@canb.auug.org.au>
 <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
Date: Fri, 19 Feb 2021 10:28:46 +1100
Message-ID: <87r1ldt0pd.fsf@mpe.ellerman.id.au>
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robherring2@gmail.com> writes:
> On Thu, Feb 18, 2021 at 5:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >
>> > I think it just needs this?
>> >
>> > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> > index 87e34611f93d..0492ca6003f3 100644
>> > --- a/arch/powerpc/kexec/elf_64.c
>> > +++ b/arch/powerpc/kexec/elf_64.c
>> > @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>> >
>> >       fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
>> >                                          initrd_len, cmdline,
>> > -                                        fdt_totalsize(initial_boot_params));
>> > +                                        kexec_fdt_totalsize_ppc64(image));
>> >       if (!fdt) {
>> >               pr_err("Error setting up the new device tree.\n");
>> >               ret = -EINVAL;
>> >
>>
>> I thought about that, but the last argument to
>> of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
>> done is for this:
>>
>> fdt_size = fdt_totalsize(initial_boot_params) +
>>                    (cmdline ? strlen(cmdline) : 0) +
>>                    FDT_EXTRA_SPACE +
>>                    extra_fdt_size;
>>
>> and kexec_fdt_totalsize_ppc64() also includes
>> fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
>> kexec_fdt_totalsize_ppc64() needs modification as well?
>
> You're both right. Michael's fix is sufficient for the merge. The only
> risk with a larger size is failing to allocate it, but we're talking
> only 10s of KB. Historically until the commit causing the conflict,
> PPC was just used 2x fdt_totalsize(initial_boot_params). You could
> drop 'fdt_size = fdt_totalsize(initial_boot_params) + (2 *
> COMMAND_LINE_SIZE);' from kexec_fdt_totalsize_ppc64() as well, but
> then the function name is misleading.
>
> Lakshmi can send a follow-up patch to fine tune the size and rename
> kexec_fdt_totalsize_ppc64.

Sounds good.

cheers
