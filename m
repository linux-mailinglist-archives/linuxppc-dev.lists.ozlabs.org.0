Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA843A8ECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 04:24:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4TXZ2c4Mz3byg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 12:24:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bFttHDSY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bFttHDSY; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4TX31gldz3033
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 12:24:02 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4TWn4TqHz9sWX;
 Wed, 16 Jun 2021 12:23:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623810234;
 bh=P3MCetIfzZtPqhiTVaYvru4yq+FzxZnPf34lNt0JVNs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bFttHDSYDF8hs1GhcNrBuxC8r7YR1FbbNwSxkDAL7lQtIx4XxJMkGgJ7lrWjuZU9K
 hHlMI3fju9iswEdIjo7GjpwxP1Gj1Fm/KYx+39MCmWGuFbgefyJ9+AnXWm5Gf/e/WE
 A3rk+pmgQ4nYUF6AN4aESjVY9NcZzs/XD9grffQ9ZgTrSzGhxqLEc7HLOf2IyR5wUs
 BEgh91+kA9k66Ony2Qct/YJq45j32aDa0BAlicNYsFLF+qSWSLxNmpFtktw78LYU6u
 aLSqG0ucZiktlwstD97l1OxIipFzxib0Y/fOq3lYLMw7V3BV6g9i2RPMf7XTojDwDI
 6cNIWLPIEvGYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, nramas <nramas@linux.microsoft.com>
Subject: Re: [PATCH v19 05/13] of: Add a common kexec FDT setup function
In-Reply-To: <CAL_JsqJEucP043eViq0Y1kAeqWNTqP5fLjfjz7+ksYx7QP_V5w@mail.gmail.com>
References: <20210221174930.27324-1-nramas@linux.microsoft.com>
 <20210221174930.27324-6-nramas@linux.microsoft.com>
 <CAMuHMdVSuNS4edh-zM0_sbC0i1AAjQ9Y0n_8Mjz=3CALkW4pgg@mail.gmail.com>
 <CAL_JsqJ2x7zbyP3fAacdfHOWjCVjg6XhraV2YkoBJdZ2jXAMEA@mail.gmail.com>
 <54efb4fce5aac7efbd0b1b3885e9098b1d4ea745.camel@linux.microsoft.com>
 <CAL_JsqJEucP043eViq0Y1kAeqWNTqP5fLjfjz7+ksYx7QP_V5w@mail.gmail.com>
Date: Wed, 16 Jun 2021 12:23:44 +1000
Message-ID: <87y2basg27.fsf@mpe.ellerman.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, tao.li@vivo.com,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Will Deacon <will@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, James Morris <jmorris@namei.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, Greg KH <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Tue, Jun 15, 2021 at 10:13 AM nramas <nramas@linux.microsoft.com> wrote:
>>
>> On Tue, 2021-06-15 at 08:01 -0600, Rob Herring wrote:
>> > On Tue, Jun 15, 2021 at 6:18 AM Geert Uytterhoeven <
>> > geert@linux-m68k.org> wrote:
>> > >
>> > > > +void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>> > > > +                                  unsigned long
>> > > > initrd_load_addr,
>> > > > +                                  unsigned long initrd_len,
>> > > > +                                  const char *cmdline, size_t
>> > > > extra_fdt_size)
>> > > > +{
>> > > > +       /* Did we boot using an initrd? */
>> > > > +       prop = fdt_getprop(fdt, chosen_node, "linux,initrd-
>> > > > start", NULL);
>> > > > +       if (prop) {
>> > > > +               u64 tmp_start, tmp_end, tmp_size;
>> > > > +
>> > > > +               tmp_start = fdt64_to_cpu(*((const fdt64_t *)
>> > > > prop));
>> > > > +
>> > > > +               prop = fdt_getprop(fdt, chosen_node,
>> > > > "linux,initrd-end", NULL);
>> > > > +               if (!prop) {
>> > > > +                       ret = -EINVAL;
>> > > > +                       goto out;
>> > > > +               }
>> > > > +
>> > > > +               tmp_end = fdt64_to_cpu(*((const fdt64_t *)
>> > > > prop));
>> > >
>> > > Some kernel code assumes "linux,initrd-{start,end}" are 64-bit,
>> > > other code assumes 32-bit.
>> >
>> > It can be either. The above code was a merge of arm64 and powerpc >> > both
>> > of which use 64-bit and still only runs on those arches. It looks >> > like
>> > some powerpc platforms may use 32-bit, but this would have been >> > broken
>> > before.

>> of_kexec_alloc_and_setup_fdt() is called from elf_64.c (in
>> arch/powerpc/kexec) which is for 64-bit powerpc platform only.
>
> 64-bit PPC could be writing 32-bit property values. The architecture
> size doesn't necessarily matter. And if the values came from the
> bootloader, who knows what size it used.
>
> This code is 32-bit powerpc only?:
>
> arch/powerpc/boot/main.c-       /* Tell the kernel initrd address via device tree */
> arch/powerpc/boot/main.c:       setprop_val(chosen, "linux,initrd-start", (u32)(initrd_addr));
> arch/powerpc/boot/main.c-       setprop_val(chosen, "linux,initrd-end", (u32)(initrd_addr+initrd_size));

Historically that code was always built 32-bit, even when used with a
64-bit kernel.

These days it is also built 64-bit (for ppc64le).

It looks like the drivers/of/fdt.c code can handle either 64 or 32-bit,
so I guess that's why it seems to be working.

Although I'm not sure how much testing the 64-bit case gets, because the
distros tend to just use the vmlinux.

cheers
