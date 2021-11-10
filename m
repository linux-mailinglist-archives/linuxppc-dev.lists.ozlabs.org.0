Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50544C507
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 17:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq9Ml6j9vz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 03:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 432 seconds by postgrey-1.36 at boromir;
 Thu, 11 Nov 2021 03:30:49 AEDT
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq9MF5DFDz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 03:30:48 +1100 (AEDT)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4Hq9Bc5nfbzMqpGQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 17:23:20 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9dc9:efd5:4c6f:baa9])
 by laurent.telenet-ops.be with bizsmtp
 id GgPK2600C1LAWtA01gPKaH; Wed, 10 Nov 2021 17:23:20 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mkqNb-00BUyT-26; Wed, 10 Nov 2021 17:23:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mkqNa-007g1r-LI; Wed, 10 Nov 2021 17:23:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH/RFC] of: Shrink struct of_device_id
Date: Wed, 10 Nov 2021 17:23:17 +0100
Message-Id: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
large.  It contains fixed-size strings for a name, a type, and a
compatible value, but the first two are barely used.
OF device ID tables contain multiple entries, plus an empty sentinel
entry.

Statistics for my current kernel source tree:
  - 4487 tables with 16836 entries (3367200 bytes)
  - 176 names (average 6.7 max 23 chars)
  - 66 types (average 5.1 max 21 chars)
  - 12192 compatible values (average 18.0 max 45 chars)
Taking into account the minimum needed size to store the strings, only
6.9% of the allocated space is used...

Reduce kernel size by reducing the sizes of the fixed strings by one
half.

This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
KiB.  For a typical kernel supporting a single board, you can expect to
save 50-100 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  - While gcc complains if the non-NUL characters in a string do not fit
    in the available space, it does not complain if there is no space to
    store the string's NUL-terminator.  However, that should be caught
    during testing, as the affected entry won't ever match.  The kernel
    won't crash, as such strings will still be terminated by the
    sentinel in the table.

  - We could save even more by converting the strings from fixed-size
    arrays to pointers, at the expense of making it harder to mark
    entries __init.  Given most drivers support binding and unbinding
    and thus cannot use __init for of_device_id tables, perhaps that's
    the way to go?

Thanks for your comments!
---
 include/linux/mod_devicetable.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b219920..2bb2558d52d30d2b 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -266,9 +266,9 @@ struct sdw_device_id {
  * Struct used for matching a device
  */
 struct of_device_id {
-	char	name[32];
-	char	type[32];
-	char	compatible[128];
+	char	name[24];
+	char	type[24];
+	char	compatible[48];
 	const void *data;
 };
 
-- 
2.25.1

