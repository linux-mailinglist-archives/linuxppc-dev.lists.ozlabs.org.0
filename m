Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2C7AAD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 16:22:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ydzQ68hyzDqLb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 00:21:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ydwb0NWCzDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 00:19:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45ydwZ4YDTz9s8m; Wed, 31 Jul 2019 00:19:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45ydwZ3zM2z9sBF; Wed, 31 Jul 2019 00:19:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/spe: Mark expected switch fall-throughs
Date: Wed, 31 Jul 2019 00:19:17 +1000
Message-Id: <20190730141917.21817-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark switch cases where we are expecting to fall through.

Fixes errors such as below, seen with mpc85xx_defconfig:

  arch/powerpc/kernel/align.c: In function 'emulate_spe':
  arch/powerpc/kernel/align.c:178:8: error: this statement may fall through
    ret |= __get_user_inatomic(temp.v[3], p++);
        ^~

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/align.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 7107ad86de65..92045ed64976 100644
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
2.20.1

