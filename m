Return-Path: <linuxppc-dev+bounces-10237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7CB03449
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 03:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgQSK5Ytlz3bn0;
	Mon, 14 Jul 2025 11:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752458257;
	cv=none; b=WmypiUArAqFa39jSyVfTndRlCeVhWRpFPWEBDE8AkfuUcr5PbXlqE/PXYdBAjFyOthd2x/0v2Mi/aXrEFxZxcAsRkSBmVYvGQ5iwgwUaDFjBlS04/0s+gKld66xNeO24zcXGaVDFAAVXlGoQ001Dudt3UzI7QKL4eZoZ/V/093Jt/G2+ltByzvUIpCdOOKCUPxBoeQr62VWAO6nqLkHSsjuUlJ7OthTSkf8Bsv4y2/qU5/O2TXQs6ob4FbHC99Ldl8+cjvONyIHG+gZanqykqE2V7X3qISLW9Ti8veSE0o61hmToQRHI1WOroVwcYFaPvT3l8wPVUi2zWTenKL/oZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752458257; c=relaxed/relaxed;
	bh=18fNXUOoTp1B5DuMo79HunXMqPXIfJMdw0LfIba3R6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcyCNu15lco0XiFjoSM1SIZoMPmbV3uhxzPRKpkSFYIAm7SPkhOdPSplrOTMsNc81pmB5IvuiUPtd/BVMYvB/XsbMO2RphLjNIBW4u6sn/J5IfBeylg3CW89BbFCdyIfaH6gE1sDAjd/gMiJzxfGeXZP+0RtPB/39YS7m/cZR/xeHk7hjECMktfPKRI/472dwb7Z5PMssb60HHu7OHUEsVmeHUSQPdWozCED00alSfXL5pQwi5xqadvMuoKhCX+gfb4oHAhBLFnVv41a8JsOdxUFtN0Lk+g7uGaNrSJj8bmiV2/E7flw03a3Js1Qghf1vnXxREBO2fJL7smk2nde4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aQrEI62C; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aQrEI62C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgQSJ0VlBz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 11:57:35 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3c5f666bfso679295266b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752458253; x=1753063053; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18fNXUOoTp1B5DuMo79HunXMqPXIfJMdw0LfIba3R6M=;
        b=aQrEI62CAarAbpZjcZ8Enu8Dz+GNJeDZa2BqLyiG7pp9enGWGhMUlMKD7A2P+OpMLN
         QiLFkMlLKign8eVByENiqenZ5UpVkQW0zdxPIsTTsNuV+SAsq/6+3kZet1nraH28rzAc
         WeW3alSb/AunNzE929x02qNw/zc6i6jSBQ8hTpIOXvQikPIN65vudXDP1n9pPcA9KueL
         ths9dMPdGezMv2p0n5nWox5BYMcmTWK9qoErOJy0UostlSXk/GGveqLM4yGIXNjYvDTc
         /tQnphPbxDBS7nnaLT6mxV1EuWB+wlv4fiZmU9qFlZKZOt/chdlLTHuo8jJ2WkJRJ3s4
         1gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752458253; x=1753063053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18fNXUOoTp1B5DuMo79HunXMqPXIfJMdw0LfIba3R6M=;
        b=PBiIneMI722+qPeoK3YJ+0qbJ+xZKa0r/qJQC6AQsG/cMsff39Ep8y2+NazFSEjC01
         tiMVqwThvG0XhMmX6uaKYR0AogymvUtO9Qr/Q8y5rkbS67nnK5mWvLtzbxNC19r24LPX
         F7A5zIRkQQGivtlP7L8j8+Gu6YnS/J5yj6Gt8rqtar3TCMWPd0W8xTaIGHFyzUs+M53Z
         ou9alDJ/7W7buNsqsXIcrggYmx7CLEOYNsRl/BFFcMxe/haA48Q5wm0rQ4WKfle4VwjL
         CNFQtTSueCa6j0VIifzjikAN6573MipXnrQEhADgdDvRC8FO40UIiuBHAI89Bo0QI9Wf
         NIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbOGAmwmI0CwfjphefHp5/YiMg8BLJOPUX4XrnxgOGEGNkreastZqpQ5cOGS002BRoUj2WIdR60fRBypc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSWhclotzENekUG/I6zdFl5D4dY+5LQ425zVZe1tlZS7t2XYr8
	EIYm8ChEkJDQ5AyLGOCl6HfexziD1buRm1XAZuLguOjdOpdGoiXYDHVg
