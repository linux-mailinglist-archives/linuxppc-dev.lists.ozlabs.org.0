Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD7D343220
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 12:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3FyB1qn9z30B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 22:38:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CjBgjxTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=senozhatsky@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=CjBgjxTr; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F35hc5NXSz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 16:26:21 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id c204so8731205pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 22:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hh7shEFqN+4YQy0DWvjoXzsDlDCaLtw9ra44KHPWHkg=;
 b=CjBgjxTr+npHKRoZHWRNroG1zVN7+AkzcS/lmkSLNlF4EKxZnVNJjDShIuxxxAbDMP
 Zi7BM7SPsQiwW3sjUNxe7wSxx8345a5fj0NJPVkLBGCQUl1vmxZJ8jBKoC1wCrRzdvKX
 XajNGZiZipEMON2F1c0CexM5NZ+JccY+8RIow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hh7shEFqN+4YQy0DWvjoXzsDlDCaLtw9ra44KHPWHkg=;
 b=PjkGNoS8O06TSycG5dfNg1ZKciNlvCbnM5amvuVNdcKdpD4u1WhcrKJjLrNt5IRNce
 0O3t+Ow13gq0wzWrFA2I8dEeBDmzQ/wtsdPazGRPRGTx02n2/D74LAs0Uh8JZoImS/W7
 gR2/ARuzh+v9c4BDEc5oZ8zbjve8ccWm1QaSi0SBFuCLzA8PPxQBoT5gwqjN+8TbEyw2
 baO99aB4I5Ff3qIvhhmVlD/8i/owTtdf2CZXybNWlOrsQCXUq5ynh8ui4WfdM6Yc6rp5
 vW7LgE2HvE9EBYK411nBbAjR1Y70PoofxGzKFkizHYw0TpgQuBaFUpCuZCo8KHVeZ8hp
 GPCA==
X-Gm-Message-State: AOAM531K92wDDZWYZKGvfjNc4k+zkGN8gHX8yLV5YJl2LLCLYcMYNhOZ
 +Uwqy5w36KlmMqFF8HqqQTOSQw==
X-Google-Smtp-Source: ABdhPJzWtY3HUJYpBDSoqpysrTRhl3hfq3Gue+pAzMn1TblrjdoVsbczMaY8+SWExQl6c3ccUGZpXA==
X-Received: by 2002:a63:1845:: with SMTP id 5mr18028063pgy.244.1616304378263; 
 Sat, 20 Mar 2021 22:26:18 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:2dfa:a0a:77ff:3953])
 by smtp.gmail.com with ESMTPSA id x190sm9815525pfx.60.2021.03.20.22.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 22:26:17 -0700 (PDT)
Date: Sun, 21 Mar 2021 14:26:10 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH next v1 2/3] printk: remove safe buffers
Message-ID: <YFbY8kF7ilYoxvYp@google.com>
References: <20210316233326.10778-1-john.ogness@linutronix.de>
 <20210316233326.10778-3-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316233326.10778-3-john.ogness@linutronix.de>
X-Mailman-Approved-At: Sun, 21 Mar 2021 22:38:19 +1100
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
Cc: Rafael Aquini <aquini@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (21/03/17 00:33), John Ogness wrote:
[..]
>  void printk_nmi_direct_enter(void)
>  {
> @@ -324,27 +44,8 @@ void printk_nmi_direct_exit(void)
>  	this_cpu_and(printk_context, ~PRINTK_NMI_DIRECT_CONTEXT_MASK);
>  }
>  
> -#else
> -
> -static __printf(1, 0) int vprintk_nmi(const char *fmt, va_list args)
> -{
> -	return 0;
> -}
> -
>  #endif /* CONFIG_PRINTK_NMI */
>  
> -/*
> - * Lock-less printk(), to avoid deadlocks should the printk() recurse
> - * into itself. It uses a per-CPU buffer to store the message, just like
> - * NMI.
> - */
> -static __printf(1, 0) int vprintk_safe(const char *fmt, va_list args)
> -{
> -	struct printk_safe_seq_buf *s = this_cpu_ptr(&safe_print_seq);
> -
> -	return printk_safe_log_store(s, fmt, args);
> -}
> -
>  /* Can be preempted by NMI. */
>  void __printk_safe_enter(void)
>  {
> @@ -369,7 +70,10 @@ __printf(1, 0) int vprintk_func(const char *fmt, va_list args)
>  	 * Use the main logbuf even in NMI. But avoid calling console
>  	 * drivers that might have their own locks.
>  	 */
> -	if ((this_cpu_read(printk_context) & PRINTK_NMI_DIRECT_CONTEXT_MASK)) {
> +	if (this_cpu_read(printk_context) &
> +	    (PRINTK_NMI_DIRECT_CONTEXT_MASK |
> +	     PRINTK_NMI_CONTEXT_MASK |
> +	     PRINTK_SAFE_CONTEXT_MASK)) {

Do we need printk_nmi_direct_enter/exit() and PRINTK_NMI_DIRECT_CONTEXT_MASK?
Seems like all printk_safe() paths are now DIRECT - we store messages to the
prb, but don't call console drivers.

	-ss
