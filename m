Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4D436D84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:34:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2NR0mYNz3clL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:34:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cIJBVy+e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cIJBVy+e; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hh2YY8z3c9T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:40 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id v8so1902457pfu.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=cIJBVy+eaxVPV7kkePPWvChxtwGhuEUGMQiPz0Y4oymY2fp/HV1NWs9HUfuQTORozz
 qRXAOwQtks3mgfSkbhWMV0GzWIjEyK3WEvd4AHP4gGOmuysB0idMxljlHmLwSvfN0/sa
 TgNOe8y4MlD+dHwXe/cwJN1JJJ9OoZzjVLsT/NlfI038iECUoi4PTX0E9FdrSrBj8tH7
 KMxt3JWhvFFtMv1q/jT+JtcXYlBVXbXBNkvGCrll6ZKZohCCK/06WbSYcVj079QHCwnD
 kxn7XxXtx8MXlNKF8UmxHvZBA6y7jNFRPecSWJDRPZGVCi6kKlXSyHi/8kB/oFcG3Xx+
 dJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=xmBZjr8PH7gYT+9+cqojjeyIHCF5wdCZrVcc61UuRJnQC4jNsz8PHZPJFSgj8+r0jO
 OpX923vokqY094XhmYCO3BsXEMaijkgh7xrSZiGk8s1sUFzsUKiNaEpKU33aprTMPrfE
 aSCMnq7CCgUh4r9v+rbjIz8DnPtqL9t4sQasjFqgKRQkpuTMV40o6E+BPjmn7cRoTpL2
 ujDH+kesuhHDRTSphp+a5PsfvoeoaT4AC/f5nx8TBMOOnpYtDTvHaZK8iKOQhMGBNdpg
 UaxDSDAHzCwNu5IXw+7qYh/jqGEmrOim+sLarCgO1ngpGoPW4GxEVcdgQz8g0W+2mO9V
 PTlA==
X-Gm-Message-State: AOAM533LsmCJGL0SDQxHHV3AkNJOBT/tEYHGunUdxL2498dMGt471w12
 oB3JDn6ltdDXVj22XPtMT3xQXDQx5Ao=
X-Google-Smtp-Source: ABdhPJyai0PvEwgvi5XVBEIGZPNDbIpQJgFjUtZJTWWPtt4WQPtxSwlZzdDjV7LSf9J3tZy10p74tQ==
X-Received: by 2002:a63:7308:: with SMTP id o8mr5834960pgc.77.1634855438213;
 Thu, 21 Oct 2021 15:30:38 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/18] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Fri, 22 Oct 2021 08:30:01 +1000
Message-Id: <20211021223013.2641952-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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

This avoids a change in behaviour in the later patch making hash
support configurable. This is possibly a user interface change, so
the alternative would be a hard-coded slb_size=0 here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..3354c00914fa 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -532,7 +532,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   lppaca_shared_proc(get_lppaca()));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
+	if (!radix_enabled())
+		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
 	maxmem_data(m);
-- 
2.23.0

