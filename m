Return-Path: <linuxppc-dev+bounces-9797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD6AE9342
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 02:12:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSJz23GP9z2xWc;
	Thu, 26 Jun 2025 10:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750896734;
	cv=none; b=oIz+pUtGNtqRda1CWr9x2moFGa3VrP82aut/IOP8wF2YZ5urYGxFYb1kroWoJZxysXvymbzOz5cieIFmF/y1WlQj/jwWMcodTYGGeLeK27kRpCjoop12fH4ygVxkQG6btYv/TFVM7DoPo7V6qfxFIANnFjP3H+tL7rfGJtqsWhYlabdFynVc5vnyVpcDHuWtOMdHBUslwaLED2y6ACr3vtCAPSe4lUCSam91G9rap+Umb1kJt2uvlMMdqRsx6Hpq0irEgfQ0gxUmBxHwTgXJh/NAjNZjp7QiJT/aio8gXRxVlF9wigexdYmfIt6RXH9RVOFKk5tATO4kYXXVSXVsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750896734; c=relaxed/relaxed;
	bh=lowV/nKzWTvWfWNiFO0HDvMPBtQosk45w4ddFI+eEJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdOde/25ExIQxxPALRczMIIn1BwWTJ/s/rXWdS6ILV0ATZpSynJPlFdibdFm12Bm3THGt0+KCPu8carfSqVOtIzVRO6c7CX22gyTuqRX9gXjixxT8mxzVjA6pPikK077Hq8vPxhrkZe2ByTzwrZ5eITzbSwr6mP95BJlr95GEj2v8AhBCw0QqrexxAAuWmCw4dvpFFkrvmLHcckzAq5kwVwQeJ0GLFpKaImtBj95XQx9baX1gTNybXslLmyyeyCEG07fRD/CKumHSx1RwyrlKo1H3a4+g1cLGWPh3ygBctnk5qeugwhkitgvzOQ69089uokzE00wPlnPmqNssrbYEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OYiHKKlA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OYiHKKlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSJz14s7vz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 10:12:12 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23636167b30so5291475ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750896730; x=1751501530; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lowV/nKzWTvWfWNiFO0HDvMPBtQosk45w4ddFI+eEJ4=;
        b=OYiHKKlALu7oy9kz0cXZkv7ujcjXld+IETpV1PcWUHrqg9ZOz+1pSsackO9f/pRUsx
         tRf4aNT9I3kexA2rOoIeoM2O6kkuvLtUnpxiXA7QBs1h7HhIF/NCMUBp7O9rC0DZ89/N
         6B9pKdGM2hRZZ6D2OrInmDNS6OQ32DsmDZX8nHkxQucPgK9urXTdiA7GmsC7q7CiRpRx
         Y+yDoolAE0mg1U0mmSA4U5LcCypxpubSYATdvZU6a7gIkhEO2/XwAOKB694xVGmI/OnD
         b1v0zgA1PLJDCI8hBBXIFn1BL4W7FU+w07+FTaGM1y9qOCrypiBQKJcGt7wmGElIpm19
         X9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896730; x=1751501530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lowV/nKzWTvWfWNiFO0HDvMPBtQosk45w4ddFI+eEJ4=;
        b=AWHI1MoeKrARdYiB99lMZ0dJczCtWVrYRoqGazpQOFM+ejt/XKND+oRcnE4+VgsNx3
         qM9u3wCdCfc3vOC5Nn+KmScM5/tch61zZaYc/7Noh4BaxIRdc3L6AqaWNwMV3M3Wb0tr
         UwPZLNRIWJSa2Jm8o1IMMKChMHVMHWIoaNsj2HrDBv01dG6ob/cI9l8CHhmP0WmMT5+1
         OKK5FX7kx4JRphlzAguXQLO6iWe0HuoJv9AFE94dLvIIBlw4wY9d/XWy60aFu5OYlpz8
         kXkYdajB8N3JCJ0kSfcR+0XnMtqM/KsJxKcglBsmAjM4rzm94U3uqbKgPhpvKJOYWNC/
         SAdg==
