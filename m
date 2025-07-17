Return-Path: <linuxppc-dev+bounces-10296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E535B08F4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZys0vQgz3bpP;
	Fri, 18 Jul 2025 00:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762485;
	cv=none; b=BPoZ3FeuBwfHhooRzK6K0BlO/AxE7o3ltapjB444QYns80Ny9z8xth97MOpW1zMnlZuz49JT2EOP0a8uYfiNtbVeOo8Svu/dlJQLu1i9UgNldroc6MgikJ/YZj6PctQ1psmtCuR8kr17+SAMZdhRRVmM3Y+XBKByB/UCFhzba/gQG4zFXV6Fbnb0TND/gAUcNQBUsVmOdXoLFzAa3MlCL8N3cJnQTidPDc2lnankeCb0wkdhoOVPdzJ4RFnR/DgMy3JPGEIsTo1uFxfqGsAIWNcWbF9WY1NegCdwISS6dLQA72OsR3sFgrW3Lgh41eqeU+Hkr824FsrX77lL/3girg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762485; c=relaxed/relaxed;
	bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gXIElwGSDxr4AIK77Acgb1G6GlYNsg8AQmINGQ1tv5bbx4FtmelrpdVCCNXQpFh6VGDGqLS7PVyRZq2qv848WWR3YW92YX1mFR6NxnTBvgNAPTedS91+Qd/8GVVpvKrvLBGD6CoSqumj23lWSY9SXNpHPGUateQ4xswLh3arE4XEzYqdkbbSmWKRNOjgQ6924boeSiHc0z+JSY51iJjoSO6Tgq8/KTWo5GlMA2ASAYpGWCnm5JGIgGmqqvFoQgT6/acWzz7kJOhBx9jJbaZbCKZnyaZkmiJug+BJwOoUpX07goSGxJlzE6+WZUiHmtT4+Fo9F4OymmGmwAdoYI1a1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BMHRJ0RO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BMHRJ0RO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyr0qlTz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:04 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553d771435fso1179269e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762481; x=1753367281; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=BMHRJ0ROZUJNczq1Pa3IEYPsKJ5cxHPYmj+3iCw6g7qy+fdqA41wi0LE0yycuHg2++
         GMmuyguaIdKW6Ysd+AeGjRiB8U3axIoP2IjaqhkcvJSZuSA1Ktx2hyAJZxQi5LHKV77B
         MxSndCxN77aSNnI8GGPCX3IF540EYtQouddFLe0UsRqqlRM7Gd0cp3WsdoXQ3vyONxmm
         r17QPKL5aukMtV7j5ZqX+kdyslErOfL2AWDobcQynzUNa3MB/i7d/yFmVnQ80a+kIaZt
         vVDoyK/KBSuRZ96DOA8x58R4gcaQItizH8VN3JrnB//DHEH4jWPUvapmk3Bpo+f/E8Ki
         vxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762481; x=1753367281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fypRqRD7duJ7p6/XnMiehAY4t+I2qqoeS7XCKLtEaPI=;
        b=DqoyoDyQHVUKnvAwIIWvY1FDbO/5PH1EhLHw0/lc9Jj4HH6h5JTQcyyWRPDOUci9xf
         3UJP4ACEDJUYFOMFQKWwaCD8yxKbQA1BDAUhgf86JlNoP4cS5BQV47eze/LeKVZCMc75
         ag+s7cAnKsA1U5JbRBj5XfaXd/DcwekyFvR+uPuOkGXExlNTPGVQsNgqcTnOP8+trFDe
         zV255s6YX/JIuKZQiCU163ZsfJgQiKvXMnDXEKQ8ZTjnKbwKP0RNTjXbFooneiX2QD58
         squZG7fd+IUbjxVe4QPTJWgl0Lb/fdhT0/9GT5xQEBZwjgo6hRVlYWWLeV0rf/u8C/lY
         gsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf4bYu4VAh+A2FIHUXz3SH3M+m8VEX4gzLyUFONIqsPf4MwkItaSDxoDeJYOQcvfzMkrrMnxnNqnG6WIQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywg748U73TjMfRYiLfMwuxEHlFgBaciqVNNqzzqBjf3pvGM5Egw
	98sFaGZqZnjzmb1l5qVsU2BoMrCyJ6O+9ZNiclrXuq6dpOrxy+ho54Cd
X-Gm-Gg: ASbGncvj44idEQ6SBq1cB+NRpt7X699NNy7hk/O7anLUe7Bx7vB2otmlUw8/CgGJoBP
	SzLcDgp0wBFaShz/H6X7PwDPr5hbY0Yne8VHJhwzEb+7c+8UZNG/uCjxO3YWDHDPo9VClZLLzEa
	ZxXpVDOZfG3ZUfLerHbrAfIR7RyUsNKJGCv7T8sCZ1dd4SDT5KIMPTEuoBscBI9nheTnkaqcK/5
	ok53AVktf5isDOcsm6hxcizOawfDXkTrU8eHWtWnvxJ9hguJPvlZ5WeeOYmine5IsEILA6WNwDt
	Mlwc44gxdJqu/13SWTZ3gLKUgxLwRyk4FMp7CG4LdSfGaH83PQ5QeqSAbEHB61uqRwI2Xw6rPnj
	9xqGeThLRyrQRjio9wGdpKgLh6n+kOqf3ENE5GbtjSOHBXe65Pojc4EpBXerc4Bbw7UxE
X-Google-Smtp-Source: AGHT+IFLVShq7sQke2+sS90z+vGxECzG8DIPcMIPlB0XqE9wZj6ZkLlHMF4FaDTA86AkwLv8/0lA9Q==
X-Received: by 2002:a05:6512:63c4:10b0:553:ae47:685f with SMTP id 2adb3069b0e04-55a233b1914mr1997025e87.38.1752762480616;
        Thu, 17 Jul 2025 07:28:00 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:59 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 06/12] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:26 +0500
Message-Id: <20250717142732.292822-7-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since xtensa doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op.

Note that arch/xtensa still uses "current" instead of "init_task" pointer
in `current->kasan_depth = 0;` to enable error messages. This is left
unchanged as it cannot be tested.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/xtensa/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1


