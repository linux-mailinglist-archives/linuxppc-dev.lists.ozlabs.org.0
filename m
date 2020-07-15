Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3C2202D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:14:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62YW22gYzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:14:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mCQYqHda; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B62S114nSzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:09:52 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o22so1685487pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R8Gi68qr1aDvO0QyibD3Pq2zcXF2jU6VWUvfFWeUSio=;
 b=mCQYqHdaeQKSdh/0G0+UcnKbrk3gam4BRinxdpoSmGWJoo7YCrXU1HXoo+l5rldKPl
 35He1pWMZF9+F9lDMZ/nN7jyxZJKlRGDfK/7qZh0qgnwbam4p/hkHtbfSI7oUXsU2MYb
 Cl+PWrpd57mmjpgbe9ZokVqqcc23el1nAOtpj4e4lZMjeIEieffTfWhCh5sYaAZxbY0f
 cj8Y2A3l/aKfqUHGS48stXID25o58xi/YqXfV+8OlDK+hbdWvRENKfBx96v9J21XA8MR
 XbeQrkCgsBNXAIX4Fy0Wa8z3FfdSfjqYRN7X6lpEEm36Z9uwGzkz8f8D2M1DjKiUWxtg
 tJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R8Gi68qr1aDvO0QyibD3Pq2zcXF2jU6VWUvfFWeUSio=;
 b=l/Dcjf4ypUqPLDmzIawCx8wkHIFLkn0Rcp6/dyNKPZUo50rb1iadcKGgL6H7G+NSxp
 p1n1uC/1Rg8QwAyzMkk/96/RtvaDA9/WX46Edvd2a2l5VruF6w0xcqWA2tMdiBIQfdGV
 uje2FBMGeUPSws9r4+04OkrG97FwKy6ATWRrlUOE0a74k0osFVxlo/tRB6R1c5uLy1Aa
 AKnk4niETVjLn4sWh2ECOWg21GgYghAaJhmx/NjdwC5YxrWbGF02W0eY7zyD2rWi48mz
 cgMuX19haWt+tHcMukcCmajuFwXYorEleAXYD0XzS84YpLg05XEcCRB8cZDwMYNBa16d
 sXvQ==
X-Gm-Message-State: AOAM533iq8Dnk//wwN716eCoQi1hnPSI5ef8btWJvIa4Aj0FCnmIueHx
 jKVdHZCnP1Jot2tr8C1r2KhTcA==
X-Google-Smtp-Source: ABdhPJxLkRpCAh56OHvV9+ruY7Vzg+a1Z9+GxC17tANOkAOMf1eHdhsH69mrQ3UVDo33lzSRWmiORw==
X-Received: by 2002:a17:902:82cb:: with SMTP id
 u11mr6359503plz.207.1594782588903; 
 Tue, 14 Jul 2020 20:09:48 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id ml8sm369552pjb.47.2020.07.14.20.09.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jul 2020 20:09:48 -0700 (PDT)
Date: Wed, 15 Jul 2020 08:39:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 07/13] cpufreq: powernv-cpufreq: Fix a bunch of kerneldoc
 related issues
Message-ID: <20200715030946.xxetozdxe5slvoid@vireshk-i7>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714145049.2496163-8-lee.jones@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: linux-pm@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14-07-20, 15:50, Lee Jones wrote:
> Repair problems with formatting and missing attributes/parameters, and
> demote header comments which do not meet the required standards
> applicable to kerneldoc.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'last_lpstate_idx' not described in 'global_pstate_info'
>  drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'last_gpstate_idx' not described in 'global_pstate_info'
>  drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'policy' not described in 'global_pstate_info'
>  drivers/cpufreq/powernv-cpufreq.c:182: warning: Function parameter or member 'i' not described in 'idx_to_pstate'
>  drivers/cpufreq/powernv-cpufreq.c:201: warning: Function parameter or member 'pstate' not described in 'pstate_to_idx'
>  drivers/cpufreq/powernv-cpufreq.c:670: warning: Function parameter or member 't' not described in 'gpstate_timer_handler'
>  drivers/cpufreq/powernv-cpufreq.c:670: warning: Excess function parameter 'data' description in 'gpstate_timer_handler'
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
> index 068cc53abe320..2e5a8b8a4abaa 100644
> --- a/drivers/cpufreq/powernv-cpufreq.c
> +++ b/drivers/cpufreq/powernv-cpufreq.c
> @@ -64,13 +64,14 @@
>   *				highest_lpstate_idx
>   * @last_sampled_time:		Time from boot in ms when global pstates were
>   *				last set
> - * @last_lpstate_idx,		Last set value of local pstate and global
> - * last_gpstate_idx		pstate in terms of cpufreq table index
> + * @last_lpstate_idx:		Last set value of local pstate and global
> + * @last_gpstate_idx:		pstate in terms of cpufreq table index
>   * @timer:			Is used for ramping down if cpu goes idle for
>   *				a long time with global pstate held high
>   * @gpstate_lock:		A spinlock to maintain synchronization between
>   *				routines called by the timer handler and
>   *				governer's target_index calls
> + * @policy:			Associated CPUFreq policy
>   */
>  struct global_pstate_info {
>  	int highest_lpstate_idx;
> @@ -170,7 +171,7 @@ static inline u8 extract_pstate(u64 pmsr_val, unsigned int shift)
>  
>  /* Use following functions for conversions between pstate_id and index */
>  
> -/**
> +/*
>   * idx_to_pstate : Returns the pstate id corresponding to the
>   *		   frequency in the cpufreq frequency table
>   *		   powernv_freqs indexed by @i.
> @@ -188,7 +189,7 @@ static inline u8 idx_to_pstate(unsigned int i)
>  	return powernv_freqs[i].driver_data;
>  }
>  
> -/**
> +/*
>   * pstate_to_idx : Returns the index in the cpufreq frequencytable
>   *		   powernv_freqs for the frequency whose corresponding
>   *		   pstate id is @pstate.
> @@ -660,7 +661,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
>  /**
>   * gpstate_timer_handler
>   *
> - * @data: pointer to cpufreq_policy on which timer was queued
> + * @t: Timer context used to fetch global pstate info struct
>   *
>   * This handler brings down the global pstate closer to the local pstate
>   * according quadratic equation. Queues a new timer if it is still not equal

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
