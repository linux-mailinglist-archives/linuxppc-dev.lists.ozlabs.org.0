Return-Path: <linuxppc-dev+bounces-16364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MXTDwsXemlS2QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 15:02:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D680A26F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 15:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1P9c1bMnz2xm3;
	Thu, 29 Jan 2026 01:02:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769608964;
	cv=none; b=NThKva25xcwI1z7G/y5VIAFO9d+R9D4OQzDZTM5aP+u9xyzAvBpmTUstROSGJPGAU8xW++LdbO4nlcUFcK9h/wetuG/gmbPJlDZnZrXVBlc8tiK711QixFiDy/7TGuS560A5OR1SKS823vwzurKzYM8B5iipDZIjCDTDiKDleD/qEFh95ZubLxM0FlUVtMjCoLZesKeDHwEIGxn+GUiAIMfXEm7MzWX6J/nMoJZPDePWufoqonCpQk+0EpZ/7Tn+GlwRXzFICLCf3NLUmm2P0F7Mys06xOVgFgmurmC82VnTRw4DdR9LAQgwbOFO6oBrbYt/ac9rI3pJagxufxbBow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769608964; c=relaxed/relaxed;
	bh=yWbt6lh+3bpPLJugNJcWG7ZRS4g49UvH5frndTAUT+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cxe9BZt+4xGT3KHvYLJINkrlNumoiJQcnMxwttOLA/qUePtY4eF9th+70QDh7FKjUWlvauRM8+2onvreNaw/jvIfsYxJsGuZ+H2yeCebnmdlb5JtioFhg6xnPbL6U3PilRB5HTgK2L8S7aBs+VDwOiiGngOjZJXi++QWRYmgrfx+1ffWEw0nBVCJIZIqM3VXUn3NJ6gnSni+dkbKc+OpUVbkCQo0p/iH9NefqjhRlNtllxViIDm43Vn0R1IFL68u749P4zwYVOnSidcWR4BWSFB98iybkcWWeinsxNgyKNCPzZRZEI31NY1T9zjDoVYlgGOkd3q0TOQpJF5mzVnUyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q08SQs3X; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q08SQs3X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1P9b10XKz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 01:02:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 81D58433F5;
	Wed, 28 Jan 2026 14:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5FCC4CEF1;
	Wed, 28 Jan 2026 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608960;
	bh=DJYJy6rAk8mT7ZaSQdUIpTiwpwqy148hC1cHlbsyWMs=;
	h=From:To:Cc:Subject:Date:From;
	b=Q08SQs3Xfz4etQe09Uf2U07aKF8yM3DjGfCHspwWepYA6a4QMYujKntJdJT23t8R2
	 LjMzRMGqjS2IbK4OCx351wRmzgvot4atywiaJr/9BO8HDTuS70url9H6UJhUi9Dtxk
	 juZHnWQAq6CGv04Rx6rk1msE96O478gaC4KxoLpArKIOWsQrUEhjhwyHEFYmqdrBVG
	 CGZZ8oKf7a2zkZKmessyFz1TvrI2numIePwaxzW9SLTD+imj6e+lkZr30ktMkMzb13
	 +4te8RaxgErCavsbk3CiKQIzS/C9g+CcBi7fAwZnrjrBy6D95T2nNPwuHSQh0gqH6y
	 mPDhSsHJuNOpw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH] powerpc: dts: fsl: Drop unused .dtsi files
Date: Wed, 28 Jan 2026 08:02:20 -0600
Message-ID: <20260128140222.1627203-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16364-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.f.9.b.1.2.0.0.4.9.4.0.4.2.asn6.rspamd.com:server fail];
	FORGED_SENDER(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:richardcochran@gmail.com,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.31.64:email,0.0.42.248:email,0.0.23.112:email,0.0.3.232:email,0.3.122.160:email,0.0.54.176:email,0.0.11.184:email,0.0.7.208:email,0.0.15.160:email,0.0.50.200:email,0.6.26.128:email,0.3.126.136:email];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.1:email,0.0.39.16:email,e1000:email,e3000:email,e000:email,0.0.165.160:email,b000:email,f000:email,a000:email,0.0.4.176:email,0.1.91.168:email,0.0.35.40:email,0.0.27.88:email,0.0.58.152:email,0.0.66.104:email,0.0.62.128:email,0.0.19.136:email]
X-Rspamd-Queue-Id: 6D680A26F0
X-Rspamd-Action: no action

These files are not included by anything and therefore don't get built or
tested.

There's also no upstream driver for the interlaken-lac stuff.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/fsl/interlaken-lac-portals.dtsi  | 156 ------------------
 arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi |  45 -----
 .../boot/dts/fsl/pq3-mpic-message-B.dtsi      |  43 -----
 .../fsl/qoriq-fman3-0-10g-1-best-effort.dtsi  |  80 ---------
 4 files changed, 324 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
 delete mode 100644 arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi

diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi b/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
deleted file mode 100644
index 9cffccf4e07e..000000000000
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac-portals.dtsi
+++ /dev/null
@@ -1,156 +0,0 @@
-/* T4240 Interlaken LAC Portal device tree stub with 24 portals.
- *
- * Copyright 2012 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *       notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *       notice, this list of conditions and the following disclaimer in the
- *       documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *       names of its contributors may be used to endorse or promote products
- *       derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#address-cells = <0x1>;
-#size-cells = <0x1>;
-compatible = "fsl,interlaken-lac-portals";
-
-lportal0: lac-portal@0 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x0 0x1000>;
-};
-
-lportal1: lac-portal@1000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x1000 0x1000>;
-};
-
-lportal2: lac-portal@2000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x2000 0x1000>;
-};
-
-lportal3: lac-portal@3000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x3000 0x1000>;
-};
-
-lportal4: lac-portal@4000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x4000 0x1000>;
-};
-
-lportal5: lac-portal@5000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x5000 0x1000>;
-};
-
-lportal6: lac-portal@6000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x6000 0x1000>;
-};
-
-lportal7: lac-portal@7000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x7000 0x1000>;
-};
-
-lportal8: lac-portal@8000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x8000 0x1000>;
-};
-
-lportal9: lac-portal@9000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x9000 0x1000>;
-};
-
-lportal10: lac-portal@A000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xA000 0x1000>;
-};
-
-lportal11: lac-portal@B000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xB000 0x1000>;
-};
-
-lportal12: lac-portal@C000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xC000 0x1000>;
-};
-
-lportal13: lac-portal@D000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xD000 0x1000>;
-};
-
-lportal14: lac-portal@E000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xE000 0x1000>;
-};
-
-lportal15: lac-portal@F000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0xF000 0x1000>;
-};
-
-lportal16: lac-portal@10000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x10000 0x1000>;
-};
-
-lportal17: lac-portal@11000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x11000 0x1000>;
-};
-
-lportal18: lac-portal@1200 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x12000 0x1000>;
-};
-
-lportal19: lac-portal@13000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x13000 0x1000>;
-};
-
-lportal20: lac-portal@14000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x14000 0x1000>;
-};
-
-lportal21: lac-portal@15000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x15000 0x1000>;
-};
-
-lportal22: lac-portal@16000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x16000 0x1000>;
-};
-
-lportal23: lac-portal@17000 {
-	compatible = "fsl,interlaken-lac-portal-v1.0";
-	reg = <0x17000 0x1000>;
-};
diff --git a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi b/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
deleted file mode 100644
index e8208720ac0e..000000000000
--- a/arch/powerpc/boot/dts/fsl/interlaken-lac.dtsi
+++ /dev/null
@@ -1,45 +0,0 @@
-/*
- * T4 Interlaken Look-aside Controller (LAC) device tree stub
- *
- * Copyright 2012 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *       notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *       notice, this list of conditions and the following disclaimer in the
- *       documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *       names of its contributors may be used to endorse or promote products
- *       derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-lac: lac@229000 {
-	compatible = "fsl,interlaken-lac";
-	reg = <0x229000 0x1000>;
-	interrupts = <16 2 1 18>;
-};
-
-lac-hv@228000 {
-	compatible = "fsl,interlaken-lac-hv";
-	reg = <0x228000 0x1000>;
-	fsl,non-hv-node = <&lac>;
-};
diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi b/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
deleted file mode 100644
index 1cf0b77b1efe..000000000000
--- a/arch/powerpc/boot/dts/fsl/pq3-mpic-message-B.dtsi
+++ /dev/null
@@ -1,43 +0,0 @@
-/*
- * PQ3 MPIC Message (Group B) device tree stub [ controller @ offset 0x42400 ]
- *
- * Copyright 2012 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *       notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *       notice, this list of conditions and the following disclaimer in the
- *       documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *       names of its contributors may be used to endorse or promote products
- *       derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-message@42400 {
-	compatible = "fsl,mpic-v3.1-msgr";
-	reg = <0x42400 0x200>;
-	interrupts = <
-		0xb4 2 0 0
-		0xb5 2 0 0
-		0xb6 2 0 0
-		0xb7 2 0 0>;
-};
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
deleted file mode 100644
index 71eb75e82c2e..000000000000
--- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
+++ /dev/null
@@ -1,80 +0,0 @@
-/*
- * QorIQ FMan v3 1g port #1 device tree stub [ controller @ offset 0x400000 ]
- *
- * Copyright 2012 - 2015 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *	 notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *	 notice, this list of conditions and the following disclaimer in the
- *	 documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *	 names of its contributors may be used to endorse or promote products
- *	 derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-fman@400000 {
-	fman0_rx_0x09: port@89000 {
-		cell-index = <0x9>;
-		compatible = "fsl,fman-v3-port-rx";
-		reg = <0x89000 0x1000>;
-		fsl,fman-10g-port;
-		fsl,fman-best-effort-port;
-	};
-
-	fman0_tx_0x29: port@a9000 {
-		cell-index = <0x29>;
-		compatible = "fsl,fman-v3-port-tx";
-		reg = <0xa9000 0x1000>;
-		fsl,fman-10g-port;
-		fsl,fman-best-effort-port;
-	};
-
-	ethernet@e2000 {
-		cell-index = <1>;
-		compatible = "fsl,fman-memac";
-		reg = <0xe2000 0x1000>;
-		fsl,fman-ports = <&fman0_rx_0x09 &fman0_tx_0x29>;
-		ptp-timer = <&ptp_timer0>;
-		pcsphy-handle = <&pcsphy1>, <&qsgmiia_pcs1>;
-		pcs-handle-names = "sgmii", "qsgmii";
-	};
-
-	mdio@e1000 {
-		qsgmiia_pcs1: ethernet-pcs@1 {
-			compatible = "fsl,lynx-pcs";
-			reg = <1>;
-		};
-	};
-
-	mdio@e3000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
-		reg = <0xe3000 0x1000>;
-		fsl,erratum-a011043; /* must ignore read errors */
-
-		pcsphy1: ethernet-phy@0 {
-			reg = <0x0>;
-		};
-	};
-};
-- 
2.51.0


