Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1F5EEBB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 04:27:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdHM31FTFz3c6q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 12:27:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SpxT3HUK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SpxT3HUK;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdHLP333Gz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 12:26:51 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id b5so218255pgb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 19:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=jt3P+BLXBXjD4xVQjEuovh0jGtGymQW5MnUT4hQ4W48=;
        b=SpxT3HUKLWw/DOixd485n2jRPAmO7yynLMjwJGXpfhc8uKYjkPfJvxJ4bHqdkOm+S5
         TXWXEGFBPXmzD7TOaRw5wlf6wLUy5H2mjnJ8jOrSxxZKwAexkmEyFbkYYdTsFnvZ2uxP
         ZHm/8N47G0KTORRMyc6EVrzMiHjSkU6qEr09m25qh+klBt0r2bqiKPqJHB3WXieKLitQ
         BZcVvqBby3xvrL9NcgKQsTqNq9gCJXa96ahc/e5s4cYN82MTz+rwPvk+3Ege+7aJ+vDc
         4mRNZmh87LTyUl0Lz1Vh25gdFL2mao038BmjSv69Sa37x6J8PdkuefQKpaCQXqzakDDl
         ZGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=jt3P+BLXBXjD4xVQjEuovh0jGtGymQW5MnUT4hQ4W48=;
        b=ViBqQkQIkYG2Jh/vz6vF/8c7mPgM51q2jtdNrVBmkulXCzXSBWNbncmUxkM+F8A/HN
         8HPgjg/WS1xM0o3CukqCjvklR6AZzfAuu/vpOFlL2KaWwG0rQ9fFd0mH8rXnS7+C627J
         f5v4TH04VQaSF+J4UPCA+1g6hW6vlkLtW75qUs3P6ccxmTVAvYB3zw0AUSxPeMQaz7fM
         UJ7LiI0EE+O8wP6A4ShSYQwPqHcITZyj/XvJwsfwzjzeIkTRO2cH8Ki8rv4zfQ6D5y4/
         uKX7rWm9n5DdOL9AFLv/dAQiR7FFJhvYZHJIzRHuC6hQ+NP1OHWK/jmPNVv6XxTXJum2
         7z3w==
X-Gm-Message-State: ACrzQf347C95jJJU9f7B19N1CS/XNvBHCdfQoiSsRhqeQ1cr97vnJEdA
	LZpE8B/1H++kBa0zIrHYDD9ZVhx3HgY=
X-Google-Smtp-Source: AMsMyM5M7wHQMLb7bHYaF+t7SC/lVTx2UUU4gzzx8dUlAMpheZ2s+1ushsvcqWPFfEZk/4xuTJzhyw==
X-Received: by 2002:a62:1a8d:0:b0:544:1309:19f3 with SMTP id a135-20020a621a8d000000b00544130919f3mr993978pfa.37.1664418408815;
        Wed, 28 Sep 2022 19:26:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id w4-20020a634904000000b0042b291a89bfsm4220596pga.11.2022.09.28.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:26:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/microwatt: Add litesd
Date: Thu, 29 Sep 2022 11:55:46 +0930
Message-Id: <20220929022546.2730192-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the register layout of the litesd peripheral for the fusesoc
based Microwatt SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/boot/dts/microwatt.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index b69db1d275cd..0a2e82ca1c79 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -141,6 +141,21 @@ ethernet@8020000 {
 			litex,slot-size = <0x800>;
 			interrupts = <0x11 0x1>;
 		};
+
+		mmc@8040000 {
+			compatible = "litex,mmc";
+			reg = <0x8042800 0x800
+				0x8041000 0x800
+				0x8040800 0x800
+				0x8042000 0x800
+				0x8041800 0x800>;
+			reg-names = "phy", "core", "reader", "writer", "irq";
+			bus-width = <4>;
+			interrupts = <0x13 1>;
+			cap-sd-highspeed;
+			non-removeable;
+			status = "disabled";
+		};
 	};
 
 	chosen {
-- 
2.35.1

