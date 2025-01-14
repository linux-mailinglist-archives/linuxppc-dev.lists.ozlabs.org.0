Return-Path: <linuxppc-dev+bounces-5221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A15A104BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 11:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXQzW4KvVz306x;
	Tue, 14 Jan 2025 21:56:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736852183;
	cv=none; b=CHWr692jsPMLamnE/4qPXQl3gWPN3GeP2GIaWHaTcLbO0tAp+NeaZgdGHaYNDD0+Dz5+St1S3GN/L+I2+8Aa8BAOjJ9UlznhChcqk/8UhWMwosQOAc6xhhKlh8d8hGNmY76QoZfTigmJvb//10DlGX0Hmf5ARwur1cQprUHSNB/LCR+8kbn/txw8vRX0p8nQHl5JMTzjYM0iME2K+3GzOMkXabM330qTfh0/0qhaVyDtQJLPue/PnbWjqR/pY1ORn4zeXHmh3JmgGwX8xxozUl4XFQ5IXtLCGAVN7cz1p1OKqOPO3SVFamhvBLNwaLPX5yfnND3tDpXSVxdtjdb7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736852183; c=relaxed/relaxed;
	bh=/9oSrldtgC1P5MkOGOlIxpHFkeRWTLigJBFqOxmE9I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnPJCykJPpNET3maF2pFbQcxLtc/pVbkVwK0OXCvOqEYSyRzKHhZrKCViO0jZ5Krui0RyYIM5+A4ZnhVd8X3tdFjGDF9MiNkiCm223rl2RVOqD63rorLcQchbb+ltkhPqpSR3NqeGTAfBoCHq7zQVpuZIfMO1l5j3jp8CynZfDyfyhA8RdCQRI2KvqNrYsskoksZvDuSIIolAsPr0aiZ3pnV05nGaCVWpZKOYAofNCU0yMgEcSG48rmtp3N+1BncaVMMnbEsTQyx/+xG3VsEr3YWblZm5I81lnCrBaT3EFNfgeKBs2wGSiLJEF1IXBJgXGC6qeBy5rc762rITjd4yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ipyMAmwe; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ipyMAmwe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQzV1rjWz3011
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:56:20 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aa6647a7556so94764466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852174; x=1737456974; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9oSrldtgC1P5MkOGOlIxpHFkeRWTLigJBFqOxmE9I8=;
        b=ipyMAmweLkH/D+pngg0+UEgvPUPJm68Rf6QsvV6HrEMnOEytlUNWM57j2sHGcxbwIV
         hxsyRL9A9WlBI+bW6txAO0j4Jch6pJJYawTN/7En74rOUxvd/2NIDMoeBIgrVKm7K1CN
         ULWg2p4RKxv2ONFxpylg/5EEPedJUibxbFKc3rdlRyhFnAaDRI8v45jXG/cDKG2Qc+cH
         NUn3Srktu5SkWT/eBi8Ki8kBd34uzIrb6yUKQqpqA5wmbwGJQgi7CvUOM+ur3fxHCkzC
         fskf8brgpA6DeZTrDvCFSTrE0fmFJtPEO14WzNhXuuO4EaEhnM+V8Ko6eEw2A9knymR1
         mFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852174; x=1737456974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9oSrldtgC1P5MkOGOlIxpHFkeRWTLigJBFqOxmE9I8=;
        b=XzjJpqkD9+RitVTGRFqtRz+VqWgR82ITk5/hoQDfUjSjo/YzAEiUTS6ZtitO2lrivu
         qx0LWUApgzST7L0Qj9VLKgns7JD0wYrkYitxORcXgLcdA/dSjqW0uA/uPVpyefiVsDt1
         stPXfXAkwuq4OVnxDy2qHtY3PAnmHprQwvrz6C1wJqTIfjclDvbdtUI82VHBO3e1+Hyb
         UrFOFdRO/wKbdWblrMn8SAc6HIBi2Ka6cR68akSZxIHtARW14l6qJE8fGMuNHnfPTB5B
         6sJWq/s/SEflzYgcFKUQRyXWFKKuqFgZxYJM+qFFr6mN/n0WKfpsYVfXv3yB7hkK5cVl
         0ELg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ptz+dVEV04OiXejOSOeFO3rFK+LDBaMcfbbbi7zgqzXT3PNsVjXVKmZgiJv32Pv6omohAnhisvCtTJw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwS6SInZQxWNVGO+Evkj93kCOfP1NKmM2cSy7pvolAWRAFNHhAJ
	oDQpQFFop6DFEn0V9gydseibpfhypyJs7L8G6EVNyvQlR9tNWyli1FZyf7kfPJw=
