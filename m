Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC592BEC7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 17:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJQSg1NXWz3ck9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 01:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 962 seconds by postgrey-1.37 at boromir; Wed, 10 Jul 2024 01:50:39 AEST
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJQSH56jtz3bSx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 01:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WJQ5f4LDqz9sSq;
	Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmxSbZ-bi7i5; Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WJQ5f3VCQz9sSp;
	Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 654A68B778;
	Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gluke2XNulId; Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.9])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3079C8B773;
	Tue,  9 Jul 2024 17:34:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation/powerpc: Remove retired CPUs from list of supported CPUs
Date: Tue,  9 Jul 2024 17:34:27 +0200
Message-ID: <e33ba7b242a104259fbcf1a4d4bdb0f1d1db6882.1720539170.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720539267; l=3729; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=g2TeahJZO7npPyW42OA1MqX8NHOBTRgERAWE4Igw29M=; b=5TIs567xNQZ7AzoBPcbZ9jugS2tqaQnuPfBfdj3T0d+pd1+P1cxAqe6KDqoXJrR3a5cXlTwWi avPRafFhOgLApUgIeYDoGkN7e/w9/yiASdMp2XCzTzLeWyHg2d+vVfb
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

601, power4, 401, 403, 405, e200 and IBM-A2 support was removed by
by following commits:
- Commit 8b14e1dff067 ("powerpc: Remove support for PowerPC 601")
- Commit 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
- Commit 1b5c0967ab8a ("powerpc/40x: Remove support for IBM 403GCX")
- Commit 39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
- Commit fb5a515704d7 ("powerpc: Remove platforms/wsp and associated
pieces")

Remove them from the list of supported CPUs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 Documentation/arch/powerpc/cpu_families.rst | 56 +++------------------
 1 file changed, 8 insertions(+), 48 deletions(-)

diff --git a/Documentation/arch/powerpc/cpu_families.rst b/Documentation/arch/powerpc/cpu_families.rst
index eb7e60649b43..713806eb14bd 100644
--- a/Documentation/arch/powerpc/cpu_families.rst
+++ b/Documentation/arch/powerpc/cpu_families.rst
@@ -20,10 +20,10 @@ Book3S (aka sPAPR)
    +--------------+                 +----------------+
           |
           |
-          v
-   +--------------+                 +----------------+      +------+
-   |     601      | --------------> |      603       | ---> | e300 |
-   +--------------+                 +----------------+      +------+
+          |
+          |                         +----------------+      +------+
+          |-----------------------> |      603       | ---> | e300 |
+          |                         +----------------+      +------+
           |                                 |
           |                                 |
           v                                 v
@@ -50,10 +50,10 @@ Book3S (aka sPAPR)
    +--------------+                 +----------------+
           |                                 |
           |                                 |
-          v                                 v
-   +--------------+                 +----------------+
-   |    POWER4    |                 |      7455      |
-   +--------------+                 +----------------+
+          |                                 v
+          |                         +----------------+
+          |                         |      7455      |
+          |                         +----------------+
           |                                 |
           |                                 |
           v                                 v
@@ -128,24 +128,6 @@ IBM BookE
 - All 32 bit::
 
    +--------------+
-   |     401      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
-   |     403      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
-   |     405      |
-   +--------------+
-          |
-          |
-          v
-   +--------------+
    |     440      |
    +--------------+
           |
@@ -186,11 +168,6 @@ Freescale BookE
 - e6500 adds HW loaded indirect TLB entries.
 - Mix of 32 & 64 bit::
 
-   +--------------+
-   |     e200     |
-   +--------------+
-
-
    +--------------------------------+
    |              e500              |
    +--------------------------------+
@@ -218,20 +195,3 @@ Freescale BookE
    +--------------------------------+
    | e6500 (HW TLB) (Multithreaded) |
    +--------------------------------+
-
-
-IBM A2 core
------------
-
-- Book3E, software loaded TLB + HW loaded indirect TLB entries.
-- 64 bit::
-
-   +--------------+     +----------------+
-   |   A2 core    | --> |      WSP       |
-   +--------------+     +----------------+
-           |
-           |
-           v
-   +--------------+
-   |     BG/Q     |
-   +--------------+
-- 
2.44.0

