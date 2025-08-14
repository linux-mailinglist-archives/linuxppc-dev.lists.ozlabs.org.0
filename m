Return-Path: <linuxppc-dev+bounces-11011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72FB26811
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 15:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2ms758zmz30T9;
	Thu, 14 Aug 2025 23:52:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755179563;
	cv=none; b=hlKkq3ov0HrulXp9SYsSHTvVCKl3ZQQ6BzKvJw5UqiZbRDNvZZU5eo4oTWcyEgMev9CJmMb1lLxEJP6AvpogsWSO7HAcEqoNnW42tzn5gNaYlhUf3tnEIZqx+TXKWY3FH+KOzl+Ra+zvcq7dR0kf1hC2q1g/q58SN/JrHBJlFJRWI8IqZvrJk0cc86IWPk44mI7SQZsarHRGMaNGE55q0su/Duaqcb4/kyV4ZL6p7u0uGQPa/uFet/+FA4XexEMHjle6hXQ6uK2u8aYSyEM73OiOX2Gncpb/wdOyoLLCsozaPETH9Ab7TaObrzP+vfF7tbnEUSHKGaANGjnaP0tMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755179563; c=relaxed/relaxed;
	bh=aRf4+ea6X8TVUwTTRmlqgZ5W0PCxJ47ba1uhMItLiQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeWMxIU9DdzW0g04zj8OtP8A1ba8HoFxoQMgr9/5zNVxgEvtd0SOfnKGY8wrQI0TUgyf8Alag1GAyox3wGO3RwLg3dSRn+5KHFOwSbaC1+cr1ZuoMYanrD7+lDgN/7SNa+myQ2Yl6nwjP/TOAgN2IFSvt9Naoky+SGcPC1ivhdmPoI5WG7grk0A+m7SgaUorcUpHv3v8rPmPgHlR3G/lQvGOY1PJQmu5vlZkFjmdZdKxVPBbX6DTFbrS/kl92M8kbuY4VCLCc6gDlEWI65uxTTPzMMI9KP7PUHob/w4eHW5roZDhOzaY62yE72jVGjur+N3TPrhc54MEDbjT8xep/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n4s69L1v; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n4s69L1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2ms675Xfz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 23:52:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A17C344D11;
	Thu, 14 Aug 2025 13:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E80EC4CEED;
	Thu, 14 Aug 2025 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755179560;
	bh=YVEL4qHwQgtfbHG+I3WiGlyaT3HMVv50NMOTP8/4a9U=;
	h=From:To:Cc:Subject:Date:From;
	b=n4s69L1vyfn02IWPi3qjxNuzZiiTe6HbC5SpHqwwZRZovypprfjb3V54PPxZHRjEh
	 yye9ad09dvbTaNYJyohgDJBSfnb42xo8WjqVqMjWfKrAhPU5Ezbwa4LqcbWAGqPICx
	 bVn0b/VL6RkbQijQ4dEedlg2li+pLzWBZL7cdjW8ylhVdR67fdPO0vmFEa3amnhZaq
	 rxNUxGuD1M+MqUFmqCD1Z0Jkpp8E9Q/6Rm9lvI+zLwybxbJ11O6UdVvlxylko9VrLL
	 35QiMbP3DELeBk1Mj1P6ThCN60wA1Ij0rEfjgbchRn4WiIGAaz+xlVwDnOfA2HXsjv
	 SwZV1Q2GHUDJA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
Date: Thu, 14 Aug 2025 08:51:56 -0500
Message-ID: <20250814135157.2747346-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The chrp,open-pic binding schema already supports the "fsl,mpic"
compatible. Add a couple of missing properties and support for 4
"#interrupt-cells" to the chrp,open-pic binding, so fsl/mpic.txt can be
removed.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Add support for 4 #interrupt-cells
---
 .../interrupt-controller/chrp,open-pic.yaml   |  17 +-
 .../devicetree/bindings/powerpc/fsl/mpic.txt  | 231 ------------------
 2 files changed, 16 insertions(+), 232 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
index f0d9bbd7d510..642738512f3c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/chrp,open-pic.yaml
@@ -36,12 +36,27 @@ properties:
     const: 0
 
   '#interrupt-cells':
