Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA321F57E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:55:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5k8j3R64zDqdd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 00:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YaPkEvwk; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5k3V4gT9zDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 00:51:01 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id f18so22197711wrs.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pwz2ffWzBJ40s4OQQcEx95BGb6IW3I0JlI9ImusOaw=;
 b=YaPkEvwkRMrXCrAr3GD3Lq5esr1zvrFowgkVtFLyXE9aeQ+n6qHPlhaUhK4AYO4xUs
 hm5M2HAtd3m5JHJjY2xKUYjnMD1tdtfs5OPz2xXGUBp2zizzY0ZWTKvQ9U0A5cXFSIRJ
 j3yMdMtUprKvhoEl35KqZAv8e37m9RfHJ9JDTy287GDX+MDLsV7UmkJ7LDgRcd0qsysv
 Ia93V3kAPH4VDyioq5fO47gOCGnLqoR2QLu1mPSgJAUAUCITRKMczfB1Ec4oXyA2jWHx
 PQLY4by7vk9xQhpkcw3oZfR/uB2heai2vAqu8clRrz2QEmp5oM3aCK3aViE9BDI4b5mz
 3u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pwz2ffWzBJ40s4OQQcEx95BGb6IW3I0JlI9ImusOaw=;
 b=kSvqgplDHGfadSNAw6qI3tIWe5/dN9kmT9y0mxx4Ivrbj9EQgrqB8ZMgZL84hxBShM
 LaiOtu5LjWAYw5kTfJgZlUwxme+JAXHOPISNw6lVMO/pT479t+HL5kAiznmMnZXXnE/p
 sF2Q3/w3nfwa+nF9oljnfVo0xksgBpUaZO3B5s/caPNYbQ6cdWtC+AcC/uv5qqGzKSbl
 KweWBWr0sVaroP4JG/xtqAsPHyyAcUSeubhDvqs67MoercgHp0PTW19YimWRBndBEcjY
 bfNQOaRRqrees2UTwJWD8+YDnmQW8lMrLfN7vIVESWbvOlmqEN6hJzz5/X9FN+oaNUrO
 HT2A==
X-Gm-Message-State: AOAM531kKB4DMAd7rlegkbRdb6F8EvKsqL6FIPzYejkaFLjqlLpbXPBv
 iqdacYO+aHzKWg39Nr0mXCjzKA==
X-Google-Smtp-Source: ABdhPJxR1XkWPEdO/OToyZfeyPk6VSF/2G2O+HfpfRXS3rTqGgoQ4md522X2INCeZPPwNAHNuFWGZw==
X-Received: by 2002:a5d:650e:: with SMTP id x14mr6401946wru.187.1594738258660; 
 Tue, 14 Jul 2020 07:50:58 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id a84sm4653305wmh.47.2020.07.14.07.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:50:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: rjw@rjwysocki.net,
	viresh.kumar@linaro.org
Subject: [PATCH 06/13] cpufreq: powernv-cpufreq: Functions only used in
 call-backs should be static
Date: Tue, 14 Jul 2020 15:50:42 +0100
Message-Id: <20200714145049.2496163-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714145049.2496163-1-lee.jones@linaro.org>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Fixes the following W=1 kernel build warning(s):

 drivers/cpufreq/powernv-cpufreq.c:669:6: warning: no previous prototype for ‘gpstate_timer_handler’ [-Wmissing-prototypes]
 drivers/cpufreq/powernv-cpufreq.c:902:6: warning: no previous prototype for ‘powernv_cpufreq_work_fn’ [-Wmissing-prototypes]

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/cpufreq/powernv-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 8646eb197cd96..068cc53abe320 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -666,7 +666,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
  * according quadratic equation. Queues a new timer if it is still not equal
  * to local pstate
  */
-void gpstate_timer_handler(struct timer_list *t)
+static void gpstate_timer_handler(struct timer_list *t)
 {
 	struct global_pstate_info *gpstates = from_timer(gpstates, t, timer);
 	struct cpufreq_policy *policy = gpstates->policy;
@@ -899,7 +899,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
 	.notifier_call = powernv_cpufreq_reboot_notifier,
 };
 
-void powernv_cpufreq_work_fn(struct work_struct *work)
+static void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip = container_of(work, struct chip, throttle);
 	struct cpufreq_policy *policy;
-- 
2.25.1

