Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B047CE2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 09:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJmbN5SVBz3cRp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 19:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G1sq2eud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G1sq2eud; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJmXc5bWTz303H
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 19:22:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0041B61912
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C107DC36AEC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640161356;
 bh=2XdBX3wzyy6S5BxKK0ZicVvab6NsAf6qcGVNsQ9XyZI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G1sq2eudGh36I+DqgeCDxPCVBPk0csEMF+RkmSiqSLDvPLTgXdTaQCC+nWWXVxDNg
 AJeKqswfXL/hhfl1wkRXss3IMn9bGHW6HvFl1Uwm3prQDpuQBnIg1M8UJxY2YWmA5Z
 +NbFb1B+IVW1qyZBIkva7VVApjtELEqUasFKBL/diZe5Dy99P9WBZY7HMWJ93KkozX
 8W/C/2xRr71eywqowyaRVuxcvjx0Wb5W+/5XzMieyQBXH45BPLGBE0rJPfH96/7ywy
 2MLhEBpsdyHiYpwTeQc+h07Co0IAZXRk3xEqe0qp/6gzwnBrkpdAUhWcuCW8GM1N3H
 g2V2JsflSC8uQ==
Received: by mail-ua1-f50.google.com with SMTP id a14so3129915uak.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 00:22:36 -0800 (PST)
X-Gm-Message-State: AOAM533cHRzeCWwDSHb2UEBx+rvcwIU1lqbYWxCRY9ew97w5Dk647jkt
 lWmt+vML/DaOuGMatK9Y6NgLk2QmYyDTb8H4Vlo=
X-Google-Smtp-Source: ABdhPJyrBN3Y+GFr2Jt9nGnwL8yvmgKGPxXYCH/BMlHDVbFRTyxSsMe3GTBWxXqMbH4bqKtfuLnOWF72/H7yGJFpaXg=
X-Received: by 2002:a05:6102:316e:: with SMTP id
 l14mr716344vsm.8.1640161355738; 
 Wed, 22 Dec 2021 00:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-5-guoren@kernel.org>
 <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
 <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
 <7ce6caf5-b16d-97de-fcc3-882a9a98437a@csgroup.eu>
In-Reply-To: <7ce6caf5-b16d-97de-fcc3-882a9a98437a@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 16:22:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR5NbuVRkBWyEiCmsq4y3Ua_JMZSPcX=LQdzo2tOCFyYQ@mail.gmail.com>
Message-ID: <CAJF2gTR5NbuVRkBWyEiCmsq4y3Ua_JMZSPcX=LQdzo2tOCFyYQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.or" <sparclinux@vger.kernel.or>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Got it. Thx

On Wed, Dec 22, 2021 at 3:27 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/12/2021 =C3=A0 04:02, Guo Ren a =C3=A9crit :
> > On Wed, Dec 22, 2021 at 2:43 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >>
> >>
> >>
> >> Le 21/12/2021 =C3=A0 18:00, guoren@kernel.org a =C3=A9crit :
> >>> From: Guo Ren <guoren@linux.alibaba.com>
> >>>
> >>> This macro isn't used in Linux sched, now. Delete in
> >>> include/linux/sched.h and arch's include/asm.
> >>>
> >>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >>> ---
> >>>    arch/powerpc/include/asm/task_size_64.h | 6 ++----
> >>>    1 file changed, 2 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/i=
nclude/asm/task_size_64.h
> >>> index c993482237ed..7e2eca4fac4d 100644
> >>> --- a/arch/powerpc/include/asm/task_size_64.h
> >>> +++ b/arch/powerpc/include/asm/task_size_64.h
> >>> @@ -44,12 +44,10 @@
> >>>     */
> >>>    #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
> >>>
> >>> -#define TASK_SIZE_OF(tsk)                                           =
 \
> >>> -     (test_tsk_thread_flag(tsk, TIF_32BIT) ? TASK_SIZE_USER32 :     =
 \
> >>> +#define TASK_SIZE                                                   =
 \
> >>> +     (test_tsk_thread_flag(current, TIF_32BIT) ? TASK_SIZE_USER32 : =
 \
> >>>                                                TASK_SIZE_USER64)
> >>
> >> I think you should use test_thread_flag() instead.
> >>
> >> Or even better: use is_32bit_task() and bring back this macro as a
> >> single line, something like:
> >>
> >> #define TASK_SIZE (is_32bit_task() ? TASK_SIZE_USER32 : TASK_SIZE_USER=
64)
> > Okay, looks better. I would fix it in the next version.
>
> Note that is_32bit_task() exists on powerpc, parisc and sparc.
>
> For other ones you can still use test_thread_flag() instead of
> test_tsk_thread_flag(current)



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
