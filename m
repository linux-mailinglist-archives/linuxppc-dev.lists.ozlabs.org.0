Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A862DDED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 15:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NChyR6jSqz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:25:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6hp/l5V;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6hp/l5V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6hp/l5V;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U6hp/l5V;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NChxR3Xf8z3c9B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 01:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668695045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ero3Dop74ZUrxw/cst3yMxEJhDrRdAAQvlUsX3escHg=;
	b=U6hp/l5VTUJDdI4+4rllrSNo9nh4XAjZl4owqCdSiSTB7Xq/pF5zdA+I1VpPq0EWqb1E0t
	adPOlhv7aN0TWCgQ/DCVjdMz60p28eu4CSl6WfCYRzfFZIy5m5JAAZxQfDNsfFo8bYaiR9
	w0casiP/nCnzJUIuWj4sO/DEY/RxgJ4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668695045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ero3Dop74ZUrxw/cst3yMxEJhDrRdAAQvlUsX3escHg=;
	b=U6hp/l5VTUJDdI4+4rllrSNo9nh4XAjZl4owqCdSiSTB7Xq/pF5zdA+I1VpPq0EWqb1E0t
	adPOlhv7aN0TWCgQ/DCVjdMz60p28eu4CSl6WfCYRzfFZIy5m5JAAZxQfDNsfFo8bYaiR9
	w0casiP/nCnzJUIuWj4sO/DEY/RxgJ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-8HVUW98TO0G2Cz85CHsTjA-1; Thu, 17 Nov 2022 09:24:01 -0500
X-MC-Unique: 8HVUW98TO0G2Cz85CHsTjA-1
Received: by mail-wr1-f69.google.com with SMTP id v14-20020adf8b4e000000b0024174021277so768842wra.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 06:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ero3Dop74ZUrxw/cst3yMxEJhDrRdAAQvlUsX3escHg=;
        b=mF1+IFHSsLFMzdu/Wxf5AaZOKxYM3Ab4F3dN8Zzi8PEh69jPKm9ReHkd3SQJ7YRM4b
         ouN7g+EjOvCDGigCLM/yvkoYZoe4N+BZfQmvY1QzNUDK10kXhIscqj45echXDeGT603V
         7H6BDyJSV9Moujoou++dEnSxzGCXv3IDtXCFWcQcM9/BauHKl90qmbEbMQvzYcAtOztQ
         QHNZ3XsvpiU/4sD6mzXfAX2ytHPQSc4c1882XYbri+H1oktVsW9Cjy2STrZ8aw+Z8AWf
         c7WsD32ELNA/CqP2KMdmt3WKBuuqjKqFPNeaRB9BlXdX1V9VnTirEPP1RChcJWEipFX4
         IVUg==
X-Gm-Message-State: ANoB5pnNAc0nP9wKjQwoqeQ/bREzMIYg+dUL3rBUICpqFPGhrN6KGNzD
	0eJ12J+f8JWI2lIg5YYq2d1y57o3oMAP4v0q5YPeuYV5rz7Ke6A3An48DJOCWdtpmsBaoJodwbw
	LlA9Alm1BRbPRyNcalmlDn5ffKQ==
X-Received: by 2002:a5d:58fb:0:b0:236:74c5:1b2d with SMTP id f27-20020a5d58fb000000b0023674c51b2dmr1616741wrd.14.1668695040760;
        Thu, 17 Nov 2022 06:24:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7dCrVGloFO6BdNbsi4gADz4iCuS/nJ5b5vEmtvQw4WeirpWLMINwzrWmZ6QxU1sPuLDe40QQ==
X-Received: by 2002:a5d:58fb:0:b0:236:74c5:1b2d with SMTP id f27-20020a5d58fb000000b0023674c51b2dmr1616704wrd.14.1668695040586;
        Thu, 17 Nov 2022 06:24:00 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id t11-20020adff60b000000b0022e035a4e93sm1096445wrp.87.2022.11.17.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:23:59 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v2 4/8] smp: Trace IPIs sent via
 arch_send_call_function_ipi_mask()
In-Reply-To: <Y3X5/65o8127DgZl@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-3-vschneid@redhat.com>
 <Y3X5/65o8127DgZl@hirez.programming.kicks-ass.net>
Date: Thu, 17 Nov 2022 14:23:55 +0000
Message-ID: <xhsmhk03ty804.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.
 org, Daniel Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/11/22 10:08, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:32PM +0000, Valentin Schneider wrote:
>> This simply wraps around the arch function and prepends it with a
>> tracepoint, similar to send_call_function_single_ipi().
>>
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> ---
>>  kernel/smp.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index e2ca1e2f31274..c4d561cf50d45 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -160,6 +160,13 @@ void __init call_function_init(void)
>>      smpcfd_prepare_cpu(smp_processor_id());
>>  }
>>
>> +static inline void
>
> Given the use of _RET_IP_, I would strongly recommend you use
> __always_inline.
>

Noted, thanks

>> +send_call_function_ipi_mask(const struct cpumask *mask)
>> +{
>> +	trace_ipi_send_cpumask(mask, _RET_IP_, func);
>
> What's func?
>

A rebase fail... That's only plugged in later.

>> +	arch_send_call_function_ipi_mask(mask);
>> +}

