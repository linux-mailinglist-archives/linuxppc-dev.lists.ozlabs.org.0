Return-Path: <linuxppc-dev+bounces-14731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A01CB8773
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Dec 2025 10:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSPM75sgYz2xnl;
	Fri, 12 Dec 2025 20:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765531827;
	cv=none; b=AmV29BKcJNdUflP9mO+kaX0ctQxW7VU7xeu73WA6Req5/u3Nr9kK5jO6WTueGEnmZ0PXPY3VKO/+LCg/psG7qpmk4U0BYoWE3VnHfiO1P9R7yit9tuvsHNFM7+3ckt6vt5AKBm5TvWIez8LbtRu95PQ8eLbVQZ8mmZSMcj7SSdAMOQGoVKtLEtfBQhyC5MLDylQtDVpjVLEF7rAD5IvOCmMzLTrGLaNKtk4/ZOj3K47QZD4hbzG0/z+Br/HwUQd0mslzcJdUoLCRdLJBDJdZd5ueb8kpuEfrw4gyBdslgN2/6Fx2d1Lj6DXE06DJF/Nk12JFMOxcJqk36Op/Kc8A5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765531827; c=relaxed/relaxed;
	bh=TqBCCuMDo8XkanA9t4q1Yalkj0pckYKIk41K6zsONlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hPW0KpBP7V6OoH5Ngkh0e8/iPXY0idlpHqOvaFwstaS1CNHLcIbztTyd6xda6VKkno9XQ/D+6NSHGQtPfi5p+WAuDEKjQ5ZRWMvx5v+h4HVv8qzbGWn4F/u4P7NSW12Sun9kaEISeeswBCm4kPRrMtnizsNQ5gzA8u6sErTa+Offcv/D171sl5qseG7+q/Qdh8Sr869VI51xXFFhczvTbLv2F5YJ/gM+qg25jlPSpmUGPHzMtDJQULCcp571BQNp9xBnya4xrrYWp+3kVGYsISynOs+E8B/96cIKLXnhDmwNK1qSaueT9tlpC1VHmyTDIKzsV6tPwyb1Isujjy20lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RtFWeuw8; dkim-atps=neutral; spf=pass (client-ip=209.85.210.174; helo=mail-pf1-f174.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RtFWeuw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.174; helo=mail-pf1-f174.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSPM64tVMz2xNk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 20:30:25 +1100 (AEDT)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e2762ad850so1038097b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Dec 2025 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765531763; x=1766136563; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqBCCuMDo8XkanA9t4q1Yalkj0pckYKIk41K6zsONlc=;
        b=RtFWeuw8uXVpdV3GChQ0ki0qjleKLHchPsa/rgl1yn58TG1Z4isbkLKWZspAHqpQtV
         fQibzlIpW55OICiUTk/CGjU/osP/8yPLkrlx5DFu4WraoWtoWuuav/pHhDedz18+VpR7
         nzx/yzwyTmYN7jPwKm3LjfS81aIFi6kvcOMMov9NcwrY3QwqVPvoIe6i6NZppVg2kQS3
         8w2OECsF9I1Eikl+DdZYTDH00N8NLyeQIXBphSS4EWXaw5F4150LIRmZgk+cnKAPTuYe
         ELQ3CWwf1LlUTsRh0iD98YtyAOtwCZRoy3jDnq1fVwJzumHupx0R7GTZv1SkrV1iROFd
         ypgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765531763; x=1766136563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqBCCuMDo8XkanA9t4q1Yalkj0pckYKIk41K6zsONlc=;
        b=R1d9+upvpMDTEmmEwF7BpNgXygmT+ZiQfoNSHptHaxWmxofpNhfrrnGwl8SwOhqzK9
         V4/QYoQJRhnJW1KAXmRN9EKKCCUwZO35yAFRF2zV1pt+BudMPXV/hLsCKH7KgOHJkXqa
         Kgdy1tjs62fFQhksLwC54EVQcrc2voTkXzWd9z2r/ut2j6BwyD1F0D2o/TbUlVGi93xh
         +pLets416PNT5fvrNvK2q8V7qP4WqzHIEc0CLg+vKnd+NR5Aojm2sQNsJ6mZsDjidDtR
         TD2bNH7rbaUo0vFCx7e0HFFGtIyXxZqDfhTYA3JM7r52WeMcWU9HzfgEkPQRVypNJMkS
         eTXg==
X-Forwarded-Encrypted: i=1; AJvYcCUxqt0PtVvSDjy0jw48VxBbTqJ4sh2+Xi/QWevbQ3R8ncPtkJvFbbPLpGmiy3MeiYC+xeaPI56xMThsmpk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUkOzk1sIYDvXD5ExuUaV5GLkwYCvscbUjrxBm9Z8mDiqTU3m8
	02qVD8ZDl6na9bKc6f5OjMoxENycjlUGdfIE+HXqKCeHpCj5ArA/goAd
X-Gm-Gg: AY/fxX5yVDZZhmU15sx+z7YVSRidWQdPbg/HycGTU6AlDzRHzdHqngTx8ZQ92q5kQ0P
	d1c4lMkFo+HDXEhOEDXaURq7QtTYVfGApzjRUI2A+tja+b2rAp9bHvjXh952OkNrPXrv2XwHdsz
	1jz0gBuTsj/5HLeeG7FKQms8eJyRjdS84BjmABTt2TUSWZ0vu91/qKSrOpasfGelMso0MV8Cq6e
	tX8seRQQvByd34purYpKvjNGf4vMQLswBur7Y0wu0F3M2q437QEp3bPlVh5KydsTJ+kY1PcCzk4
	34ybYgXGU65/pcqjV0LdTnw0fV+BGxtqe3lJzXck5i9b5b/pro9AHpGRb7xxkQSU3sbkHTHcRuo
	fYUrIRLpMjByw6gdxUTF1NBorQOMNoR6UoP9JbXXgidFStfKfHVo504tiFPmjpJBTYAqZyRGHs2
	a4QWirb50J
X-Google-Smtp-Source: AGHT+IE4GkrmjiEKubwBC3E06sLn47erp8gSJb/6WMPDYnjsxpuc5QHpftFLPESuDZbHLqLMyjd9pg==
X-Received: by 2002:a05:6a21:e083:b0:34f:e712:348d with SMTP id adf61e73a8af0-369ae1a9b27mr1432502637.30.1765531763439;
        Fri, 12 Dec 2025 01:29:23 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c0c206cf429sm4753659a12.0.2025.12.12.01.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:29:22 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Paul Mackerras <paulus@ozlabs.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] cpufreq: pmac64-cpufreq: Fix refcount leak on error paths
