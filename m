Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFD22A1CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 00:10:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBqQm1q4CzDr3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:10:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DaGkdRNf; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBj5F03YrzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:24:44 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id dg28so2254043edb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vHgiL55jxDrujS/wtQnL77G2JrcZ1DngkTtPEjQmevw=;
 b=DaGkdRNfS8eXOBKB5sp0VfYsh5wlQq7pP2Y+QI84Pxei90Prd/XesQk8y64weQCjFE
 L86OcBmZoUSZgIa2YE2s+OKBewK5rBIob8PYrvByLTE9XNqc8RLuImeOh84tsK91hpi3
 i8CV2XUi0ZabD2QljLDMLQVJ3A0pnt+qRjIzv53RRgFbfDOWO4fQpAJ1veUbAA/PttcU
 DcRUDiUaOESxMwRpXL8NgIwbGJudZJ328hRyy4/awcGF/wyHSPiJ9nSjf068Upy+b8oD
 YMOHGhrd1G6VRmJHAMmAMZc42+x3O6Kqku58mnjIqCAQvoiUqDX3+yhM4Dyiutqv/OjC
 8GVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vHgiL55jxDrujS/wtQnL77G2JrcZ1DngkTtPEjQmevw=;
 b=Nv4mAtgS5d6SZVD6I/PQaBRvbPRNCw6GIy9Wrloj8PsdmRxPdQrt1Ciz9lIT4WykNI
 i9Obqp/kLny3Ahf4heeVVTsRfVIC4VeNwCkmfCOlUg/fijaFS+adnIvFKNAm2J5o/EtY
 1n/PxhIUi7R9VjM8cbL9Rl00ZNeoF4lxzq/0+PJ3YZk7M4+2SzYpBUtrLNcrPXXNXTGC
 l1e3kfDD7ImUHb9zLSdgzrNk0ypCtV8N7kEHUC0qtTsRlfJtHf5I1pal3xJRLuk+KtTk
 rlZ4lcrJ2h9XJMYpO3Zgqf1Nv4B18noB65tXvWe7zWvcyXlPtLZk/KarZ9bLgc2Vq1Ox
 FfTg==
X-Gm-Message-State: AOAM5321xRazj9JLc3s5d79heG4g7RE8I7RaG278UtXXbCCAMAg1bZUb
 12kESIZVhA1Ejk1Q6++C4uA=
X-Google-Smtp-Source: ABdhPJyXxT+y27dnP3zqkhp3Z0x2wLeOmgRRK6nopGhYGs2ugqJ+s1/IyCgvhCQI1tHV163CaotnFQ==
X-Received: by 2002:a50:fe0c:: with SMTP id f12mr496188edt.360.1595438681135; 
 Wed, 22 Jul 2020 10:24:41 -0700 (PDT)
Received: from localhost.localdomain ([188.25.219.134])
 by smtp.gmail.com with ESMTPSA id bt26sm311517edb.17.2020.07.22.10.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 10:24:40 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: robh+dt@kernel.org, shawnguo@kernel.org, mpe@ellerman.id.au,
 devicetree@vger.kernel.org
Subject: [PATCH devicetree 1/4] powerpc: dts: t1040: add bindings for Seville
 Ethernet switch
Date: Wed, 22 Jul 2020 20:24:19 +0300
Message-Id: <20200722172422.2590489-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722172422.2590489-1-olteanv@gmail.com>
References: <20200722172422.2590489-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jul 2020 08:08:49 +1000
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
Cc: madalin.bucur@oss.nxp.com, linux-kernel@vger.kernel.org,
 radu-andrei.bulie@nxp.com, fido_max@inbox.ru, paulus@samba.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the description of the embedded L2 switch inside the SoC dtsi file
for NXP T1040.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index 315d0557eefc..4af856dcc6a3 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -628,6 +628,81 @@ mdio@fd000 {
 			status = "disabled";
 		};
 	};
+
+	seville_switch: ethernet-switch@800000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "mscc,vsc9953-switch";
+		little-endian;
+		reg = <0x800000 0x290000>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			seville_port0: port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			seville_port1: port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			seville_port2: port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			seville_port3: port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			seville_port4: port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+
+			seville_port5: port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+
+			seville_port6: port@6 {
+				reg = <6>;
+				status = "disabled";
+			};
+
+			seville_port7: port@7 {
+				reg = <7>;
+				status = "disabled";
+			};
+
+			seville_port8: port@8 {
+				reg = <8>;
+				phy-mode = "internal";
+				status = "disabled";
+
+				fixed-link {
+					speed = <2500>;
+					full-duplex;
+				};
+			};
+
+			seville_port9: port@9 {
+				reg = <9>;
+				phy-mode = "internal";
+				status = "disabled";
+
+				fixed-link {
+					speed = <2500>;
+					full-duplex;
+				};
+			};
+		};
+	};
 };
 
 &qe {
-- 
2.25.1

