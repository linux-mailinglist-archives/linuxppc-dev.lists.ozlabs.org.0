Return-Path: <linuxppc-dev+bounces-11741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F5B43DCE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 15:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHgv23N9pz2xlM;
	Thu,  4 Sep 2025 23:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756989867;
	cv=none; b=GCeyiMBjjrzea3LDKdggj8gfIfMRalLD7/LPpXxROopM7d0s/sSQtiNfld34WQjkGGYWJS/sZg0EMzFHpx72JptfU0bs/V5B7m2XxW/tVYBDYDI8CnIMdFXaCbeRhndMXoAlr+YDdgzNOAmeUbxuSpFyRI7jhRoaP1TUDgfoWAJXI8Qyf+nvDrg+vLcCFZSl84Lu8r6hmk57MFivAEoG9NFnEsTbfOMaQjD1x84pkdj8D2/Um0mHtFZRworHreJ8259bL6/6Kr8mHAx1qmQ3i3cPpJcEE+M2v/gyfBfBBrDQ0MlYlSnEIqJ+GEYHKdxCcp/Ry8gvA8vEjzdCiXfWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756989867; c=relaxed/relaxed;
	bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UljFaWGYNwso7H/VffzAo2ErlLaEcF6gcx3S5ZNykwkf040hdS8h1h0gx8MvLd0c0OkWK+vzunIF31LCix12VAWBjFOW9KHGna/nmHf667meExnuuRawSLErGGG9MeTfqmpyViS3ArD+56D7OOWeFliohkmwW+Yd6xLVjSFBF8qHy184L85LAPURqQ0T3cIwF9J1yK/BXfnrjrZcdNNrGlW+Va+80SKUPsb5gHts2Om0py8JyxtHNRZTy7NlfLpGAH1oP9TmCYctclAcV3puodoWoAhfSeeRAg2/89C1bcwdSCgoxMkvN/9YrfojqMYRzGmG1YChtdMP57BKcy+6Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KB3GBYRf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=krishnagopi487@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KB3GBYRf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=krishnagopi487@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHfLf1Crxz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 22:44:25 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7723cf6e4b6so841674b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Sep 2025 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756989863; x=1757594663; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=KB3GBYRf7DWxtl8VUlImVgj5ddf71/OXUviqjDs05mH/uXajFRZPQR6qqezVbmDN8Q
         qosb2QugdwEvB8pLxp0Fi3Hp8Ug5R7+yn8zAlC/3KhHIAHOn5LT3pEUi37bBbwZdWRtg
         U+ZZxNfAHbyImKsp1N4u9AS6sH3DiB+sxv+ANEwpGe9RnXGWQLBmg4+zHXtg+zhoKRyU
         0qBVrqIPeozKnOgTNm7LhFvlt9Oo79hH+jXTcR3Lbgjcns6uNblfrYTtqEpPuEBmPmxr
         zmY9o9DZU6Tu8WGGM+jiKAKpY1aXQqijl7RdDBFCSC9OqkY0GQ5wxHbzyiVdB9k9Z9H8
         7puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756989863; x=1757594663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4TpF34W3PHvsBrekGwm1rvuPQAafzFCgW5mxOcoS+s=;
        b=att6ewTO13cClDUnMlQRRbRuaq9VSGV7lVfG0GgcrxNeg5t+FIbx76V8wRk/9bhNaN
         KcX0+mug+Od7FLcozPU+9PH9NMqqIbGOev4w4RhnJIdJu4Z1lvTDDR8NkpBc89RhfaW2
         kP+6JCyHOw5KWNQC7tnJKED73NJ1lRde5S3vwIRZ+/PIlvLLg4RdQCgi3jJgMn/it6N+
         UrV7g9l0rjYFNl6nc9Vp4VZUUIC3hrpupF6IDuWCXUO1VQMrR/vNESJYOEdqrdl6riiR
         isbpY6+k27nEPbxKpwzfYvHhJNnuVfNqAdUPgpG08TpbpSYinz/JyNjSfHvc6qv9nghO
         XCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFMzf1cly6aIvYDUg+SyyiBDM5+dSV6Nr9eygLZ2CFyo2Kh2qLgBkf42Aq/A0+8lVEiwK/EHwtS3pN26Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEwNdCrrULgL4BV/fFr4RruJ0tOnp65mGe1s53wJJnYp2TxRzn
	i7zLH0NBo02ggWWaOD1Lk50EbphkFAaD454pxePDqzkgxVVvHgDUXxbS
X-Gm-Gg: ASbGncs68c8XNqS6zerTXVfaNGUuag31gqKwZxh70tqNz8evVkABQN7dxpA5ZY6x9A9
	G8A/Wvu7sRad4JMF3lufoYgu3RTtF+3hqchCAPPiLvucM8T3WMTTQa3yhaT1qv2sMEwWZY7rR0G
	C7NV0ZWCR5CAo/jfalt3KD5a//wtMUuCTb9JjlDy+G2Z7Cfigl9Y6PYWtDMUbKbeEpBH/clD3CR
	I8Zq8WQeliyfNJ6a021NEQDJ25PS6haCuj+08tHxl0Px8Hg+W5sCmvtzcEIEFIJhH3gbTWbe4Cu
	2CRfy6+GylRPgXhHfzrxc5qyWQEsoMZFPzdypWJ0jXpKnCK8NDNrVt6x9EjRwERwjj5eZqf4hPQ
	Pzfiut+OSx8sMUZY0jXI8HN5kCB31JDtspSkSKjOxI/8=
X-Google-Smtp-Source: AGHT+IG6ptwhAi2WTl+f7P5ZxhCvDz0tuMXhkbgEzCii/VqANS73LGKBj4D0rLB4cKm9/rE75RrMQg==
X-Received: by 2002:a05:6a21:7988:b0:243:f86b:3856 with SMTP id adf61e73a8af0-243f87ac36bmr15437336637.38.1756989862589;
        Thu, 04 Sep 2025 05:44:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f9c35f391sm5854642a12.25.2025.09.04.05.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:44:22 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: maddy@linux.ibm.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	shuah@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: [PATCH] selftests/powerpc/pmu/: Add check_extended_reg_test to .gitignore
Date: Thu,  4 Sep 2025 18:14:01 +0530
Message-ID: <20250904124404.4425-1-krishnagopi487@gmail.com>
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
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add the check_extended_reg_test binary to .gitignore to avoid accidentally
staging the build artifact.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
index f93b4c7c3a8a..ea29228334e8 100644
--- a/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore
@@ -1,5 +1,6 @@
 bhrb_filter_map_test
 bhrb_no_crash_wo_pmu_test
+check_extended_reg_test
 intr_regs_no_crash_wo_pmu_test
 mmcr0_cc56run_test
 mmcr0_exceptionbits_test
-- 
2.43.0


