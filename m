Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A887F96F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:22:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UNREkCU/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPpV0hJpz3wHT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UNREkCU/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPLt1T5Kz3vfN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:42 +1100 (AEDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5a46ec4050eso2762360eaf.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835299; x=1711440099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHV3i4Gba0d6WT/j4EZFJfZJO1H61IDlaezqmWnREy8=;
        b=UNREkCU/v70xrTUa8rIeh0n4wiDI5Itc6UanCFp2KOsohlaiKL7jsHKhJt/hLOZWEO
         NMnYFGIZKQBhreaafxtt6uo/MsTkPRjklIImMqDCr0mX8SnLKVYd41n91Jov1WD2CsxR
         3RVwhoSnhd27SJxpwlVXXQ3GquPNFZtQWA+jZFRMB+YfwGtlo9nCRcuBHaIlRPC0s0Gn
         UkfGgvOoRrGGxXVE9AK55Q69PHOvp2PNuLE5tJyTvwnliwswbnEe4Fr8LKsZs0sXG+uj
         yY5Ee3HjEmxpDlGEkyiyCImZMXa7thgLFv0F9V6v4ubmSLE3WEHASOUs/1sgT9JwWVaK
         AJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835299; x=1711440099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHV3i4Gba0d6WT/j4EZFJfZJO1H61IDlaezqmWnREy8=;
        b=DHRebIK5fq67/VTNhpnl6YzFxGkXe4ArVT4wN7CoKqLvSWn11hRNqhXXrb+YBdk5t5
         7rmEsyek7L7mXyOpYF5FjPSNxpbd/18hR8hZMtzeSuzgPaQIfhTPtocVruyyzHBOQz5w
         jjSO9lf6RS2DnBNaD+paK/LR1UVgzusH73N3iXXTaccM0CCqEohXUYB+LOObfQgXlTPR
         Lr2hHXNUmpcNub9iz2C1GV53gwACwOvfqzTbFAFfw3kFBjaiJUnZRzjKYZltmB0/OwHL
         ZGJAuCRGGfhukP/C/I4L6VOvYqZZkGTayoEkkQBkLAUT8Sj5/gE6y5FPqMvzUCOrwi0i
         Vvsw==
X-Forwarded-Encrypted: i=1; AJvYcCWthuh6lY1JGvl7lP7dURo6mmp4be31S8f3nohwuyGgSG3lEh+HeD+Ap7yzURJHi+L0+0kfSwDYuRm/vtm6VlKhkxBY2S7v9YFTx6wlMQ==
X-Gm-Message-State: AOJu0Yxg7ijdLD8owWaNjZj1r3jB/nqOxW3Wx6IFW52B0uln5DwOh/eg
	AoMx1nzlLVMx5Fu2tc4QRduGp9V90a2Zw6/o+sinrL89CJwBtGcO
X-Google-Smtp-Source: AGHT+IEXs0E8Qb6RA4bkQO4VYmb+dtVmkchk4sJqMglG8DUv1dLfuBOTpKPRWovT8+dXEQ7h57Mfvw==
X-Received: by 2002:a05:6358:56a2:b0:17e:9ca7:c3a2 with SMTP id o34-20020a05635856a200b0017e9ca7c3a2mr12938120rwf.21.1710835299085;
        Tue, 19 Mar 2024 01:01:39 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:01:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 30/35] powerpc: Add sieve.c common test
Date: Tue, 19 Mar 2024 17:59:21 +1000
Message-ID: <20240319075926.2422707-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that sieve copes with lack of MMU support, it can be run by
powerpc.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common | 1 +
 powerpc/sieve.c         | 1 +
 powerpc/unittests.cfg   | 3 +++
 3 files changed, 5 insertions(+)
 create mode 120000 powerpc/sieve.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 5871da47a..410a675d9 100644
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
index 0be787f67..351da46a6 100644
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
2.42.0

