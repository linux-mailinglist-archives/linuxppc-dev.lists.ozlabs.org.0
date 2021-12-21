Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622B47C67E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 19:26:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJQ0J6Fq7z3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 05:26:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJPzt06jZz2yMV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 05:26:32 +1100 (AEDT)
Received: from mail-ed1-f49.google.com ([209.85.208.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtObA-1mBt5315Je-00uoRQ for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec
 2021 19:26:27 +0100
Received: by mail-ed1-f49.google.com with SMTP id y22so55625784edq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 10:26:26 -0800 (PST)
X-Gm-Message-State: AOAM532G65piAsHdK3I1Mvf9Bv1giVMEyH87UBMYLb6WMomeY1iwCALi
 6XrAHgiz/Auv9mQZFNhbz3z5X2jcPRXYUMhQowY=
X-Google-Smtp-Source: ABdhPJxLPfvoBB+dfcIJaQqwJtQ3BevGRPxqadC+I3rCQp9PvcGuMoU65G3rfQPJYAfstpb2qB1NqFuHBwuqdhFOzcw=
X-Received: by 2002:adf:f051:: with SMTP id t17mr3447981wro.192.1640107753248; 
 Tue, 21 Dec 2021 09:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-2-guoren@kernel.org>
In-Reply-To: <20211221170057.2637763-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:28:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_Ha89oH5NYx6zPzTBj9y8spCAeihcbjqQVriDv9jCaQ@mail.gmail.com>
Message-ID: <CAK8P3a3_Ha89oH5NYx6zPzTBj9y8spCAeihcbjqQVriDv9jCaQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] sched: Remove unused TASK_SIZE_OF
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SfE5+zwUP9zC0SOiktS+gzfYwq21iUGjXvk85bsoOWy8+jy77FY
 hvDgPH/txZmgN60/0JFEe9DodPQW+893OWKio/MGzWHrOR7HFl96Y6f2dGmu5h7iTS68iX+
 RYRxj0mnRiyme4ZNM3A6JYbjq7dAGhdJIPMO4fCzFmO6BaeECF3t+YpS+rdpEWZeoDLTTN5
 Yf5sIEvcBGja7+kUjIHWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pOQKJDHj4Xo=:ycXldwMIEd6YRj5IMQYtRm
 qK3oaRxc36RRLKhqVymRUX5WkRdLlUuRWU+4/QRng+CXv8kj04/4PjnaCF5JWDXxeD1ArDgrZ
 gOV32irLU/dmD/yBqmCV8wKgs68Rp+WXopLE2e1a2G1SzrZJQgwRkgRPXegxR9rDpX0oBx/Av
 /ym6Glx0YUEe1h1RvPQtPUrF4O+82ihNwk4cypLIR+3jYbY1C3wIKjOf3DNPCo5g+jW7WU1hx
 58QX35IERk4j+UdS3w9RKENV65GPGavGztINF7FTtAt+qTZDvdkSkNxEuQ1pPh/PTo0NGJwrO
 t5JkGvdl7TEOPsGgBuYjgAIc54I8dPQTylsfMqvO5fYbm8O/4+7dcY0bIAFwW0gWSRWOzefgP
 WkJ27d1QqvVgAAgIrR+HkpJw25/PCJhQKMQA7SvYKLlf6W08CHnTTLAbojMtXYd2LvbJHZjeZ
 YdoaEJ4sb4niwQTada3TVDmfLaERcnOB6izlK6J3ZEyISCsbOJQ0+MHRprLUp+p80c0MdxkgN
 mk4xuUrAQ3Hvr201BHYZTtKYkMehumD0/rye6wGrRJ5aLWSWmKD2d98YNHBjEMnL/vIDCeUv7
 7byyGvLG17uhED20AjTJDC4B+P73CaRuKtObzmBudDz5RLv2FUHdckGKkfoHmZBHogXObdo2C
 PwyYt/Vj5Zevf44zzgnEEfQ0pr+Y5OZPvl27YQiE50jMC7c5hryMJHXiWrmj35TVsyiuDq+0f
 7WCteq0Kgr3yLiSDEPdmGyGvH/3Xmv3DLKhieNkcwOQMjy+IScf6fgkioOb7iXUqLm+ijdbpw
 QqY2jC5dre8R/1VxPn7oHqWLagq/jkNmz9/7JwcQZZRfdEkcrc=
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.or>, inux-parisc@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 21, 2021 at 6:00 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This macro isn't used in Linux, now. Delete in include/linux/sched.h
> and arch's include/asm. This would confuse people who are
> implementing the COMPAT feature for architecture.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

It would help to list how long it has been unused for. Looking through
the git history, I see commit a06db751c321 ("pagemap: check
permissions and capabilities at open time") removing the last user.

I would normally offer to take the entire series through the asm-generic
tree, as I do for this kind of cross-architecture work. I'll probably
not have time before the merge window to pick it up though, so it
may be better to go through the architecture trees, or possibly
linux-mm for anything that fails to get picked up.

For the series:

Review-by: Arnd Bergmann <arnd@arndb.de>
