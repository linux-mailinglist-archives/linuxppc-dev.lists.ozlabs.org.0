Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF48146D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 12:25:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lvStG1Hp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss6ND6CfZz3dS8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 22:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lvStG1Hp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss6MN27Jbz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 22:25:02 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3364a657564so501054f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702639498; x=1703244298; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=78QwY/yXp7SyEhpI3hXVRE/tZyrcCs2zsxYlhvSEhSw=;
        b=lvStG1HpL7Y59i9WqYYu6gMOMqajgWajoogwOaT0ePHK18Da6VZyqZnK9tNZMX6y9g
         pcJOucDaIxUa5fL8dbJw6IAgeGEoHnlncGxa9+KrnoRBBXd2GtH4BgQUdQJ4Vtn0Cdls
         RB6nrzTzsOUIqMEcqX3s2vbqjSbT26uZpvfNVRS9yksM3Bc7FtBNjZ67NJxB/5kgXHjH
         NyZHZN/sKiPeqPvvI50XZkVM+Jrny8M2Jji4xf6UxoKmJHXS5TpKlfInUytloN+J9jFh
         IHqck2sZ+36M7lzqpQCaRbUI+SUr+Vy7hHew63yVyIjVa2AEbSCW60KnDEiHDy5rsIdH
         nGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639498; x=1703244298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78QwY/yXp7SyEhpI3hXVRE/tZyrcCs2zsxYlhvSEhSw=;
        b=JzGIZAeZ/uZcPq5T7DzD4XzMii9MnKdNof2BognoY+axhnRTa1/XeG+d4iGHVRCZSi
         ACt1L1H6kPBotg3QlQz+rFx8hKz/40DU807aWPYuHiEWvyd8UrGo30PNx7foF0KDYwVJ
         1yCyJrD5hrDa7rD+SIqHCvbV4CwAuf32zR/TmpOz/c0cUFjL9K3Hkl0NphlWDpwci5I8
         JzRWrbljJfXJybESB/u7CIil/hLi5TjLC9u4PNsSsHGgBZS0XPU83zMQelPwPEklgMeJ
         GCjbco/KdDREQZH5Gql3UQ+kAf66PDrKsf/6nFY+iH0Z/igI1WtMi3TPKG0LelcWK+j3
         w1xQ==
X-Gm-Message-State: AOJu0Yz1e5D99jP+9wrj95YSRFkO+hCmbnlo0jmJiNupWnGxSd+H5vyo
	25cdwo4CztZMfoYZAdrBAYk=
X-Google-Smtp-Source: AGHT+IHbvlF50uwy5uxAGyjsXMY3E1oRBF1pOxK0P3BvjONqgzkK+7agL/9FjbSYjrZbPUgvJTYAew==
X-Received: by 2002:adf:ed49:0:b0:336:4350:e2fb with SMTP id u9-20020adfed49000000b003364350e2fbmr2275153wro.76.1702639498352;
        Fri, 15 Dec 2023 03:24:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id df5-20020a5d5b85000000b003364a0e6983sm3668181wrb.62.2023.12.15.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 03:24:57 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH][next] powerpc/selftests: Fix spelling mistake "EACCESS" -> "EACCES"
Date: Fri, 15 Dec 2023 11:24:56 +0000
Message-Id: <20231215112456.13554-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a spelling mistake of the EACCES error name, fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
index d5436de5b8ed..f56c15a11e2f 100644
--- a/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
+++ b/tools/testing/selftests/powerpc/papr_sysparm/papr_sysparm.c
@@ -177,7 +177,7 @@ static const struct sysparm_test sysparm_tests[] = {
 	},
 	{
 		.function = set_with_ro_fd,
-		.description = "PAPR_IOC_SYSPARM_SET returns EACCESS on read-only fd",
+		.description = "PAPR_IOC_SYSPARM_SET returns EACCES on read-only fd",
 	},
 };
 
-- 
2.39.2

