Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728D3F24CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 04:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrQhs2rydz3cLL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 12:35:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lHDeTH5e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lHDeTH5e; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrQh833R1z3bTV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 12:34:30 +1000 (AEST)
Received: by mail-qv1-xf35.google.com with SMTP id g11so4798885qvd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoGBCWp3KCNfgB/Df5rElpIhp6P6dUadsEIrn/tjMyk=;
 b=lHDeTH5eYqmuMWehbWpNCnLy2x0qltq/wnwxqkp574COOjpeXYoxZVWThj7NyFE4Hi
 l/CnAimflK3MxW5xhT4W8ka6ZLHUaDWQzpkFPzTpzq3Og5s6yvjiG8zfsBaO/jgD4YGO
 bTnRSmIAKyJZMc5pUS4M2QvBR3CpGElgz8DMmvu6ifKoqlKVCpzNNafrJgsxgUo2kQUG
 a08TX9h1Kl0IOdPoAgesC+DBRz1YaJfYqE7qbb4vKSDkqtDMMgaqa6fGRpB9wFvFkNsh
 vUQZUBeAwGQnBdpkhEsSP5WxmfJXE8fi9YY5Qa+bEoHeN7heCyMtez5XMOojON14pFip
 fAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VoGBCWp3KCNfgB/Df5rElpIhp6P6dUadsEIrn/tjMyk=;
 b=GM7QQV9DEYI3ry5QU3iJHFjSEVPYDlOxzTUAl65YPQp1QJDKmabHiE2sVAZZNWPAng
 4RHvM/STiDJ7JCAfqHZDwYGPbIu6Cp/8sqbpcqME+4rgrgR26t4WmGOsW4JHhCIB86iV
 nulrLUsgnpb7SFs9BH6j93UrZEY/g45dRoN79AIn+hAKAmqLbl6ZY7DjucQg7NHlKia5
 lTJlHO7hEZERnfT2gut46ZyQ2s1NYTQPRQmFNwP2n3FOp1z4fgbz/D25GOooZHGJCMtz
 dzUsj6+g07iNHlS5yJqPg8/0SMCXHejMGijVy+F4Z7VRYldRgPewpz5MOaPqkvpfSDLO
 8c7g==
X-Gm-Message-State: AOAM531ti3oTKFYbLsmwa1JhRhkD6lLBcykfJJJClcPGeLaXFilnzS1q
 FirPNzOLUx5Kpm3aAWa00r0=
X-Google-Smtp-Source: ABdhPJzYzgrCRZIg+O/2IZU7ylfpuT40S9ORMT3V/sxyKAAUeNrRmqvLLZ+J+8sSB2r4iqlr4XJ2AQ==
X-Received: by 2002:ad4:54f2:: with SMTP id k18mr17878753qvx.24.1629426866086; 
 Thu, 19 Aug 2021 19:34:26 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id r18sm2119277qtm.96.2021.08.19.19.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:34:25 -0700 (PDT)
From: jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux-next] macintosh: fix warning comparing pointer to 0
Date: Thu, 19 Aug 2021 19:34:14 -0700
Message-Id: <b12b200502312957065a12f8d78e8d250c244d21.1629193159.git.jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jing yangyang <jing.yangyang@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccicheck warning:

./drivers/macintosh/windfarm_pm91.c:152:12-13:WARNING comparing pointer to 0

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 drivers/macintosh/windfarm_pm91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/windfarm_pm91.c b/drivers/macintosh/windfarm_pm91.c
index 3f346af..568f8a2 100644
--- a/drivers/macintosh/windfarm_pm91.c
+++ b/drivers/macintosh/windfarm_pm91.c
@@ -149,7 +149,7 @@ static void wf_smu_create_cpu_fans(void)
 
 	/* First, locate the PID params in SMU SBD */
 	hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
-	if (hdr == 0) {
+	if (!hdr) {
 		printk(KERN_WARNING "windfarm: CPU PID fan config not found "
 		       "max fan speed\n");
 		goto fail;
-- 
1.8.3.1


