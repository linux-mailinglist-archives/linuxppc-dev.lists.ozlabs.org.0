Return-Path: <linuxppc-dev+bounces-5542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2ACA1B21B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 09:59:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfWvc2cWxz30NY;
	Fri, 24 Jan 2025 19:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737709148;
	cv=none; b=W24Las1VYfSlcYjxIi6mqLv+t8YhpVphWiBaYtHRdfG5N4qRo/wOR8KNl7wRD2UUA4ro6RorGPi2+66AeFBvfYBPEz8aKPuUke6oKqGktOe9fFaZI0QpS1Lff6rwyziKP7lLQAVl7FHr9WkMbY18UZIMBspQzyIogIpc1JM7ysiP4nlUeEIwZkyWGVBlqlpXJeIElntxLsVUs2PZKvUluo2Rw1n2r2F+bDx2rgezBDTSBee7+5nCLiNk5xkDHLYWZmKCY+VxUM4L6ssKciO8gqBXPGDeGGPyOEr62LObs0/ZsGgRoqAgGmFNgUxPxweWdxtbdr7ZCCzKkX/xx71KkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737709148; c=relaxed/relaxed;
	bh=XHvPLEImTEWfALntTBCPd9TKW0+oiHv2uyr8XB4xyIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hhoit9hQ7O/SzKbtiTiW9PkSnVuKxeQPvBUlx7SMX8uDmAuIGO+4a3//2eJr9z5n1zvh+eDX/UQyAK7wIkCVNi2SDqVapCrhKzPITr6RQB1FefgP9tt8BonjO+7NgVcKTyb6GjgZYOFSSgmJ8SbMvI5icYHyUKBXzygoMo9MkcpLeB15ZSrV3M+YDqgGOl62xxIyuXqi716J1sn41cWDt2qCS7yNdWDLxnYs2s3uNVvc7lpPHuRGfjd/EvdrAaSnkIRR90DLtulUoEJe/ySk8PB45HJrFymwL8FVggfiq11PXntACM1f8DZwKfW0KuX3BQ8ZWGNU9vLVTwZPdwAM4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dznqfBfE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dznqfBfE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfWvb0Jpgz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 19:59:06 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso2675606a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709145; x=1738313945; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHvPLEImTEWfALntTBCPd9TKW0+oiHv2uyr8XB4xyIc=;
        b=dznqfBfEMJP2fGnPfBakVDC0FFqjaCS1n5/Yh5qOjGEU+6ojS3Z/PwKRG08fdZIlU/
         iV6RV3DDJh90NeNZirP+CLOVXHzzhX/GQsf02ub8+aA7+ynrYZxjwqsShTmPmkNTbgJU
         lYkvEopXYYNXAXdoGIAjTU2e/q720+3OdNh8K/d1w8R5y3/W2Ff94ocLbF5ehpw6J9IT
         jZ/AxewoSIKmYN9n6JbhWq3p/+St16Z4cFbaAcIKqyw10x+e0RYNEJhh76292eSD28Y+
         23OEV3FPkZx8BK/mn+9J3yS7/exNdU6yR8LorPpIK/sRnwxTbvybjVDhFhUl7hL8sa9H
         TNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709145; x=1738313945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHvPLEImTEWfALntTBCPd9TKW0+oiHv2uyr8XB4xyIc=;
        b=dYOhWo2eSEC7qMwRBa+ykUOtrfEusicijesC7fY9eBusBVJKq0zD8aYZEQ9rb2tkp3
         rQQmPvCjdFgs6cZP+vDQXzVZ3pHxXZ+dEs1oBFMye5UvMd8YEHzGsKiN5/CLaB69IX7A
         MiolB6dsD/knnJ0ai5gzUtyizUY4DQIVvoSg3UGII6G/tpnj1DLwTncQxa7QVwExn+Pa
         D0C7iOxKXvHIYOjnp4mXBrcQo0jTtk9FHTXXVNgkfOjlo8vnjyA3uWYF7Wix7fULum49
         Et1U8MkcaMoPQcXtmrzET9noMEOyawl6/UXDaT19gasBnwPxJEs6aWCNtXIqtsYXmqNL
         iDNg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhsWaoKo1h7NFV/isfV+naLgqoViKw5Ti1bUXR5t7wEGITzD4gUa7Qla6bylQcK/P8dbL14OI6P0EyfY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzF3uzHBHOE/X7CIvQYfR4Wlymd9jhW+m27tCeAdoPvIpNfG1fN
	R5MhToKJtpHUynGQZS0kwT4xTBQSDIfbpPyZlroWSHg8pgu7qRzBe0t0YVraPXywJa5ix87JS2D
	P
X-Gm-Gg: ASbGncsdDvMsub1jFULbHhKs01u91Ep/P2AS8rh4VahUmULykZ/p5WllU+pa0Xi0/aF
	P42NN5NlwZUn9MTyDKg8/HE+MzEU/X23FaNR7UIReUQ+PwnuyrLRHQyTQb8iS4Z6MSseGArFx3n
	dcCMDXx3euZJz4Q6LzRFAgoL+blMSjVkxMZTVVTUUPe7wYWFBYy1Lw3VxuM1sC9FyQj36RlAgWv
	zjGYMGjoedNF7tSCYrkElGnrf7V+CxdusnBaMCAm9aHDgRTGp0S3whTMTDrVbV4oK/kHzs0yj78
	N8cTMQE=
X-Google-Smtp-Source: AGHT+IFlPf6Y5ApV2vEgtwBRH/T2hTrMCJRbAhXXb7JfHHFFf33S6aG5dH1A+wfV/EhE0fz4W4IA+g==
X-Received: by 2002:a17:90b:1f92:b0:2ee:db8a:29d0 with SMTP id 98e67ed59e1d1-2f782d4f3edmr36840886a91.26.1737709144725;
        Fri, 24 Jan 2025 00:59:04 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa6a725sm1258715a91.21.2025.01.24.00.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:59:04 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] cpufreq: powernv: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:14 +0530
Message-Id: <9b4af20d5b415f41e866ddd8bde9cf6441c463b8.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently the driver enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets
called for each policy and then there is online/offline path too where
this gets done unnecessarily.

Instead set the .set_boost field directly and always enable the boost
support. If a policy doesn't support boost feature, the core will not
enable it for that policy.

Keep the initial state of driver level boost to disabled and let the
user enable it if required as ideally the boost frequencies must be used
only when really required.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/powernv-cpufreq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 0c3e907c58bc..4d3e891ff508 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1125,7 +1125,7 @@ static int __init powernv_cpufreq_init(void)
 		goto out;
 
 	if (powernv_pstate_info.wof_enabled)
-		powernv_cpufreq_driver.boost_enabled = true;
+		powernv_cpufreq_driver.set_boost = cpufreq_boost_set_sw;
 	else
 		powernv_cpu_freq_attr[SCALING_BOOST_FREQS_ATTR_INDEX] = NULL;
 
@@ -1135,9 +1135,6 @@ static int __init powernv_cpufreq_init(void)
 		goto cleanup;
 	}
 
-	if (powernv_pstate_info.wof_enabled)
-		cpufreq_enable_boost_support();
-
 	register_reboot_notifier(&powernv_cpufreq_reboot_nb);
 	opal_message_notifier_register(OPAL_MSG_OCC, &powernv_cpufreq_opal_nb);
 
-- 
2.31.1.272.g89b43f80a514


