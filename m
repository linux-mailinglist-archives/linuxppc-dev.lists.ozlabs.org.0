Return-Path: <linuxppc-dev+bounces-6933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62449A5DEFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 15:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCY3J1MLVz3btk;
	Thu, 13 Mar 2025 01:31:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741789884;
	cv=none; b=EgDqsleqCX4WkofqOAKLXM5AMlDgiCkK457q1N0nDm6QRHWnRSBijL+BHIYgus+AiD7Pad2Y4zjW3Fs/d4X8fTYh5MvhiQayXBzfQRIUzoP7YxCN/L5AV2ClUe4h/pOlaslXMTrPVq6eBFGGlPevFX6kDbFSB7MY6NlojSBcwpbxD0fSis8uniZ0MyupgDY+ELJopH7yDbGonwfGfmqyeiy5N22OVl5tGyOiSsYEZJ4Qjn8ILv2mWQBVIzIU1vqIuritHV42TY+lRdERbRCpzZC1vpoySNWOQ92GAsafZD6jS9YxszhcvUdZW6zex47rW5bH3+eEMA53iFu/03pxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741789884; c=relaxed/relaxed;
	bh=7wHVeTdcbD/lMPZ+7RVnSVzW4Yy+8n9avYr5uzJiRKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QHN1AV9jpjFU1l3Y6jnhG6rP4cleXuIsYAydj+rAwR3JvTmfXs7KtdvjRTzHz51SJR4fh6l7WMJABDJsLjJlRXmw7EhyKeoHECh/z0VnGcmEi4/mK5SU0Cvs/q5hjBkKCGhdtEp7VRoesUmh8jMhCyDL+A0zGsmU4EZTX1e7Yf8oMpIayB/uT69JKaaSBS/6rOvogTAy/2ISXW5NTpBOtDJW3/6jfca60LBO/zQqM9jHX0Tq7DIDjWSCuVADVCRUOoOG+3OaHXR/6Lt/3v+VQeiVMXeRkZaztHaUYR+uXXbAoV0WiUUde8nsmoSP+3Wm1HdcZNs0hk6Bm/03oYMZpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3+wRi10; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M3+wRi10;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCY3F61l8z30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 01:31:20 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22185cddbffso18032315ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741789878; x=1742394678; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wHVeTdcbD/lMPZ+7RVnSVzW4Yy+8n9avYr5uzJiRKg=;
        b=M3+wRi10NKwtIZPJz/Fhj2gYsZbBHiZrnXjyuH+ANY+61lpj4WnJZFgmlBKLDpD6Yk
         CaorNpUoJsyVPj6zjSk5FxnVwfAhdsPiudbd4MwGirt3L3nF3tWce+jgnh+rfEmLw9NH
         5j+PLaFaEbu2+EuyueLFBYWDVORqAPv0Y3MOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789878; x=1742394678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wHVeTdcbD/lMPZ+7RVnSVzW4Yy+8n9avYr5uzJiRKg=;
        b=XxQeCv71sbCMiPgLzrhVEJmDzRpVZe7eU6RCkXJJwpOYciEl1+YOSnnQ13dlMBbCuF
         8bWftcGYTz2EYe7JabZ4ZulL2irWWwHagahwxyIuVbQDCY9zdy8ByofEH38x1J+14FGY
         sSg2VNJms0JEM5fr9LlrsYy8WQ0mrkaYxObCD8Z2osKDrSKmKC0unpoKRIjhf601BQNP
         3XuGP4bO5ddm0ltP4fF0DB1KxJjD0ig4RHlT0Vp9dgBhEc9F2whH4lmfcsZHnvpupn44
         RqICFIeww1nYNX2DYKw092TB1Vpm8lwsUdz+eHw7sGOpLOez3FhaHdOSCigY89754RWQ
         SGxg==
X-Gm-Message-State: AOJu0YyZRHFwH3x06JkJU1SOFo3B5cofrv+p7UXjR4M6JZnVDXkOj6IN
	th8Z+GdR7zWtJHhZl7r3Q5MF3WOMwiwgvfb1ljQxbO5l8Eh9VR1EGMngDkSpZVyaFA/K2/dFtT8
	=
X-Gm-Gg: ASbGncvAPNycDaJbM3Ph31lNRfkkWFslWzLQlpVlMfakSD+fvk54y9iOO7ezMZ8pY5h
	caQGiOXq/tB25i5bdBSDS7TVCJm31TURfcwkh3cTCnXyUtQCWm+y8N2e6geyw00BloJX40OT9Nr
	aHSWVmklm7xpvp6dDmnRJLoz/sUN4eMUlNra2w9HTUsPopaowlBjit2MGKpiN0E7LWV4O8rB4I0
	gv8BpsjbEuxaLVPSzNTUNDdI2Aj8mkCzguM0fT7BqaX400UyPvtYoXUGMvURJLRNd7lZWHMkq54
	15OGeH+HpaAHGlVP4BLTQQ/hPTzlSQEm8gEyWRgzPPKif85tLd46cNukfsDqramMbvtyosm9n2L
	bQrCwhwhCqSWlvZQNRBZVzB7+
X-Google-Smtp-Source: AGHT+IGso4VXNf4LaA6gyp5gDGaLztOCm9ys3zkim+c3BRQl8gd7egffGxKYj+WJgPgAHh1RMcUppg==
X-Received: by 2002:aa7:8449:0:b0:736:b400:b58f with SMTP id d2e1a72fcca58-736ec417889mr10251381b3a.0.1741789877798;
        Wed, 12 Mar 2025 07:31:17 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ea1:ba82:2605:7d4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736af3a69b2sm10408708b3a.6.2025.03.12.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 07:31:17 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 12 Mar 2025 07:31:16 -0700
Subject: [PATCH v2] Documentation: ocxl.rst: Update consortium site
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
Message-Id: <20250312-dead_site-v2-1-920a313743ee@chromium.org>
X-B4-Tracking: v=1; b=H4sIALOa0WcC/23MSw7CIBSF4a00dyyGR6XWkfswjUG4LXfQYqAST
 cPexY4d/icn3wYJI2GCS7NBxEyJwlJDHhqw3iwTMnK1QXJ54koI5tC4e6IVGfb6rNpecK0V1P8
 z4kjv3boNtT2lNcTPTmfxW/8pWTDBOvNQFo3q2lFerY9hptd8DHGCoZTyBbJ8ivOlAAAA
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Point to post-merger site.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
Changes in v2:
- Update link per feedback
- Update commit message to reflect sureness in corectness
- Link to v1: https://lore.kernel.org/r/20250311-dead_site-v1-1-7ab3cea374f2@chromium.org
---
 Documentation/userspace-api/accelerators/ocxl.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index db7570d5e50d..4e213af70237 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -3,8 +3,11 @@ OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
 
 OpenCAPI is an interface between processors and accelerators. It aims
-at being low-latency and high-bandwidth. The specification is
-developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
+at being low-latency and high-bandwidth.
+
+The specification was developed by the OpenCAPI Consortium, and is now
+available from the `Compute Express Link Consortium
+<https://computeexpresslink.org/resource/opencapi-specification-archive/>`_.
 
 It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI

---
base-commit: 0b46b049d6eccd947c361018439fcb596e741d7a
change-id: 20250311-dead_site-e96834910663

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


