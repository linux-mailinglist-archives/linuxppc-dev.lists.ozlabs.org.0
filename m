Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C943F876B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 14:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwMZY2xscz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 22:28:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WWwjHJTe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WWwjHJTe; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwMYD5Vn5z2xrR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 22:27:12 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so5903559pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDRz3Eohl6wH4T4UfgR5oe0+9Ib3alLfUOBUDKUip0c=;
 b=WWwjHJTe1fS6l1JjDk6O7Lf/MQVetjDIhjrGOaRXDDmQo+h6ARe03w/PUqyVdOJISk
 PZMWjkXsbsECkAGbimnttGc+BGn5Luxbb3siYDOVq/ihGz4qpLv9i3Ylf5ay9sy6NE+y
 7SKQN4kVO+gWExHdfHqdyVSF+Pg4CHjQKACBTLDTAU21/ymq/VfudAJH4BdMmJWYf8sa
 AsV1/m4W1+3dlqf6/JBgtzdBBQTHY+UJZJKu/Nop3091eoqsDussyDqp25Kfz8G6D/sG
 SEbZZYSZXZkBkbQLb7hHyAM0iVUvRAI5Y+Vm4rmK0NosnTzoqhCEQ7lt6XU2Fil1qkQV
 Br7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MDRz3Eohl6wH4T4UfgR5oe0+9Ib3alLfUOBUDKUip0c=;
 b=b5A90Je09mnMn8mwgkjmDngH5OoPXGfTWROO/7QVgRD+knVLPgWFjC79jUnONrvPF7
 I9EVt7JApx8knmYhDcePRxBlYW1nVPlMfQIcRiZJ2zQKR0FC9AXWB33BSvdgp1BbHygH
 nx6ch0ausGasfKeLbIaJPLvFlyLThwtNevM3FXQYdYQuJgqBZLlAhRI0YLvTnPEY7J7T
 Gul/69QdQhPoQCzjvF1yZp9V20qxNKu01w4HtSGXRcXSLaijgtn+9/SN8+nufbqVDocp
 W2MKjXK/8Ay4Toz+t2yV0GlkwcSrR81KwZBJqxrcyveI2fmYD4Fg67NVXyxQfje6dycd
 WgJQ==
X-Gm-Message-State: AOAM530KzxunUvjsOAoVDpH1/X6R70G1GDyvX2g+7xwagYwfQQRKYbxl
 jLnEqjTrV8YYP3gitNpAcB0=
X-Google-Smtp-Source: ABdhPJxIQXHyCoLyYqTUHJEQn2I5ig7igmObuI0zNrT+QbjKLz8+dwuicbpcW3CI3Jo53Gx5MdfQrw==
X-Received: by 2002:a17:902:684d:b0:138:7bed:7471 with SMTP id
 f13-20020a170902684d00b001387bed7471mr3420132pln.68.1629980830303; 
 Thu, 26 Aug 2021 05:27:10 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id o2sm3683188pgu.76.2021.08.26.05.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:27:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Neuling <mikey@neuling.org>
Subject: [PATCH 1/3] powerpc/microwatt: Add Ethernet to device tree
Date: Thu, 26 Aug 2021 21:56:51 +0930
Message-Id: <20210826122653.3236867-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826122653.3236867-1-joel@jms.id.au>
References: <20210826122653.3236867-1-joel@jms.id.au>
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

The liteeth network device is used in the Microwatt soc.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/boot/dts/microwatt.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 974abbdda249..65b270a90f94 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -127,6 +127,18 @@ UART0: serial@2000 {
 			fifo-size = <16>;
 			interrupts = <0x10 0x1>;
 		};
+
+		ethernet@8020000 {
+			compatible = "litex,liteeth";
+			reg = <0x8021000 0x100
+				0x8020800 0x100
+				0x8030000 0x2000>;
+			reg-names = "mac", "mido", "buffer";
+			litex,rx-slots = <2>;
+			litex,tx-slots = <2>;
+			litex,slot-size = <0x800>;
+			interrupts = <0x11 0x1>;
+		};
 	};
 
 	chosen {
-- 
2.33.0

