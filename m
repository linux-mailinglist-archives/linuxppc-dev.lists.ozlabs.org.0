Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5ED639F76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8j02BQ6z3cMl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NZDzr5az;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NZDzr5az;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8h64TBxz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:35:02 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id io19so8849482plb.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 18:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMCKPCghPywBjnvs19xv1uYV6vxnNLiaDFDZlf5zcl8=;
        b=NZDzr5azNvehOWot7iQG14i5dRW802/Q5FusRaTC0QeNriC5yvARRJ9xuSGt2XH6zv
         S+sYUmDVPoUspxKxuqcqn+IFoPts4c7Gauen3zF8nVHUMwRRxHt2Y+W/hNdmFc6nHegs
         0/UNt5OR0ssCvmYi08iRH4f/z6Btz+1RT4BYUHdbTQfughk0YtKfaIaAlUuDPApcgFCB
         Gy4F0qTQjfJ9WTptyR1dHQgWmjtapQ7uriXsNLSdiRmDqOL/uosRQ56uObIGjXXO9f6A
         aDY69VCeOjeqYu6PSbIrntYcY5He76glBExaW0sHkWzFMA/tHbl03kYDcb37dXrkL/2E
         ArXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bMCKPCghPywBjnvs19xv1uYV6vxnNLiaDFDZlf5zcl8=;
        b=NTEG9ZhioR0jCuj2uyb3DCSckeLmW2wmLXKCc3HbNtfwOo/3QcIHF+8WIDC09LKswn
         s4xjeOYdNcONDZKfP4nM79ZrYJtS9LnXErvHWBpQn32jjZm76P3xFTo6hTHKuaahII0W
         q+FwlXbFgDo4uPEoH7NsOaoAN3PclHw/WWMtowVhsQQMt4cr330h2jGIDAeDqo7hLsnL
         KSJBfa1Se1SX7MfttHckrFKqdmqEyPXRoQmYJK3wLt2dx3avHCSfziu5ejsqefgBTgid
         KYRvsy7JayZFPxyPe+nVUjcz6UiG3oiQQcPO1DiNruerr7UKTPC2LAgjJ4roJOfiv/Xj
         Q8Fg==
X-Gm-Message-State: ANoB5pnz8UV1S6v8tHOoPWpp4kPYTxWNr/373RFn5qHhMZjBLZtu/xpZ
	fPrMfZ3APxTWW0GNw9rVrkKE7Ou24gQ=
X-Google-Smtp-Source: AA0mqf5aEU5k/DRL5TWGDWkuIiVyHyiF+d7bozmzBpZrP4OdEYH/VkhRnT8P/QmV5HtHmVMSCT038A==
X-Received: by 2002:a17:902:820c:b0:189:505b:73dd with SMTP id x12-20020a170902820c00b00189505b73ddmr22402500pln.143.1669602900351;
        Sun, 27 Nov 2022 18:35:00 -0800 (PST)
Received: from localhost ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902a3c600b0017e64da44c5sm7442188plb.203.2022.11.27.18.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 18:34:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Nov 2022 12:34:55 +1000
Message-Id: <CONKTXD6H622.AK0NSD7PPNG@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 04/13] powerpc/rtas: avoid scheduling in rtas_os_term()
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-5-nathanl@linux.ibm.com>
In-Reply-To: <20221118150751.469393-5-nathanl@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> It's unsafe to use rtas_busy_delay() to handle a busy status from
> the ibm,os-term RTAS function in rtas_os_term():
>
> Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
> BUG: sleeping function called from invalid context at arch/powerpc/kernel=
/rtas.c:618
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
> preempt_count: 2, expected: 0
> CPU: 7 PID: 1 Comm: swapper/0 Tainted: G      D            6.0.0-rc5-0218=
2-gf8553a572277-dirty #9
> Call Trace:
> [c000000007b8f000] [c000000001337110] dump_stack_lvl+0xb4/0x110 (unreliab=
le)
> [c000000007b8f040] [c0000000002440e4] __might_resched+0x394/0x3c0
> [c000000007b8f0e0] [c00000000004f680] rtas_busy_delay+0x120/0x1b0
> [c000000007b8f100] [c000000000052d04] rtas_os_term+0xb8/0xf4
> [c000000007b8f180] [c0000000001150fc] pseries_panic+0x50/0x68
> [c000000007b8f1f0] [c000000000036354] ppc_panic_platform_handler+0x34/0x5=
0
> [c000000007b8f210] [c0000000002303c4] notifier_call_chain+0xd4/0x1c0
> [c000000007b8f2b0] [c0000000002306cc] atomic_notifier_call_chain+0xac/0x1=
c0
> [c000000007b8f2f0] [c0000000001d62b8] panic+0x228/0x4d0
> [c000000007b8f390] [c0000000001e573c] do_exit+0x140c/0x1420
> [c000000007b8f480] [c0000000001e586c] make_task_dead+0xdc/0x200
>
> Use rtas_busy_delay_time() instead, which signals without side effects
> whether to attempt the ibm,os-term RTAS call again.

rtas_busy_delay should probably be renamed to rtas_busy_sleep, to make
that self-documenting that it can schedule. You could then add a
rtas_busy_delay which doesn't sleep, which a few other places could
use...

But that's a bigger chance and there is precedent for using this call
this way, so looks okay to me. Maybe you could open-code an mdelay
though, although I guess firmware should be tolerant of calling it in
a loop.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 81e4996012b7..51f0508593a7 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -965,10 +965,15 @@ void rtas_os_term(char *str)
> =20
>  	snprintf(rtas_os_term_buf, 2048, "OS panic: %s", str);
> =20
> +	/*
> +	 * Keep calling as long as RTAS returns a "try again" status,
> +	 * but don't use rtas_busy_delay(), which potentially
> +	 * schedules.
> +	 */
>  	do {
>  		status =3D rtas_call(ibm_os_term_token, 1, 1, NULL,
>  				   __pa(rtas_os_term_buf));
> -	} while (rtas_busy_delay(status));
> +	} while (rtas_busy_delay_time(status));
> =20
>  	if (status !=3D 0)
>  		printk(KERN_EMERG "ibm,os-term call failed %d\n", status);
> --=20
> 2.37.1

