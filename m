Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873E2B0365
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 12:04:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWzJF0CL2zDqwg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 22:04:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OIcAU4L2; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWzB56by0zDqll
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 21:59:09 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id c9so4855601wml.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgyLyFchGL7Sp7PDuveL5Dq/jWJMAfMom/lcxhPZFGk=;
 b=OIcAU4L2NY90scoNe97J7Lo3gdQ4brKCLe5fP7yOH2yD67Ofz0aO0Wo5MUjF2m7/2C
 iqhZfqgE7sx7uOpFPy6Ej8kW1KzNWFmtq5SPp7JzD7HcWn46JIHoJagCqfDo1sLnBMmW
 8Ag48q1gpX4QthRyaDE+UI3Mt18iHtxM0E6J81ecjFGOXmqgtNRJkbanRvJMVY+ewKaZ
 yKEIWMnBWpwiUDnYYiK+r6VCsU2UdmV9yTj07zJZJMrzl00HxHjL52MRjrnzsiZLqanr
 olAQRFJvinPjCXmYaWsofa2c+EJTF0jTIVk2+chj6Zx6LKZcVdSbdxxJR5dgoozgc9p4
 XSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgyLyFchGL7Sp7PDuveL5Dq/jWJMAfMom/lcxhPZFGk=;
 b=c7HWvIqzh4m3gAG3tmABdHk/I/XJRdMZ+g0dXFtqsEFUmYBLdlClynrm3xbEO/mS8D
 yT+h3nVVWz+iRw1b7XCG5FeRuZsEUzP2RcoRTtOZee0pE2sFXFwrAQq6pXQVBhHWw75H
 fcHUk0yTCaaDBUb0ui1L1Pe8+s3+brJXz0RKtPzLrJ04d/Gnf/1w4G3RRmpMXHlrLDRC
 0tYoyB8Y7Cn2l3LHYNbvn1ClxdBdzqxPiYGb2b6Bc173ZQkH/4gTfWidLa4YElPyuPEt
 GS5DPr5X+KhB4/FhFQBCip5Uv19eQ5edJ/Nwbll0mZpNNuxuY937mmilLBi5fd1kZ+7I
 4QSg==
X-Gm-Message-State: AOAM532nR1Rl7D1SWYgqEBa3d205uGb1uLOJgZFU6Me4hUBJfw0FfMMr
 qghN/SdjNGT70I3g/HfaMKCMMA==
X-Google-Smtp-Source: ABdhPJypm3E5Z4Dtn6FAq2BnkUT91LvIbDHRoSB1aVRFTBICzorGYZNNLlfeGh36eCzBVJ5tkNl0tQ==
X-Received: by 2002:a1c:4c09:: with SMTP id z9mr9042901wmf.55.1605178745182;
 Thu, 12 Nov 2020 02:59:05 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id u5sm1167239wro.56.2020.11.12.02.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 02:59:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 4/4] tty: serial: pmac_zilog: Remove unused disposable
 variable 'garbage'
Date: Thu, 12 Nov 2020 10:58:57 +0000
Message-Id: <20201112105857.2078977-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112105857.2078977-1-lee.jones@linaro.org>
References: <20201112105857.2078977-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/tty/serial/pmac_zilog.h:365:58: warning: variable ‘garbage’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-serial@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/pmac_zilog.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.h b/drivers/tty/serial/pmac_zilog.h
index bb874e76810e0..fa85b0de5c2fd 100644
--- a/drivers/tty/serial/pmac_zilog.h
+++ b/drivers/tty/serial/pmac_zilog.h
@@ -362,10 +362,10 @@ static inline void zssync(struct uart_pmac_port *port)
 
 /* Misc macros */
 #define ZS_CLEARERR(port)    (write_zsreg(port, 0, ERR_RES))
-#define ZS_CLEARFIFO(port)   do { volatile unsigned char garbage; \
-				     garbage = read_zsdata(port); \
-				     garbage = read_zsdata(port); \
-				     garbage = read_zsdata(port); \
+#define ZS_CLEARFIFO(port)   do {                       \
+				     read_zsdata(port); \
+				     read_zsdata(port); \
+				     read_zsdata(port); \
 				} while(0)
 
 #define ZS_IS_CONS(UP)			((UP)->flags & PMACZILOG_FLAG_IS_CONS)
-- 
2.25.1