-    const: 2
+    description:
+      A value of 4 means that interrupt specifiers contain the interrupt-type or
+      type-specific information cells.
+    enum: [ 2, 4 ]
 
   pic-no-reset:
     description: Indicates the PIC shall not be reset during runtime initialization.
     type: boolean
 
+  single-cpu-affinity:
+    description:
+      If present, non-IPI interrupts will be routed to a single CPU at a time.
+    type: boolean
+
+  last-interrupt-source:
+    description:
+      Some MPICs do not correctly report the number of hardware sources in the
+      global feature registers. This value, if specified, overrides the value
+      read from MPIC_GREG_FEATURE_LAST_SRC.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mpic.txt b/Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
deleted file mode 100644
index dc5744636a57..000000000000
--- a/Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
+++ /dev/null
@@ -1,231 +0,0 @@
-=====================================================================
-Freescale MPIC Interrupt Controller Node
-Copyright (C) 2010,2011 Freescale Semiconductor Inc.
-=====================================================================
-
-The Freescale MPIC interrupt controller is found on all PowerQUICC
-and QorIQ processors and is compatible with the Open PIC.  The
-notable difference from Open PIC binding is the addition of 2
-additional cells in the interrupt specifier defining interrupt type
-information.
-
-PROPERTIES
-
-  - compatible
-      Usage: required
-      Value type: <string>
-      Definition: Shall include "fsl,mpic".  Freescale MPIC
-          controllers compatible with this binding have Block
-          Revision Registers BRR1 and BRR2 at offset 0x0 and
-          0x10 in the MPIC.
-
-  - reg
-      Usage: required
-      Value type: <prop-encoded-array>
-      Definition: A standard property.  Specifies the physical
-          offset and length of the device's registers within the
-          CCSR address space.
-
-  - interrupt-controller
-      Usage: required
-      Value type: <empty>
-      Definition: Specifies that this node is an interrupt
-          controller
-
-  - #interrupt-cells
-      Usage: required
-      Value type: <u32>
-      Definition: Shall be 2 or 4.  A value of 2 means that interrupt
-          specifiers do not contain the interrupt-type or type-specific
-          information cells.
-
-  - #address-cells
-      Usage: required
-      Value type: <u32>
-      Definition: Shall be 0.
-
-  - pic-no-reset
-      Usage: optional
-      Value type: <empty>
-      Definition: The presence of this property specifies that the
-          MPIC must not be reset by the client program, and that
-          the boot program has initialized all interrupt source
-          configuration registers to a sane state-- masked or
-          directed at other cores.  This ensures that the client
-          program will not receive interrupts for sources not belonging
-          to the client.  The presence of this property also mandates
-          that any initialization related to interrupt sources shall
-          be limited to sources explicitly referenced in the device tree.
-
-  - big-endian
-      Usage: optional
-      Value type: <empty>
-          If present the MPIC will be assumed to be big-endian.  Some
-          device-trees omit this property on MPIC nodes even when the MPIC is
-          in fact big-endian, so certain boards override this property.
-
-  - single-cpu-affinity
-      Usage: optional
-      Value type: <empty>
-          If present the MPIC will be assumed to only be able to route
-          non-IPI interrupts to a single CPU at a time (EG: Freescale MPIC).
-
-  - last-interrupt-source
-      Usage: optional
-      Value type: <u32>
-          Some MPICs do not correctly report the number of hardware sources
-          in the global feature registers.  If specified, this field will
-          override the value read from MPIC_GREG_FEATURE_LAST_SRC.
-
-INTERRUPT SPECIFIER DEFINITION
-
-  Interrupt specifiers consists of 4 cells encoded as
-  follows:
-
-   <1st-cell>   interrupt-number
-
-                Identifies the interrupt source.  The meaning
-                depends on the type of interrupt.
-
-                Note: If the interrupt-type cell is undefined
-                (i.e. #interrupt-cells = 2), this cell
-                should be interpreted the same as for
-                interrupt-type 0-- i.e. an external or
-                normal SoC device interrupt.
-
-   <2nd-cell>   level-sense information, encoded as follows:
-                    0 = low-to-high edge triggered
-                    1 = active low level-sensitive
-                    2 = active high level-sensitive
-                    3 = high-to-low edge triggered
-
-   <3rd-cell>   interrupt-type
-
-                The following types are supported:
-
-                  0 = external or normal SoC device interrupt
-
-                      The interrupt-number cell contains
-                      the SoC device interrupt number.  The
-                      type-specific cell is undefined.  The
-                      interrupt-number is derived from the
-                      MPIC a block of registers referred to as
-                      the "Interrupt Source Configuration Registers".
-                      Each source has 32-bytes of registers
-                      (vector/priority and destination) in this
-                      region.   So interrupt 0 is at offset 0x0,
-                      interrupt 1 is at offset 0x20, and so on.
-
-                  1 = error interrupt
-
-                      The interrupt-number cell contains
-                      the SoC device interrupt number for
-                      the error interrupt.  The type-specific
-                      cell identifies the specific error
-                      interrupt number.
-
-                  2 = MPIC inter-processor interrupt (IPI)
-
-                      The interrupt-number cell identifies
-                      the MPIC IPI number.  The type-specific
-                      cell is undefined.
-
-                  3 = MPIC timer interrupt
-
-                      The interrupt-number cell identifies
-                      the MPIC timer number.  The type-specific
-                      cell is undefined.
-
-   <4th-cell>   type-specific information
-
-                The type-specific cell is encoded as follows:
-
-                 - For interrupt-type 1 (error interrupt),
-                   the type-specific cell contains the
-                   bit number of the error interrupt in the
-                   Error Interrupt Summary Register.
-
-EXAMPLE 1
-	/*
-	 * mpic interrupt controller with 4 cells per specifier
-	 */
-	mpic: pic@40000 {
-		compatible = "fsl,mpic";
-		interrupt-controller;
-		#interrupt-cells = <4>;
-		#address-cells = <0>;
-		reg = <0x40000 0x40000>;
-	};
-
-EXAMPLE 2
-	/*
-	 * The MPC8544 I2C controller node has an internal
-	 * interrupt number of 27.  As per the reference manual
-	 * this corresponds to interrupt source configuration
-	 * registers at 0x5_0560.
-	 *
-	 * The interrupt source configuration registers begin
-	 * at 0x5_0000.
-	 *
-	 * To compute the interrupt specifier interrupt number
-         *
-	 *       0x560 >> 5 = 43
-	 *
-	 * The interrupt source configuration registers begin
-	 * at 0x5_0000, and so the i2c vector/priority registers
-	 * are at 0x5_0560.
-	 */
-	i2c@3000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		cell-index = <0>;
-		compatible = "fsl-i2c";
-		reg = <0x3000 0x100>;
-		interrupts = <43 2>;
-		interrupt-parent = <&mpic>;
-		dfsrr;
-	};
-
-
-EXAMPLE 3
-	/*
-	 *  Definition of a node defining the 4
-	 *  MPIC IPI interrupts.  Note the interrupt
-	 *  type of 2.
-	 */
-	ipi@410a0 {
-		compatible = "fsl,mpic-ipi";
-		reg = <0x40040 0x10>;
-		interrupts = <0 0 2 0
-		              1 0 2 0
-		              2 0 2 0
-		              3 0 2 0>;
-	};
-
-EXAMPLE 4
-	/*
-	 *  Definition of a node defining the MPIC
-	 *  global timers.  Note the interrupt
-	 *  type of 3.
-	 */
-	timer0: timer@41100 {
-		compatible = "fsl,mpic-global-timer";
-		reg = <0x41100 0x100 0x41300 4>;
-		interrupts = <0 0 3 0
-		              1 0 3 0
-		              2 0 3 0
-		              3 0 3 0>;
-	};
-
-EXAMPLE 5
-	/*
-	 * Definition of an error interrupt (interrupt type 1).
-	 * SoC interrupt number is 16 and the specific error
-         * interrupt bit in the error interrupt summary register
-	 * is 23.
-	 */
-	memory-controller@8000 {
-		compatible = "fsl,p4080-memory-controller";
-		reg = <0x8000 0x1000>;
-		interrupts = <16 2 1 23>;
-	};
-- 
2.47.2


