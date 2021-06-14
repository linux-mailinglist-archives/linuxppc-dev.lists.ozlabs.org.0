Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB13A7250
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:06:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3nB44d8Xz3bsV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:06:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=qUVr1F+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=qUVr1F+4; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3n9c3hM9z2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 09:05:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3n9Z58VJz9ssP; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G3n9Z4Pmmz9sXL; Tue, 15 Jun 2021 09:05:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623711938; bh=sb1OIBZW4E5CnvLhi1CwpO8pddAPS+5H4j2SD0xbFkQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=qUVr1F+4sGbgHJy2kHb3QqAMdz6XO3jxBFzqvdQ6R1QdBvvwrw6s0n4B9sy9lo768
 a8ed8Lh/mFqV/QAlNsdLPrYKd9iONp4jUdwjLy5n4OMhNS/nk8st+NVdai0SIu66Mt
 /1AKmXT3CvUdun1X+4SEU2ZbkYIiNSieAoc+RkbirM4V9omXiuHZFRpFv6TwbSGhrE
 UNdzgsmH1HIar6n2PGDtTjmCovgGh+ybsNXr6q/7GMJ51k/3SXP75pLeWVbG6E0X+s
 Vlj5WMzCBaNZTatK92tP9bf/6zRE8V1RF5RC2ybYxawDYyzAMbRjyipWEBtJDxoDXQ
 MQehBm/t2hY6g==
Date: Tue, 15 Jun 2021 08:58:24 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 02/11] powerpc: Add Microwatt device tree
Message-ID: <YMffEN3q5RlLeg4W@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/dts/microwatt.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/microwatt.dts

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
new file mode 100644
index 000000000000..9b2e64da9432
--- /dev/null
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -0,0 +1,105 @@
+/dts-v1/;
+
+/ {
+	#size-cells = <0x02>;
+	#address-cells = <0x02>;
+	model-name = "microwatt";
+	compatible = "microwatt-soc";
+
+	reserved-memory {
+		#size-cells = <0x02>;
+		#address-cells = <0x02>;
+		ranges;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x00000000 0x00000000 0x10000000>;
+	};
+
+	cpus {
+		#size-cells = <0x00>;
+		#address-cells = <0x01>;
+
+		ibm,powerpc-cpu-features {
+			display-name = "Microwatt";
+			isa = <3000>;
+			device_type = "cpu-features";
+			compatible = "ibm,powerpc-cpu-features";
+
+			mmu-radix {
+				isa = <3000>;
+				usable-privilege = <2>;
+				os-support = <0x00>;
+			};
+
+			little-endian {
+				isa = <0>;
+				usable-privilege = <3>;
+				os-support = <0x00>;
+			};
+
+			cache-inhibited-large-page {
+				isa = <0x00>;
+				usable-privilege = <2>;
+				os-support = <0x00>;
+			};
+
+			fixed-point-v3 {
+				isa = <3000>;
+				usable-privilege = <3>;
+			};
+
+			no-execute {
+				isa = <0x00>;
+				usable-privilege = <2>;
+				os-support = <0x00>;
+			};
+
+			floating-point {
+				hfscr-bit-nr = <0x00>;
+				hwcap-bit-nr = <0x1b>;
+				isa = <0x00>;
+				usable-privilege = <0x07>;
+				hv-support = <0x00>;
+				os-support = <0x00>;
+			};
+		};
+
+		PowerPC,Microwatt@0 {
+			i-cache-sets = <2>;
+			ibm,dec-bits = <64>;
+			reservation-granule-size = <64>;
+			clock-frequency = <100000000>;
+			timebase-frequency = <100000000>;
+			i-tlb-sets = <1>;
+			ibm,ppc-interrupt-server#s = <0>;
+			i-cache-block-size = <64>;
+			d-cache-block-size = <64>;
+			ibm,pa-features = [40 00 c2 27 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 80 00 80 00 00 00 80 00 80 00 00 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00];
+			d-cache-sets = <2>;
+			ibm,pir = <0x3c>;
+			i-tlb-size = <64>;
+			cpu-version = <0x990000>;
+			status = "okay";
+			i-cache-size = <0x1000>;
+			ibm,processor-radix-AP-encodings = <0x0c 0xa0000010 0x20000015 0x4000001e>;
+			tlb-size = <0>;
+			tlb-sets = <0>;
+			device_type = "cpu";
+			d-tlb-size = <128>;
+			d-tlb-sets = <2>;
+			reg = <0>;
+			general-purpose;
+			64-bit;
+			d-cache-size = <0x1000>;
+			ibm,chip-id = <0x00>;
+		};
+	};
+
+	chosen {
+		bootargs = "";
+		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 40];
+	};
+
+};
-- 
2.31.1

