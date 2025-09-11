Return-Path: <linuxppc-dev+bounces-12017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0EB5261D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 03:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMgZ10tzlz2xnx;
	Thu, 11 Sep 2025 11:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757555592;
	cv=none; b=oZJp89YfYf/XiUR8BueuvIOJgGOVT8xjKdwEU7Hd2mUzTSKtKqFuzbXpO2x9hd+YezLeSYmsODdgmfbZxBTfTiSBqKEdEUK+j+CO1SSLHA1wICCnXFjVQuSrOM6dPR/e0qPdzC8uQk0NGmg9zC7seE1QseeH1dAkyoIIwZB0Dplx+5rfeIh5Cut4FXPFSGYQD7LpI+2pGT1IPyUTxGxiQZdvNkI+m6bbQeTLbR1llN8xmxZy39sRgVEuvQ026vLlAr+OYEmmRKkak5QLP4D6QI+3SNeZR/H1Jiy1mFTTW/cBjJtOMrndGIwJrtpYU2GLcoU36F9N8+44PgZJoPADMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757555592; c=relaxed/relaxed;
	bh=2ftEC8QkQSW9Yu26ixMKaFncSw8YIxtS0maQQ86n+mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Msq7DNzKnnVv9qO5KbcUD6dNBuWBBFZzgkGF0rzaGlGw93gcJ+uqXAeYY2IHzyxMPYx3EEWipnma+t3hpJvjLey0yABRB2e6cLPggfnRlzKvxVVTTUUVZFFwwrsx4npYJUsFoecXWBTrNt8TQ5mX5mW/AVdtB/wWACWkAeI7fVLKAt+1MbStKatL424CoO4aW7p14s028mB1/Obcx62WPigzfc1h1GZRAht3FMmKruGcXp0kDi9nhp8/l/8SKsiaQtyd+QZ4etjZRv1z6OTLMLQ8eZW/x7MERnNmPa53/lVSfFqPCJzeEDLMyfc84NmpaMjgkTnZR45ujqfXhbe3aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FDfn/ZKv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FDfn/ZKv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMgYz57Msz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 11:53:10 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so175002b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 18:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757555587; x=1758160387; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ftEC8QkQSW9Yu26ixMKaFncSw8YIxtS0maQQ86n+mo=;
        b=FDfn/ZKvNeUOwfxkptIiMnm1X6RuxJ1tD+rCO5YUUwrAjhY3PKrSBEiMNP0zEvkwfs
         xr9W/MHW0XjT4neMcHieb38aMEHbd7qpNq9Ue7y6Lw8Rgl3/N+Kn9jrTNvyIzlcyc5Vc
         CefFmrZqTyEr7l+nbVgEvuxi87t7vVdxdWgkryJestFueYTcpQWm3nba402EPSfRcAmc
         oLw3iiF4SMNNv2a7WF5Eob95ZV7zYfZ+naC881jxhBEyHLNbrmK1D1+UdCFT68HsUcmR
         EJg+3eLmM20mFiE/rDFpLmkuOVeBKleB7D15iqwqo+TJMbGEOqcBPoHz03rnNa8at57N
         gG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757555587; x=1758160387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ftEC8QkQSW9Yu26ixMKaFncSw8YIxtS0maQQ86n+mo=;
        b=nvKKdh69vAtcQTsLprP0AJs3Gd1ryI1glg9W1e52bAQ3DeJK50czwh4C2GgYJOv+h1
         YT5sNf0cN0iedG5WuTIwgvGugG4WuNAIecnX5qSVqHF6IQrcn7yxOkt2RI9vhM9meMKg
         39wo+Ke0qZDZzMAhci1PAlEby4tOl0b9sUDj6IZxAJrQRSZ9PYeAOxSwCyqinisDfkfh
         TUsyp4Oy3lArsYz79gNuo/VMzo/Bn+tPwdzKOHbZOiYuz1BiO7cZkH4dMD/4p2Hdp0F4
         HxQtA8JC89QlPrA7JBZ7ylDD5opEkDfGbkdeKrEyUab6bKzAEEJw43H8ng+a3X2khK+Y
         Cs1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/ISLrYSdORGsVhTQbUCVRbeMslA6VYKFv94VyzK+sBA9jZZywyr4ZtQfTuk61QSRG4pq3vfLVuEKr4Bw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyvZ7ucJvkDY20uZYvaOuEBZAOMca+ifplG0sVcDbh3BoWTCuky
	T0AdpgESHGPRHtp7WR4gzC94ihSzUIejWrdBTbfdVy5ROkCnMoOVAwFM
