Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADB1FA7C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 06:30:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mFcg5LtjzDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 14:30:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n9mKx0XL; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mFZK2nV5zDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 14:28:38 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id u128so1757385pgu.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 21:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YaFHme5I+vEiE9uZgkx1lHevUOVlBP99z4TPAG/B6Js=;
 b=n9mKx0XLblljfU1/2otAMQ6pOQK99gXRz18ZgUZanhinH4owiDvYtypcf6Sqq8gdZG
 Yb2CBv7G7K2Yb6rXbPVUvT3oyqsRA3u/c8QRqvJ/zi8KD0E0RBo4aBUCBPJVrq3dWApo
 j0tAWc8e3IDgc89c+TIzduQ0sDiDTd9muFhIdDU7HsJCvRhJhGGGEz4h6378+1ZpL+Es
 GxLDhhajfiVsOIZH15jDXXb767tbDzuQjAvSief8u3zUyPKP6XHCtCKkyf4iewHo9Odl
 Q9KvqSKO8336D8/ZgFsKI6z6gXxnfqM7P3IC/gngXLggYeSojKqsQNto+keFGVdQGGCF
 b5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YaFHme5I+vEiE9uZgkx1lHevUOVlBP99z4TPAG/B6Js=;
 b=kEksdIyc8e+YAv3Huy/RJmQEi9LNe8nlsMvZojUoPdlxY7+ZpGcG8txzjWs4bNGH9u
 4ydnm0VDAgEIv0RNVC9NiFq1qQv5jmT1pPIXCqVkFeu2BGZQgNqjMeZrofaOMxaELqar
 z8/Tz2+c/epPBwoDugxbkApqNyV69x5up9HfqpMMvVxGifWW2p1qoGEFZwCoTyPzQmT8
 ZOOoJQrSWg+aukClVxHJrepjObCGKUQ6MLqYczkJKbL7apirK4SKkqIdOYThU1cBKE50
 myS9GC+KWf13BRxFQi6pbXD3AEcmjDUYZBU8Gu4lIaldzHqrcRO8u21/4yFfWWG1ZycE
 Uf0A==
X-Gm-Message-State: AOAM530zOs8sDjIR3ebbYNGRLHRC/PuWC08BDutmE8SpKtR7h8KWH/vR
 QFnpMs0KTomymD4lX30ZYc95yg==
X-Google-Smtp-Source: ABdhPJxpnwaDV/9AKfcTr2LjEIIk4xAPjUH6jqsguih+3J5o67WPw9vRcApVwL9o95WNsa02ug5U5Q==
X-Received: by 2002:a62:7bcd:: with SMTP id w196mr433531pfc.73.1592281715522; 
 Mon, 15 Jun 2020 21:28:35 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id q10sm16272276pfk.86.2020.06.15.21.28.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 21:28:34 -0700 (PDT)
Date: Tue, 16 Jun 2020 09:58:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH 1/2] cpufreq: Register governors at core_initcall
Message-ID: <20200616042831.3kazrpvvjhbahoaj@vireshk-i7>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615165554.228063-2-qperret@google.com>
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

On 15-06-20, 17:55, Quentin Perret wrote:
> Currently, most CPUFreq governors are registered at core_initcall time
> when used as default, and module_init otherwise. In preparation for
> letting users specify the default governor on the kernel command line,
> change all of them to use core_initcall unconditionally, as is already
> the case for schedutil and performance. This will enable us to assume
> builtin governors have been registered before the builtin CPUFreq
> drivers probe.
> 
> And since all governors now have similar init/exit patterns, introduce
> two new macros cpufreq_governor_{init,exit}() to factorize the code.
> 
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
> Note: I couldn't boot-test the change to spudemand, by lack of hardware.
> But I can confirm cell_defconfig compiles just fine.
> ---
>  .../platforms/cell/cpufreq_spudemand.c        | 26 ++-----------------
>  drivers/cpufreq/cpufreq_conservative.c        | 22 ++++------------
>  drivers/cpufreq/cpufreq_ondemand.c            | 24 +++++------------
>  drivers/cpufreq/cpufreq_performance.c         | 14 ++--------
>  drivers/cpufreq/cpufreq_powersave.c           | 18 +++----------
>  drivers/cpufreq/cpufreq_userspace.c           | 18 +++----------
>  include/linux/cpufreq.h                       | 14 ++++++++++
>  kernel/sched/cpufreq_schedutil.c              |  6 +----
>  8 files changed, 36 insertions(+), 106 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
