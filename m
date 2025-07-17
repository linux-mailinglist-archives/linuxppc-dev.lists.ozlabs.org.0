Return-Path: <linuxppc-dev+bounces-10294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4C6B08F48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyk0rxkz30WF;
	Fri, 18 Jul 2025 00:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762478;
	cv=none; b=Fwc/QXR2evxztL0GxV1+uL2y5uaLGLg3mpAXPGTjFL5j9BC2nJfAxRA/Z4Dou0r/aSXF4fi0orryTYV1hKTQc9CP5fwltgIizfkMI32CWWwZEQ42DaPHD2ETrm/sqT4I4kdAcVS2Bgd/EjraRZv0uSGf38QPGgdnj8QdiK/E5LAbE0aLJm8vFDU211bNHf983DoygTsxlLbIC5G7MHDdRDxf6xbRQt2I+bcB7sKvJu78cHKMPxwatQ4kOAr+eLxpFdhVfkRVSwRMbK/PhW0oSqLOy2r9fo6C5pkMcEKrqC+xsWBvU1uVSdomDftCF2nen4R1LGjs1lb1vMipMeoAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762478; c=relaxed/relaxed;
	bh=Bku05+DNIlaPeHqRJ4y/c3E9v08tlUqoZ6kZCd1AC2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpnF+vI10GGgPClOHPSw50X3kHVig4DfLFmEStpd67OBCU3n0trC5OavomDRnAAeS/DAWRfI/gh+oVJCeAA59XwZhxjb/QFll17CjB+MPvmyb9zYOakVe0obHTlyhH13PuVt1A46eHnic2xxLKUO3O84WXmpohmjc6hDz3FV49LlGB9ocByIjQ9LYxpb5gkQBCXyRTEiqsQa4qswRXhHVph3Us0dCx8u4T5IFPttC+c0rJnKa5EZg+Jrskaw+tLVYIVTFLHTGO2C0jxIYvBAt9UCX+OMwG6T8ZFzd+acD9cza8rJTiO9x7fvCE8btfazU52yqyIgsax+wf+irC/PNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CxcCZDDu; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CxcCZDDu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyj1Rbwz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:27:57 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55628eaec6cso934623e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762474; x=1753367274; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bku05+DNIlaPeHqRJ4y/c3E9v08tlUqoZ6kZCd1AC2c=;
        b=CxcCZDDuemUxxi07VbGn7mzEVA89YTeT1JGvl8S5gTq5h7QYVQCmexwZAzgN4m3TFS
         M8uhggJu5PmtDhHp1OTgd46Ks56mHjl1ZVsnPDO42PG3y2+n9dX0mYcUkX/AxtRQflQx
         oTSVp21QGX4DI+AxSDwl2hMidOsYwJGixMLYEFef9rCDZ1OgLyviizDRIKIf3XqUrBnB
         pzc8HmDYSTuHcbkX5E17BbFMJtxqlHHV/QWV27Hjv6+kHlOpyElGPhHz6/b2jXiPYT8c
         Fe2TxbqMLRFMz3R7IKLoUug/LrWMaIiQfz2QGHUNAx6OL5OYIXq/X1zE2oTV6ma6XybZ
         WQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762474; x=1753367274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bku05+DNIlaPeHqRJ4y/c3E9v08tlUqoZ6kZCd1AC2c=;
        b=Fpovuronp72UFTYi/XyicKCzyoFMSoyMapc8QyeQnGiZGqn33Xj8hVmsd3VC2TGny/
         kYs9mC/qrMk0YqAajt09l83Kg7wQCTPsnEv8udd6ig+mIyoq/qi2BKCzvZxGkakH/jv5
         KW2+1Wa9hmnFWVpVqjMDTjnUoMIY5etFSd6psmLknoFIbVhYwFzFVA+COWYd0YUaxC2Q
         6ZMI/kLbmHLSMIF/Q2ghYpUUM+TKw+9g8FWk2FLcLNbLjKJ5/dKHxu2yCkPhmbh5q89d
         RRCg78/+FKM0OwtFG7lhpfWqMS++PWcNLVtORPUAvpnaD1tI0EV9yZzw2Ex4zgoBy8Qm
         SNYw==
X-Forwarded-Encrypted: i=1; AJvYcCWMR2dBUc9G98pTfDGB5xZ/UBv9euV0Up1o0Tr6KeVrnkwEiIPZ7xKNGOYNwc7DqB30exTRp2l56z4TMwg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAMh5FDKV2vWV2tFbQB6grJHYjNqXU2U6SUdYfuOk+gFL5SfVZ
	w86zyDWsT0hlpMj3WsicFoZUcB0QteZ1AsbVy19+otjbqYsXixQOLC+q
X-Gm-Gg: ASbGncuQGKH1OlUOlxMcfbqn7JcSKslSuKQeSB/fGLM4AGqkwVTvIAqtR7VOLWHU5jR
	XtpYYMbR67PpdSd9M/B6PXFAvMfr+31JqZAhFOj1EDEA2QwTHT++Dsb2RSVyDEKIr1bYNQInPkX
	LP2LBnoBuA1+rhThtIm5v35S2803Ki0bYmkOdg+dsyf6Mdp0Les7NpAI5JFDh69Hxgt5kMv9xLK
	B0Bas/gCH5QAVUeEGBna4EflX6UMUDx4Vu+pXjGhD0TlefEO+CcnaF/CIrWrQ33C3vtJkGng4aS
	6MHLtXhaw0RXpEOxZJOCWgt3cnFDBFoF3j0SSArN9+tdqxKt134wDS7Vijb02+MK2Md1ROCsCry
	174TZnzwMnBjLyvAw8tuDFw5GTA9zoK0tw34B9tSBEAvG5UVttsbBDf+RjDyc2dOR1wNo/YtboV
	nyqiY=
X-Google-Smtp-Source: AGHT+IG3RRCZYJkrl0IFxNTcXHaC63cFJOMHtvbXLWcJf3SefCDeVNa3EwWa0HZJEZD2h7TP1+bY7g==
X-Received: by 2002:a05:6512:1452:20b0:553:af30:1e8b with SMTP id 2adb3069b0e04-55a233affa7mr1874039e87.38.1752762473999;
        Thu, 17 Jul 2025 07:27:53 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:53 -0700 (PDT)
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
Subject: [PATCH v3 04/12] kasan/arm64: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:24 +0500
Message-Id: <20250717142732.292822-5-snovitoll@gmail.com>
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

Call kasan_init_generic() which handles Generic KASAN initialization.
Since arm64 doesn't select ARCH_DEFER_KASAN, this will be a no-op for
the runtime flag but will print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
-- 
2.34.1


