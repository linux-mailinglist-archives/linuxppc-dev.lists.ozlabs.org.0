Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F734E1E20
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Mar 2022 23:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMBmM6tlVz3bWP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:11:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dmjwNLdf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=colin.i.king@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dmjwNLdf; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KLcLW1LmTz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Mar 2022 10:20:34 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id b19so16192683wrh.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 16:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNzk/6MtnNLiXGXvVyfwvCWzIwLhP+ShlErnksixr+U=;
 b=dmjwNLdfWyGLpa2sWEml7Z1tf4clTCmw86dgqS6Jyv6F8s/sBa76xZbWybDeegDi9B
 3kIa5lk/GoeKK6of4yefI9yGRdGGSwI3CzX9CITLq3pnYdJnFcrfumFT0lz0BDWdD/Z0
 wpEc5p6JLaAmEghNpbNjZFrv6xb/4fpMQA19sNjoTfOqXsOyvObCr4cwv3myYQ2F0lvH
 Ml9xVA8oM6TAF7o/vwL4e/Kx3mmDPc/fXdS4sO+Vw4AbcjOLOjNARQoQpZOmTUJ1fjV2
 /CQGquFI2VAArdSLPdNq4lfLpenb8+/IBPUbIKycJaWwzLj1xSIMMfLizENthvVojd/1
 vomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BNzk/6MtnNLiXGXvVyfwvCWzIwLhP+ShlErnksixr+U=;
 b=ndjFWy1gaYskwdDoPhrIDYpDff8OZWPo+5KPmE0bdduXD9YGrVopkxCAeVpWnXNjsO
 +nskVNypyoIxjx5vsx8rG6QvHDmqqagfReDqKeueLnggwiR96flKJKyVbuJafDANJNAF
 g9hzX5EpGgquyNNIJeTjV/KySdUj6N9E3PPL+HjkTqUd4LRQdI8wTDnLd3ZcKAx3vAfL
 0r2YiZ21AAQhZ3ipJkQOmycv3WoUHcwU7eNOQ8lJlxyEQYQO/VsdkD9tONAdfTgOo7Dv
 JGu5vV62n4mL0aZtWvjkRSipsc70+6iSEM2gGFzQaBNYtuIJJP2WXC3HTtGK/pX3R4Zj
 AvmA==
X-Gm-Message-State: AOAM530uAM5/9poVuIhog6DzUNgY5DLvZVPAgi6MfYYS4aeXhFMjoKWa
 CZMpewmIFNnucZABAw3VZDg=
X-Google-Smtp-Source: ABdhPJxtvsnHmneE09xrDF3eTfL4lgsytbRDwN+qSw8ui0UxseW78A+LmkoR3hGYVO4Qkwd82jfpZQ==
X-Received: by 2002:a5d:6f0d:0:b0:203:dc69:2e69 with SMTP id
 ay13-20020a5d6f0d000000b00203dc692e69mr12471640wrb.533.1647732027022; 
 Sat, 19 Mar 2022 16:20:27 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm9591581wmb.22.2022.03.19.16.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 16:20:26 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/powerpc/pmu: fix spelling mistake "mis-match" ->
 "mismatch"
Date: Sat, 19 Mar 2022 23:20:25 +0000
Message-Id: <20220319232025.22067-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Mar 2022 09:10:59 +1100
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a few spelling mistakes in error messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/powerpc/security/spectre_v2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index d42ca8c676c3..e832605442bb 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -183,7 +183,7 @@ int spectre_v2_test(void)
 		// These should all not affect userspace branch prediction
 		if (miss_percent > 15) {
 			printf("Branch misses > 15%% unexpected in this configuration!\n");
-			printf("Possible mis-match between reported & actual mitigation\n");
+			printf("Possible mismatch between reported & actual mitigation\n");
 			/*
 			 * Such a mismatch may be caused by a guest system
 			 * reporting as vulnerable when the host is mitigated.
@@ -201,14 +201,14 @@ int spectre_v2_test(void)
 		// This seems to affect userspace branch prediction a bit?
 		if (miss_percent > 25) {
 			printf("Branch misses > 25%% unexpected in this configuration!\n");
-			printf("Possible mis-match between reported & actual mitigation\n");
+			printf("Possible mismatch between reported & actual mitigation\n");
 			return 1;
 		}
 		break;
 	case COUNT_CACHE_DISABLED:
 		if (miss_percent < 95) {
 			printf("Branch misses < 20%% unexpected in this configuration!\n");
-			printf("Possible mis-match between reported & actual mitigation\n");
+			printf("Possible mismatch between reported & actual mitigation\n");
 			return 1;
 		}
 		break;
-- 
2.35.1

