Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE874A5DC6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 14:57:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp61h0Xfqz3cGn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 00:57:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nULUMuvX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nULUMuvX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp60y23r2z2xBP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 00:56:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8E2B615AF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4392AC340FA
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643723789;
 bh=LR7K+KdhE8ua4Hf11bODf1Ipe6bgjP3NN3+/HtimckQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nULUMuvXkvrb2wx3h/E78ZWoev9tF1+n30y0uhd+VeL4suK4h/7PaBEhJdpbFimhZ
 eHq0ecvW4j9hpvDyoZLt082QO0YUiD4dzL5ypbtytbtJmn7imennsvXbabeHBBV/vB
 3HyaukGCDLsTs1HAwDF19bw+hwSBPkKz7r7PU1bCJuZxl9sFSOqZpTujWPyNpJr7z4
 SFGJYyGAlUcLKGJpL5WZ8M8ewKFW2/+hdSvUvDhleXoVNOU8+wdKNUvmjZ2EJo/7jc
 bNeohXIAvk6tn7PJhPBZ216d3Y87XjTjr7gYe/BUWcPiFfGHoxZ/8lWDlggv7ZX8Fr
 9cFvpFMp+gkng==
Received: by mail-vs1-f42.google.com with SMTP id g10so16161428vss.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 05:56:29 -0800 (PST)
X-Gm-Message-State: AOAM532BqxXrtvGM/fK9I84Fjr2McCfSZvx74E5jq9rReJu5tEqfAU8A
 KwUtf8uiTncKKuVXaSdPI9+uQWOLpQD0P32985s=
X-Google-Smtp-Source: ABdhPJySe8D0nEEAYvBRzFy6LwfvSeR3L3Y/oGIyxpX/nRoUeaoc3ecWWnv60QtmaYC3C4Lb9VuYZme6+tyqFZXZr7A=
X-Received: by 2002:a67:f94e:: with SMTP id u14mr10667024vsq.2.1643723788142; 
 Tue, 01 Feb 2022 05:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
 <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
 <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
 <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
In-Reply-To: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Feb 2022 21:56:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTtCboaEdC1MXkONUr1Nc6BcM4xM5tdE9t6_PiSdiGHLg@mail.gmail.com>
Message-ID: <CAJF2gTTtCboaEdC1MXkONUr1Nc6BcM4xM5tdE9t6_PiSdiGHLg@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 7:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Feb 1, 2022 at 11:26 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Arnd & Christoph,
> >
> > The UXL field controls the value of XLEN for U-mode, termed UXLEN,
> > which may differ from the
> > value of XLEN for S-mode, termed SXLEN. The encoding of UXL is the
> > same as that of the MXL
> > field of misa, shown in Table 3.1.
> >
> > Here is the patch. (We needn't exception helper, because we are in
> > S-mode and UXL wouldn't affect.)
>
> Looks good to me, just a few details that could be improved
>
> > -#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> > +#ifdef CONFIG_COMPAT
> > +#define compat_elf_check_arch compat_elf_check_arch
> > +extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> > +#endif
>
> No need for the #ifdef
Okay

> > +}
>
> > +void compat_mode_detect(void)
>
> __init
Okay

>
> > +{
> > + unsigned long tmp = csr_read(CSR_STATUS);
> > + csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> > +
> > + if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> > + csr_write(CSR_STATUS, tmp);
> > + return;
> > + }
> > +
> > + csr_write(CSR_STATUS, tmp);
> > + compat_mode_support = true;
> > +
> > + pr_info("riscv: compat: 32bit U-mode applications support\n");
> > +}
>
> I think an entry in /proc/cpuinfo would be more helpful than the pr_info at
> boot time. Maybe a follow-up patch though, as there is no obvious place
> to put it. On other architectures, you typically have a set of space
> separated feature names, but riscv has a single string that describes
> the ISA, and this feature is technically the support for a second ISA.
Yes, it should be another patch after discussion.

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
