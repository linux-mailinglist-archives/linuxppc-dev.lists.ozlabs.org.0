Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2199153EBA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 07:27:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CpQN3mtRzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 17:27:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cD5aKn6G; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CpNw0fKPzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 17:26:39 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id z124so2206717pgb.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 22:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl7NjEQ6EJ4MFGS375lN94gjCgV6bU9jJAzpU2IVB3M=;
 b=cD5aKn6G76/m1v6E4ftL8HpJIZ5fk7Oajd/wioM3HHtA315UUuzu7rQ8yJLstGjcID
 mpFS/QB5eWrBJHwYa6kNjBcjt+c2VIshTBAL1XtD3Ab2JbZET4wz87e0GfNj9uf2exRo
 WBONvaAYApVYZLbPs1rk0b0WKGV8rslXXoWuFQ9nJfnA5pu94DU0tj8iPOWYVGOs7MEe
 LN++0k6d9E7rO81vGSWe+uOjdnaZZlmg6zZ1JEBkq2OcTJ6sanmeHWxPWLth5THGcV7o
 AcE2RlgInhtajd/tOfLTgBCiGRi0Zu0Xs5TdLCxSlUIlTu1Yt4JGZP4vJ6ycgZpTiB7d
 +oIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl7NjEQ6EJ4MFGS375lN94gjCgV6bU9jJAzpU2IVB3M=;
 b=nkkfp5hnrSxK5Y7+FGlt8ic6T4io1CZOELp1AW+ryeXjGRkpDqsQdEOmDVBbt5C1kf
 1jzCpZmwd6scJDlpfUhl/jMKwA8j7sQnucl3j/IJdDeUTmIRRSIjg/uRQAa2yXETl1JU
 F0dBdo8A65iKjW3ocTc7eJ7JlKBW8UhqVWQTF6J2fZIOp1I99Q510nfSXhTavONghPya
 zQIQqhgmIJf+YVglXJaooCsHq4Na+1hIfi8vviHquxxBgL1nyZGcgrOzpt/C2XmkwCDp
 oMr3hpbSWlxLiKUb0QZ5BDj7mAmKgaj2uKDIswdVK1Jp62OR9/AJJ8oik8UqHx4bfDRl
 wl4w==
X-Gm-Message-State: APjAAAWaiYJK65brDp6cRAzafZr4SNFL8jneYUzK//stAGuJgLoEZIlb
 j3KZKWJd2iOPHWpa8Rr9iIyPthjL
X-Google-Smtp-Source: APXvYqzX9wpOLW4AvGPxMjlyB3GYDXDtRCg08qTHSEzOi+xp9nP1PO5lB2dtv1rbEp4T12HbR4euXQ==
X-Received: by 2002:a63:8e:: with SMTP id 136mr1898538pga.319.1580970396179;
 Wed, 05 Feb 2020 22:26:36 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y24sm1895588pge.72.2020.02.05.22.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 22:26:35 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] cpufreq/powernv: Fix use-after-free
Date: Thu,  6 Feb 2020 17:26:21 +1100
Message-Id: <20200206062622.28235-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The cpufreq driver has a use-after-free that we can hit if:

a) There's an OCC message pending when the notifier is registered, and
b) The cpufreq driver fails to register with the core.

When a) occurs the notifier schedules a workqueue item to handle the
message. The backing work_struct is located on chips[].throttle and when b)
happens we clean up by freeing the array. Once we get to the (now free)
queued item and the kernel crashes.

Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Fixes: c5e29ea ("cpufreq: powernv: Fix bugs in powernv_cpufreq_{init/exit}")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 56f4bc0..1806b1d 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -1080,6 +1080,12 @@ static int init_chip_info(void)
 
 static inline void clean_chip_info(void)
 {
+	int i;
+
+	/* flush any pending work items */
+	if (chips)
+		for (i = 0; i < nr_chips; i++)
+			cancel_work_sync(&chips[i].throttle);
 	kfree(chips);
 }
 
-- 
2.9.5

