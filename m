Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481E8BBB8F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:47:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WtAnBB0k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnWm11jFz78CW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WtAnBB0k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7p6nsWz30Tw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:30 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-61c4ebd0c99so320313a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825829; x=1715430629; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NGJB2kU/PZBgZRxhGgnfzeZa2zBkfZth+TZPJCBD2U=;
        b=WtAnBB0kiLZuWpP0/8Bin+PipuCch8EzVxneiJPJj7xs8udF/KR1wRzdRT93PtfcjE
         +I0IbcB02XSaSoMVXALTD9V++VNYvt4TbxYCna+YqqImQiE3NF67dIQpgrPa55Z5S8lp
         buy1ZEeISwHr0d03YPRg1i9+jU4Ci8kEHaDJHazeri7C4DTSnlOKMnOMNEyNGqN5t0Nh
         4cajmpTQeh3TTq/TxHbR4B0PPVrIdwRxQWZ96JSRbI+9I2ToMWUf5Ttni81M7sL8WDg9
         jg0JQF4gDjPqiDl+5qjTa/ZdQSR2Dk755c9tHetLU3dfKHSKMfZvqffrvQJbnxaiUx7E
         KLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825829; x=1715430629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NGJB2kU/PZBgZRxhGgnfzeZa2zBkfZth+TZPJCBD2U=;
        b=RJ6x0pzI8FcDzt/wZKWgT5NmJpwHMaaLXue2BSOMtgnb1qZUpNd2eV4uHU5QmW9bV+
         E3fwYIfT95WDeejWMpvIrXw0UG3YtsUX1ifL39dFG9SgoDKasAh7phEa6NlquTuotrT+
         EW+gKeA/cs/p8WWOYraC9ivzH9zwhbJbwAUircKMdTvpIG9trMUwWiEOFBjUlkW4a6R8
         kZSsE02pOG4QGzvLI+Inoj2ja81HNxl6Sj3eNSV1Zf0kMorr8UBfwPSEQohk3FYnrbYE
         IPStuUG/Y0HXvNYmupOTKiBGEMk6TxmB8g2rFcqBZwST8TtW8tWro9UvD7TIRII0unfg
         aCKg==
X-Forwarded-Encrypted: i=1; AJvYcCVp0vlu8lzJntxOz3sXp9lSUvX+w0YAa4x5vPFr8QtIxTwZHX1PAZmGmyFBopElVCMJ7EYWGduALJAxGYUXY89uwLGMlfUnNVXOCdB40w==
X-Gm-Message-State: AOJu0YxABt4dZNd29F/2pvn5mUFnVxbMOe/adwia/D+vuz3CBQaOawnV
	c9W45awRjcfZknTMM9uLnRrtWCVXv1bNh/1ABXN+cdrfNyAOisFyE4cpAg==
X-Google-Smtp-Source: AGHT+IEoUYJSmTBuUD/jk1CLYptkUeIzK0xq1aBA4WJ3bd83Z7S3fr1cnVqSRKmY/XCfM4wCkaZB+A==
X-Received: by 2002:a05:6a20:3948:b0:1a7:8610:bb62 with SMTP id r8-20020a056a20394800b001a78610bb62mr7155624pzg.51.1714825828863;
        Sat, 04 May 2024 05:30:28 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 25/31] powerpc: Add sieve.c common test
Date: Sat,  4 May 2024 22:28:31 +1000
Message-ID: <20240504122841.1177683-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common | 1 +
 powerpc/sieve.c         | 1 +
 powerpc/unittests.cfg   | 3 +++
 3 files changed, 5 insertions(+)
 create mode 120000 powerpc/sieve.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 7378b1137..b2e89e4fd 100644
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
index 286e11782..c7cda819d 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -120,3 +120,6 @@ file = sprs.elf
 machine = pseries
 extra_params = -append '-w'
 groups = migration
+
+[sieve]
+file = sieve.elf
-- 
2.43.0

