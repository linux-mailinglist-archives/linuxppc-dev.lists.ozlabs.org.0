Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E430494BCE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 11:34:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jff4v2zqlz3cFg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 21:34:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jff4Q3RYBz2x9j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 21:33:42 +1100 (AEDT)
Received: from mail-lf1-f43.google.com ([209.85.167.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MpCz1-1mW9Xw27e3-00qjXm for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 11:33:39 +0100
Received: by mail-lf1-f43.google.com with SMTP id x11so19903104lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 02:33:38 -0800 (PST)
X-Gm-Message-State: AOAM5329GRo9eFMeBBNq4IFqc7Qf5OlzG7gGqdI2wqUVBuOWzKGA4dbd
 vO5iRMmJ6OMTIprKIBvdaT7cDUQugzjbfqARfWo=
X-Google-Smtp-Source: ABdhPJym7KyRCSRXKMerVMcQ/VMRiOiyKpoCP7tEcDc9DhkSEEWwSJxd9o5Jl5QZLGZ5wnpG9DwFk+lKhhVFjaoKItk=
X-Received: by 2002:a5d:6488:: with SMTP id o8mr12004975wri.219.1642671600998; 
 Thu, 20 Jan 2022 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-16-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-16-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:39:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Message-ID: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
Subject: Re: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7qaWmTS71QvJfX6/FBXOz513BR4kpzNjzMLmUepIUgH2PEPGZQ4
 JLib0mo/QaN9TesjTpBffk54TESvZ7yqA/uz4SZ5Y4HM4gzbZVoYgCMGdqBSTaIucoEiODc
 LCL/33dA/Tc6LxH+aQHo3Uo+Cb+IA9Imp52OcAvTY5qXynp/i7A1RWGjHpjIMoMCk1jBTpi
 PMumdeFnyYOtjP4LkRtvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GE2iEdYngFA=:+D6wr30SS8Hrv8+kC65XI6
 coDS+7t9wQLIYasSDQsj+h21eBcezeB/8ruA2SaycpFEry6Q9IeNL9EAjp6mH6TITxtV/kB/w
 Uuaf0kDFICIXMT/4Ailuvwax0waXjzBSTTGd4aNBV5YiTR85bU4ocByFut5z9TxVHLC8vVxXB
 m/hsGlv0h5suwvpyRIDYSOMMA06YRGVl1oUbvfZyculJEaW8ZX48qi1M8jK2k90b2YAh9rXij
 IXL4g7v8oDT0GSNVt4nE1W6wZB1aY5mf+brMRGg5Cv1bM1uzoJ+SP/Lsv73D2Oroqy/9m6+zm
 P81EKk7TWuVyyTJ7gCK0XKt4Gebd7wWbiCqVhzS25wqZM8qz7FV9yvLKcr5VtTSjF/r8FGFNE
 3E22n+Q4rUy8GFN2u3Kn0GUrS2ot6E/jsIco3V4UYwP/B0KiDdQfr9v+DfCfzdILeDWH7+Fsj
 PJjwbQWeIr5Ego80QUf3KcEFl9gqvOgNP62ahbCtjdgCoHMjixQ5ORR66aGJy3psBKqRMdkVF
 DnSN7xqIJqKxmRBmjH6KkpARPGtccj+DaqPyw+Fn4OC6KHPDokOrr1cOKWT3tW9/j/wCF1Tnu
 5dEKh9eK8OubL+TGGcHBwdxpL2knYvhTa4eYY3bZuZPKbJg+/tx32rbkSvW7Mmkfh4K77jAKX
 n/aY5YFvRvKM8MPdVPPevTR8Hs6Z2B8BRt7ur5VcQW95M7uCqUS8aGuJW0g7z5bUmQv/Hbj9b
 bJEt9t0kJ9ZH3jZ4xC3wB8PHToZ2x4KTUlLmNNtdpQJg58lDey5wfECMecxFui6M7oujrnaOt
 BFHFvA1EPLwqszpqazOE61qjNyPAp0saeeOkJ8TjhxX7/ECSeeOg4K+vVb/xpJAozBskTM5
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, gregkh <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> +
> +#ifdef CONFIG_COMPAT
> +       if (is_compat_task())
> +               regs->status |= SR_UXL_32;
> +#endif


You should not need that #ifdef, as the is_compat_task() definition is
meant to drop the code at compile time, unless the SR_UXL_32
definition is not visible here.

         Arnd
