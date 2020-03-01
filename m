Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88F174EA2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 18:03:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VqN605zszDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 04:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=nishadkamdar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VFRG012v; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VqLH128ZzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 04:01:21 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id m5so339566pgg.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 09:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=RkkxF9rbxL5TO4VtQqDvZ6QeVGq/gOE8OHFbri98OUA=;
 b=VFRG012v30gxubG5Nej5tyHeMMNqRwiL0kDhem7uw9Qgt+GzJWxSr3q1r/W5P2uxpJ
 YKMTL2e6Xle+8Lw9q03OPtE4HSkeSxrS5c8R/1BvFDBrSPd7u7Cvwn9R+b19jEtUNi80
 4oCjumC8XyDv3Fs52DQXqKxNje8Hl6Hb91inoPkk/bFzlel7CDDtbXc7moAFXrpumsXE
 isnfF2U/3cICosoD+u0NS7+kLQuuLKfTqSJV4VX44M7YMVxXL2JonMUP9BWBvhdW96Ma
 D+UerkZxOYLmZfTmCtD70jXb1GdSlpEfupw+opedCZ7onPCX6vc2baiv8t5EVpoZwFQG
 s1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=RkkxF9rbxL5TO4VtQqDvZ6QeVGq/gOE8OHFbri98OUA=;
 b=qSzIS6WiUcnvcVyAkomY0xPWOWtWOqnv9mitcKtxV4+eqZjHnkZ9O6AbKlYnwyWgr6
 MSdvKDrsGTCDaFgypxwJI0KlHr4j3JW6nKEQ3/nctUGsrnYj0igipw4qTdZJJXnmGTe3
 1KkmaPdzuHYIAW8icbnUT0H1+K04L3nF3BnW+i12Zwo19odwzQp58S1ltdsBqeIlTsBV
 fVaS3N2Mb3WwD/UGZG9B3sM6xX1L5yyRy81AZG39Wpu0MGHDeic2cTm0TvCSkreI/Wmd
 zI8ZkOc6KXf4zq4OHm9wbj8xIY9TgH9sI1hseS3DuxCWkntD2X6UHKcmCMFZwi7RPFF7
 SgDg==
X-Gm-Message-State: APjAAAW/uuNcOKCrs/dtD9oN5Fuy34QpDpAANMb9sJIwbUOPoknO31tG
 VdNMey6PrZgrweg7AxYTiLw=
X-Google-Smtp-Source: APXvYqw6pqUf2LcXYwgPka2U3Xna2R3Gr7uR6Sue2OpeYCKG+BAg1qoJ20mZpwPQFFM1MoO4V7GUlw==
X-Received: by 2002:a65:40c8:: with SMTP id u8mr15183918pgp.188.1583082077891; 
 Sun, 01 Mar 2020 09:01:17 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id k5sm2161534pfp.66.2020.03.01.09.01.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 09:01:17 -0800 (PST)
Date: Sun, 1 Mar 2020 22:31:11 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Joe Perches <joe@perches.com>
Subject: [PATCH] tty: hvc: Use the correct style for SPDX License Identifier
Message-ID: <20200301170107.GA7097@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: inux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch corrects the SPDX License Identifier style in
header file related to the HVC driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/tty/hvc/hvc_console.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index e9319954c832..18d005814e4b 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * hvc_console.h
  * Copyright (C) 2005 IBM Corporation
-- 
2.17.1