X-Gm-Gg: ASbGncuqCkb+wElPt7ZUDFfj64Hkm3W0DuVDwAiOuEoNq2QyDQJJQuoo3Gs2g9SgOS/
	uKcb68yMERZjHudbx1a/mU7TwFmycNNvYVgDBd4wtN1kkKGuR7U9AmdczQb8/SagDfabA0ppv5/
	NUpNXDJVnIBb0c9a38/aK305n4kJPQwecRIrxjbnMc0xZ7eH/Vx7/0m1u7gn518UU1pkrkIseU0
	MdA/scLFteFxsHJpbeyBRfs1eWaPv4cAgOmtskoXB4g2VmRY37RkuVtQ6kG4NZI852rTPfX8bFh
	ZJcGsixzy9gB3fR6tQ+VM9FYyCXLK0txQmYr1KlGyV6TmT+r1MwmTbbL1ea9W3f/L7nu9ewLuX6
	v/LsXOX27JSQ8UuDG1cGsqHBvJQwG7EFIwBwhX1wQW7g=
X-Google-Smtp-Source: AGHT+IGndbB5UAuz3dgDmvjY2BUvfTTSKWff8fM1hjgOiYID8XfDtIeSMvF+llPYiazanhdjQzxrIQ==
X-Received: by 2002:a05:6a20:4311:b0:24f:5ac4:664a with SMTP id adf61e73a8af0-2534594fbc1mr25666734637.46.1757555586723;
        Wed, 10 Sep 2025 18:53:06 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35ba7f4sm177683a12.9.2025.09.10.18.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:53:06 -0700 (PDT)
Date: Wed, 10 Sep 2025 21:53:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	gregkh@linuxfoundation.org, vschneid@redhat.com, iii@linux.ibm.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, vineeth@bitbyteword.org, jgross@suse.com,
	pbonzini@redhat.com, seanjc@google.com
Subject: Re: [RFC PATCH v3 03/10] sched: Static key to check paravirt cpu push
Message-ID: <aMIrgI9J4fuXntRz@yury>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-4-sshegde@linux.ibm.com>
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
In-Reply-To: <20250910174210.1969750-4-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 11:12:03PM +0530, Shrikanth Hegde wrote:
> CPUs are marked paravirt when there is contention for underlying
> physical CPU.
> 
> The push mechanism and check for paravirt CPUs are in sched tick
> and wakeup. It should be close to no-op when there is no need for it.
> Achieve that using static key.
> 
> Architecture needs to enable this key when it decides there are
> paravirt CPUs. Disable it when there are no paravirt CPUs.

Testing a bit is quite close to a no-op, isn't it? Have you measured
the performance impact that would advocate the static key? Please
share some numbers then. I believe I asked you about it on the previous
round.

> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  kernel/sched/core.c  |  1 +
>  kernel/sched/sched.h | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0f1e36bb5779..b8a84e4691c8 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10967,4 +10967,5 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
>  #ifdef CONFIG_PARAVIRT
>  struct cpumask __cpu_paravirt_mask __read_mostly;
>  EXPORT_SYMBOL(__cpu_paravirt_mask);
> +DEFINE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
>  #endif
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index b5367c514c14..8f9991453d36 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3880,4 +3880,21 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx);
>  
>  #include "ext.h"
>  
> +#ifdef CONFIG_PARAVIRT
> +DECLARE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
> +
> +static inline bool is_cpu_paravirt(int cpu)
> +{
> +	if (static_branch_unlikely(&cpu_paravirt_push_tasks))
> +		return cpu_paravirt(cpu);
> +
> +	return false;
> +}

So is_cpu_paravirt and cpu_paravirt are exactly the same in terms of
functionality. If you really believe that static branch benefits the
performance, it should go straight to the cpu_paravirt().

> +#else	/* !CONFIG_PARAVIRT */
> +static inline bool is_cpu_paravirt(int cpu)
> +{
> +	return false;
> +}
> +#endif	/* !CONFIG_PARAVIRT */
> +
>  #endif /* _KERNEL_SCHED_SCHED_H */
> -- 
> 2.47.3