Date: Fri, 12 Dec 2025 13:29:09 +0400
Message-Id: <20251212092910.2454034-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

of_cpu_device_node_get obtain a reference to the device node which
must be released with of_node_put().

Add missing of_node_put() on error paths to fix.

Found via static analysis and code review.

Fixes: 760287ab90a3 ("cpufreq: pmac64-cpufreq: remove device tree parsing for cpu nodes")
Fixes: 4350147a816b ("[PATCH] ppc64: SMU based macs cpufreq support")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/cpufreq/pmac64-cpufreq.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 80897ec8f00e..0e0205b888ba 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -356,8 +356,10 @@ static int __init g5_neo2_cpufreq_init(struct device_node *cpunode)
 		use_volts_smu = 1;
 	else if (of_machine_is_compatible("PowerMac11,2"))
 		use_volts_vdnap = 1;
-	else
-		return -ENODEV;
+	else {
+		rc = -ENODEV;
+		goto bail_noprops;
+	}
 
 	/* Check 970FX for now */
 	valp = of_get_property(cpunode, "cpu-version", NULL);
@@ -430,8 +432,11 @@ static int __init g5_neo2_cpufreq_init(struct device_node *cpunode)
 	 * supporting anything else.
 	 */
 	valp = of_get_property(cpunode, "clock-frequency", NULL);
-	if (!valp)
-		return -ENODEV;
+	if (!valp) {
+		rc = -ENODEV;
+		goto bail_noprops;
+	}
+
 	max_freq = (*valp)/1000;
 	g5_cpu_freqs[0].frequency = max_freq;
 	g5_cpu_freqs[1].frequency = max_freq/2;
-- 
2.25.1


