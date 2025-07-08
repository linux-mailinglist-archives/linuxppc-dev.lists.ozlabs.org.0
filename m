Return-Path: <linuxppc-dev+bounces-10148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D8AFBF4F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 02:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbj5w4yZ0z30TG;
	Tue,  8 Jul 2025 10:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751935428;
	cv=none; b=BReixAhlcKqnnPRyu073s/EibS9QL3+yKROfCxu74av8gbJS1HCaie+EFR4WXvMz17e5QD6i7bo+MyODFlNAgUYyZGowge7yRMBJUWYpoQsh0mVkOW2SDl34UI9uaPNASwGAh8x1N7VWFneD+f57cQvQ7VszlKolo46xW1PQe98m32E7ZvQvnQdeHHcE3bngwdgNC8TZKBIvxqBV6OsNw2swrmq25+EH3ZcV2lXF5GnqJR2/Re/jZ/RBzYbVAqd9zKRYGu5RN8BqJIYotbCssDZC22qskkLdtUEnOX6jj54V6R+nblvhwxnOjoRR/enXhoF5NGM9F7358rOZ8SPFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751935428; c=relaxed/relaxed;
	bh=dSX7rXG/Cb7Iv2C93GcbdXPfzK1jTKmoYKGXzw019z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVk1PyfiudeBONNuVYbZuhscRvtDG7gFHm9FS55noajX2gsOQ0qJOk/w4BDANJmwEjZzNvd9w98+wLdac2rIrTV6fZs36OKHOHga34kP3U6DqW0tniCA/jWPWEXWN2tGTOzxZnf4OYkN6roWbKDnPJ02nUe4GMO8nvK/GSLWD6shxEiOSLKaNrJIidgKxwxLc7vTCXnj3KtA4VE2YeXFJOYqKBQZm3kVig/XsWRU82kaiRw/LCSq0Fv/2k7rcPGvourQj0w4nvO8VbbYo2O00IanwPD7CpUFqFXPT739+EWUu1IQGpB3UHAppGFzyHF9Sb7Vv7yX2rir3yTMYBisIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SDCOeFIV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SDCOeFIV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbj5v1cc9z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 10:43:46 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234fcadde3eso55666715ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jul 2025 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751935421; x=1752540221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSX7rXG/Cb7Iv2C93GcbdXPfzK1jTKmoYKGXzw019z4=;
        b=SDCOeFIVgru2nIQ33kir7xI76j0NWwAucdkb4mnb36rs6Xv9CcOjZ9KfkoMbZVelOs
         OaEeFXMiSXPtFbo2CPDdyo79ZeH9P+ZpAj3gP1/OiKCzZiEFNtTVrY9HiGzVE6NiU1h2
         64GBH6l1h+jT+avgH6PJzXPG3bVqCMSlR6lj7dmTLq0bxSOhlQoXjZro2gnRcvwjj4h8
         2uK5Yk/7yzTMY+AGXxYqrjp1VFbbJFPJEi8OMXPi9fAZPx2+PLcNfyq6dqM8BGWTiPm4
         mnYmgFyzIv9jorQ9qnY8mUoM1i6nA2G63cN0crYBqWjmz1uhhF6rm3hgusSAQm51QEBj
         9XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751935421; x=1752540221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSX7rXG/Cb7Iv2C93GcbdXPfzK1jTKmoYKGXzw019z4=;
        b=UOz5s3yYodeGN4XFWlRx3ri36FXilLtXX8WJXLi6xAnk2v1X6a8VrrD6QaMrevZGSA
         cuReA5x58NOZX/+4omQ6tkdjOFGJ3svzk2foNItRCvzjNg7XNhCR55epnA9a3aUu2+nx
         d3ZlX5WI5ZdHB4VeceCEdhhjTIBmLhDJ/sJobzHlMxbF+a3SCHzbYKQxJImoxs6UVWPA
         czMCwKlKNb7M/c2SEh5lhXxPlbfS20aU7UTC0agIuQffmdKerLrwhRsXoUT5OfXw2sLR
         iq8uIQTZDzCao0ln66bgtiOePPrgkQSK8Qzt4HbVRIRQGxggcUexi0eAcTL0Irvt02mP
         /RFA==
