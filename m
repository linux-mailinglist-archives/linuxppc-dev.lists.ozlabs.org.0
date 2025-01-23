Return-Path: <linuxppc-dev+bounces-5503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC899A1A324
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzVc2Nm2z3050;
	Thu, 23 Jan 2025 22:39:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632344;
	cv=none; b=gy4x+vFciVnKa+mKOARYvJFM/ihDl7RxkwBkcRF+Sd8Dds3mx60N4xD+HuHKawFl7QEask9SKY6dp6hzycN9LydXyLRLQn52wG1csUjDGMTsJY3ZWM3WMC9OzzDhXj6IX3k9s6xFhRVBc8ZxuhVgy6Q9/Ep3gmwnasqyL3YgkXiKpudWIgOLuDmOzGGarpRbn4kj3cMmGwm2TIasa8amjRMms6pWBXGRch1f5GOzOpj6ootMBquoxod8BVvMJD1WxngVcc+zSxnMW4OWQX6zuuLQNKSRkxer1HfbjtQEzHAZPuGOv7l3NAN7Bjgbhfvnq9zOfyKxHFxHOR3GB2mdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632344; c=relaxed/relaxed;
	bh=QfvCGCHZNCxyn69/UWRqVioH0Lp44Bh/3oJ9xo86mtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z/+O9nxK4R1ah9hJBPlON4psMZXeighSieN0f2FBO/RjQvhJ1AK0sylBZQ0S347GQBAZZ2gKj+IP7S/oK3mXHUl+PgnfQ0WKe91A+KNQZaMLeDLcZnEFks5D8lYsyC9L3eZShWlhYrRY4BFlsgUMcGnnivE7eYIZidPU4FIgs/e1oMjGhrnNL55B5Y2UTATqts9MLTMT3pUN3qHkDyBAyuElIVt29kb534eEMeBsaLn54HFQNDcvtk2IL28P0J/bLHCn0NRJyoHvyZEqBa4O2BTtkWsIHp34iNgYGV0DEjQjBewk5rSOKe8s6Dt37USwE5jXwG6Fmj3RlqJFrcYASw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiCBkT4V; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KiCBkT4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzVb5S43z303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:39:03 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21628b3fe7dso11905195ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 03:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632342; x=1738237142; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfvCGCHZNCxyn69/UWRqVioH0Lp44Bh/3oJ9xo86mtE=;
        b=KiCBkT4VXSeFNt7DDo7x993q4b9c6aBdMWneARX2uUpQoMfqbWRMtwQV8YKX/ink8e
         S9F/un+lUh7uJDpuhRIcpH9pW33SsgAlvwiG4mBAv4B77btCKydiGfrLr16arKpE3Q/m
         4TP/balNxH28GY8k7L/lVEP1k+JGW4iKNHUY4VQrKR4caxYijVWziPslbV3h4/3nY8S+
         Ss0xRAPdnInl/iOiOa+b3fQylRC5UcPHBXzNyOQvYT78PUNil1N8VASUSNL6WOUwVKba
         3rk4lWeNkN1wdtYOLTz/nZ05FKdSUGC0hFf9wNVFUhVIVzksue6B+05BXVdZxJw1Boe/
         S9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632342; x=1738237142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfvCGCHZNCxyn69/UWRqVioH0Lp44Bh/3oJ9xo86mtE=;
        b=Rb3xb6iqJX7SjPKBiFwNV9hufLkL8TBudRu3FEZ4GYyWfWpmb5aDe25CkzdFsk0yaB
         oMHZWfuR5Ab0vildeKJgexlhq2TIFXwJ+6RzwyX4moEl76HNgbuKBtd1mXknaQPHu35X
         VOA4/GuQR0Wo2PXjNfV61tCP+/1Hoe1EC+yPXbMxywk4asTd2cJMbUSWcRSMf8veKjTl
         9vebptzrpnkZGGsOj5/l0ow+FYj5UJQQhpOx4EyF+Ylhti9DYXdn8MjGhijk+R4GkBKP
         ke25t8U35nXnAmXCefELF7WkYT0hE76qMQ8OnFKq/4oh06i2twI1mJPhAquJ9gLJUYdr
         4pFA==
X-Forwarded-Encrypted: i=1; AJvYcCVOkv1RJ7/6CzLSzjiZ5dJnduoytIhRAACi+Pi+bJiHPBktDTFygwyYqkdjKgSyAprYMqmpGjt4bbzelns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5C/uqZrs4YdPixe7fRM0F8/bd3123buP6Ob7QytbE2+vrxKay
	5LubA4ByhmTfga/g/1ERY6QBQbPuH4+PP3jaE4gC9KKJ0yID7EA+xhw5MbRiVKQ=
X-Gm-Gg: ASbGnctax0CL+cxIrcCJJgX8cKRqkaeKm6Up/O74EaFCiDGf5+ZptoHSPRDAus/zHy0
	I9tRqdYS0rExDB3KPxEumdnP+6DnkFm45flYfV/TEVjG/dzOihWJZ7xPEms3fzjrAQBoTQlj09c
	QU5JY25w6ZwzYSRgEaL9dxP/GhG06O1HEW3HI/NmDHknPXmbrfn4U/KK5uqUwOvjsjl2ehNRxBu
	X02eGFR/ECFmVt8dscChFQp2LkA+0lY6yLlsfOtOSDpmWZASv3KGlpqJUqHvFyyRm4Yn+eNYnBW
	BZJ14yA=
X-Google-Smtp-Source: AGHT+IFOTJp7fcVtErTm2ko8MfwAJVCJqrxtj35BJRTuPk8xc83dAT0RCHhiqJHyXYcuqQ3GU0FTBg==
X-Received: by 2002:a17:902:c943:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-21c351d328amr426236855ad.5.1737632342032;
        Thu, 23 Jan 2025 03:39:02 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3deb6csm111272655ad.175.2025.01.23.03.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:39:01 -0800 (PST)
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
Subject: [PATCH 18/33] cpufreq: pmac: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:54 +0530
Message-Id: <d3e73fe309baf9c839d76a3c6dbc3abd3ba06746.1737631669.git.viresh.kumar@linaro.org>
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

The cpufreq core handles this for basic attributes now, the drivers can
skip setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/pmac32-cpufreq.c | 1 -
 drivers/cpufreq/pmac64-cpufreq.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 6c9f0888a2a7..a22c22bd693a 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -439,7 +439,6 @@ static struct cpufreq_driver pmac_cpufreq_driver = {
 	.suspend	= pmac_cpufreq_suspend,
 	.resume		= pmac_cpufreq_resume,
 	.flags		= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
-	.attr		= cpufreq_generic_attr,
 	.name		= "powermac",
 };
 
diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 74ff6c47df29..80897ec8f00e 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -332,7 +332,6 @@ static struct cpufreq_driver g5_cpufreq_driver = {
 	.verify		= cpufreq_generic_frequency_table_verify,
 	.target_index	= g5_cpufreq_target,
 	.get		= g5_cpufreq_get_speed,
-	.attr 		= cpufreq_generic_attr,
 };
 
 
-- 
2.31.1.272.g89b43f80a514


