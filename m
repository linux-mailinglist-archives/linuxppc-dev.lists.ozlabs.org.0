Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC343F876A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 14:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwMYr2h5zz2yp6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 22:27:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pahDP9MQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pahDP9MQ; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwMYD0rf0z2xrR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 22:27:11 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so5871921pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z32IzEUdggTlrUH6Z/swye2XN6mqhiK8QF3x27tqInA=;
 b=pahDP9MQ1ajrX4gdC7bvPZg3gr9ecfTLttmT+Tbn6xKj96d1sZD+qjjdYYLhmpba+P
 Ownv3sM9jsEVDHO98jOX2OMA5Fjdmxuf2E3GK8x4hHM1SQAB/0/EjwniNBoRVM5ktiEd
 4bUDc6d0JlEk8wgggKd2w28f5nn5lKKsJK+0+ikRvMntmdenJOct/Brwe23FcfidMVvZ
 wnVOF5LERiYTj+C4L5OysxhwwnhnQrOCZDFy8k0zvp8PFCLJm0+BAbehNueayRFS43gn
 n1GUBSnQZQyEWevCUpLD2hYOIs4F1vVKOe9I8MR4vq5cZ3uMUptTBurQ8QqZ/zWr+w3t
 im+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z32IzEUdggTlrUH6Z/swye2XN6mqhiK8QF3x27tqInA=;
 b=L2CdJXbwANPidxaNRfmBlLJNlLLsXdFr1JAb3u7WdUhkBo1WwWWbm1KahZ13Z2HGKj
 jk/iKLl7MtqyQTbtRFHV3KG4AqwT7uiopVJEqwl16cwFM4ORu6Og+mO0KlPCXJGUdBqp
 dc+gqKqqauS1Dg7iOCochfrb7bVGNqkKrqcfo1TXbDJ/3VC0BLdbhW5luKMf7FktpOu9
 kpTWlvaguRk5/T2PXwDt+V8JohnaJtc1vHfYWvK4tnxSVQxDMCJQrg2ZoQ9HqLWeLDRi
 yg6a9yc3UCZ7cMmTvBpVNdjUXWhg3UsVF40pl8DhXUWj2dAO8+pqMUTzIIJyQSu6xVEV
 Z4+Q==
X-Gm-Message-State: AOAM533KRGkqnLTFgYhDWjvZUd2FtqnbBRgUSujGZfZTj/oRLnl0D3sn
 RT58aFb3ZGOuJRQPEJHTNI0kp9tATGU=
X-Google-Smtp-Source: ABdhPJwp80ThTye6mzrIgQWprosoWnOpAw3F9fKAU5UhJ3q75M9kqW+C+JCUMx8W8PATAlii/vCCvw==
X-Received: by 2002:a17:90a:3d4d:: with SMTP id
 o13mr16781880pjf.34.1629980826455; 
 Thu, 26 Aug 2021 05:27:06 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id o2sm3683188pgu.76.2021.08.26.05.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:27:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Neuling <mikey@neuling.org>
Subject: [PATCH 0/3] powerpc/microwatt: Device tree and config updates
Date: Thu, 26 Aug 2021 21:56:50 +0930
Message-Id: <20210826122653.3236867-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables the liteeth network device for microwatt which will be
merged in v5.15.

It also turns on some options so the microwatt defconfig can be used to
boot a userspace with systemd.

Joel Stanley (3):
  powerpc/microwatt: Add Ethernet to device tree
  powerpc/configs/microwattt: Enable Liteeth
  powerpc/configs/microwatt: Enable options for systemd

 arch/powerpc/boot/dts/microwatt.dts      | 12 ++++++++++++
 arch/powerpc/configs/microwatt_defconfig |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.33.0

