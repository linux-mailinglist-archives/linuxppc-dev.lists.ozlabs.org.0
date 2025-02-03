Return-Path: <linuxppc-dev+bounces-5783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33C1A2565C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 10:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmhfM0z7Tz2xt7;
	Mon,  3 Feb 2025 20:54:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738576443;
	cv=none; b=XPbQPCwd2kMqQkqsSodYOFTMggaar/+Eu6Oizy0Aj2dN5UEsAOBzyUptVf/ROyd4yNs4hwACtuRerCo4IBg9wl9h1RRC7cVXf3OrtAT3PdabfILS/fa+zYUUtqDxMhPlKD+eXPa8EgHGakCFS9OYv4go2wjaYKC1Uacu+7HjA1xJQV5Ir+6zF6eV01reB/q7T1gTwfSy01/dHtkuvkxKjFDdedc41AtsXrLuNeqFF0BAiJ9yZ6ARpVEAyfEwVKLqz4RMUmIZG7HoeapbCt+F75u8yss/yZ5C9BCbU/3PYCuwTCip4mQow5eBrm0Ucra5/TXb50vY4wAQkJrNnziXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738576443; c=relaxed/relaxed;
	bh=oGm/bq6SKySYHYDc9Teum4UAC1vMAmPVFWHcwcmi784=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dlrHOXVKaiywhUxKzE7XLSKVeAYtBE+ETHruFfBsvFEicLp37dTieOX73QaaEPdFDc/StVGjrPvY+b+51Gmh8OMbJSWhuZA4x1Tk0Qjn6KhbvaNWduGQzwCJ1GVtLssoErNz/zywBcueSKxVn6C8GIBm8w9k7aX4UE6turu+GMVQCCJB/o1jBdvR53Y0JldHLVZ4xulC1AjcfsKmhfaTejVcQfmIk+e4HlkaTZM47/ZaSz473UzXD9iRVthZihAVpyNc3kjcKOL7w/FYw0mceWFhdpritvd2XWcYQ5lKhfXlUzQbxHhrhCNbmiYJXo4jy+XSeuIXANzgFqwFgVXOAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XCXSAIsz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XCXSAIsz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmhfL1Qcnz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 20:54:01 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21649a7bcdcso69534675ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2025 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738576439; x=1739181239; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGm/bq6SKySYHYDc9Teum4UAC1vMAmPVFWHcwcmi784=;
        b=XCXSAIszNXGU7gEAXQOSROYYKeLQJlkpzS4+10O+vCrMLC25ZElMuj94L8jcZu7U/1
         eskfqajLyDzFE90kiHvGIij7J0cEjBc5PNDre+8+0kVGHUFiZ0woqqHZRChBiCvndgXO
         IrEueubzWPgDBCoG7PEI5QvzAtD753L7c2ennm8fI07ajtkIJYN2XOzpEemPyXsi0CHP
         WDexIG8W0igyeWlM1Wpa3HseiaL1TOD585sjm3Dey6FvVFhZv35cmLHdjvIP+i0gSVsY
         wJeHf2w7/rKVbfvRFUqqRzBLhzy3TwZJHLB9VAlBPtUWymEwkvMDi4VLY46JoEgGag94
         3zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576439; x=1739181239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGm/bq6SKySYHYDc9Teum4UAC1vMAmPVFWHcwcmi784=;
        b=tNoo9UV7cpLCsouMJhJdcgTcDSPLsQobbYKLxP1ePCaky0LlUqrBslQbPbjatPt8q6
         D0O8cxGCQsZo/nemGEGErNuAnVGHSy6BC3A6TTgNU7PFbEvUfPB1qdRjLt4SrI/bSnKN
         45jnppMNE95v8nLZT39AMLe9D0pZ94oLd6NOMedrjem6TfJuIJtURKUMzMncUABGEGcL
         kV+60dfCJ+MTjRPjiFKWpjSQjEHycROMkLjbEvYMqiH0Iqe4zowsgFipTYd4+3xOOmNS
         eAkt3YTIB0A65hVb5RgXziI3UT+WNMyTVokVQQ45pb5LftjRRFU5zAZPidsqUaRuxEvI
         eM9w==
