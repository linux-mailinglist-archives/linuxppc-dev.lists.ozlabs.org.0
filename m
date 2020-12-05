Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F642CF939
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 04:50:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnwbM48D9zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 14:50:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CnwYp1ZWmzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 14:49:34 +1100 (AEDT)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 1A4412B617; Fri,  4 Dec 2020 22:49:32 -0500 (EST)
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Message-Id: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] MAINTAINERS: Update 68k Mac entry
Date: Sat, 05 Dec 2020 14:46:27 +1100
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
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two files under drivers/macintosh are actually m68k-only. I think that
patches for these files should be reviewed in the appropriate forum and
merged via the appropriate tree, rather than falling to the powerpc
maintainers to deal with. Update the "M68K ON APPLE MACINTOSH" section
accordingly.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Joshua Thompson <funaho@jurai.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867157311dc8..e8fa0c9645d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10322,6 +10322,8 @@ L:	linux-m68k@lists.linux-m68k.org
 S:	Maintained
 W:	http://www.mac.linux-m68k.org/
 F:	arch/m68k/mac/
+F:	drivers/macintosh/adb-iop.c
+F:	drivers/macintosh/via-macii.c
 
 M68K ON HP9000/300
 M:	Philip Blundell <philb@gnu.org>
-- 
2.26.2

