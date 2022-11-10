Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8BD623834
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N72vQ32DNz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:36:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aEMTlQJm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aEMTlQJm;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72tS4VSGz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:35:27 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id b11so379587pjp.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4U6HYkpXGvvUxavUnJ5+ed1ZVusXt6XGG8837aDmvw=;
        b=aEMTlQJmtIgZBDbT8vTXqJPYUGR9nY2Jvghan88jbWl44t+wZl+nQbXxiNOMqNAxyw
         tR4wCWbDWBFIRbe3CFPpyDLT4q1ixi8gxUDcRmOc1FHr7vqrhsTdSK4yS23EbnPWZRZA
         ExYAy2DlaksWQbHCU0FgqJnMfbiSJlweOfsm2S++T178VqUCRpoqi+t+gCckGprSQvSK
         djxcMYvYhG2W++c0EWlFBXcd/9kFud8mRv3N+3y8pATJHTvU1/w6IGpCcI4ekvViRgOL
         35OTYqewPyKzLAxAGf4HS9c687GRJr4H4knlXYs6Tp0ngyi2zC7ToYyPfmgwNLYRf9DE
         XxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4U6HYkpXGvvUxavUnJ5+ed1ZVusXt6XGG8837aDmvw=;
        b=Fc36Tpwhe75+2BvwnyRPgao0AitX2aG6ZJ8m5955Faspy6LGwHSPhLJ/Ok7jwKkEWv
         UEjDT8ezpFWapujIaBQntqXjDZIcMwxakcDTW2VuYfONvxNqfTFe0vYLLoFl8kVOSvyI
         WXhaHrSafJQ4YeLEANPqjdDC0PCpATc7XuW8D9jhso1EFAOlQgi0Ljlq3wnxL2TeuvKp
         w0xI3vrtmT6eAdb9fPSQwLotoHw1gZ/IuN2QiGa0L+jLfi9TrFJjxO1OXnUpISOvHz+k
         kU34xXATwl5ToqyPNI3C9LFEvQ6nGhHSjvPKNpyqaDfnGl1XOkwIEAJQQbq8/La0wnfk
         ZaRA==
X-Gm-Message-State: ACrzQf0I6SQT/2YjREtyEx18O1r7GjIK/+1oIUImgep7EQ1x00K70e41
	P2MlIYSV7NhoUsEzdVTz3Zw=
X-Google-Smtp-Source: AMsMyM7h4t35Y3nxEBa+s5dmUObDxYZZDxl0MSa00fHIEDJicpFeu/9LawhynZfCmagfWgwXrjAOfQ==
X-Received: by 2002:a17:90a:f3d4:b0:213:959f:5a90 with SMTP id ha20-20020a17090af3d400b00213959f5a90mr68719325pjb.54.1668040524738;
        Wed, 09 Nov 2022 16:35:24 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id k14-20020a170902ce0e00b0016dbdf7b97bsm9634482plg.266.2022.11.09.16.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:35:24 -0800 (PST)
Message-ID: <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:35:21 +1100
In-Reply-To: <20220728063120.2867508-2-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-2-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
<snip>
> -#define queued_spin_lock queued_spin_lock
>  
> -static inline void queued_spin_unlock(struct qspinlock *lock)
> +static __always_inline int queued_spin_trylock(struct qspinlock *lock)
>  {
> -	if (!IS_ENABLED(CONFIG_PARAVIRT_SPINLOCKS) || !is_shared_processor())
> -		smp_store_release(&lock->locked, 0);
> -	else
> -		__pv_queued_spin_unlock(lock);
> +	if (atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0)
> +		return 1;
> +	return 0;

optional style nit: return (atomic_cmpxchg_acquire(&lock->val, 0, 1) == 0);

[resend as utf-8, not utf-7]

