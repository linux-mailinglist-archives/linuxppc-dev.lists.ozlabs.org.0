Return-Path: <linuxppc-dev+bounces-5504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF8A1A325
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:39:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzVl3y1Xz305c;
	Thu, 23 Jan 2025 22:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632351;
	cv=none; b=K6ekdJ4VzV2HF/GZ54G8XhFp5UfmKNZqGVZdq5iS12g0xbE4AsUfIOWxaKtwYyu4p7KELrirSS9b8uTWqzo0Jq+p9P8DwLUxOtiL8JMYNACLLYoeJru03UbMSUor/VlUn8Kq0RRVa1lJPBGa1t+NmvUMa6gmF992cn3uLuzBEbRuSKlmXF/YWm41549WKpIHd82oM0xyqbi1dq+pmcdM95y5TV8A+qhYxWnkPnXEK5mx4dSz0slf6a6fPuSMQ5ML7NUS+otXC7WRHD1gEUwUzxmGcm7qmp2eabrB+yM0hcwjdd14vuNUS3Es8myXwFVS4LfymbgDPDMRvMFRPI1bKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632351; c=relaxed/relaxed;
	bh=NOQaZrUykuIT2nDOu/hapfD8pr24HO9XboBFcdlFf5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KsyC2sgfkVASIhZQZepI1/2JqRA6Tz7nDMUQxWdP3fDce/nIbF09PjvR0wq9MAC1dzv48opYMcL5OXOZtaOtMzgb5LJ4cw3Z+vX6aTnXEI+m/xS9RGCQPkrW38eXfS7F1eOh2HcznDM6IMjuQS9PY7n0F/lphX2RoGSKRF58XaXD6C5BgdXaRP3s/FMor4TmIYIxi+jMhrbBi9KajZWXiER6OZ/t2Cc9lRgZl/wqMd3Kreae6kyzRCE8Ej04gMMb8L9c/wxi+xCZ6w3+0cDqZAv6VnU/t7s2YnT9CrcYniGIuQCWZEvmUykM1YmcfepYbBgmO/pITXXctvaqUI4tqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VFnRTpxP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VFnRTpxP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzVk69LVz305Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:39:10 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2161eb95317so12520735ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632349; x=1738237149; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOQaZrUykuIT2nDOu/hapfD8pr24HO9XboBFcdlFf5E=;
        b=VFnRTpxPyQL/aKycgTF+3haKBLfk7OpN0nfVxtVIObll74QJDys3x8ua8s/S4ahL7M
         Ov4cgigu9UYTu0KQqowOpipN0d6Lh/Mo8iyGW3kXszKxBG2XbQ+Esq+OWxpaadu3GFHe
         Q8ktEeSWc5sw4VJ1c9u/tAlYVhxozti7S6h3UbC3/5IHt+9xvezBfNpM7xkRfJS+D8F5
         d3dP6Pca+BaeDVe3abhL3YtzRiDpZ8VDCS6nRMiqa2is8dZm8BWPMDJ+hRs81IXHMrfi
         Wdhn3OEHS+dM69enQGBN7Ovd0PIcGlj/Ej51s9L0c9TLfcVTa9mxyXT3cgMrDHK5My9V
         1BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632349; x=1738237149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOQaZrUykuIT2nDOu/hapfD8pr24HO9XboBFcdlFf5E=;
        b=ealXFsM1nP5boH2Z56eSyE3DWLJNyTQhlMSBcGRSr+Cd3pM7fofoprURrJv87hKoRs
         H+rbNMQ3hpu1x2DnWlwKOeMGE1O/bqDaeUdt8z9jd/HFrNQ7nHGrJPO26qT005UNB8w/
         wYkMPLpYhGaVJ+7YqgCV8Ahpnt9YsicFtz86QW5ed41beJ9UrOFSgcDrZvQBADcTpPKZ
         4BkXe7dQ/fV546+nmwTRGB+f4qqmTrvJ2P0F7qS8v95Shoc6dGNt/KysV5Hhjx+r3ciI
         /41+qsK6S361ZUK1opWftogKYmJNoHidXo5pM58Ni+C7k8MhMnVTE2rjPP+P9MwI42xm
         SrhA==
X-Forwarded-Encrypted: i=1; AJvYcCVC5pi8MA4T2ziFwkJFPc68v5rtwlbcrgLj/jHIBZN8MiH59lQr3lDJtGo1qo6v5OKZ9AjtgDXO+Us1YFg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxIzDflAsF487uLUtKFiiN4MWyfJbOJTSrIkRe5I3BfUuWXOr4Q
	aBaz3CRRNJzZjBOZZPdIs3jR9UzZq4zmbXdDRixGINwoJGa3mfGugFHqKQgl+n8=
X-Gm-Gg: ASbGncsDBqBhAFh7KGw2zGiMno3PGCZVYgYhsIQ+y3lsugttSZ8P4/eE2AMAMrwQOwD
	DLc1T+LZmoU/lh+tGDbg4OQiC8CmauHKKAOHR8rr3cszeCay4/H5zrQ10j6oUovZj5L2lg0CWWG
	SyGd5gmH06ZjQe7dJRqmVPut5cTiVnojn4/EhSC5nUbIriLLNWvAW0xpEPHqAnb6do6movS38NA
	nSMccTgSzqkdP9xastUFjvOn06OTAoIgY+C+kaa+pilR2NFYeej66MOwCOrdOF4KI5GMVgeZTpP
	yhgakGCeYkb/1As4sA==
X-Google-Smtp-Source: AGHT+IHIGxlnIT9W1m1496ap5CdNvSqcyAIJOYfXO5RvLWjmiK3vtYAvEomKz83J4zLXKOM8QP8JXg==
X-Received: by 2002:a05:6a20:1596:b0:1e1:bdae:e058 with SMTP id adf61e73a8af0-1eb215ec58cmr42346024637.37.1737632349101;
        Thu, 23 Jan 2025 03:39:09 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa39c6sm12950387b3a.160.2025.01.23.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:08 -0800 (PST)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/33] cpufreq: powernv: Stop setting common freq attributes
Date: Thu, 23 Jan 2025 17:05:56 +0530
Message-Id: <1f5393d54b2c04206afefd521ebdf3fc03004a11.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
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

The cpufreq core handles this now, the driver can skip setting it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/powernv-cpufreq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 8de759247771..0c3e907c58bc 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -388,9 +388,7 @@ static struct freq_attr cpufreq_freq_attr_cpuinfo_nominal_freq =
 #define SCALING_BOOST_FREQS_ATTR_INDEX		2
 
 static struct freq_attr *powernv_cpu_freq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
 	&cpufreq_freq_attr_cpuinfo_nominal_freq,
-	&cpufreq_freq_attr_scaling_boost_freqs,
 	NULL,
 };
 
-- 
2.31.1.272.g89b43f80a514


