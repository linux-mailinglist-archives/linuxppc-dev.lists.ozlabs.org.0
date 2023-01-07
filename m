Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFF660E34
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 12:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Npy6x2kHtz3c94
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 22:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BzPTx+OD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BzPTx+OD;
	dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Npy6218Qkz306n
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 22:04:56 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so5256169wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jan 2023 03:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jV2yBF+mbkDE0BvyOwe05ARE6EO7XhtOfB/KJLMsfFA=;
        b=BzPTx+ODS2RwGu5d9Av3CGI6XJ0NbmKP1pStUzg0M0m6+VF6wu2vf0tqTwK0k6q0qV
         Fbx7Y4Wluy9p+k8PZjL3FOoLufHJHxtq2K/BaarEwd/dPtd/DgO4uDiDqLUXCcfzSy4g
         Wd0wz4xfpZYGbxR/O6enZWRjIhs25ZrrKgwvTGouDcupcbkSfLeRveiApotbcr4XMgph
         w/4+08uhP/RwKAozhcyw6lYPvScMk8zL6fmWwbkyxQOkT9WdSUz8lze9ta3Mlh7zLg9k
         cM2v76pe7iQT/2ZR+EkGweLVXlhhfTIoWJwjo2u32vXfi3qjeDrWte72tROnSs3wxhtS
         1Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV2yBF+mbkDE0BvyOwe05ARE6EO7XhtOfB/KJLMsfFA=;
        b=U0WbpU5tv0bXlGGp9XiqBrB/dRQPEu5dB76SNzAazIpirGB7EDTk3qxdc4b8khRJrN
         Rx+o0Xq6B8gUSos/NTxd+r8r2gF1q6srZi+OSUzrlOLVffaapuHoofnMgZeaoI61WUTo
         dE6kZvXUJ1ofmSJQw1hO/TkykF+pXXFCSr2a4JBTBcq17h/iw2HGXqosKCYAUi5uojbT
         8tvmDHRX5XBt61/SGr2OUAjlgKjsxp0o7VnTLfvhdOaY4L+zVuYA9Qnl13ctcgWKfjsr
         Xb/zlY3iIiVZoNmJcViMbBwMPLg06aUWx8dOUV3y4WGjQb60f4ZXY4Eqj56zuXlDz4yc
         IhBA==
X-Gm-Message-State: AFqh2kqmeWFdO6iZ/MUrgScTCINXDWXekOFuXsrNrZM8tVV6OXGXl6hK
	Yrw63EohTKMlALZDaGPopRw=
X-Google-Smtp-Source: AMrXdXuUafS1AFxogNrZXZJj6k6oC1QjVGeJmfZCRFdf2sgwNHMbrVBUD4+y7GGme2gWJhcqxBhA0A==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id az30-20020a05600c601e00b003c6e61eae71mr50341357wmb.1.1673089493118;
        Sat, 07 Jan 2023 03:04:53 -0800 (PST)
Received: from gmail.com (1F2EF507.nat.pool.telekom.hu. [31.46.245.7])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm10657278wms.31.2023.01.07.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 03:04:50 -0800 (PST)
Date: Sat, 7 Jan 2023 12:04:47 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v3 3/8] sched, smp: Trace IPIs sent via
 send_call_function_single_ipi()
Message-ID: <Y7lRz7oCaAmAhoqS@gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-4-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202155817.2102944-4-vschneid@redhat.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.i
 nfradead.org, linux-parisc@vger.kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Valentin Schneider <vschneid@redhat.com> wrote:

> send_call_function_single_ipi() is the thing that sends IPIs at the bottom
> of smp_call_function*() via either generic_exec_single() or
> smp_call_function_many_cond(). Give it an IPI-related tracepoint.
> 
> Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
> which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Ingo Molnar <mingo@kernel.org>

Patch series logistics:

 - No objections from the scheduler side, this feature looks pretty useful.

 - Certain patches are incomplete, others are noted as being merged 
   separately, so I presume you'll send an updated/completed series 
   eventually?

 - We can merge this via the scheduler tree I suspect, as most callbacks 
   affected relate to tip:sched/core and tmp:smp/core - but if you have 
   some other preferred tree that's fine too.

Thanks,

	Ingo
