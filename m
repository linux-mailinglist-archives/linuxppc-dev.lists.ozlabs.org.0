Return-Path: <linuxppc-dev+bounces-12373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8553B85617
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:55:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJbb4p3wz2ypV;
	Fri, 19 Sep 2025 00:55:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758201347;
	cv=none; b=CQp45GVq1U05lkb5EPsX7BGDWRiCcilMNuvVT19Z0oYliWtNYy5zs36RLaiTz9yU083r4kqxbXP2EnxhFpPyfjWkBRQQx9qtI8mxQThxvEzinYyG64AhXUrCP2C67ui+HkO8sUAe9VSz87Vu+swiZZ1Yazz+9BI3zkCE3IDSAxotT0POXRKTae8IjV2yoU9DXHEwILavCU2LH9ZyihpJ/PEiEXcHlIrKYfIqKKKZy5nJ1RSUNDi+rr497OSoSFwh9nz4pMtYXcMpF8jYvzsuuWySwPAxgZW8fKFmAHRuURj08USRj21KfO9WHhfkfWfiNw/nXZWlMy82UqxD1u0EQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758201347; c=relaxed/relaxed;
	bh=yE34uiJAxjOCRXMZb/gdhVBd/0cCnsnfIfmCkzSAFk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ippMangzMJ6gixafDExggpslxo2+e8HUGBUa+nRLsarXW3euFDXaUJ8MNIz//wD7Qxw7KrH+G4bVeCANmOyAJLg28fNJ75P5S7T6FKlZF1FQr9EwkWwxtXe24rzEyd71uPUJMnAk/UL/N8J+OpdgOMkVR2Wz5wGPPd6XT8avzFpUmXx7cMSnt7h3SFw4hmXqX+RCsZs4lntsKbM2e9wxluG7jflTHcyyf1NEGszUNQuZHgaXfpnNjwKNb2HpY0b0Nwl/icmE16IyaFtXJ4NBoTurMuNvln29txLnpQvWWkepVdHfGk6gPC64JjFFCbzGR0rliSXKS0T8NhG8zYMJQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VL92buCz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VL92buCz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSGNL5YLnz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 23:15:46 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b55115148b4so207152a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758201344; x=1758806144; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yE34uiJAxjOCRXMZb/gdhVBd/0cCnsnfIfmCkzSAFk8=;
        b=VL92buCzyQLjBkPNyI8TW6OFa1ke++QbMshoFrfD2sj8zoDTmWS9uKKH2+a/WFudS7
         k+v+as/uzXcjE3Agn4X3PW89/OLHxoXG4hFpnlN+tpmbmuZTy7+lvDYdchGap3bw7UZ8
         NTwgKl2g8zuj8Sjv+DjCtiZtRwdWaOhRm3tpOxprWLIdwm3UMVAkZLEGgUQPPLQFErJK
         tVsf/gOzAVidskhYu8TXx8XA9o1/XIGZc2XEe0YCEP/gXQAiQz1VLZHlUoZ6G89xZoZT
         K2kfNdgBpXDHS1mTo5XAtBxESMBZUd82iRiEyz2KwVQ7SNoae8BzJK6nhUjxanDbbjTT
         NlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758201344; x=1758806144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE34uiJAxjOCRXMZb/gdhVBd/0cCnsnfIfmCkzSAFk8=;
        b=Xsr/OgMG3I68uTA9I4sdu8fAEAcbwLrwuIDJtEYmDjbmIt+p1ddNu5frQy25qou4gk
         9ahkdTp63+gc8MeP3ECiZ6k/7JMXjO5WgAz3lXzUJ4hFe3UrP2UpR0aOE1iYrqc9nbGz
         vR9iF3C/mNvaHfNpqF8mDdaHVrNC3qF4CG91Tf5uMXuxEB1FLPprcK14DDpbDS+v2WyV
         wiUzmafRXGcv2qFMNOYiOTGCm7sO/odGqeP5g7qsOyvC3g/K7Jsi+RAzKiS9oLrsBWxd
         Pzg6eN7gECqb8S0PsMdIpL0xpcf4ejWcB+59p4SV9B47B11drpTon1BSKZcS3xuTCuWQ
         Qewg==
X-Forwarded-Encrypted: i=1; AJvYcCU7vrPzwDdx9lRPhzhrNOVYQFAeheVVG2Myn82JczCc5gEC6wnfF12La/KetIPflG57jfJFQbNW2Zo/tKg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeA6hE1RwrwdgyBgcf9S+aZ9aJPb3EqDLrNz9Govl53OkmxWko
	ylZYEd2lvot6WSPpnJNlO3fD0mRLMFPJuiIZ+nrFua6aePd8S5uOf0TY
X-Gm-Gg: ASbGncv/gJdKCfO14IaP6QOZa+lE7OPk1yix6caDTJdDair46YRjluSDwgWUBEfRL+K
	ZMGBRen7f+s6xR5Ots3MTqvh9p2YpafP1s5J9tvyk1jy1Iv6yGUG8U9rwrtRKEJGWuYlvREO7mc
	0866F5zvPEp/EPcRVFqzoexoI3lPejkS+zFDbXYGGUQZQncqOSh205bN3o0MzycJTuEoW3v3Pj+
	cNRBckBcJ0Cfj1mQV13Vy9O+znbFHziA9Omnd2gDW6/2tLzwqbq7pcMaYIewPhbA5EoPacoQiiP
	8xTSEmCCPIOAu8R5FIg7HcySPZm17xIpocKbIQuUH6Z2p9PhYktHrWUPM2/YvBvHJ69Ho3dZAJn
	9EYkqrYM2MYICc7noKYA8A1f2R536hivqKDpTRB6CEw==
X-Google-Smtp-Source: AGHT+IGsMo/8lQqefuavLtapLE7AECgG8b9jcfsyTOPdN+syxzbumlh0WE+7dvjsyXF6z+BpZPP70Q==
X-Received: by 2002:a17:903:fa4:b0:24a:8e36:420a with SMTP id d9443c01a7336-2698aa45676mr34911085ad.40.1758201343497;
        Thu, 18 Sep 2025 06:15:43 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:c81b:8d5e:98f2:8322])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033ff66sm25343095ad.133.2025.09.18.06.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:15:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] powerpc/smp: Add check for kcalloc() in parse_thread_groups()
Date: Thu, 18 Sep 2025 21:15:13 +0800
Message-ID: <20250918131513.3557422-1-lgs201920130244@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

As kcalloc() may fail, check its return value to avoid a NULL pointer
dereference when passing it to of_property_read_u32_array().

Fixes: 790a1662d3a26 ("powerpc/smp: Parse ibm,thread-groups with multiple properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 arch/powerpc/kernel/smp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..fa0cd3f7a93c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -822,6 +822,10 @@ static int parse_thread_groups(struct device_node *dn,
 
 	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
 	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!thread_group_array) {
+		ret = -ENOMEM;
+		goto out_free;
+	}
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
 					 thread_group_array, count);
 	if (ret)
-- 
2.43.0


