Return-Path: <linuxppc-dev+bounces-5502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DDA1A322
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 12:39:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdzVY57cyz3048;
	Thu, 23 Jan 2025 22:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737632341;
	cv=none; b=nK5GFieBkCU/Z0YFg5ZmyTZ/DdT+oimaBTTAXtrCTbW6ltdbWLQN4zqFkakNEhZDKj9g1JITWL/SP/9MgCm7NZBB2KohfrdfryPidASmVeP/59DlMkTz3dXMgi75PYRchRvcChh8NEpyIKcUki4zfwkuOEumLGh0zMtPyYrlXvsf2GlubUi7fVi38bIRlrar+JQBemSeDBpR/7yrmkrFlZ2/kOMX82MvsHZntNC/sU/eh7b/SlpO2+DPT0/4kblB69FJDPixN8cIQQUTFEf0pQR9q+Si2wLjgNsVdhsrJKNWH+W6rt68TtRbf+ub8fMfF7aIKPO0nmel4sNz3ghy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737632341; c=relaxed/relaxed;
	bh=jgUMFQF2jZPTg63RfJyqUIOezgHoYovaa305j3CfZfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A35cPF9MhEkCAp0QEuzeUzQ8KdeKSrpEG0lwUoNHCn76G2332TOEcEDJfLm6+KXgNgrQTBzm8rtei1H61WADnFx7eYV0g/fYfZx2l8f1qmbCGxN04OHrV794nUxEUh29tz+ErSL0n6yKF3NpkrESx20Z0XKsamkGI0Q3sQ8MeyD+F/5mq+2oQzU8cxj4Os7yoDce8cbYec7j0YBR6PGfT1Igf8JDxVFdW1XbobESVvBbrED0YP0cV8zED4w0LNINKSHS6D4Ifdu8syWnrOWzb/3SoIA3lq8JEvE/rqG37By0gYKUstEV/RxNHQvfwAVnkHlzGzKfzOjs+yfEwZBW5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bQjNpt3r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bQjNpt3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdzVX4kBqz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 22:39:00 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21661be2c2dso12521915ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632338; x=1738237138; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgUMFQF2jZPTg63RfJyqUIOezgHoYovaa305j3CfZfs=;
        b=bQjNpt3rxvBavj/l9ratGpX5M4jCs6cjTLVivjrZSTxjkZMtZK42fA4lDo3ZOG+miz
         LcfweFdc6lD/iI85dEARjh/y4D5CbF0c9Ncuj/9NMbl3x6wGsBAjhsZZ+XQaCfWXtG/6
         xYu4hZE0rqZqfCSrebl8SZBgaSUIE8P+Z3nJ9rNeZwjHnfWW/2kUt3zTHlooFlg6om/q
         GHyHVQdVVeNkHIXNSJ1Bnt+OaZotODyA9Kk9+yZYXpqcGwkJt4s4dhoH741Q/qxkJgvn
         v1G68uL0nnBd0op+owqWKMGT1HgcXuoqVlMcSiinGoRTL/UlOL3h/tv9QfWPy685sRdl
         gIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632338; x=1738237138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgUMFQF2jZPTg63RfJyqUIOezgHoYovaa305j3CfZfs=;
        b=DSUb8dMGZ3re3+E4rkUchmf2GFh8BBWrMUyYibCIPaND05nBMve0a5Bzp/6cQ3FWVh
         NCpfHKdZvUWxsXRNn3mXeWsBJpVPIj9bdmV12WlYrW1jxFUs10bPS5TXlwwTA2yBsN5q
         ff8l0obKKf3q2cgBdhBllXswQMtNljGvk8H+vFS+zl7ut/4XhDjroKUqHlzJvqRy5OaD
         mx/G369nHbPBJXfVM2p+TQhZ4TJ1hDjtrPj4R0dtBDDzT7tEPDMzsz0irfxw8CJDcqqN
         z01jrCZqfebftcXiqFJYKdkE6K0Z7H1G5R9bDNojhZJuXRg7bDGfZZ10KO7bAihj+fmm
         OFTA==
X-Forwarded-Encrypted: i=1; AJvYcCWQE4kF5+EuG8xXDnXhQumvBYphUD5YFU1zycfGGMpFszGCpTY96eNfVPxnnuQDmD4HH2iFzBwc+r2MPsg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRCz/Q4qaIfEr+3tQy6x6soMiWWzJSJt2ZJM/nsUfhUgof7SKB
	l5I/VjeU2QH1aEZ+cqWcbbEM0swhdfzDZTjSr/prmVFGVtRe5HFXVzze3QGdZhc=
X-Gm-Gg: ASbGncs0JsLASyfjXM1/IfF2YNIpTnfJwJ485z0dlr3i6s7xJy3nMDYr707w7LSHOtf
	qfVYoxsleJHh1l2SSXiE+MLmoGbEfFCxW0j+XrmAknmROnfrldaVtwn95VLAOmRfQssqAcYx47D
	/XsMzUNw+6N/BrPEDtWpHJtMrlmf2/PWRyM2IMA1J2hltMG06ty6siQUTiRQV4kAkXqFr9Uteo7
	UC+NyVvLenZuexavfiuIvFkdIKpyAt3P3P7FyaN0f2iyZoqrOuFGkNsJDWDAI7ixGPuCIOJOdb/
	T+zjYss=
X-Google-Smtp-Source: AGHT+IG8elfcqoVP5TeqJF0YRGoxv3Se634EVNeUTNkO1Px/MlZcL9qlyaSPzaiuo/PEWE6hWA8Y5Q==
X-Received: by 2002:a05:6a00:be0:b0:72f:59d8:43ed with SMTP id d2e1a72fcca58-72f59d84743mr12350234b3a.14.1737632338582;
        Thu, 23 Jan 2025 03:38:58 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8148dbsm12918263b3a.44.2025.01.23.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/33] cpufreq: pasemi: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:53 +0530
Message-Id: <a93cb0a441881a23ed867fa35d5960aaba9ae0f3.1737631669.git.viresh.kumar@linaro.org>
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

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/pasemi-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index 5fc9cb480516..a3931349360f 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -245,7 +245,6 @@ static struct cpufreq_driver pas_cpufreq_driver = {
 	.exit		= pas_cpufreq_cpu_exit,
 	.verify		= cpufreq_generic_frequency_table_verify,
 	.target_index	= pas_cpufreq_target,
-	.attr		= cpufreq_generic_attr,
 };
 
 /*
-- 
2.31.1.272.g89b43f80a514