X-Forwarded-Encrypted: i=1; AJvYcCWoLCaC4zccFLnwvyEsYG4x9ZNElNYdW4rSY1DByA/xHrgxxtNLH3wJCvi8X/h7eRtab2gJbbS2EJl59yw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGSMKxoQmOf9FR1SZO65V9a8xf2uTf7YcZ0Zfq/FWoZdjx3SHw
	e7sGHWwuyEIFarfOW2Ka6hO8yb2scP6dUEYKZIYZj4cPvyuvk6p61DyR
X-Gm-Gg: ASbGncsaGYrdnTxU38L+qFLpu2rVqUIm8ax0xAjkxqDEMereSs2PvAFWtBzIRY4eHbp
	VEQDqvN4NNA0y0vInqgQRZ89OYcXRw0FPxii+9/ce42dpfVFcBvY8s0NRyMprLmi05S26waDwBU
	GoQgXgpTE0HEid+C1t/cLdBMBtNnS2KXYAvVD8mlEBNn9sbPPza+q9IzBmpjL1ktuiXYoIFq+X5
	DxN/vRSQFhsX1hfKt+Wzdy/LBYeXMhjUG/zUCPp3s9H7PGbzGPMfChOtZoFhKaJCsHgtV7JZwg3
	dCR7iVzeswVHrR4wTKNylJszQCK43o98lJQsCN457xEhZj0y2sTxS3OJqkxkiw==
X-Google-Smtp-Source: AGHT+IEAuHP6Svd8Lb4XpqwNEFCuT7DD/C+PIpC3nxFrsbTlP9Co8Vp8AGmR2u2x8S8eo9w2aPZQTQ==
X-Received: by 2002:a17:903:2d2:b0:235:f078:4746 with SMTP id d9443c01a7336-23c875ac041mr222094905ad.42.1751935421299;
        Mon, 07 Jul 2025 17:43:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845bd292sm94309265ad.236.2025.07.07.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:43:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id ADB97410194E; Tue, 08 Jul 2025 07:43:37 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Haren Myneni <haren@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>
Subject: [PATCH RESEND 3/3] Documentation: ioctl-number: Correct full path to papr-physical-attestation.h
Date: Tue,  8 Jul 2025 07:43:33 +0700
Message-ID: <20250708004334.15861-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708004334.15861-1-bagasdotme@gmail.com>
References: <20250708004334.15861-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833; i=bagasdotme@gmail.com; h=from:subject; bh=zNTKRq7aNErhkH8U18q1BjbgmqsaSp0PtB0iNkd7AU0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBk5mbpnc/aLfFntdWb+ksXqk7k3b/g3t2Pf+8kl71fJd urti6q431HKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJ2K1k+M3adUbuXhb7ds6/ rid/fNNL/ne+srxT6a1017R/89+ufSnD8N+FRzxG+9zjCasarx7YvWuDkPKi/kcmDBzHPRJCH4e Kz+UBAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 03c9d1a5a30d93 ("Documentation: Fix description format for
powerpc RTAS ioctls") fixes Sphinx warning by chopping arch/ path
component of papr-physical-attestation.h to fit existing "Include File"
column. Now that the column has been widened just enough for that
header file, add back its arch/ path component.

Fixes: 03c9d1a5a30d ("Documentation: Fix description format for powerpc RTAS ioctls")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index b45f5d857a00b6..5aa09865b3aa0f 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -369,7 +369,7 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h        powerpc/pseries Platform Dump API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h      powerpc/pseries Physical Attestation API
+0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h powerpc/pseries Physical Attestation API
                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                              <mailto:linux-gpio@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


