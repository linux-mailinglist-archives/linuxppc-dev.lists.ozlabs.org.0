Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F906220734
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B69Xw3rVPzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dNLsrisc; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B69Tj3l2ZzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:26:48 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id g75so4473132wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FEE9EyuKEElP2R0dGV5iQicdnI3vcbhmFFoLiz/bvg=;
 b=dNLsriscR4hsRjVJy5HJ61IIk4PpwYkqGkI3F3kDQQeDKRecSXlq3RsNQY2oCbqvYr
 yZK14gsEQVw7xlfvTfZM7JvCMqfvlrQVrrqRtn83MdQ71BOFT0hZL8oC5qbgiEx20dXq
 AhE5zLi6V299vlhGlmf96yVFf+aEYUzYOT21qrkVWe/b5KHV8IjzCsqL+yoJCjR+6QTS
 qoCDhHlD5wC1lXiQlu+TjLdoU+qrC3Egi+XR2EqRUqbwFO56nK2tBacDB/dP9AGYQsp4
 6xzTC0Fl0UxZFy7pe5bgbzmpQWKzHYZ/6nMwAUfRIVIfqPQHKtwzaKcds55p7jwTV7si
 eTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FEE9EyuKEElP2R0dGV5iQicdnI3vcbhmFFoLiz/bvg=;
 b=H/dMfAdjZ0JDTTD8LsxDCQavwf04gA3l1q2GSC21NdMNauklnDPP3r+fi1cV6nqpsB
 /02nhYJ2XYkynEHHY6O9ySYYt96rC2X83nwHctuQpXNtr6GZB3wfLWfrCJg9Ssslu8Ng
 XLmcwtOS/o6NUD6mJud8JAYcLFkA8QX7nffog78exdNJx1aEnArWStDOssQRFLXtyqkR
 1OdCfb+iwrcH+4/blnHqkAmvYL0X1jTf0bjCdUOHrQeHbZR07gIyfrd0dMEAbX37E8+V
 8IdzPGXN/qCXDMFxZkmnnZAVUXwPHToS84PY/6ZOWzCHDQpNgF5KOudsyG1w+06KeLcW
 gYvg==
X-Gm-Message-State: AOAM532t8j6nwVb9myZ4vY1gX/QH1x79vAGXAlqgSOA1S44ZW+xcn6Ya
 Iw/n1BnTADQYcXSVAeCHV1OjXQ==
X-Google-Smtp-Source: ABdhPJyFYPMmX9IE6VXwHxqc8TKSlBqseWdICHouNyIBW5KtvQh/NAXsNlCEjrx8/rQmYCNCLa2C6w==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr7896351wmi.114.1594801605457; 
 Wed, 15 Jul 2020 01:26:45 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id h13sm2400361wml.42.2020.07.15.01.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 01:26:44 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: rjw@rjwysocki.net,
	viresh.kumar@linaro.org
Subject: [PATCH v2 06/13] cpufreq: powernv-cpufreq: Functions only used in
 call-backs should be static
Date: Wed, 15 Jul 2020 09:26:27 +0100
Message-Id: <20200715082634.3024816-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715082634.3024816-1-lee.jones@linaro.org>
References: <20200715082634.3024816-1-lee.jones@linaro.org>
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
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
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

