Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21956904AE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:28:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N3bVSnED;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYwz0tZMz3g7H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:28:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N3bVSnED;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYqY5k0Dz3dXM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:23:53 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6c7cdec83so52557275ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169833; x=1718774633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTVzxmkOngiwY2AMcf/1w5MP+3nR1mu8fLqrjh5W7lM=;
        b=N3bVSnEDqKtHy+swb2+WnAQsJ9MW8KXlUxEiQynYwzNkAU6LFv2LKDZjWdxWfeBSjb
         /f32Nsm9cBHba0cRUeK4srhBXTNnH3KogM4/4mftD9Bt+iYeydtORHbkQvLcpeYHKitX
         Rzt3tgY+Ct31XlPGjtHhJpwblwUWtm3H9X138Nr1Stf1H/y2gvPgW9TtbKPVCCudqDVE
         Ay/LqK6Eu/C8pwcFR+rqiGVwMybJSzfNz2gxmTIir41FAlJRaYpBE755g48EjB54kaqZ
         6bVRV6N25T/cjvpudG9z5zop6QmpQ0sTIcp1i5tLt9eKrtGY1VqjrW7hn2b4EQQDT9ma
         CaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169833; x=1718774633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTVzxmkOngiwY2AMcf/1w5MP+3nR1mu8fLqrjh5W7lM=;
        b=Vkyfax/DD5lGecvsqQKKbxnw95PmKWVZfX275ZplCarPp43NqoAMzwRNPiUDmNs07P
         JDfN+wTlUIEVe4E7IREkDHq+gDPTXfMhGHK9CDnwCWS+NBRAYzqA/RRgbBN2GYhCpe7B
         eO//kIcLuE5H0hTOoSuS0KnB3KuNWCLEjpigOyJ/LxXPM6Z/gfAsx9sTKy4y0l3MqIV8
         HhGU3PvhkcSN80IeeQFy5WzUzpmhh5WxSVNFx/vrvLvOxp/o5FmYFUhCcqNM1QEXPs38
         WBsHRjBjT37ZWnngs+7qkNVMok/BA+z9uHpZ3xef60x8RSZkawGB7sAeW6Zps9YvYicx
         pawg==
X-Forwarded-Encrypted: i=1; AJvYcCXwsL3j0wOmkLFmjtKtiw1zugdgYGRoM1P67KB/5pLVxq4RwC1lTeFB4THoyzvA6mjzWIGkn2WJjKo1PEgGXR5Frj7AMxcLfeLb3yZQQA==
X-Gm-Message-State: AOJu0Yx78uCdtZ12J62ce/HLrZaf+mKwApTcysS9sleNdPoij1tif2WD
	uJ2E+a6FBibOlBLQmV7zSi+CspKDln01syhCxZKH3Y8P9U/nrBLZ
X-Google-Smtp-Source: AGHT+IFT4vVNxGrh0/Ssaxl+Nv3a6M4E9eQlhkw95iQGq43XTwW8DEHnaM1OPRJ7I6K4NvAm1pkm3Q==
X-Received: by 2002:a17:902:d2d1:b0:1f7:38c5:1f1a with SMTP id d9443c01a7336-1f83b565bc2mr9422475ad.11.1718169832831;
        Tue, 11 Jun 2024 22:23:52 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:23:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 06/15] powerpc: Add sieve.c common test
Date: Wed, 12 Jun 2024 15:23:11 +1000
Message-ID: <20240612052322.218726-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that sieve copes with lack of MMU support, it can be run by
powerpc.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common | 1 +
 powerpc/sieve.c         | 1 +
 powerpc/unittests.cfg   | 3 +++
 3 files changed, 5 insertions(+)
 create mode 120000 powerpc/sieve.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index d8db19580..900b1f00b 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -8,6 +8,7 @@ tests-common = \
 	$(TEST_DIR)/selftest.elf \
 	$(TEST_DIR)/selftest-migration.elf \
 	$(TEST_DIR)/memory-verify.elf \
+	$(TEST_DIR)/sieve.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/sieve.c b/powerpc/sieve.c
new file mode 120000
index 000000000..fe299f309
--- /dev/null
+++ b/powerpc/sieve.c
@@ -0,0 +1 @@
+../common/sieve.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 9af88d2ae..149f963f3 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -121,3 +121,6 @@ file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
 groups = migration
+
+[sieve]
+file = sieve.elf
-- 
2.45.1

