Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F635494AC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 10:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfcgF47BKz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 20:30:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfcfq4bpkz2ywd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 20:29:55 +1100 (AEDT)
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mv3Ds-1mJt8x2awq-00qwq0 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 10:29:51 +0100
Received: by mail-ot1-f51.google.com with SMTP id
 a12-20020a0568301dcc00b005919e149b4cso6778595otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 01:29:51 -0800 (PST)
X-Gm-Message-State: AOAM533JGuARfBETeA6axk00fgwvX9ATU+EKlTbYUfz9gcdtX9nCeqZ2
 +cHaPgZW/bNdrYNZE8JEBlo8HNdcatSstql9bMI=
X-Google-Smtp-Source: ABdhPJw23cQjee+wzKe1BZuP5Egl38StW0xVS2Lx2CrxQkm8C96LIXXcbD+ld7BJcIRLzViPyYDZ1TVXzpuf+zNTwjI=
X-Received: by 2002:a05:6830:2095:: with SMTP id
 y21mr25066257otq.368.1642670990087; 
 Thu, 20 Jan 2022 01:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-7-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-7-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:29:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Subject: Re: [PATCH V3 06/17] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:KKX+9HNtA1mSU6MqbV/jXbUwxpLtyTxOis6xqiY8Iql1Mw2tmed
 4pQ2xse4Ke0qy+egGetawqI6y4OVjCGUu9BZvpumkZ5gYr/i/p8rf74VcfTmk7NrPBE4m3J
 Eoj66qlekUKAD8zjGaPT/iEODJYnZ/Ex8gcj9dDfIUytEaepW31oMVbIKsbLGq7VXy57C/I
 RmlvKbDAfHtz3/1jJtxRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XO1LaekllgM=:kE35Gc0ZktCHbAM4CE1qM5
 CRZuxP+I4Zqebk1rr9G1iquL6eyMKFlGEf5//bsnLfIRprtY+kPJLJe/4yw5xqA/B7Czri1Um
 USXVfye4b+o6/OPdVDjWuTsZGRwSM7nf6P3ZuY141k13omSm3+c61szu1AfcervMg+I53wTSy
 MxsGI2X6HPgxACtmize0AYewCuyrR9UYM/p278eiPoGQGcDvhxFYMZ7u7wL5EDmMP5IA2OKPc
 oL+l5bBNuOHnXbV5S6uskFvwytHEVg8PRPOY2ffoaNoivy8vJJVW2TMECHKWjkA9nTIbUtybX
 Wav6pcu0V3qneAyDj5eS2KnZmK7oZ4HDC9mrAiiFKyoRq753HQhVmhIITtU3KM+/pjD51w/2G
 C4SZWND/Wp4LuhuOqSuwpDpPbDDTGh+Mqzx3K9IWPNOncEBmq5iSB0zv7NvQMI1IiAK97KLHd
 zOU0oWRxxipET1T0HZ0vXaaJxSJRya7jzwefNfw54tOGFWzrcg1DKgoXN6JDRepsMICiLehsW
 DE4Z/IbicoCMj/UHiNhrE62XXhbGPas8aYjUH5C+AT/UcTmXm0CfYhzA6jfi5wiK14BhMtRF5
 yMD0bCg+6lhN+tjuuwMMZGSbknWnEacWGV/IYt136Fo3LXiAJL/kholpCV4PM6pTQlIbgCbMn
 jju0GrlJ+8z0xaEIErpY6XNejIR3jjrf7fnClW4yc9gPaP5Pn4o3ao9fsf+aHO760n/2GpWnS
 BIke5XSgco5kIRBYyQAHu35cFcaGlm+w6FztaN+VtPD6nF7WYARFdJZG5jJ61RehaH0nftBKO
 Tz2emAC8tXwt2c98kiemdRY0E4aUaEhbHtfA3tSiWTLatNz09s=
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

On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:

> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_COMPAT_H
> +#define __ASM_COMPAT_H
> +
> +#define compat_mode_t  compat_mode_t
> +typedef u16            compat_mode_t;

I think this one is wrong, as rv32 should get the native definition from

include/uapi/asm-generic/posix_types.h:typedef unsigned int     __kernel_mode_t;

I think it works if you just remove those two lines. The rest looks good to me.

       Arnd
