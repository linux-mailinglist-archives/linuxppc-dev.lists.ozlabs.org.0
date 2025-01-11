Return-Path: <linuxppc-dev+bounces-5074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B25A0A122
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 06:49:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVSJz4xttz3cmk;
	Sat, 11 Jan 2025 16:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736574579;
	cv=none; b=RJKljMC7TGRR2S4FX4wpjhDxHcG9KN2LmxwY/Tv3bD+AAx4RTG7tB31AMRdQNAfYytJzox8ETRyHPQ/OX4KqLOzMhkpbej9hvy5h+NY2IVybz0bdxUen1o9pgE7bERO0JOHnoskL3j7ogvp/vhrOeo8E52nAs/eaJBgVYrXCQhGmV7McCKHmWet1TFctTHbTWTLwGioisEOGSBogWKU4JBn4tlr34Eu9eygwYtwzGd2ahVPbEiUCn2ZvO8/1xVJKLgxaH6apFY9+KMkV8P0/HAodPDBvJ+dgmmfB+FhbdtM0q8gvK8zKnB5S/K2dIoyynNqpZ4htTZ8tQ5FgC87wEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736574579; c=relaxed/relaxed;
	bh=hJIM5PjsK5XkECqCUUoGiieCybrsun7CzYeIZbw5syM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AdFmZLMjoyXZwPPO2E5Txts8Trs2w/j+bTEnZ4ch/i+SJSSD5UWdaFXo8XjVqv16FKMcrJ2CVnPb+PMGdYRJE8IGf13eRs3/XdccaghXyr7I4fdKEJYO5dOcW1QaE4O4Jd+WFYfvA92qfZv0DEbsBOQD4mujesKVMoSnDKelhLAY5vsEJk/NeTRUvDwFATlkcVhUd+NsKydljArXJ/PyxmNx8r2cJYWEdpL1Lkhw3OQ4QG+WzhWSwIWXz0MsfQ7AYxCH8U3WR11oC0cVsbwFPxib4tSpp6ZD6jtrUqZPLwotd1ZmWYZiMUomt2gZ+i9CBkSW8ckDQFRgo2G5jdGGiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com; dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=f7HMDgkO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org) smtp.mailfrom=daynix.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=f7HMDgkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=daynix.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=akihiko.odaki@daynix.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVSJy5rTtz3cmK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 16:49:38 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216401de828so45215585ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 21:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736574576; x=1737179376; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJIM5PjsK5XkECqCUUoGiieCybrsun7CzYeIZbw5syM=;
        b=f7HMDgkOo2MIpQzftXbR8FaEecYiIAF+MEVxuigxwwg5Z3sAd+fGPZev8JwGR3Xz2d
         B1c/Sc5pJsNr2F9qI6+b4ZYaWnW3n0mB/Un3kAw3okCSKQM5flqwFDbHafk9IB0pt7s3
         TnecELQyILYlc0QKWefViYVr8jazn33YoVrG9zyjUoyfj2ACzTX6zCcdfONx22Esw5tP
         7C2id+t4v7KibiEAnpT3CZWkL57iRK1ni3qcDH88su7MrMkJmIQoOy7hnUYhpQJUA4Yp
         kaOFiFW1cQ6tZj3c7r3QJvgRF6E4Qj93QlMmYHAKC1Iy1IfVrzHvz9eppOWw1WMp71bQ
         QntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736574576; x=1737179376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJIM5PjsK5XkECqCUUoGiieCybrsun7CzYeIZbw5syM=;
        b=NfhKLxJr8+6lutYkLdTuLwLwIx09FcwntTAHo5/YUBYTMPBuhiwwwkYGT+PTpKJ2kd
         I8HUeKPl0qnEK/1p/98a7DWunAQMQQjatlroI3vJm5djtu3DoDWLsbkV28ekLSuUgrJo
         B8h1KdXGrXzeIzs716KeLJ/7bOEM+Ehm4LdYR3fIxZpbJsyvvHGZKDef6gIGwjIpeY6B
         wuhbi94WAzsw+FaBeX5e1BfW8Mq2u1JRDu08NCBYOm+Be7Oj5dlCTel5M6T9CQQEc3K3
         bsbEMLfBKyJFkrfxi9+9W1nXtIlzdAomXHZf5bnDOa8x1BOUu6Vt4Wf+tgx/TXma664/
         pPSw==
X-Forwarded-Encrypted: i=1; AJvYcCUoTNG8ggazNpnFsdooAlb7eV1DNqv516WMGs976VBbbo79Qvvvr165MBUUKRgrTQNcOF+lVHnBqnfga3c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEn6Q9wvw3nNWSiWimCF0EjR3hObN0s3POcqGdeqpRemyygWsy
	Sb0x7p4DKk78JMQNMIUBzoluAroeajY4F/mEDPcun9leOcBdvLEVfQON7X2Yffs=
X-Gm-Gg: ASbGncuB13irtdaVvVIZuDd/+g5EWmFX7rS/+IawJ/a0e5t3tC8erK4DcwyNd4hQ3WL
	N16MpBiXWrhKN3qsVr0/7PzWaniy+zC5oAz/BvYvJT0+Yq5vjt4D0BNEJOR/ojxyPSQrz0yOMnt
	l6+JucmQDAQFfU04Hg4Sdx5R1YOZi4c/mV1O8JG09ATCgZVQnO3YJmCoF5tRw5A52faurw5+pnn
	5snypzD956nzsBsuZWJwmriaEaDbU6cYh/XIcJ3ypzA6W0UVZqcKyTobvY=
X-Google-Smtp-Source: AGHT+IGdQ/W+GdFqyOEQRaBJtYEIC3d/2Cs4dWBSsnFKDdtRyf3/E/GqQ6RNXv61x1Bb9PKDJOpeZw==
X-Received: by 2002:a17:902:e552:b0:216:2426:7666 with SMTP id d9443c01a7336-21a83f36f14mr210827905ad.12.1736574576473;
        Fri, 10 Jan 2025 21:49:36 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a9f10ddbesm21468195ad.2.2025.01.10.21.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 21:49:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 11 Jan 2025 14:48:49 +0900
Subject: [PATCH v4 6/6] crash: Remove KEXEC_CORE_NOTE_NAME
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
Message-Id: <20250111-elf-v4-6-b3841fa0dcd9@daynix.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
In-Reply-To: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
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


