Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E518D2E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:29:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kSPr4zFdzF0PV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 02:29:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nMb736M9; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kSLs1cQgzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 02:27:16 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id dw20so3560393pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YL749ffaRRh70O7cH//JEZ2UTAKAkYu6Kz0qNRlmdFc=;
 b=nMb736M9Pu0wVEXsuPKV1MkR7nvPX0RHh08qQU68dX4v0iiMCMvoCMEO9hVuMDhRpv
 +g8WsYn52K6qm8ECzNk0J/lemhr7Ui08bLH2ZbNqi+S00lM5qSrT0nA9++pCvxu6Z6MY
 3dsm5PpUaHHNA8p+WgniQCqUQ96AcushrEzAplkpSfJlJwN4PtyQ2GQNFL21MiKkTloq
 EjZsFmFBQcmsKi5mTPB2vq9Dd6Yzrg+MMVxboVLQfOeVl6nhSxVvOz40rQ3XwsNzUiQG
 WKmrPGXlhWpQ3JF/Xo6MK+AP1AU+u4paqIdFx2yHXD7uzTAcCxWdycbwvtFIKMW+qpBj
 TcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YL749ffaRRh70O7cH//JEZ2UTAKAkYu6Kz0qNRlmdFc=;
 b=sk42L/wS0YDWYqGF6J7YPk3L3J0sC8d9dy5K8Jk6OfAhaKMxg4V9s1mfhw/VVUE31x
 GfxZsNA7b1C53qfw9aNh5KjINW6jq/aWZ+oqnNSWohsfTF6Pn8Pq7i9SvqnqmMDfND2F
 A9X2CtvlBjsmFMSsZdDH15Re7vOSaxcU2t6FQ5E+sHkBnVshGP+4Jfb0a2qmLDIV7qtU
 gSqzZG+nnXNCXV5vg8mbstpzaBoxZ5kHzK0mOfH1/SKiqFT2Fb4DvqiLsjAZkcxyhxk0
 wkS/4Hq6Ar4aL3NYEsrvpTWUEH2OUKBAgMOROlGW4/ZXMxlFgmqSXWL92YghP3JhmwWM
 YXSw==
X-Gm-Message-State: ANhLgQ2fhOX9zfJMSweM1xe8hELq0NjclBveXAaJox9rrjSUl7ZWYsMK
 mZOajZUiNgno5uq+1E/uYUmib8yH
X-Google-Smtp-Source: ADFU+vtkMRwIjtEVZDx3W4qeGpj45/7U0F3iQQ4lvYojyGcQxHXqcd1XKOPHNCUMuJ3jPRK1WAe31Q==
X-Received: by 2002:a17:902:8213:: with SMTP id
 x19mr8673322pln.161.1584718032751; 
 Fri, 20 Mar 2020 08:27:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id lt11sm5105005pjb.2.2020.03.20.08.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 08:27:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: avoid harmless preempt warning
Date: Sat, 21 Mar 2020 01:24:36 +1000
Message-Id: <20200320152436.1468651-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 3c3da25b445c..e4ed5317f117 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -636,8 +636,16 @@ static const struct proc_ops vcpudispatch_stats_freq_proc_ops = {
 
 static int __init vcpudispatch_stats_procfs_init(void)
 {
-	if (!lppaca_shared_proc(get_lppaca()))
+	/*
+	 * Avoid smp_processor_id while preemptible. All CPUs should have
+	 * the same value for lppaca_shared_proc.
+	 */
+	preempt_disable();
+	if (!lppaca_shared_proc(get_lppaca())) {
+		preempt_enable();
 		return 0;
+	}
+	preempt_enable();
 
 	if (!proc_create("powerpc/vcpudispatch_stats", 0600, NULL,
 					&vcpudispatch_stats_proc_ops))
-- 
2.23.0