X-Forwarded-Encrypted: i=1; AJvYcCWNttowxC4qCMj963N3CI3iVMx+pwxD2bj4QIMxE2DfM6GsVSwDpQKS0/adju3QYug0wJ9daXIwwvVPcRk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKnOl4HLriC85T9MNajmAJVoCN/uUqqqrmDmyE9Xlt27roMtvO
	cxd8QSrMjRsizMQa9X2eDSn45pCxdowNseSafJoxzq1lsWB9pVnFH6va
X-Gm-Gg: ASbGncvuKz1eWASWL95oIsvfczuULuJAUPUHKzAwfBhL9sMbXgUd3Qg2GvAzh90ly9Y
	zLt5OyUjjAdzN02uJl3CKEX2KiedNPDZ6M0OpVpTETgrB1tBThxXIDVo5PyFrgsMP27zoh7QSBg
	RiyNlV984oADaelY7tmQB9NJB46H/17DECUWGEhIO4jyy4VrxmxKQRYBXHHwFTl6Fhz2ez5XR94
	pxVRcDezCDvRmto/9fx7BMrT9Uxq2E1PFk/M1Bj57Hx7/qtrHeSOUuE+dY6/XtAnmUQNeoHmqgn
	omSVy+DaAwgwvvODI/Dv4HvtTXdcVduFPndfJShnqxM2IYYVJCYh+UqD1xsj5w==
X-Google-Smtp-Source: AGHT+IFdjaJJtcu1Ur4K2yZ0JHexKIy67/OGUnCR0lz66MZ8PefNDV+iP31fY0J968Af1oTeT5n7Nw==
X-Received: by 2002:a17:902:f681:b0:234:9670:cc73 with SMTP id d9443c01a7336-23823f65de5mr93831885ad.5.1750896730581;
        Wed, 25 Jun 2025 17:12:10 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d869fbfcsm151610165ad.194.2025.06.25.17.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:12:10 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:12:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 7/9] sched: Add static key check for cpu_avoid
Message-ID: <aFyQWLpI8B8B1AoM@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-8-sshegde@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-8-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 12:41:06AM +0530, Shrikanth Hegde wrote:
> Checking if a CPU is avoid can add a slight overhead and should be 
> done only when necessary. 
> 
> Add a static key check which makes it almost nop when key is false. 
> Arch needs to set the key when it decides to. Refer to debug patch
> for example. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> This method avoids additional ifdefs. So kept it that way instead of 
> CONFIG_PARAVIRT. 
> 
> Added a helper function for cpu_avoid, since including sched.h fails in 
> cpumask.h
> 
>  kernel/sched/core.c  | 8 ++++----
>  kernel/sched/fair.c  | 5 +++--
>  kernel/sched/rt.c    | 8 ++++----
>  kernel/sched/sched.h | 9 +++++++++
>  4 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index aea4232e3ec4..51426b17ef55 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -148,9 +148,9 @@ __read_mostly int sysctl_resched_latency_warn_once = 1;
>   * Limited because this is done with IRQs disabled.
>   */
>  __read_mostly unsigned int sysctl_sched_nr_migrate = SCHED_NR_MIGRATE_BREAK;
> -
>  __read_mostly int scheduler_running;
>  
> +DEFINE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
>  #ifdef CONFIG_SCHED_CORE
>  
>  DEFINE_STATIC_KEY_FALSE(__sched_core_enabled);
> @@ -2438,7 +2438,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  		return false;
>  
>  	/* CPU marked as avoid, shouldn't chosen to run any task*/
> -	if (cpu_avoid(cpu))
> +	if (cpu_avoid_check(cpu))
>  		return false;

Here you're patching the code that you've just added. Can you simply
add it in a proper way?..

