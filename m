Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 815458A05BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 04:05:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BTLtd8o5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFNMS2Knjz3vbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 12:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BTLtd8o5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=lidong.zhong@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFNLj0pRdz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 12:04:59 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so69604901fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 19:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712801094; x=1713405894; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f95uk9eiNhzs+qv0g8M/yPBn2RDkTYuRWKYblC4xV74=;
        b=BTLtd8o5VK/u9az2e43l/6JHpOM1NeX18HuC+CQ113o6q+8lWCJyJJvGBsma6C8rql
         N0CvmY1KciduWtgSptRnKswS4Gjohe9z0+8ntC0ZGmvJjhUrvDdlpIlwIb93HnThhfw8
         lKfPf7Egw3mQQOxGl7J+7EZy8F93D+rfwAACHImG2NrTFxr/3KNAjo3f+ifobmCBra/K
         iurdAnkh6Gkviz3TyhGmBkKwCJczeYYJ949qxOGtPbfryc4WHrXg7BwXCslZVR/lLflI
         A7feYdTxSJ8HbduI1E1Xi3qOrf7ekIwD4+S8W6yNY41TXZgL82+D8jGrgU07qmE5l6It
         TrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712801094; x=1713405894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f95uk9eiNhzs+qv0g8M/yPBn2RDkTYuRWKYblC4xV74=;
        b=lXeWRgghap7p/tDoDVBfvlR0pRVH0MzgGLDpxN7dUoz29e45Yka0QE/dqB8mCBYH6c
         76qOTBRhi3ldZQSBb6r47neQC1fq8s4mHnFkqCV9KtWXM73iJR2/wi5zkMjIfFVveuf9
         w9xQX6K4YqOIlkTqvG8kZDOTlpkdXK7HqVcH90xh24nQX1xZzfVgNGfaTfUepuRYXNFS
         1asQL1RZtzjJcrln5Moj/K4Qny47cq1RNNLqbBcTVy+TJVQYr5QMWLC9cTKavht/amen
         csKfL8qgBLP3sypBNUYHmiNASfLN4K9aF30KObTiWeKTJHiK0U4eoEp9Ng1QNAdLb2+s
         5fwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt0xRBFhDt2v1NbeaDUFs2bvyL6sWRSCQ4d8G+9PN5RL4hhgvW2W23cdCH3BRCHKvl3s26So+/mnKAxbpfA24PmPt3XDWOh2zbf7cFog==
X-Gm-Message-State: AOJu0Yw4UZ+giQx+SMnMluCp20DHyWDMKt8skNjzWcmbUGeFrLeWNGBC
	PFQtCdgBDQw6annoEHYc0jZJocv+LMz1SRCa+cjPkTwaI2h0uhp2GqSI63CjFlM=
X-Google-Smtp-Source: AGHT+IE6dB9zJt0CpZY2U2Op6RM40Mv+ujVLaKmjHYj1EXBT4JVmauVeNzRp4/C+Dko63FtDxeb3Jw==
X-Received: by 2002:a05:651c:1423:b0:2d6:9445:9267 with SMTP id u35-20020a05651c142300b002d694459267mr2368295lje.43.1712801094371;
        Wed, 10 Apr 2024 19:04:54 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902748200b001e3dda6511esm218635pll.101.2024.04.10.19.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 19:04:53 -0700 (PDT)
From: Lidong Zhong <lidong.zhong@suse.com>
To: mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries: remove returning ENODEV when uevent is triggered
Date: Thu, 11 Apr 2024 10:04:50 +0800
Message-Id: <20240411020450.12725-1-lidong.zhong@suse.com>
X-Mailer: git-send-email 2.35.3
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
Cc: lidong.zhong@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We noticed the following nuisance messages during boot process

[    7.120610][ T1060] vio vio: uevent: failed to send synthetic uevent
[    7.122281][ T1060] vio 4000: uevent: failed to send synthetic uevent
[    7.122304][ T1060] vio 4001: uevent: failed to send synthetic uevent
[    7.122324][ T1060] vio 4002: uevent: failedto send synthetic uevent
[    7.122345][ T1060] vio 4004: uevent: failed to send synthetic uevent

It's caused by either vio_register_device_node() fails to set dev->of_node
or the missing "compatible" property. To keep align with the definition of
modalias in modalias_show(), we remove the return of ENODEV in such cases.
The failure messages can also be suppressed with this change.

v2: keep align the definition of modalias with modalias_show()
Signed-off-by: Lidong Zhong <lidong.zhong@suse.com>
---
 arch/powerpc/platforms/pseries/vio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 90ff85c879bf..b2babfdbc40b 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1592,13 +1592,9 @@ static int vio_hotplug(const struct device *dev, struct kobj_uevent_env *env)
 	const char *cp;
 
 	dn = dev->of_node;
-	if (!dn)
-		return -ENODEV;
-	cp = of_get_property(dn, "compatible", NULL);
-	if (!cp)
-		return -ENODEV;
+	if (dn && (cp = of_get_property(dn, "compatible", NULL)))
+		add_uevent_var(env, "MODALIAS=vio:T%sS%s", vio_dev->type, cp);
 
-	add_uevent_var(env, "MODALIAS=vio:T%sS%s", vio_dev->type, cp);
 	return 0;
 }
 
-- 
2.35.3

