Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEBF4A5B8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp39x1nqvz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:49:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp39N6jxRz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:48:40 +1100 (AEDT)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MaIGB-1mkyT0181V-00WG5z for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb
 2022 12:48:35 +0100
Received: by mail-wr1-f52.google.com with SMTP id c23so31473654wrb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 03:48:34 -0800 (PST)
X-Gm-Message-State: AOAM531X78UqVrtq9eV7tqH+vDrTj3GwNulb2ROF7FwITo6obcXViigS
 4vmgJ+gYMwRaE3sunKMqeGios4ts3NWEPlue9Cs=
X-Google-Smtp-Source: ABdhPJxO+OGO5lnSmsts+k8ffbEmh9/UtuFXn1dLVr5xpmsd+BH7cbCu5DpyTRvWDXlXMwgE6rWgsvPUd5Lt6roAGEM=
X-Received: by 2002:a05:6000:178d:: with SMTP id
 e13mr20737860wrg.317.1643716114442; 
 Tue, 01 Feb 2022 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
 <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
 <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
In-Reply-To: <CAJF2gTTgTzvGfa3nGzVo4C=fe+ZCGBWp=VhTMRt1vF1O1bnS5g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 12:48:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
Message-ID: <CAK8P3a3u8zo+MOOpDXaX8PY2ukN3J2VHnV8uDXQwc=0WgV6qFw@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ek6BVwLmqU3yWNOF2PRTYO7xNYYgH77tdHNCdCmy6smmTJ5GZNo
 +f58jlPc8ldxFA03+1Ae24vphBksJ6po/uB7KcsGxWbwHFwdAoKY5RrDT0AQgNsswFNtSkk
 zPPN6NqYwsSnJLZHZhg5AEX6vp8r3wCTPI1MOBHUBY3onpXChNyfeGdSM55Z9BjKratWsSi
 kmxYmCkopfZsuByPJ5gCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MgIVWL4Chu4=:6gA+OrWd7eC3zGiStBCSqt
 xsdT+iChOQxpfTY7a4wM83G+ETHER0Ty9/bePHBKKoNhNsI4tUPSfn6A/VUblYP8rM+FVBR8T
 Nv/uDkzSNky2g7BuArMP6jJ0PGcXmvuSBbxvbVtXoVy7R7Y+k70mhRtAI8hjNOWzquz1qmpRV
 zh4qT4lL0kAOxJjyWwTSFZPnQA1Y9FFi/BgIRpQe3izhV+h0aAC+tlV7iuFgCJbGx3mz6d1rQ
 mkwGePN4o3T5HU3kR/9BXMNdHE+UlfFpQeonBw7CDlYw1QBvledV2B9HXIiNMbTBSD7UkgCLB
 7y6v13Py7fECOOCj6U9BJAT0VKik84r+K2MWyZJ9+HHZ0QFQW00a0kaIGGtSLn3U0fEk9sGrY
 v0nUCBvF0PLhuryN14p8zfJTEgnlrqNNbarU5/bWqyBmr5QkibkueByi5XAUNy7M+eP2a+d20
 +IcVzd4UrQ4KoKax2v8XR1HYDLnrAdMYidJY/dDYHvZp4bnZ2UmsB0zqsGZ9pXvpyiQP14uy+
 ZsNKnbMZV5oBsoTdFA1EElLpCeFeGedDLbZJXA/74+kX5OpM6qdQW7P7qphUIt6RP7v+UsKYn
 RmFuoftHe+uMIAhQfs7+AfpO6FldwOEHAvM0e53HA4T8yLRluGbUuyCuirMDVdnblk6Tg1fZF
 4uCBeTKPN24CLEM4Fl7OeXeqeGhrA2/nA84wS6r6M9vnEbdZl2hdci0WSssz5kOn69mLeypnJ
 jS6ToeGgaLkFNcrlp/p6eDedqmE2ulVf1LHVjfIriVZC6CX5JJ7cPwzcjxLNCbWnvLREXGHMu
 Hie8M3qn6vmxo1wR/pwHzibMBgDNM+owPZvXp5INSsXDdT9PRw=
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 11:26 AM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Arnd & Christoph,
>
> The UXL field controls the value of XLEN for U-mode, termed UXLEN,
> which may differ from the
> value of XLEN for S-mode, termed SXLEN. The encoding of UXL is the
> same as that of the MXL
> field of misa, shown in Table 3.1.
>
> Here is the patch. (We needn't exception helper, because we are in
> S-mode and UXL wouldn't affect.)

Looks good to me, just a few details that could be improved

> -#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
> +#ifdef CONFIG_COMPAT
> +#define compat_elf_check_arch compat_elf_check_arch
> +extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> +#endif

No need for the #ifdef
> +}

> +void compat_mode_detect(void)

__init

> +{
> + unsigned long tmp = csr_read(CSR_STATUS);
> + csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> +
> + if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> + csr_write(CSR_STATUS, tmp);
> + return;
> + }
> +
> + csr_write(CSR_STATUS, tmp);
> + compat_mode_support = true;
> +
> + pr_info("riscv: compat: 32bit U-mode applications support\n");
> +}

I think an entry in /proc/cpuinfo would be more helpful than the pr_info at
boot time. Maybe a follow-up patch though, as there is no obvious place
to put it. On other architectures, you typically have a set of space
separated feature names, but riscv has a single string that describes
the ISA, and this feature is technically the support for a second ISA.

         Arnd
