Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B85AB494BBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 11:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jff2250wnz30NG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 21:31:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jff1W640Zz2x9j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 21:31:10 +1100 (AEDT)
Received: from mail-ed1-f45.google.com ([209.85.208.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9FX5-1nGG1H3jpX-006QIy for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 11:31:04 +0100
Received: by mail-ed1-f45.google.com with SMTP id j2so26552549edj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 02:31:04 -0800 (PST)
X-Gm-Message-State: AOAM530kRcrYjkOTFre3iFtKfQKVxTkj3Ucn9twvz3lK0kOFO8xtIAm6
 Qt/u+a1E77gkMYvZfJh0YbglnBT+ZqwRvVhUCGk=
X-Google-Smtp-Source: ABdhPJzWEQOVmrSCBjLkthqjYvCekql2pWig3E9/sv1NmQbjWn/17+5wGi2Yo7L626/g8+PxrkZBITeqW35NrwNIykU=
X-Received: by 2002:adf:e193:: with SMTP id
 az19mr26654977wrb.407.1642671389935; 
 Thu, 20 Jan 2022 01:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-11-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-11-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:36:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
Message-ID: <CAK8P3a2HaeFGdOr4Rm_ZcEP0rjh2Mo53=-ZRnEPtFfnmzfeE6g@mail.gmail.com>
Subject: Re: [PATCH V3 10/17] riscv: compat: Add elf.h implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fJPE/Ibuju59ipH4ZLpPSfDo6QNKRF/IIBP4BKrWqHhZ7Q1X6Gm
 fzZcdBOJ+pK2Enqqe4b2us2y27YoprV/fFDLwUMrzIC2BTk4vWJ5Phjq1Y6tQxaUJPswdsO
 4hvjNZcelZItQaEcGoKqtvL6L+AcSHswn2Of+p0+HPNJP6qzNtsKf3T5DA+GyZ0+OuDGB0x
 oPV4tRrWE4DixsOK22kEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M0ov9O3TPqA=:g0aTxYkGHZpD8YFxyunp0o
 fdK/+Fa3p45Pp7uLkjeiIzMJQOXQN3RcVhONFhxKDbOQztO1VKIhVBQONYK7uSZ+CHfZfEf0h
 9i2CwliE0bcxo1RRezvmVRBMLMWN8ayRvPvj9rHW56kXcKfgXVvyI/iSXkQlqzf5RSTlzY6/m
 OplQjWzHRCTWfVNj1FpJXXfJCbaCm16RhppvHT5C14woXGmvbX3d72LtUdWkYZgMdvSF58Uw4
 4yToeZhQ7ZrNUJZF81yb87BHPWNm6v+7zIb75M1r6RIN82dppgKmSpEaEowd4EgiAvBTDgF9k
 ZUauuGV4y9/GJ+Nlvp7D/2pVNBO+8XIhB8lzrurE41b8g1pAwRZX8YXG+CBwvEiHk5F+17V/Z
 4RIujn0huGprQqOM0Bem4vIG+kD5rgOfnswFTnGjH+dygHvE4YzVddL+K3Hvbzz0U4DQEYuFh
 qsOi1O9ghZsNjjPipVgPSRpnc5SkrDdgiQDJoKPBLLH0iNHbHa3bX9c+qgFNcyl8S4qB7xUmc
 uD2Q6/PoUMs8goMNmLuYcwC8W3AgUuzPgbIsfJMo4kLjYerIBVVtb48S7qpXjWoD3II8XlWst
 Jl2Iozo7U9O40Gc1+ca/SJec/mLC2QvGqwRs7ARTM5JIwIDXlrv9yIEo+zlDLSoytQtJzdNLa
 sKWQKohtSgzqxWQvS5DAN5ZegSndo9FUmvK78mPMFLqBPNITXZJXUk494PLrNoce0UGHWpVTE
 fAdRWSfQARgcDNPayMhTE/qKzWfTY8che66LER8AYVNtopADx6v65GokGVhWqqB0ZV3zcMxdk
 Zlf25VcfjXCLjF/pWZwwLC8pStJZJ0a6xCSG3vh5D+2vXja9tqlde5hu40mdnvLy1wjHizK
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
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement necessary type and macro for compat elf. See the code
> comment for detail.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> +
> +/*
> + * FIXME: not sure SET_PERSONALITY for compat process is right!
> + */
> +#define SET_PERSONALITY(ex)                                    \
> +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)              \
> +               set_thread_flag(TIF_32BIT);                     \
> +       else                                                    \
> +               clear_thread_flag(TIF_32BIT);                   \
> +       if (personality(current->personality) != PER_LINUX32)   \
> +               set_personality(PER_LINUX |                     \
> +                       (current->personality & (~PER_MASK)));  \
> +} while (0)
> +

The implementation looks good to me now,  you can remove that comment above it.

        Arnd
