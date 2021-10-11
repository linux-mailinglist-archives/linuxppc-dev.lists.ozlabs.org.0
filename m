Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C70234287F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 09:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSW3Z32Vdz306h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 18:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.105.233;
 helo=2.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSW372yPnz2xYV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 18:42:09 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BFC8E20215;
 Mon, 11 Oct 2021 07:04:01 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 11 Oct
 2021 09:04:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044b272651-5507-470c-94ee-4433db65a020,
 044DEDDE8B0E05FD49EE52B84AFD98BA54CEE260) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/boot: Use CONFIG_PPC_POWERNV to compile OPAL support
Date: Mon, 11 Oct 2021 09:03:56 +0200
Message-ID: <20211011070356.99952-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9a0f23a9-1979-4ae2-b462-adbd58b7beaa
X-Ovh-Tracer-Id: 16276290529440402397
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddthedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC64_BOOT_WRAPPER is selected by CPU_LITTLE_ENDIAN which is
used to compile support for other platforms such as Microwatt. There
is no need for OPAL calls on these.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/boot/serial.c | 2 +-
 arch/powerpc/boot/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index 9a19e5905485..54d2522be485 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -132,7 +132,7 @@ int serial_console_init(void)
 	else if (dt_is_compatible(devp, "fsl,mpc5200-psc-uart"))
 		rc = mpc5200_psc_console_init(devp, &serial_cd);
 #endif
-#ifdef CONFIG_PPC64_BOOT_WRAPPER
+#ifdef CONFIG_PPC_POWERNV
 	else if (dt_is_compatible(devp, "ibm,opal-console-raw"))
 		rc = opal_console_init(devp, &serial_cd);
 #endif
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 089ee3ea55c8..9993c6256ad2 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -123,7 +123,7 @@ src-wlib-y := string.S crt0.S stdio.c decompress.c main.c \
 		oflib.c ofconsole.c cuboot.c
 
 src-wlib-$(CONFIG_PPC_MPC52xx) += mpc52xx-psc.c
-src-wlib-$(CONFIG_PPC64_BOOT_WRAPPER) += opal-calls.S opal.c
+src-wlib-$(CONFIG_PPC_POWERNV) += opal-calls.S opal.c
 ifndef CONFIG_PPC64_BOOT_WRAPPER
 src-wlib-y += crtsavres.S
 endif
-- 
2.31.1