X-Gm-Gg: ASbGncs0V/KotFJorb2PITgSU1jGmZNKZpa1flWJfpRTBu0oGd/v5tYckU4LO2dMQ+M
	jVRoSXxfw9Dr27fSihtHhA+hZnMnmyXF+2Kdhqc9rG6+5NPm2zj+bHIyhh6kWEjiS7gm+Gc20uu
	cw7txiTXm0wwV5x+OWNhLEksjx0rGD+Pmd2LzuCpVAb6P2daBWsRP8h1wE47bKeba/FLWKIY3MK
	vNWjLeL6EX8S+lGzHt5Jb6UsEdT9Bi290BoPpLgSCUvrjK+eKWRsZIYLgoZdTDeBijWBQCjLucn
	vMC4AQZXBsyXEvC71W+fGYNYs/D9Q7OA488YKUobH8rnuwd73xphdHDx/YOyG3AM7rCdnw4LpiQ
	Vs+x3JqpTqzkIy7c9aRURdQ==
X-Google-Smtp-Source: AGHT+IGLxHNZYsNpZfVYl26BiBae3FGliB1xn3y4/hXDGM/4prDAdt7ZERtTvLadQOB6QRcChXSdBA==
X-Received: by 2002:a17:907:3dab:b0:ad8:9a3b:b26e with SMTP id a640c23a62f3a-ae6fc161916mr1243488566b.56.1752458252583;
        Sun, 13 Jul 2025 18:57:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee459asm751575266b.52.2025.07.13.18.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:57:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 69382420A818; Mon, 14 Jul 2025 08:57:26 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>
Subject: [PATCH v2 1/3] Documentation: ioctl-number: Fix linuxppc-dev mailto link
Date: Mon, 14 Jul 2025 08:57:08 +0700
Message-ID: <20250714015711.14525-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714015711.14525-1-bagasdotme@gmail.com>
References: <20250714015711.14525-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214; i=bagasdotme@gmail.com; h=from:subject; bh=Ml6dracZlciGK5OWxXhyxUD5G+vURe2PpzJsaKSDLKU=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBklSTk1gkfN02L3flzOYZo/nTGBeVH5j30iEtl7SrVmX WI2XdjWUcrCIMbFICumyDIpka/p9C4jkQvtax1h5rAygQxh4OIUgInkdjMydCxZnB2ifaNd/rzU K93Paa52Rn/lv76puf7AsOzmneuesYwMb78VVjjGb3gQt2Ghkdnroz9M/kkbZq37aOPxc4KJfUs KLwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Spell out full Linux PPC mailing list address like other subsystem
mailing lists listed in the table.

Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
Fixes: 514f6ff4369a ("powerpc/pseries: Add papr-vpd character driver for VPD retrieval")
Fixes: 905b9e48786e ("powerpc/pseries/papr-sysparm: Expose character device to user space")
Reviewed-by: Haren Myneni <haren@linux.ibm.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index bc91756bde733b..a4782e566392c7 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -362,15 +362,15 @@ Code  Seq#    Include File                                           Comments
 0xB1  00-1F                                                          PPPoX
                                                                      <mailto:mostrows@styx.uwaterloo.ca>
 0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
-                                                                     <mailto:linuxppc-dev>
+                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
-- 
An old man doll... just what I always wanted! - Clara


