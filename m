Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D1D3AC19F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lPr0d6xz3dBZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=u3tzV9RN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=u3tzV9RN; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lMM1nDMz3c1W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:55 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5lML1lQ6z9sf9; Fri, 18 Jun 2021 13:50:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5lML0yk9z9sXb; Fri, 18 Jun 2021 13:50:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623988254; bh=s5Z/9+wzpKfJbyxl02VCPCUVIFYSnbMvGlkzbNN8QeE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=u3tzV9RN8oD6/vtVarJM/oao7Car2SjaFSv2ULy6nxCqDPQwQYxyMPWypfFOACNIf
 xv7UWxJ9Lu2r5VfLi5fuDz0DQmB6WNpVFRC2JrnQqf01fAh/JnoEUlh8dgpDc0pXRF
 Gc8IdH07+QRnB6i6Ebb3mbV+EpMrkAElL6to9YkYy0iwAZUJlvII5PhePpBFUMrbMb
 yF6sKy7O4jVemU/38xHmN1vzdSNCfuIeij2/LmNYGho1u7m3ggKrvdmknAHbZbnG2m
 QgvRvZqgbX+AYIzzW9/xstPLslr0T4rouVtipr++7OynFI5EQm3wHDgUmkQiVUsXfe
 7flu4TRVJ5r7A==
Date: Fri, 18 Jun 2021 13:44:16 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/9] powerpc: Add Microwatt device tree
Message-ID: <YMwWkPcXlGDSQ9Q3@thinks.paulus.ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
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

Microwatt currently runs with MSR[HV] = 0, hence the usable-privilege
properties don't have bit 2 (for HV support) set, and we need the
/chosen/ibm,architecture-vec-5 property.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/dts/microwatt.dts | 98 +++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/microwatt.dts

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
new file mode 100644
index 000000000000..ac264ad3faaf
--- /dev/null
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -0,0 +1,98 @@
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
+			};
+
+			little-endian {
+				isa = <2050>;
+				usable-privilege = <3>;
+				hwcap-bit-nr = <1>;
+			};
+
+			cache-inhibited-large-page {
+				isa = <2040>;
+				usable-privilege = <2>;
+			};
+
+			fixed-point-v3 {
+				isa = <3000>;
+				usable-privilege = <3>;
+			};
+
+			no-execute {
+				isa = <2010>;
+				usable-privilege = <2>;
+			};
+
+			floating-point {
+				hwcap-bit-nr = <27>;
+				isa = <0>;
+				usable-privilege = <3>;
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
+			d-cache-sets = <2>;
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
+			ibm,chip-id = <0>;
+		};
+	};
+
+	chosen {
+		bootargs = "";
+		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00
+					  00 00 00 00 00 00 00 00 40 00 40];
+	};
+
+};
-- 
2.31.1

