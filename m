Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1004897C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:45:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXX7W1GThz3bb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 22:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXX7328MLz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 22:44:47 +1100 (AEDT)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N5mOZ-1mJKoS2587-017GYD for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan
 2022 12:44:43 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5003674wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 03:44:42 -0800 (PST)
X-Gm-Message-State: AOAM533yiWrCIVrwT39ojhfpipCPhdmu0pwB+xKwaRSsPa77W255oe59
 b7A8kotoal3aYEgpPLBNixHijdT99SKjI0UNZa0=
X-Google-Smtp-Source: ABdhPJxOkVX5X/eP4ROAMmqEcBQO9QsPU/GNla4UTfIaHqTpDouNC4IkJVmWSHu8Rit8nW/iWcW7PE1EcM2YzrteSLk=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr738103wmk.98.1641815082604; 
 Mon, 10 Jan 2022 03:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-3-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-3-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 12:44:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3RALe7ihmhZ-5jucrH_0CZm3VyPaVfT-nC-96=1pKTcQ@mail.gmail.com>
Message-ID: <CAK8P3a3RALe7ihmhZ-5jucrH_0CZm3VyPaVfT-nC-96=1pKTcQ@mail.gmail.com>
Subject: Re: [PATCH V2 02/17] fs: stat: compat: Add __ARCH_WANT_COMPAT_STAT
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Fg9LNKuQzyZv1F3MN0w7HQPjqnRoWDb3rWxTaaqKf0QyIzC3QUY
 KbWdXfd/U36Yy1gaBXPvmmeqMtke2Kv/loO1KZrqTLzWgbK2MvPIqVAWjro8fWtCWlrx6Ny
 2UzRWf29AKxe+zgInPGuMVuc4+KaxE+UQUw7GzoSDHt7JBxRxC8fiB5K6nVv8lxq/CTFerz
 LaaJJFFTk1CzmtzPWf+Gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IccahhC/LvI=:sMKzHmK+2WkAvGqJEp6bMB
 k1p6VPKo0unqOzGm7xP0TU6MilemjiBuzJ/3DjOaaozAipLzHxIVx8RmLIWEBb1LskXLUndIK
 TiWF6Aqj4RPiAYNotwRZstBtWK5JTsFqknf2E3kpgON24H3MoNR7KkoR1p9EnrfsBeO/k8Bt+
 ZRXOAythLpFGzBpCHnJU75w9/8JP78lNeoAOKgYma5JNcGceLuXiLnUZD1RTUadVPFMrsTPSp
 mcgqzI9obuc8Jk7gImeg/DpQrBnpgdF4nOtR92+szkKsIiNkUEycQd7zPhWvqKtMetazJv9ps
 y1fILGvNixmK/wHXY7Bq8hkCukbMEgolpL43raq2TAJ6UZTPfqKYShmT8mCMZN1hxk8aX4mcA
 JPuqlyWg1ZP5N6nXngiJ5OQbTKpbnrPa3oHWixSzwS/bjkuD6b2EFc5ORkdpk56OusnNrDm/H
 an7EID63SJNWg6wCJxt7lJLfmZo+BkSVyxfnahKsscqrdLYY7sWcjOJrmHcphK5ZK7bpjwT/F
 YfW7GUp4iCOrSorRPQBuT6r8DwhKhLcH/fN6KQ6Uf7WK49c0d6w+ZP373Zm+Lc3KHxDdkssgV
 UAL9vqvf/anfnmI4BgExK2i+3HypH65ywWQaUkQiREKszbY0eDQlNSxuJjFY30TZgxdm4UYZf
 ERWP3e54KkClBDXidRcOFKmm2+RcvpFHsD7EfizCsbAJFbXywNQpSkumIDPN/+x5/5E+dMJSz
 7htlL5ZssJrj+WMbqTo1RyjAgW73IuEI/G8RtweOsHw1Rps4b6MEbFwSrb+Ty8k0cO13ReyFv
 aQWC93ulGlA4H3AzbgM9ZEikhwdtinuhAIRXtwd0eJgfhFzTuE=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> RISC-V doesn't neeed compat_stat, so using __ARCH_WANT_COMPAT_STAT
> to exclude unnecessary SYSCALL functions.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
