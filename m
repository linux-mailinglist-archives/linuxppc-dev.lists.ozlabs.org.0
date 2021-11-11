Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80944D3D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 10:12:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqbZg5Yx1z3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 20:12:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WV4O0X4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=WV4O0X4u; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqbYz3jf8z2xC2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 20:11:33 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso3956547wmf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RJN505w6CL42PiEBXtyIsEZEsP4VhYdScJ4DvF6IvUE=;
 b=WV4O0X4udKGv3mXB+Hyjn+Y0JK+NaM83No3U8ONvBfm9JnOz7BosU+qPGnOX9b7h6a
 viRTnicfbRqxuku9BNAtdIx3oK590XlPQBEkrBTm62zhnZE1IJsEA1FQP58xcf2TNLzX
 jyL2Aq1TA5p1/bMTJey4kNHPHCP9uZhAk4E2PU2VC+70VuJQ8z5K4t9dt3Eiyc6++s15
 bKWtIr5Dq33i55/WXa0Vo+Bqxk31w5GQA4XHVaKSeX1M0i/ya66UgTtwxMST8st7S11r
 pAnYVnVLMQXG/FNCi/rsCpVlkSXbcQrNBPgjwm4AmtvqLHhqkMOMTUPM4WPEx6+vHrpA
 fyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RJN505w6CL42PiEBXtyIsEZEsP4VhYdScJ4DvF6IvUE=;
 b=dxTcwJc06lowSSADK0U52cSaF7c6QFNZVXikaRkxS97w4nkab4BeD0gk6jce+REOSY
 r1+ASQpULa3rW0pKQGnqGIpLOKQdrT2VN6H1Cs4e082912Oor/95c34KyDg+Rg9N8+tY
 A4t5scISbplB/xEQ1JgXcT5Iha1qshPfT0otv29CrQUmLlxb5EdrHXu6OBOcBV9h3RRC
 qK+1NfBEpRt5QoWOC5T0w9ZpfjP1gQCcg1naVDdBtlFmeOsa0HYk/TP4MzoadagQyMPC
 NDiJjTsVRBCKtlDoGmEwEb+3IHByrPf7rPYUvHNbRX06pDfbeJngWDZILDedVduqUcnf
 93KQ==
X-Gm-Message-State: AOAM530RWzvfqEA79KmT/R0Hpr86aV5VRJaDH9xIN6WDs27nPpGGXf7i
 broXILPNm+Mb7xaH1HINbRfqhA==
X-Google-Smtp-Source: ABdhPJzkZFauMx8KH0DEgUcMSakcoswH2SNKj7IhgTRnKWp9Auzdv8qBuhpD4B2Wlp1Wmez/UFj7Vw==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr6684146wme.38.1636621889057; 
 Thu, 11 Nov 2021 01:11:29 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:fd21:69cc:1f2b:9812])
 by smtp.gmail.com with ESMTPSA id s13sm8531050wmc.47.2021.11.11.01.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:11:28 -0800 (PST)
Date: Thu, 11 Nov 2021 10:11:21 +0100
From: Marco Elver <elver@google.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 4/5] kscan: Use preemption model accessors
Message-ID: <YYzeOQNFmuieCk3T@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-5-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110202448.4054153-5-valentin.schneider@arm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subject s/kscan/kcsan/

On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> preemption model of the live kernel. Use the newly-introduced accessors
> instead.
> 
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>

Reviewed-by: Marco Elver <elver@google.com>

Though it currently doesn't compile as a module due to missing
EXPORT_SYMBOL of is_preempt*().

> ---
>  kernel/kcsan/kcsan_test.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> index dc55fd5a36fc..14d811eb9a21 100644
> --- a/kernel/kcsan/kcsan_test.c
> +++ b/kernel/kcsan/kcsan_test.c
> @@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
>  	else
>  		nthreads *= 2;
>  
> -	if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
> +	if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
>  		/*
>  		 * Without any preemption, keep 2 CPUs free for other tasks, one
>  		 * of which is the main test case function checking for
>  		 * completion or failure.
>  		 */
> -		const long min_unused_cpus = IS_ENABLED(CONFIG_PREEMPT_NONE) ? 2 : 0;
> +		const long min_unused_cpus = is_preempt_none() ? 2 : 0;
>  		const long min_required_cpus = 2 + min_unused_cpus;
>  
>  		if (num_online_cpus() < min_required_cpus) {
> -- 
> 2.25.1
