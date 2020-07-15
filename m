Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB6220760
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:34:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B69fQ6PkczDqmF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wdxG8jLe; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B69Tj5QCPzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:26:49 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id r12so1404231wrj.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Z0fv79A73/vZIqM6ECnqpdpU/+7K2Y0w7fARWedt1c=;
 b=wdxG8jLedDYRfjs4gGzseOHpJxQaqy1oTFNhn/v43wZILfD7sUfWOlTF/WfpZ53GiT
 9oirELAFbfOr4p5MsvB+3S3+PtP7e/IqharXV5TfUubJv6rBsfC9LqbdjWCx3fsWArRs
 RN3YAggQmoJk6eGn/MiyEbYw3IQ0k4T1WmIM+5/iLbtAJYlKiflIyr5p2Jtis7DbFJlz
 l+3GYbFdxmaVQCDR3DqZ7fiLFedXA2147Ou9CguKQ4q7pNY/y7oT+rcs2qaXJju7JgkL
 YgJfJG1bNq9KJ6W7Mt551x+CpJvCFlviz24zy1H4Bb9SL4Xv68oacZ7TTVxXCoVhg5mE
 Af6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Z0fv79A73/vZIqM6ECnqpdpU/+7K2Y0w7fARWedt1c=;
 b=aYoqZIfl8wsq7mJbVoTGshL0QTH5nNLjIp3qu4hvmNiIPyQzVPButt6UC5YdWX71pk
 TKwccMRVeAnp+QIQ6c697kRnhIPwQKV8G/MDBhYWkmt1u/lPydoW1sHr/PcZ6Gj8nT3m
 O+S1LrI439JPSbgXDmnGuABevqjq6A/jHD4mJKWbid8bo4x9LS21i1Rl0Hx5fFYfmjxu
 KzcnBFJV6mjXAocdxdcjI/J//WjgovYskZcd5rT6TP91RKi9E9eH0RUwbwIh+E7setL6
 kWrxoQUAyd4M2iQO0lebZHUUEuNHvAtrm9jRV/BasL1xyNNMJln67XUb9subpheji7mH
 L+bA==
X-Gm-Message-State: AOAM5339hpiUVySucIDrZIWe0mK0IQR91Ad7k8tFUBleXHXw+pqmzXN2
 dgHn6F8sbowASt/nzUj13fnD9w==
X-Google-Smtp-Source: ABdhPJxYpuDnFCKTJN9z/Su7SsjnFEtm4WYtkojHvEEbT9vOYYaxPZnzu+/urdXDpBhf2vcZO8Fd6Q==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr10347220wrt.191.1594801606598; 
 Wed, 15 Jul 2020 01:26:46 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id h13sm2400361wml.42.2020.07.15.01.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 01:26:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: rjw@rjwysocki.net,
	viresh.kumar@linaro.org
Subject: [PATCH v2 07/13] cpufreq: powernv-cpufreq: Fix a bunch of kerneldoc
 related issues
Date: Wed, 15 Jul 2020 09:26:28 +0100
Message-Id: <20200715082634.3024816-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715082634.3024816-1-lee.jones@linaro.org>
References: <20200715082634.3024816-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Repair problems with formatting and missing attributes/parameters, and
demote header comments which do not meet the required standards
applicable to kerneldoc.

Fixes the following W=1 kernel build warning(s):

 drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'last_lpstate_idx' not described in 'global_pstate_info'
 drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'last_gpstate_idx' not described in 'global_pstate_info'
 drivers/cpufreq/powernv-cpufreq.c:84: warning: Function parameter or member 'policy' not described in 'global_pstate_info'
 drivers/cpufreq/powernv-cpufreq.c:182: warning: Function parameter or member 'i' not described in 'idx_to_pstate'
 drivers/cpufreq/powernv-cpufreq.c:201: warning: Function parameter or member 'pstate' not described in 'pstate_to_idx'
 drivers/cpufreq/powernv-cpufreq.c:670: warning: Function parameter or member 't' not described in 'gpstate_timer_handler'
 drivers/cpufreq/powernv-cpufreq.c:670: warning: Excess function parameter 'data' description in 'gpstate_timer_handler'

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/powernv-cpufreq.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 068cc53abe320..2e5a8b8a4abaa 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -64,13 +64,14 @@
  *				highest_lpstate_idx
  * @last_sampled_time:		Time from boot in ms when global pstates were
  *				last set
- * @last_lpstate_idx,		Last set value of local pstate and global
- * last_gpstate_idx		pstate in terms of cpufreq table index
+ * @last_lpstate_idx:		Last set value of local pstate and global
+ * @last_gpstate_idx:		pstate in terms of cpufreq table index
  * @timer:			Is used for ramping down if cpu goes idle for
  *				a long time with global pstate held high
  * @gpstate_lock:		A spinlock to maintain synchronization between
  *				routines called by the timer handler and
  *				governer's target_index calls
+ * @policy:			Associated CPUFreq policy
  */
 struct global_pstate_info {
 	int highest_lpstate_idx;
@@ -170,7 +171,7 @@ static inline u8 extract_pstate(u64 pmsr_val, unsigned int shift)
 
 /* Use following functions for conversions between pstate_id and index */
 
-/**
+/*
  * idx_to_pstate : Returns the pstate id corresponding to the
  *		   frequency in the cpufreq frequency table
  *		   powernv_freqs indexed by @i.
@@ -188,7 +189,7 @@ static inline u8 idx_to_pstate(unsigned int i)
 	return powernv_freqs[i].driver_data;
 }
 
-/**
+/*
  * pstate_to_idx : Returns the index in the cpufreq frequencytable
  *		   powernv_freqs for the frequency whose corresponding
  *		   pstate id is @pstate.
@@ -660,7 +661,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
 /**
  * gpstate_timer_handler
  *
- * @data: pointer to cpufreq_policy on which timer was queued
+ * @t: Timer context used to fetch global pstate info struct
  *
  * This handler brings down the global pstate closer to the local pstate
  * according quadratic equation. Queues a new timer if it is still not equal
-- 
2.25.1

