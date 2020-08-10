Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F20FA240811
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:01:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQK1S4L9LzDqK1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:01:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sym2.noone.org
 (client-ip=178.63.92.236; helo=sym2.noone.org;
 envelope-from=tklauser@sym2.noone.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=distanz.ch
Received: from sym2.noone.org (sym2.noone.org [178.63.92.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQJwz5PJ5zDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 00:57:54 +1000 (AEST)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BQBWk1r1VzvjcZ; Mon, 10 Aug 2020 12:09:06 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation/features: refresh powerpc arch support files
Date: Mon, 10 Aug 2020 12:09:06 +0200
Message-Id: <20200810100906.3805-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Support for these was added by commit aa65ff6b18e0 ("powerpc/64s:
Implement queued spinlocks and rwlocks").

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 Documentation/features/locking/queued-rwlocks/arch-support.txt  | 2 +-
 .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
index 5c6bcfcf8e1f..4dd5e554873f 100644
--- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: |  ok  |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: | TODO |
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index b55e420a34ea..b16d4f71e5ce 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: |  ok  |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: | TODO |
-- 
2.27.0

