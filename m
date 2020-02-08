Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FECA1564B8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 15:12:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FDd06qN3zDqXY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 01:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.130; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wanadoo.fr
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FDYx2fGGzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 01:09:16 +1100 (AEDT)
Received: from localhost.localdomain ([93.22.133.23]) by mwinf5d31 with ME
 id 0E99220030WSqZ103E99Z5; Sat, 08 Feb 2020 15:09:12 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Feb 2020 15:09:12 +0100
X-ME-IP: 93.22.133.23
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: oss@buserror.net, galak@kernel.crashing.org, benh@kernel.crashing.org,
 paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/83xx: Fix some typo in some warning message
Date: Sat,  8 Feb 2020 15:09:04 +0100
Message-Id: <20200208140904.7521-1-christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"couldn;t" should be "couldn't".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/platforms/83xx/km83xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index ada42f03915a..306be75faec7 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -53,13 +53,13 @@ static void quirk_mpc8360e_qe_enet10(void)
 
 	np_par = of_find_node_by_name(NULL, "par_io");
 	if (np_par == NULL) {
-		pr_warn("%s couldn;t find par_io node\n", __func__);
+		pr_warn("%s couldn't find par_io node\n", __func__);
 		return;
 	}
 	/* Map Parallel I/O ports registers */
 	ret = of_address_to_resource(np_par, 0, &res);
 	if (ret) {
-		pr_warn("%s couldn;t map par_io registers\n", __func__);
+		pr_warn("%s couldn't map par_io registers\n", __func__);
 		return;
 	}
 
-- 
2.20.1

