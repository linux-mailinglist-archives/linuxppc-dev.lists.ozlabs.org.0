Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED61E4A328F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 00:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmVH33bYpz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 10:03:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmVGX027tz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 10:02:42 +1100 (AEDT)
Received: from mail-ed1-f54.google.com ([209.85.208.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MkHhB-1mXmIp3V5F-00kicw for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan
 2022 00:02:38 +0100
Received: by mail-ed1-f54.google.com with SMTP id p7so18361355edc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 15:02:38 -0800 (PST)
X-Gm-Message-State: AOAM533xRTLcs8HaAj31ehLNkDIC4OYZFua05jZQ2vur10YiV+A1Bfhk
 3XKuJvpYooR52G963p6Ja0JtRccL2pn4/9HZS/Y=
X-Google-Smtp-Source: ABdhPJzI0D41s8yrwHglCZkVEr0x+bK1CMwYgZgaz1NErnnr1PsIuPoCJo0tLrBweMwgRCKK6bnEP4/locNb0Mfr0Gg=
X-Received: by 2002:a05:6000:3c6:: with SMTP id
 b6mr11705793wrg.12.1643494389446; 
 Sat, 29 Jan 2022 14:13:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-9-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 23:12:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
Message-ID: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9NQurJM7Ow8sPBNjAms2XMStkjTZByIG167Rsh4ZGFmdpA3KKr1
 INuQsilx/cMZ6fiQNNMLc6h2M6kNbuW+HkMDRA183ah2H21xvl50BURLupEtEJLuLZPXp42
 UIGyKdwTyuPmfETAsTpzXtMDGRj4UMlO9HWANMIpQmXatiAL9Cu4jHuDKwz9w6XEgQ6WjUy
 D6Y+RQW5j1sFqSyWRE4uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OnzBdCKKkXg=:uCMiXPVB7tI5pRm5LRtUig
 aILQhRnFBkvi4YwGIKGsJNkm0p2s5/i9RuelfVbFL4ZLw18/vA/fFGGnlmeIFiAsKCLJQaYQY
 IbnEFAzqoioh/MJFoLLyIqav75VdBg/Ik7vVdFSdxMuTHa4M7jmRkf44Bk0+CBikQe1pyRWfm
 L6VcYgSoacKhFq/wNFxSKi6pDZQeR+Vo1eocV8vDSJryZFwpCXouEzWMnUueKar8EMysGU9r6
 Kh/iXUiPHSEQmONj22qrSwykkGWOKoeMKAdc5jGP0H+T6bOQiRrP0yurXTZP2M+QC9QsFr4nh
 KOWd94HgMsPJB29GksFindzI12apcLWI+YOqVY9TYzszCv7/PuWdNHAN2e49PLKAUoqLRygPq
 Rm+YWIgqm9SzRWdDuXg65CUcEAsMPt7Po+/PDXBPCNg0s/J1mqLdd1JZA5+jKAoaz20BB9peB
 JOPxaQivcng30A/T6SYR+nk4WFkV0EMAOXz3OF3bJ7EWrXHZ77x4pd7tq/aqSgEaRGg5NpJ4+
 ukbe2gcWm0ILbIF3guVxwXLM2KnvQgtfmc+mj8SEvrl1RZ1Oez74o0TLIauxLXlEoVLyjnukI
 np8hF//vMJlfiKsdAWYfXIO1KomB0gx3uyNzc4yvcHNICkNJhEsRaEnyrLJni5mApWbNVeqeg
 kxn1aUqUCSzWWX+FFHSu2lqNkLlM4GomeMtnaSSnm+wtju+HLt5tTU00q/wnGW4kXvS/WIqks
 Sao6SrkYcTf7bXxYxIXRzazYhZApvMjIyvfYgS0U0rGNQowCHqVDC9CJAM2952ei+57oFwZGp
 AfHRUs/5knJ3QEkuQtD86CgyXnKdxoJnTsA2RP/8o9DRyAx5GM=
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
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Implement compat sys_call_table and some system call functions:
> truncate64, ftruncate64, fallocate, pread64, pwrite64,
> sync_file_range, readahead, fadvise64_64 which need argument
> translation.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

This all looks really good, but I would change one detail:

> +#ifndef compat_arg_u64
> +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> +                                        ((u64)name##_lo & 0xffffffffUL))
> +#endif

I would make these endian-specific, and reverse them on big-endian
architectures. That way it
should be possible to share them across all compat architectures
without needing the override
option.

        Arnd
