Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5321FAC63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 11:29:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mNFZ73v5zDqS1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 19:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wPEIR5HB; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mNCq4Cj7zDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 19:28:05 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g12so8121032pll.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XdcE3h12ioGr+7hsW5IVLEYOXezdbxNAFqbfrmJLRSE=;
 b=wPEIR5HB/ax8TnnqwOu3J6pC5s+9o0t3fzwRMbe0RIKWhsaPFHD1lqrV2tFTrsClYy
 fXJkkXXdUZRoLueisJyweahorxY75fMc3H0ThyA1LxjDI73N17olVG41cQQCKCdd0O+h
 r7CUz9eI4ZVzMpTIFpSxI0mIPvhl8qO85r/XMjg22vS3Ov3d8uAg7JEEGXGLqFjbB4jM
 +jLlfrPxEuG6Ujf7eDhe/obXkCYuFKN6vvjJFb7tzS1cRU7lDb/sEr2/4Fm9k7wR0Jez
 0SBvCXqtCJGTsyc0ZpZhkEPxr1q62rjUaEbuxcB+tb+lozLn/3eymIlUzcXcG3n+Gnye
 0aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XdcE3h12ioGr+7hsW5IVLEYOXezdbxNAFqbfrmJLRSE=;
 b=FoRA18pZTeXKs5Ba22SHmtGl/tbtuOuX6j54NNz9+rtsj2RRWOWc57MjNpv4JsMOV4
 cAry7y8zipvZoCwS14ia8WCD5RjzvDu4T7XJNI7it3R4N2f5J8dfQ9dUFQ3h9somB2LF
 buO/vYFiQPzUQ9eP2mZAmw3+VduQ9nZ82AMLDfPrBuqGgJ/dVy+pCWhlxf0fCI3ZTueg
 vqjNuZUSHmuXGL40X+7VQSRrrx5qqmF/f5gRCmIJzrxyxnp6jUcMC/kAsSibmT4mNTl9
 95gj2omGh/okczLICcbGLQGNmA4soHkBpNIfgV2a5MHZ/pbGRlGh1h5EfKB+6dKS3ekd
 HZkw==
X-Gm-Message-State: AOAM530DOxsvVPLCRfk8RbAtpqwaDh9guJd8iufxkFF4fhiPz1ywA3fN
 hppDtegk6SANJJI7kEAs9NFfWw==
X-Google-Smtp-Source: ABdhPJwsq5ESQOf7eSEAjznxqn8WuPCsn7fjszcUwCqSP6x8q4k9NAQZ5Lzj/jzTj5RJh+yG7ZljTA==
X-Received: by 2002:a17:90a:39ce:: with SMTP id
 k14mr1903225pjf.39.1592299681986; 
 Tue, 16 Jun 2020 02:28:01 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id n4sm17088638pfq.9.2020.06.16.02.28.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 02:28:01 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:57:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200616092759.rjnk3lef4tedfust@vireshk-i7>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
 <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
 <20200616083107.GA122049@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616083107.GA122049@google.com>
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, rafael@kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16-06-20, 09:31, Quentin Perret wrote:
> Right, so the reason I avoided cpufreq_core_init() was because it is
> called at core_initcall() time, which means I can't really assume the
> governors have been loaded by that time. By waiting for the driver to
> probe before detecting the default gov, we get that nice ordering. But
> yes, it feels odd to have it here :/
> 
> Thinking about it more, the natural fit for this would rather be the
> register/unregister path for governors directly. If that sounds good to
> you (?) I'll try to move it there in v2.

There is another problem here which we need to look at. Any governor
which is built as a module and isn't currently used, should be allowed
to unload. And this needs to be tested by you as well, should be easy
enough.

With the current implementation, you take a reference to the default
governor when the driver is registered and drop it only when the
driver goes away. Which means we won't be able to unload the module of
the governor even if it isn't used. Which is wrong. The solution I
proposed had the same issue as well.

You need to figure out a way where we don't need to keep holding the
module hostage even when it isn't used. I see two ways at least for
the same:

- Do that from the existing place: cpufreq_init_policy().

- And I think this can be done from governor-register/unregister as
  well.

Second one sounds good, if it is feasible to do that.

-- 
viresh