X-Gm-Gg: ASbGncuz2uZZRIxRXLBRHKqEOinSRjxB/76FvWMesjMwIFF3k20uGm0lKigDR3fs8A8
	xe3NErVt7dxmRdnVclPqZlvSEeWYnSRpnFlUrxq8vX/tiX0TVAtP6oo4mKUHHy8ZRXUa5Q/DvxO
	wpYOOwdqJEPaVfF89XJQOyDBOyfu9jL24dFByrcEcmZ4jQ0M7Yc2tjiniTH6pPaVRCyXmKyit92
	C2Oi8gI6NHfs4zUXMIdk8wrkedXUJ9bpiBgqd1Bs8DfsKbXjfsO4jJrIu1SPgujj5kEmco=
X-Google-Smtp-Source: AGHT+IELLCYYvHKb5lpw7z0EW5WhiA9Rzrdg/loEMvWoWRnv3YcLbL4xd0LbtlI+AziAeBNghsD6uQ==
X-Received: by 2002:a17:907:2d92:b0:aa6:9631:923f with SMTP id a640c23a62f3a-ab2abc9519fmr845034066b.12.1736852174367;
        Tue, 14 Jan 2025 02:56:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b215esm611700266b.161.2025.01.14.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:56:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] cpufreq: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:56:11 +0100
Message-ID: <20250114105611.273202-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cpufreq/cpufreq.c         | 7 ++++---
 drivers/cpufreq/powernv-cpufreq.c | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 418236fef172..fba62124b56a 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -25,6 +25,7 @@
 #include <linux/mutex.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/tick.h>
@@ -602,12 +603,12 @@ static ssize_t store_boost(struct kobject *kobj, struct kobj_attribute *attr,
 
 	if (cpufreq_boost_trigger_state(enable)) {
 		pr_err("%s: Cannot %s BOOST!\n",
-		       __func__, enable ? "enable" : "disable");
+		       __func__, str_enable_disable(enable));
 		return -EINVAL;
 	}
 
 	pr_debug("%s: cpufreq BOOST %s\n",
-		 __func__, enable ? "enabled" : "disabled");
+		 __func__, str_enable_disable(enable));
 
 	return count;
 }
@@ -2812,7 +2813,7 @@ int cpufreq_boost_trigger_state(int state)
 	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 	pr_err("%s: Cannot %s BOOST\n",
-	       __func__, state ? "enable" : "disable");
+	       __func__, str_enable_disable(state));
 
 	return ret;
 }
diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 8de759247771..ae79d909943b 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/cpu.h>
 #include <linux/hashtable.h>
 #include <trace/events/power.h>
@@ -281,7 +282,7 @@ static int init_powernv_pstates(void)
 	pr_info("cpufreq pstate min 0x%x nominal 0x%x max 0x%x\n", pstate_min,
 		pstate_nominal, pstate_max);
 	pr_info("Workload Optimized Frequency is %s in the platform\n",
-		(powernv_pstate_info.wof_enabled) ? "enabled" : "disabled");
+		str_enabled_disabled(powernv_pstate_info.wof_enabled));
 
 	pstate_ids = of_get_property(power_mgt, "ibm,pstate-ids", &len_ids);
 	if (!pstate_ids) {
-- 
2.43.0


