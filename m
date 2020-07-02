Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5C212D27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 21:34:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ySvq5sgQzDr5h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 05:34:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vMukI+8Y; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ySrZ5wr7zDqg8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:31:26 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id s14so11684222plq.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OGY4T8Zcs1wcon8HLlPhq3ExfaPukK8uw6n/UEszhf8=;
 b=vMukI+8Yv8X+JxDkvnM5hqEvcXbDyO4isuhU2PoyffLpuGKnfl2sXMKAEAK180NxbE
 vDFj55MDco7WU2fFqrEk42iWq2F+virb1m6p3rDPERupGTxifDdqE9Y5NU2G22V/1KkT
 yKpZPbFjw1X9l0nJ1p72s7jp9M65suzdx8q+nRxbfAiZtYj9s3zbF3aTS1+s5OvO3eJz
 tjtEMVxV8gXCg+McmXhFbBclhFf8Ylr86FiEVpqSmL3wq902s59FD5qMB9pD9qWc/wap
 VfVRtxTkTpb/bb1j3lscTUwiMx9NlrcWonpuhi+7wnyu+iBu8mad38gtGNM4lCvR3hEN
 TPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OGY4T8Zcs1wcon8HLlPhq3ExfaPukK8uw6n/UEszhf8=;
 b=PRiwBO1wiWhXt4NI96gjTvlzL53h9F0YNo7jKQk1ARkslOipOHn9EEjKxsIckXHhk9
 eXMYQFdiB+rSFTylG106AIuCGzSADSLZZfL6WUz62Q/O9Jzp2MCipgwgx6M0cOXrtTZr
 PkX/UHFVKFppHUlUkP/KMvH3z00gKI3T4qfKtT3C+W/ynAAYwV+Drq8bRviLXdp0K87V
 BQQ3zCgpnueFUi3Q+IXAm2hXLoTXscavkrQnJ0UYrxgYUvY+wJCeRbWIbUA4WMal0YND
 YukrFEQF9Xs8UdRtxWf6z66Q+4uRIl/EdpprmEg6Q9v2a78EIYd5PvXnjxJae9ibx3Wv
 EH0w==
X-Gm-Message-State: AOAM533t3DvOWjHK87iCmZDJZd/AzyOYUykakLdWZc8x+/oLFuFjPUvs
 LesaKHxohgCDweFKvjHmtrI=
X-Google-Smtp-Source: ABdhPJzMUcvdYtFO3zsputaplxh/6FPWCjBX+jSLUSWbLPvXQRFShaLna9JWCkpgdfDYCFe1M5jHRA==
X-Received: by 2002:a17:902:c408:: with SMTP id
 k8mr28530471plk.279.1593718282774; 
 Thu, 02 Jul 2020 12:31:22 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (searspoint.nvidia.com.
 [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n63sm9735707pfd.209.2020.07.02.12.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 12:31:22 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl
Date: Thu,  2 Jul 2020 12:31:02 -0700
Message-Id: <20200702193102.25282-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: alsa-devel@alsa-project.org, festevam@gmail.com, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, timur@tabi.org, Li.Xiubo@freescale.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
---
To Shengjiu, please ack if you feel okay with this (your email address too).

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68..54aab083bb88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6956,6 +6956,7 @@ M:	Timur Tabi <timur@kernel.org>
 M:	Nicolin Chen <nicoleotsuka@gmail.com>
 M:	Xiubo Li <Xiubo.Lee@gmail.com>
 R:	Fabio Estevam <festevam@gmail.com>
+R:	Shengjiu Wang <shengjiu.wang@nxp.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
-- 
2.17.1