X-Forwarded-Encrypted: i=1; AJvYcCXUyh835Sy299MOeoOOfNUQjgnGbw/8FdJAb23/9l4uUvMEWfYLduII4sVw2WnsQcolDyDJ5iS2xPOSZlo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBtSMVAQQvA6jvKtS+9qiVSurzVLJkDOrFD4gav8thrwwmfTTf
	DoybhDXxpBI4BzgUCKGMdo7G05bwQdjzjjyxcTxxz9wdIrEqK715JFkBxPq/b9M=
X-Gm-Gg: ASbGncs1JZ/UPzUroWfvd+ecxgstY2n87frvfnjNwuNdH9SMaMovyZq6O9AC6zQf2EY
	/egZp45Zes7OqsdTC1BW95RqZvuurmd+U/vWMqOApeCbsL0BUTpyA0Eb/5NlFia8C5QvkcnNCbU
	gKzrVaJZmm2hzoSvg2DabNSMpZ5vwwta4lY40I0VcVJ0pZPrPfDm1QRPfBZaLeangRQ78PZ+Q3G
	dllT+uGfWlielHNrT43YJlLTkhCBOlx2lqLUv7GtykeFJ5ZE674Loddo2K6dVZUe/Gj5kZPvHur
	FAK/GwBGJlZTkxzVLA==
X-Google-Smtp-Source: AGHT+IFwo05BiIt05ICb4MDKGKrGGWOHvgZo0+KY9Q0VF4jPxeMFSPJcZ0MPvxF/KghXhf5T9qIi1A==
X-Received: by 2002:a17:903:947:b0:212:4c82:e3d4 with SMTP id d9443c01a7336-21dd7df2d2cmr345490545ad.46.1738576438710;
        Mon, 03 Feb 2025 01:53:58 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33206besm71659285ad.241.2025.02.03.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:53:58 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V1.1 20/33] cpufreq: powernv: Stop setting common freq attributes
Date: Mon,  3 Feb 2025 15:23:32 +0530
Message-Id: <fa304da30d5f10e7ff069d72fb3aff2741630ca4.1738576306.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <1f5393d54b2c04206afefd521ebdf3fc03004a11.1737631669.git.viresh.kumar@linaro.org>
References: <1f5393d54b2c04206afefd521ebdf3fc03004a11.1737631669.git.viresh.kumar@linaro.org>
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
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
V1.1:
- Drop runtime updates to freq attr.

 drivers/cpufreq/powernv-cpufreq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index ae79d909943b..0631284c4cfb 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -386,12 +386,8 @@ static ssize_t cpuinfo_nominal_freq_show(struct cpufreq_policy *policy,
 static struct freq_attr cpufreq_freq_attr_cpuinfo_nominal_freq =
 	__ATTR_RO(cpuinfo_nominal_freq);
 
-#define SCALING_BOOST_FREQS_ATTR_INDEX		2
-
 static struct freq_attr *powernv_cpu_freq_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
 	&cpufreq_freq_attr_cpuinfo_nominal_freq,
-	&cpufreq_freq_attr_scaling_boost_freqs,
 	NULL,
 };
 
@@ -1129,8 +1125,6 @@ static int __init powernv_cpufreq_init(void)
 
 	if (powernv_pstate_info.wof_enabled)
 		powernv_cpufreq_driver.boost_enabled = true;
-	else
-		powernv_cpu_freq_attr[SCALING_BOOST_FREQS_ATTR_INDEX] = NULL;
 
 	rc = cpufreq_register_driver(&powernv_cpufreq_driver);
 	if (rc) {
-- 
2.31.1.272.g89b43f80a514


