Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6415F0562
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf1BS25QWz3fJP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j21FXVgF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j21FXVgF;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf1853cwFz3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:50:28 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id v186so3447902pfv.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=f5a044zA+7WSdwcbX/mNkzNfoRduTpzl/El5aJaQvLg=;
        b=j21FXVgFjkmmw6JhB4NqzTlZKAoRIqH6MVfP9hS3hxZFTNVlAFpnS5HtK7Wapo+vdu
         nWm3CmDokM7rNy4hm3nHeBlvKBP3/ATGo+uDNopKusmtNM2y3tCrjo66K2n31q41e5I/
         RnuAT6y+f3hoQU6kb2nbH+UzfPp0lofN1KX/DwMvjdJA0WT+QKrroyqLx+NNyng9GFv0
         I1D9v/F8RmxitAVY4V+qI7HcNxTCRxf3KMoB669J7ZNrJufn/6VYtm+VZxKKhtZEXizJ
         I693MFP/bA4NiW784XhR7aWmN388XFVU0YzugpsbZC1Zav2HSmZF+GfSFrv+pHk7L6f0
         WYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=f5a044zA+7WSdwcbX/mNkzNfoRduTpzl/El5aJaQvLg=;
        b=Gi9Jq2xtGOoAQGdrpYplrJWYfFd1Kc51HpjaZt98kY4rK8T926Nq5kzWAKByVF7EMd
         Sl803ZzRpZ5XhvYl2eLTN66l8cKlS7rRXoNjNMrMoo42SdvQBApVhwKPJK/ZCYdlMzoP
         ga24lOU86C1zfsO2DZDRvNVSHTJOrd1PYiMJPdCDv0Y07Yil3HF5hG1+P0JZd9ZPZwKq
         arrfyCv/qz09zbns17KQGv9karB3JVmRaz8x15mqBHmaYevPg4fjmyvn15eEUdNKeltO
         MBsprN9X7NBb3G8HlJiZcdPOmNbSt3UsR8HIJEwCcbQ2yUKuueCm7CWE257IdnvDPwqf
         tUFw==
X-Gm-Message-State: ACrzQf2v6OQoxjPADlWpZnw2Ri5911TxI3hq5Yk5Gq6kYyaEcv2gMb9E
	z9ubpb8JnSJoTMczXj0oW1Y+EzV5RSI=
X-Google-Smtp-Source: AMsMyM7wbQYJqkCWGZ+fp+6yuUtEO6m/fa44Jng+WiSuGIKv8uBFbmdGnlDdIfyasyM9UduIVX0j/g==
X-Received: by 2002:a63:512:0:b0:43c:cdb:d320 with SMTP id 18-20020a630512000000b0043c0cdbd320mr6380574pgf.179.1664520623642;
        Thu, 29 Sep 2022 23:50:23 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id a7-20020aa79707000000b0053e4cec4763sm884851pfg.160.2022.09.29.23.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 23:50:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/microwatt: Add litesd
Date: Fri, 30 Sep 2022 16:20:12 +0930
Message-Id: <20220930065012.2860577-1-joel@jms.id.au>
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

It requires a description of the system clock, which is hardcoded to
100MHz.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 * remove non-removable property
 * Remove status=disabled
 * Add clock
---
 arch/powerpc/boot/dts/microwatt.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index b69db1d275cd..269e930b3b0b 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -21,6 +21,14 @@ memory@0 {
 		reg = <0x00000000 0x00000000 0x00000000 0x10000000>;
 	};
 
+	clocks {
+		sys_clk: litex_sys_clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <100000000>;
+		};
+	};
+
 	cpus {
 		#size-cells = <0x00>;
 		#address-cells = <0x01>;
@@ -141,6 +149,20 @@ ethernet@8020000 {
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
+			clocks = <&sys_clk>;
+		};
 	};
 
 	chosen {
-- 
2.35.1

