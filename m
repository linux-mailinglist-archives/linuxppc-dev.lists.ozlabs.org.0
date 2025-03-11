Return-Path: <linuxppc-dev+bounces-6913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B313A5D22E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 23:00:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZC73z06lfz3bsQ;
	Wed, 12 Mar 2025 09:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741717462;
	cv=none; b=lYbjf09Zas/IB7Ygz4ICLjIO73g3sCV28xQvB1A9wx77FvKHax137mj1gZa7fBOpod8+M7xo7YygE4+SO7f+O0AcEN+ZB7bGTUeXCM277O5D5hkOmh8WCXoAeCgusg/fv8hrQLDbop7Gib2wqXMaOycnMpWw1HuQQ46LeTUOjdKNgbORtYx4XR4EGVLdDbN6CYXeii0vxclN6szu38miKL/nKOHKDTQMfOEkzS0TNtAcBlb6+WOrtHZ2p/lxQOTeu07ZttaVz00WaffrjR2Tm880oi2s0ysMwEsMEAEoCHubKmSoA1jhbp9LgiysoS6+pzkLcITkq5VzDqjdMbBqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741717462; c=relaxed/relaxed;
	bh=7KpDa/DEzb44vSpz/EoTHsPUYlYrzw48Wo3fhhLmVV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MfLvLVKAhvMAcrqtVhuOtVG1g1wmMUZnKDn+K2lZVmU3GUhXd8/5nrhZQIEKqDS4gtQUM8G/W+VrMRLcgnPUiIb6Kxf9TrZebF3uMSRpKuDRebLS1IOapgSesJgH+y3i6NgqbIes4hXWQxZ0MbzZPLMWAN45EAdhhxx/QTKnfSnNPok21O+rH6u9/847Z3RPMS+QZNc5OxRMC5jEQVh/s2165B/9/TcXNa4KhOtz549eCBt8D/q/5BhERctoO7E6XzPp2gaZA0OxYZ141PkbI9u4zZv9nI0s+8TqrZwD2QvEjr5U/+DQa+LngxE6SsWMr06O6nZAHnXJ0SrdnU9N9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BDt9XxJM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BDt9XxJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=frkoenig@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZC2GX5SN5z2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 05:24:20 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fec13a4067so9102159a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741717456; x=1742322256; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KpDa/DEzb44vSpz/EoTHsPUYlYrzw48Wo3fhhLmVV8=;
        b=BDt9XxJMG1Vz3XDYRHoxE/TFwXdtYm9LGDl7v/VEtZqhclwYEtaA3QedQGD+/Cq3Cg
         EnWSO4ndBWDjZWRTS+rk8Vc6fd+FIlbPygXhqlYDJX1+RMiOjXr2YDX79mnqp4sSFs6h
         +hhzMz6X91Bg5g0G27NvqzjHCR3jJ58clgo60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741717456; x=1742322256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KpDa/DEzb44vSpz/EoTHsPUYlYrzw48Wo3fhhLmVV8=;
        b=l/PKZkLG8sauCHX3RnmdpwR9m2tLoQB+Y5TqTsbQQ3Uy0SIsZkupmUZJCA1qlkhAVN
         kCYOyz9B8skgFnDYNOSUccmIKZqLr2whAKbXYxC5/NeflKA+lxWdmqb6939yiVr2RlWY
         hzQwzzKYGsLwjWh7kcC/53QK0hzKn4geq31dnikQSHyhE+bGJyw0NIeUP4KVigI1wMuE
         Eo8KnYuSGSiuQsCM4f8FWwxUxFP20YdqZRdDJ/dbkQmtHTT2pmqUIZ+rG+xmkslWsiTH
         asJRI1d9HWGtk3Dt2KeAW5eJyOKjwSPA7yEMndoK44HpB7ZLj/c6DqO2j4hCe2MhXPTQ
         KQiA==
X-Gm-Message-State: AOJu0YxhJsLzbTeZ6QW7YJSnWqDU9271srxSgZEGMGJjVLx4QMC4wBpX
	DdvpY8suMie8tWhMkGa7KqVxwryQQSHdDxJeFjO23rTwpHoy5ZX/CeU2+YoJpw==
X-Gm-Gg: ASbGncu11W9hetV2VzH6cSeL3W1oR998/ljoet2bAzp0Ou+6eggvij8gzGLiyqXLtmZ
	kPEtV5RFv/DdNKl5eObgmFAoGhoBQ3i3BUD8RLIzDWxzRC/2aep/mzN9nRUEGmH4itwykDzXpOC
	LYplt/9KtfENPdrVatoQZScRWFq+blAagBTwBvQCMBXiUEwwwLE0N8z/fTzkoWC6g5qrxluAhum
	EKhLsrgasfvWQyhDjiiFNgDycX8rGyMfc+AavhXgUw8kxPOTm6MgNusmAPBiGqv/awqneEPuo9P
	jquDbWvuXb310b4cv8CGvAwpWvHPwKA48EDqt090EEkel+43ozRaUsazRPv3wDjGBLKp/WPvhyN
	cNjnEMEkSeyvRfmvlfd/S0pg7
X-Google-Smtp-Source: AGHT+IHJIFBe2sp5aefvMU/+B+c+/u+vycxKjjJCB5yGBHEUo079bEIqZxKID9+1kXvZn7DFB3FGYQ==
X-Received: by 2002:a17:90b:180a:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-300ff105730mr7049629a91.18.1741717456043;
        Tue, 11 Mar 2025 11:24:16 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:ea1:ba82:2605:7d4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e773dddsm12265383a91.12.2025.03.11.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:24:15 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 11 Mar 2025 11:24:02 -0700
Subject: [PATCH] Documentation: ocxl.rst: Update consortium site
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
Message-Id: <20250311-dead_site-v1-1-7ab3cea374f2@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMF/0GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ND3ZTUxJT44sySVN1USzMLYxNLQwMzM2MloPqCotS0zAqwWdGxtbU
 AKoOjYVsAAAA=
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Old site no longer associated with consortium.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
After mergers the OpenCAPI Consortium does not seem to exist.
The github page is the only seemingly relevant site, but it
has not been updated in 4 years.
---
 Documentation/userspace-api/accelerators/ocxl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
index db7570d5e50d..5fc86ead39f4 100644
--- a/Documentation/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/userspace-api/accelerators/ocxl.rst
@@ -3,8 +3,8 @@ OpenCAPI (Open Coherent Accelerator Processor Interface)
 ========================================================
 
 OpenCAPI is an interface between processors and accelerators. It aims
-at being low-latency and high-bandwidth. The specification is
-developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
+at being low-latency and high-bandwidth. The specification is developed
+by the `OpenCAPI Consortium <https://opencapi.github.io/oc-accel-doc/>`_.
 
 It allows an accelerator (which could be an FPGA, ASICs, ...) to access
 the host memory coherently, using virtual addresses. An OpenCAPI

---
base-commit: 0b46b049d6eccd947c361018439fcb596e741d7a
change-id: 20250311-dead_site-e96834910663

Best regards,
-- 
Fritz Koenig <frkoenig@chromium.org>


