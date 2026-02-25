Return-Path: <linuxppc-dev+bounces-17204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHlLA4E4n2nyZQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:59:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9119BEC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:59:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLj5n4BR2z3fDD;
	Thu, 26 Feb 2026 04:59:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772042365;
	cv=none; b=AsG2xd8Y1akGLVK2Fk+iaUno+3FcL2QWPQW/5juzgv3+rlKlgH0VBJvP6vLKA04lAcd5eOk1raf3R+CrlZeOMA9Sk5IsR24lj+mTLB2h6Ny5E+HpVmd4PupSc2f5PhUWLwxzEY5irJ74cC1msuTz+aWOEb0im6ULCZz2argCynKJL9Qy8W6V6oRBVgNTdewYJx7i9MLmCbME44HEBD4afRMsXYghBQPq9bw78Xxzy5E7Eneepis8gFicscYq8mBHqjIMEOKbPb0Hir1yYztU++g8PA3Dsfd2R5yzsJ6JkF5W5HdNQrThJGL66VvlRqdxOybYjucCyjp5dKHTG4v0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772042365; c=relaxed/relaxed;
	bh=WmbRBbmslaG+5nNAmebakmFUI4iTT5LvZP/Q2XV+ZL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWYey2jiAGwCi/g1YmApwcQu+kPNJU/h0enCcBuzeZwm6phDFOqREXowytzr0QCEq2spRgChM8zV4WUykqthayNZOZnpD1SRqyyoVQXxyXgVgvwl1Xjk/z8Ge6fKRE6RQ0MGVmnDFHGQr4RAWb3g6LlXC9e092lPTQK+Z1bCm23jFhg5zxW2Z4FLX8ql53Kb/xJ4GHpPDUfgzktj8fRgLAdHNMK9CkMqWC/wFyfs5t7F8q0LibMYoLCHd0DRdG4hTNbW6WLQ5+TjJv2a0YUC3tEfgUWCAbv8C/1iDvIwLBb8xjO0NU2SfRffKoBDiuqrcyZ5zDmjFEjGeZHwdIh6YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTtQ4To1; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JTtQ4To1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLj5m4szFz3fCk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:59:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A113343C4F;
	Wed, 25 Feb 2026 17:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07DCC116D0;
	Wed, 25 Feb 2026 17:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772042362;
	bh=gcndrDOD28MklPQt/Lh2XJCyQBbbmbxuz7jAD2TN7rY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JTtQ4To1CYUcPEg1qBHhdgllrxEgtibOC+WjvHacKlGLhV2HkSVlqwr9QiVz0aPkz
	 SVmlcLkdgoW5MoWjEmU8wSCqeRUFYMMrIehEiv41hU6TbclJwspiG6AR9oJknqpA8I
	 G/9sAfx6DhHQF4lgHtiXZhV1E2+9AVXLGbZDw6HOkkIKyo4fNi8f7SJNGtZf7MTwW0
	 gTYo7UCmQxvz1w3GcuHAnC2rid/Cs5G6yDK9WQOXXm0aQMPV0qmstXuSuFV7W6xvTS
	 XuX8hwDqAbABYkBvOE0pcsXUp59Q5gT+0vrg4qc7Er1X6GNGRpRi+Ipv/4nNAl2hgs
	 FIEQQUglHNysg==
Message-ID: <cd10be19-e0bc-4e0c-8dac-4f1c05d0de8f@kernel.org>
Date: Wed, 25 Feb 2026 18:59:11 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in
 dynticks-idle
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Juri Lelli <juri.lelli@redhat.com>, Kieran Bingham <kbingham@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Paul E . McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Xin Zhao <jackzxcui1989@163.com>,
 linux-pm@vger.kernel.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20260206142245.58987-1-frederic@kernel.org>
 <20260206142245.58987-5-frederic@kernel.org>
 <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
 <9ab1e7d7-57ee-49f9-963c-3a1b96dda684@kernel.org>
 <120884b0-0b09-43a9-b0f6-7dc2affe1ac0@linux.ibm.com>
 <55720b5b-f643-4e67-8841-d81a9e712faf@kernel.org>
 <a20beb34-0e4b-4063-b6b0-6c5886bbb971@linux.ibm.com>
 <a0c6e65c-3331-402a-94eb-14ba7f4b7ba7@kernel.org>
 <729a7e7f-a50e-480c-87ce-c45221fbb326@linux.ibm.com>
 <6c007cf1-46d5-4853-ae2e-90ee5257c6c9@kernel.org>
 <62f50aad-05ce-42ac-bdf6-dcb4af69c1c2@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <62f50aad-05ce-42ac-bdf6-dcb4af69c1c2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17204-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.976];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 26B9119BEC1
X-Rspamd-Action: no action



Le 25/02/2026 à 18:47, Shrikanth Hegde a écrit :
> Hi Christophe.
> 
>> I think I'm starting to understand now.
>>
>> I think the problem is that acct->starttime has an invalid value the 
>> very first time it is used.
>>
>> We are probably lacking an initial value in paca->accounting.starttime.
>> This should likely be initialised from mftb in head_64.S in 
>> start_here_common for main CPU and __secondary_start for other CPUs or 
>> maybe at higher level in C in setup_arch() and start_secondary()
>>
>> Christophe
> 
> How about below? this works too.

Fine it is works, it means we found the real problem.

What about using the newly added vtime_reset() ? See below (untested)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 9b3167274653..f4aef85106ac 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -377,7 +377,6 @@ void vtime_task_switch(struct task_struct *prev)
  	}
  }

-#ifdef CONFIG_NO_HZ_COMMON
  /**
   * vtime_reset - Fast forward vtime entry clocks
   *
@@ -394,6 +393,7 @@ void vtime_reset(void)
  #endif
  }

+#ifdef CONFIG_NO_HZ_COMMON
  /**
   * vtime_dyntick_start - Inform vtime about entry to idle-dynticks
   *
@@ -931,6 +931,7 @@ static void __init set_decrementer_max(void)
  static void __init init_decrementer_clockevent(void)
  {
  	register_decrementer_clockevent(smp_processor_id());
+	vtime_reset();
  }

  void secondary_cpu_time_init(void)
@@ -946,6 +947,7 @@ void secondary_cpu_time_init(void)
  	/* FIME: Should make unrelated change to move snapshot_timebase
  	 * call here ! */
  	register_decrementer_clockevent(smp_processor_id());
+	vtime_reset();
  }

  /*


> 
> ---
> 
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 18506740f4a4..af129645b7f7 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -928,9 +928,24 @@ static void __init set_decrementer_max(void)
>                  bits, decrementer_max);
>   }
> 
> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> +/*
> + * This is done to initialize the starttime correctly. with this
> + * /proc/stat show correct values similar to 
> CONFIG_VIRT_CPU_ACCOUNTING_GEN
> + */
> +static void init_cpu_accounting_startime(void)
> +{
> +       struct cpu_accounting_data *acct = get_accounting(current);
> +       acct->starttime = mftb();
> +}
> +#else
> +static void init_cpu_accounting_startime(void) { };
> +#endif
> +
>   static void __init init_decrementer_clockevent(void)
>   {
>          register_decrementer_clockevent(smp_processor_id());
> +       init_cpu_accounting_startime();
>   }
> 
>   void secondary_cpu_time_init(void)
> @@ -946,6 +961,8 @@ void secondary_cpu_time_init(void)
>          /* FIME: Should make unrelated change to move snapshot_timebase
>           * call here ! */
>          register_decrementer_clockevent(smp_processor_id());
> +
> +       init_cpu_accounting_startime();
>   }
> 
>   /*
> 


