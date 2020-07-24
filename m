Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA0E22BEFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 09:22:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCgdr1hKtzDsVH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCgbP64MrzDrqV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:20:48 +1000 (AEST)
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mq2vS-1kbpTF2Z50-00n5m6 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul
 2020 09:20:43 +0200
Received: by mail-qt1-f176.google.com with SMTP id a32so6262829qtb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 00:20:42 -0700 (PDT)
X-Gm-Message-State: AOAM531KnalDnwQbVIHqI7fGjc0l9zu5ImhW5DBIRPAnjC8vZc6K/KZO
 7T5+h1ATSDLmsjDuEhRGteMljeR4mGSnW+RsMBc=
X-Google-Smtp-Source: ABdhPJxmIVXnbEioXbPXSA7ZMWes4VKvilueIEtCY7yjI+BhfVsAWHUQWo3DE1p/ihdJ0qb68PSFrNOEs1zZFP+V6+8=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr1188191qtq.7.1595575241528;
 Fri, 24 Jul 2020 00:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
 <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
 <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
In-Reply-To: <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 Jul 2020 09:20:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2u9Z6wfyRduC7396929t4VnJQ0cXMiMWO7o6tgx_uNOw@mail.gmail.com>
Message-ID: <CAK8P3a2u9Z6wfyRduC7396929t4VnJQ0cXMiMWO7o6tgx_uNOw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rtlTBXJAnM/9MwfGED8/vkYCYN5xxO0C5BFsrnc0GfvBXz216gD
 2JWMoQUiQsDIf0H2EqT7jTDs2prGuK8pOJF8OIHDEkQq6v/JJ1ZpBHCvsGD2919FcUZybYb
 lXLP1aoDu/NXg6LzwT0mt5Ihx8DTSWu4nNK0R+ULv99BuZrhEJlM8vle2GHCMzETHlClZNe
 NEA6KTH7/LL0lybVPkNxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0YfiYEKXuSo=:iHBUm5UO1sZmc+wgfp2OdX
 cS4AeyliiuFjaw/B1p6lzj5YgYPnJRpHZ2VCw+VoeHUUfDsnTH6SGiU5B3NSqs41ZI2bG7J18
 G5F03Op+F1zwIqIngGMMjYT+vXMO4tAHyPIitxmrAjIr1WlEVbO9X86S/gznj0NXhx9a/Dz0y
 E5fDl1OSY9Ctgi64CexomukCwBRbck/vOmlQWwtUDTDVTNuFBfhk217xi3gcyGFZeYDzhDjnE
 AjzUSUobWu6Qe6rJ7jt4joY2Pz+S3zCM7Zaw0Dgvkwla8qlUQ302jdKK+6oz7kJseuTGfyi0M
 nFOOJOoc01WCaGO+K6VITVAyWyX9Kvq4Efu2PSxjEe8rZacM2fRIKAOzzy1bZVTQSLm3QslQP
 SS486obGiKPAPwwvBmZWvUa6t3Q3RjODThGRJ6OkAlBSzhJ6+UPPE3zLFM/S0V63lmXCh+Fuh
 DyCkLql+h8Kc5s8Fp2HRRGVcMJebPpMsz8p4SlawY5mA2wfEJayzQLemm1g+SgQ8remXpB3oj
 S2i/sZv2J9Si7N+ClvQdbiq+Zn3JVUpLk+7tvejebdwiSSXjg7hmhX/f6Tvu52wPRTKkzquC7
 eW9wl+Cs3cIxKRapeyiJC0s+PRqnBXCRCxciBfDdDrPn1280BqnPB5oL9cRYKcw8CnFqv8rx0
 Jtkc2iplHIw5ylduNXDMIWQzTyjtcfPZzfpfkY060yjRyE0+ERA8eMW40TnYBCNIcmxBKcGlf
 ds/sEqb4SWvPYBDcUl9At+vsE7RnM4R84KXdrp2IY7wUa3KcvTCUowLsC6SjxWlH3tZorVhXL
 nOK7OpYitPjSTNWped15F1wjq+lfOxzoeD1c70Q1L3ijYqM/spnIdD43pSGRmjh5mix/9JdRp
 zzTuSPIoe+/cYXuiBRf7a48dyY4hWbbSosickRqxPiaRdpWQexX3Z4TGeFEzU5EOhu2rpfiUH
 Gh2JVfw6ObwNpBIXZvMwdLuK/KT4R0fmlw29oS+2FUSyTn6BcEXI2
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Linux-MM <linux-mm@kvack.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 11:06 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Jul 22, 2020 at 1:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I just noticed that rv32 allows 2GB of lowmem rather than just the usual
> > 768MB or 1GB, at the expense of addressable user memory. This seems
> > like an unusual choice, but I also don't see any reason to change this
> > or make it more flexible unless actual users appear.
> >
>
> I am a bit confused here. As per my understanding, RV32 supports 1GB
> of lowmem only
> as the page offset is set to 0xC0000000. The config option
> MAXPHYSMEM_2GB is misleading
> as RV32 actually allows 1GB of physical memory only.

Ok, in that case I was apparently misled by the Kconfig option name.

I just tried building a kernel to see what the boundaries actually are,
as this is not the only confusing bit. Here is what I see:

0x9dc00000 TASK_SIZE/FIXADDR_START   /* code comment says 0x9fc00000 */
0x9e000000 FIXADDR_TOP/PCI_IO_START
0x9f000000 PCI_IO_END/VMEMMAP_START
0xa0000000 VMEMMAP_END/VMALLOC_START
0xc0000000 VMALLOC_END/PAGE_OFFSET

Having exactly 1GB of linear map does make a lot of sense. Having PCI I/O,
vmemmap and fixmap come out of the user range means you get slightly
different behavior in user space if there are any changes to that set, but
that is probably fine as well, if you want the flexibility to go to a 2GB linear
map and expect user space to deal with that as well.

There is one common trick from arm32 however that you might want to
consider: if vmalloc was moved above the linear map rather than below,
the size of the vmalloc area can dynamically depend on the amount of
RAM that is actually present rather than be set to a fixed value.

On arm32, there is around 240MB of vmalloc space if the linear map
is fully populated with RAM, but it can grow to use all of the avaialable
address space if less RAM was detected at boot time (up to 3GB
depending on CONFIG_VMSPLIT).

> Any memory blocks beyond
> DRAM + 1GB are removed in setup_bootmem. IMHO, The current config
> should clarify that.
>
> Moreover, we should add 2G split under a separate configuration if we
> want to support that.

Right. It's probably not needed immediately, but can't hurt either.

    Arnd
