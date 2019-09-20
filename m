Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21CB9CF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 09:38:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46b2WH1H71zDqQP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 17:38:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=lei.xu@nxp.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZS2N1GNWzDrZD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 18:44:35 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 94BDF1A0097;
 Fri, 20 Sep 2019 10:44:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2ED431A004C;
 Fri, 20 Sep 2019 10:44:28 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A35B6402E6;
 Fri, 20 Sep 2019 16:44:23 +0800 (SGT)
From: Lei Xu <lei.xu@nxp.com>
To: linux-devel@linux.nxdi.nxp.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc:mark expected switch fall-throughs
Date: Fri, 20 Sep 2019 16:45:40 +0800
Message-Id: <20190920084540.3449-1-lei.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 21 Sep 2019 17:35:54 +1000
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
Cc: Lei Xu <lei.xu@nxp.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building kernel with -Wimplicit-fallthrough and -Werror, it
reported the follwoing errors:

arch/powerpc/kernel/align.c: In function ‘emulate_spe’:
arch/powerpc/kernel/align.c:178:8: error: this statement may fall through [-Werror=implicit-fallthrough=]
    ret |= __get_user_inatomic(temp.v[3], p++);
        ^~
arch/powerpc/kernel/align.c:179:3: note: here
   case 4:
   ^~~~
arch/powerpc/kernel/align.c:181:8: error: this statement may fall through [-Werror=implicit-fallthrough=]
    ret |= __get_user_inatomic(temp.v[5], p++);
        ^~
arch/powerpc/kernel/align.c:182:3: note: here
   case 2:
   ^~~~
arch/powerpc/kernel/align.c:261:8: error: this statement may fall through [-Werror=implicit-fallthrough=]
    ret |= __put_user_inatomic(data.v[3], p++);
        ^~
arch/powerpc/kernel/align.c:262:3: note: here
   case 4:
   ^~~~
arch/powerpc/kernel/align.c:264:8: error: this statement may fall through [-Werror=implicit-fallthrough=]
    ret |= __put_user_inatomic(data.v[5], p++);
        ^~
arch/powerpc/kernel/align.c:265:3: note: here
   case 2:
   ^~~~
cc1: all warnings being treated as errors

This patch fixs the above errors.

Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
 arch/powerpc/kernel/align.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 7107ad8..92045ed 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -176,9 +176,11 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 			ret |= __get_user_inatomic(temp.v[1], p++);
 			ret |= __get_user_inatomic(temp.v[2], p++);
 			ret |= __get_user_inatomic(temp.v[3], p++);
+			/* fall through */
 		case 4:
 			ret |= __get_user_inatomic(temp.v[4], p++);
 			ret |= __get_user_inatomic(temp.v[5], p++);
+			/* fall through */
 		case 2:
 			ret |= __get_user_inatomic(temp.v[6], p++);
 			ret |= __get_user_inatomic(temp.v[7], p++);
@@ -259,9 +261,11 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 			ret |= __put_user_inatomic(data.v[1], p++);
 			ret |= __put_user_inatomic(data.v[2], p++);
 			ret |= __put_user_inatomic(data.v[3], p++);
+			/* fall through */
 		case 4:
 			ret |= __put_user_inatomic(data.v[4], p++);
 			ret |= __put_user_inatomic(data.v[5], p++);
+			/* fall through */
 		case 2:
 			ret |= __put_user_inatomic(data.v[6], p++);
 			ret |= __put_user_inatomic(data.v[7], p++);
-- 
2.9.3

