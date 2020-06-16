Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA721FAD11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 11:50:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mNjC15b6zDqmh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 19:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=qperret@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Iqt3U+Ef; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mNfy4gj7zDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 19:48:09 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id e1so20085144wrt.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YJhllO4Kw1J0lTqgGNFCN8u51U+dY+0Qg1YUtifz2DQ=;
 b=Iqt3U+EfoGwvBO6gas6vWDONtJcu2N7OabeDosatCNXRpqIICI/AjsCW8QzOB5T2JW
 +WmzTSoalx3YRc9j98uetf0Sj/G3aJVxXRQyBl1hksCpwFHP58WKdMc3KHYMcCQHUnMl
 cAUrneMR1ctDU75iXTrOL+XHK2lQsWkh2CtlCJ6olN5YqdQVcZxBjvhYKEn17zsb9Dl6
 gbiKcLBuSB1yFzPdk/soPZZbcfzAQprsSj9xOINTAlVDBk1mJrVeIAlJB93n1TvblA0J
 +/wCrtG3RUhzaNIVOUtRKLK3mr/WaUd4Lylf9SMJtZzZN98FkPruwhHkpkb7zaGmpTge
 5VnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YJhllO4Kw1J0lTqgGNFCN8u51U+dY+0Qg1YUtifz2DQ=;
 b=uje+cQQE9nQDVpPOHU7v2el4rVGxHLNxtkwVnylZoEl88ACQZjkt/nVjpqm2syom3J
 iMw8YWmLEKMwWZM48Fv9qaVcTSTVKLIgdl4PuDxam/DfxeOjxMbmDqan0PPpBG0+XQrM
 h/WBTFT4yuJwJtw1QgGnFZDc0BKhhD36FRt7yQdwskUJ6+RYCs0sApL6b/M0BIIs3XU9
 yNSVUdHDHuNhjm1rqvPLHhPmrC00+sZyD9eonV54d42amkGO99btqL/lXTfpK2ex/LVs
 akTaxHJEce40sZ/ssAx0Aym15Ht+JRlgWSavfAoJZi2JZ/C1opDm8xwt0pfvwz0rlci5
 3XBA==
X-Gm-Message-State: AOAM532CWvXrGSHgEKI+WP1SKO74z6jAtH9U13WDU+gDiLW3txyG7l77
 Bj9hZRZg5wW0Z4p0fK+IdYXA7w==
X-Google-Smtp-Source: ABdhPJxETXYc1b9IwZwaRsxXKvkaimQeMqws2xB6B3SE1nYCRT49lzWEH9qFjPJvIMNqDEW6+58+fg==
X-Received: by 2002:adf:dd06:: with SMTP id a6mr2208922wrm.142.1592300886614; 
 Tue, 16 Jun 2020 02:48:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id n23sm3107753wmc.0.2020.06.16.02.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 02:48:06 -0700 (PDT)
Date: Tue, 16 Jun 2020 10:48:02 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200616094802.GA139416@google.com>
References: <20200615165554.228063-1-qperret@google.com>
 <20200615165554.228063-3-qperret@google.com>
 <20200616043143.obk5k3rv737j5dnd@vireshk-i7>
 <20200616083107.GA122049@google.com>
 <20200616092759.rjnk3lef4tedfust@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616092759.rjnk3lef4tedfust@vireshk-i7>
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

On Tuesday 16 Jun 2020 at 14:57:59 (+0530), Viresh Kumar wrote:
> There is another problem here which we need to look at. Any governor
> which is built as a module and isn't currently used, should be allowed
> to unload. And this needs to be tested by you as well, should be easy
> enough.
> 
> With the current implementation, you take a reference to the default
> governor when the driver is registered and drop it only when the
> driver goes away. Which means we won't be able to unload the module of
> the governor even if it isn't used. Which is wrong. The solution I
> proposed had the same issue as well.
> 
> You need to figure out a way where we don't need to keep holding the
> module hostage even when it isn't used. I see two ways at least for
> the same:
> 
> - Do that from the existing place: cpufreq_init_policy().
> 
> - And I think this can be done from governor-register/unregister as
>   well.
> 
> Second one sounds good, if it is feasible to do that.

Good point.

I'm thinking something along the lines of:

---8<---
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0f05caedc320..a9219404e07f 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2340,6 +2340,11 @@ int cpufreq_register_governor(struct cpufreq_governor *governor)
 		list_add(&governor->governor_list, &cpufreq_governor_list);
 	}
 
+	if (!strncasecmp(cpufreq_param_governor, governor->name, CPUFREQ_NAME_LEN))
+		default_governor = governor;
+	else if (!default_governor && cpufreq_default_governor() == governor)
+		default_governor = cpufreq_default_governor();
+
 	mutex_unlock(&cpufreq_governor_mutex);
 	return err;
 }
@@ -2368,6 +2373,8 @@ void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 
 	mutex_lock(&cpufreq_governor_mutex);
 	list_del(&governor->governor_list);
+	if (governor == default_governor)
+		default_governor = cpufreq_default_governor();
 	mutex_unlock(&cpufreq_governor_mutex);
 }
 EXPORT_SYMBOL_GPL(cpufreq_unregister_governor);
--->8---

should do the trick. That removes the unnecessary reference count, and
feels like a good place to hook things -- that is how cpuidle does it
too IIRC.

I'll double check the locking/synchronization, but that shouldn't be too
bad (famous last words).

Cheers,
Quentin
