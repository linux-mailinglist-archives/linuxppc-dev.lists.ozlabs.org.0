Return-Path: <linuxppc-dev+bounces-11172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E080B2EC21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 05:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6pts5DNTz2xnM;
	Thu, 21 Aug 2025 13:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755747087;
	cv=none; b=diN1IqjRVNTmcRx9ngI2x4froK1kCOP5V1Ty+5Z9M+UsINoU0GdQwGF9u6X2kpEQ07GqHiR1UEZa2xD13OIb+uoa74ZK2hXa0mgeqVI7pPCBe7WkiHEkexs1tL7ivXh7lvR/jusGak2xhM2dtntTGWCk6Cp/biI2LmrxHcw1LXRvKSUUNsStRCkKC18HNw0dIgGibaPcKEteCKcU04DHYmv1MJIHH/4cCpLeq7RzdbLgmdTZ84HQ4SdZwr7vPj+fO3Ocr+k8eNMNzYsNQ37TkpKAjOUnR71SnGqN4VeVUnMT8tQEGY76Y+XE+yrMmCx15nktsrixiv5nw9bEC3dSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755747087; c=relaxed/relaxed;
	bh=icRsK3KTpWigO3BokxIYIH8/TdR1BM20AbZoHc5m7is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3YE8aGl6OIv88Tg+RhQs+Ylo6HrBhutV4wBcVasL5vORPQe3btFtHTz28WqmarANuGmE6rC2UPMcXUATbjJpL97+4aTobQHQtu/rvSnHhSSn++C0FBjFJuSmYM0rRc00y754X+Ao/iUC6VClplLNASBo++nAW61Prq6ShjPMVKuzX7vK4BGAIz2mDnGBCabWO27a3hP4Df7Yl0j9RDhJvQJgB8My6zIKeDUGSBPLU2qGBbL4o4Sr41tN7GvOFilzV1yii1mgsNk0ohdhr7kkoOIhSLPiWTe3l3j7x4nMhaxv9Z381Xgvx/3OjN/7Vg7mXYz/MLSZ6JG1CnsP+2izA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SiN432+T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=albinbabuvarghese20@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SiN432+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=albinbabuvarghese20@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6pl21Fkrz2xQt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 13:31:25 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b1099192b0so10056451cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 20:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755747083; x=1756351883; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=icRsK3KTpWigO3BokxIYIH8/TdR1BM20AbZoHc5m7is=;
        b=SiN432+T1W1R/imtTwgZoi/nGceuVpqba0QWuLces9NcqXMqBTJtfI1pwzXy+IB9EU
         9+5iTPjETdDl2CPh6LkeYB0R7A0PcS03v+ddpIen7ozutZx7qLlvnZ5ppjhJk5Bokyc2
         k84mTqTWtbPHpeIRDuKDjxs04IkDkzjdqn0XRPQsWk87gUxfydoqwkyKNyqYbtAfPfk8
         tZMFBy8zrqjpxNKCrXRNkB/9cCHHeBLPLfjFoVvI/ccRLA3RWci2PzLhiGvxaYjVsRab
         6AZjwB5nRvd11cAbSjSITkOOAZwjy+TIITBbZF+Mh8splG22SAeeoHD5Myic9gNkIosD
         39ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747083; x=1756351883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icRsK3KTpWigO3BokxIYIH8/TdR1BM20AbZoHc5m7is=;
        b=kY+WZ+KjLiQau3iesJMl5Ng7vwnQYwgw8lnstLWIln9j3RtXOU4MZ8h20I8KF5lurs
         fk79bkZ/pC1HysiznYhQfM4UJ5buqnLqp7c+OkEnZRNKs620Rn95m/9FFWcBAds5sj8+
         t6noc3iRS3AXIzr0WP5B3aaoaZxYvdY7Qy9hYc+Fg8g82eGUcZXTtvq0BlFz5Ut/asKG
         WUO6CbTYv60vZTz5Ea79XjVcTYG/MOBw75JkbDFbLlPM8/iSwYqbo4GwifYZ/oHezwfp
         yck5ThuTVy0wex3rTb4PM1QOnzgURUWkmOPxfNe1jrqhjN2dTwLu6GHo4xjCAbYXw4DZ
         HX4w==
X-Gm-Message-State: AOJu0Yyt1IUjbfp0/XiK/8TOUZeCWf1qJiUixJMQ5xQx1SkL9OoGx1Ew
	iwBqO82AUu0DMmnEB0pu2pfx6uaAsCkI1bHKzNv+B1PNfzLhId/gnPzd
X-Gm-Gg: ASbGnct42K5vJ5TQhKFUFy0MY7qTEY0V40mMFDENOxNtX/Mr+XPrXFYf82Fh5cFFlbe
	fgoWuhaIqesYuADE7tA/DYJ2PmiAiu7fwYJZminrwOa6iA8Ki9vY0+M4xnM67KPWMJX//ENYHa7
	jxbf9oD1NMSM2k8eZtbWzyMZcU/KK/1MjBDfHV9HvOgKBMH2bmiGEjZVBOTcl7ddRf/NuMpaFae
	KCsMTGm2VUD0qB+VIlKNhk4MioEIROk7VpjGrv93lyk7RS4ey/2u3DMduhEr6j0YOzySmklpJLc
	WwXykA2bBEqGBM0SaM1HuPhQgMAnDAOCyjumPxK6QE+YK1DDBns+ZirA1Sw3xreK5BYi3u4Q5gc
	UiuOX3R+1E0nK2xNP14dj6nPdsEOGGgCaJxzkwVk9KP1ltqea9QXwHFemnzte+yvg7VSJ6JWSkP
	c=
X-Google-Smtp-Source: AGHT+IH8BDknIEg8aOY7I0VpUcwOlM1TFgwrml5wA9EZ+EVgHVP56EFvVKYngKbQyG8yEXT2lkgb2w==
X-Received: by 2002:a05:622a:28f:b0:4b0:cb1f:e390 with SMTP id d75a77b69052e-4b29fa53d05mr6498871cf.29.1755747082903;
        Wed, 20 Aug 2025 20:31:22 -0700 (PDT)
Received: from fedora (pool-99-240-65-82.cpe.net.cable.rogers.com. [99.240.65.82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b29bf0b493sm11703131cf.48.2025.08.20.20.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:31:22 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Shuah Khan <shuah@kernel.org>,
	Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc/tm: fix typo on a comment
Date: Wed, 20 Aug 2025 23:29:44 -0400
Message-ID: <20250821032950.44054-2-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Fix typo 'sucess' -> 'success' in comment.

Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-tar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-tar.c b/tools/testing/selftests/powerpc/tm/tm-tar.c
index f2a9137f3c1e..ea420caa3961 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tar.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tar.c
@@ -50,7 +50,7 @@ int test_tar(void)
 			"bne	2b;"
 			"tend.;"
 
-			/* Transaction sucess! TAR should be 3 */
+			/* Transaction success! TAR should be 3 */
 			"mfspr  7, %[tar];"
 			"ori	%[res], 7, 4;"  // res = 3|4 = 7
 			"b	4f;"
-- 
2.50.1


