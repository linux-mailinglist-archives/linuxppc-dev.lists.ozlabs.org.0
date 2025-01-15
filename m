Return-Path: <linuxppc-dev+bounces-5281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2FA11943
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:49:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw6m0k2kz3bZK;
	Wed, 15 Jan 2025 16:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736920160;
	cv=none; b=ECM5PGBHEBhPsVAzAYtUnyTo4Rhl1H0oRf68QfxfBbwTq6u5PjD3AQh8wlUxeRq1ODo3N3z0FViUqgS0TFk2v4R/ynHxlrCpP6pUfeRLOKlxEFIGWf/GVCvDoRK7JDrRd6a5owNo6P1WczPZvVug3yxi/05wMlR15zMav6zIXG+lpeRsYjLOSpr2ujvlPSDqqMIpi2h6Hjo2tzRVH6zjxanO6d50PigPOnzZ1xR/IT5fqSzumYM8ZIswG1+qhoFcEgj36CsUpIAgYFkSJR/pRnVLl6YkxsOUoWlwmTjSq+cGg7nNm8przprW+OW9AVaRFlJzuQ8JRDHKuYtqaQeBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736920160; c=relaxed/relaxed;
	bh=88SqYtXaTV08jsATT/J9IavghVGb0T0MbX3fafAbdCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtIW31fquwqv9kvAvxmtJqP3Nvm11yzrqsctEaNSCzAhuUv9OmhAPgSiZMfrnq+88bsg3nbyevWuxa54yNzoN6/bWuhDZ9IHGwfh9dWCG1w2xKHKV6UGwsGjvsK1KylkhYyBSP4r758yL6UUKE8HJJ2/xVHXmpbFb0O6N7V7O1xQVEBMbcD3qdvx2GCd62aAM3oqeOmhJ1U+XCEm+iSoHAVosCTlP8TQ1qxr3rPpMuEplzetfOO/zSbWkZ1uZG3dfX2MlZ7gp0lvNcGC3Gun21F9CvomjqAmKiP+1krBK1z3pF8+u5xle5WPi9J7LKanocQ76fMFZSOXugu9wujI3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eAabWY7x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eAabWY7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw6l2rn5z3bVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:49:19 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21636268e43so148572935ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736920157; x=1737524957; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88SqYtXaTV08jsATT/J9IavghVGb0T0MbX3fafAbdCI=;
        b=eAabWY7xjIId+KOiYIieAgEFQLRkkG5H6H+9Mfyvf/uGTqOjjFpAILBubp9AwOGG6x
         esHNq4BvIFIZX3H18nkiyN0Pnrwvuv5KkfUBZ7MX9+tW3Ig2u4goCHHmCqtP0r1EcBJ7
         BO1DdmxbTTr9SFTxWTNnbNsGmFnzCHe6XJW09fs6m1OCTKmmu/8fVkqD1Aiune3zaGWq
         upgmwgcbnC0bql6BvTJfQuJnvr5FlntKl0Bh/pM6RG3HO8qSi1oPxHdlk9v0fJYUYbR0
         BDiNGTosaTJeLjw4xl4Dae+tqicMbIgWI9OAYP182FdGGZYZUlEaHzi1S0FYeUQyGbKC
         qDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736920157; x=1737524957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88SqYtXaTV08jsATT/J9IavghVGb0T0MbX3fafAbdCI=;
        b=tGX2DIfFY34+YJTRDihv/z7QsBgJ0YNjSfOvTWFeG0HDmVDlLbvhc7SoGSIGFwrZUT
         wwASW2cUYyGeOLm8b5ZqftO6rNolvZDQASdKqIdtEgFiypSJPxXT/ufYyytf3CSaKU7S
         9o2hncM81LkKldvtZtGTwtrKckkH/SyDjZctYstryYLfiGDSOKCdWvpg/ghf7ww1r2bW
         4kpT+yzfVxkTAwnjH0lI65/zgedvzeUOU5vR2VZz8oDSNxdA79LIqOysT2KP5zkr1ANX
         mOTWucPQ0XCwl+MijVRBUa91uAiNsVG7fE5AfF007tXM90jj4r/1KnrLJA+dFwTJLK7T
         eh+w==
X-Forwarded-Encrypted: i=1; AJvYcCXTggC6TxCdZ/7W9+zElo8SCeMU0jHpSlokll5f3deyfQnKb6icMIZXJAafowlDS4SOPgDUahwsnw7JObk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzARUMhyS9fXn5kG32WMxQSM6k14cYfaEJpYKD1TxNpZJ5KZ7dy
	uaZ4gxmmPx7onKAohrOXXsgo94EgRf74QALtUB4yCGCDLpTL3gRqICNpvbkcVCE=
X-Gm-Gg: ASbGnctQ6hh05HbhzF7lZqFk96GiMRLS/PgYQj3Q+gbkTKJlSlStEFcg5CsD27sIZB2
	QSU0YLzhcJlzQbMsWPlVv3RsIR8Wmx9OUmnXBORIoFHFqwqpOtYTveVKzcHYPQZXCAgnPz7tcep
	1pe2TPYMXQ2rNZI2BwiUe+AiNpE6KAjycTFIOxKR/UVCZmfOh/s1f1iGVjWzCgPwJWfoyc/7kVc
	kHp8YxLMj6H9cTV6zl5cGGUyoj4u8SfroyGpOz239REKYym7KeRrx6nuKM=
X-Google-Smtp-Source: AGHT+IE7CP/5jGWZAR0IrIqQIqvoQb7g5wi9hxFsU0CFVXu0dR68h2h3F8IAezzLwnE0Rlv/Ybh8/Q==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21a840109d2mr433462125ad.48.1736920157113;
        Tue, 14 Jan 2025 21:49:17 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f22e591sm76124125ad.180.2025.01.14.21.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 21:49:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 15 Jan 2025 14:48:03 +0900
Subject: [PATCH v5 6/6] crash: Remove KEXEC_CORE_NOTE_NAME
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-elf-v5-6-0f9e55bbb2fc@daynix.com>
References: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
In-Reply-To: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
To: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Dave Martin <Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
 LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

KEXEC_CORE_NOTE_NAME is no longer used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Dave Martin <Dave.Martin@arm.com>
---
 include/linux/kexec.h       | 2 --
 include/linux/vmcore_info.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..c840431eadda 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -68,8 +68,6 @@ extern note_buf_t __percpu *crash_notes;
 #define KEXEC_CRASH_MEM_ALIGN PAGE_SIZE
 #endif
 
-#define KEXEC_CORE_NOTE_NAME	CRASH_CORE_NOTE_NAME
-
 /*
  * This structure is used to hold the arguments that are used when loading
  * kernel binaries.
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 1672801fd98c..37e003ae5262 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -6,7 +6,6 @@
 #include <linux/elfcore.h>
 #include <linux/elf.h>
 
-#define CRASH_CORE_NOTE_NAME	   "CORE"
 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
 #define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
 #define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)

-- 
2.47.1


