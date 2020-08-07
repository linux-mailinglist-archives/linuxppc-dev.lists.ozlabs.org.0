Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFF23F5AB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:54:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkK45JP2zDqCW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=sk2.org
 (client-ip=46.105.56.78; helo=9.mo69.mail-out.ovh.net;
 envelope-from=steve@sk2.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sk2.org
X-Greylist: delayed 5350 seconds by postgrey-1.36 at bilbo;
 Sat, 08 Aug 2020 02:57:03 AEST
Received: from 9.mo69.mail-out.ovh.net (9.mo69.mail-out.ovh.net [46.105.56.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWjq6yzfzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:57:01 +1000 (AEST)
Received: from player691.ha.ovh.net (unknown [10.110.115.91])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id C3D71999A6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 17:27:42 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id C355E152D3C08;
 Fri,  7 Aug 2020 15:27:32 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003698b6a68-6b76-4ff7-aa52-ad9ed4f119b7,
 B1FDDFD4E508142116FDFB9194C63E8FBE397CFD) smtp.auth=steve@sk2.org
From: Stephen Kitt <steve@sk2.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch/powerpc: use simple i2c probe function
Date: Fri,  7 Aug 2020 17:27:13 +0200
Message-Id: <20200807152713.381588-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8281275292837105073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:31 +1000
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
Cc: Stephen Kitt <steve@sk2.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The i2c probe functions here don't use the id information provided in
their second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 arch/powerpc/platforms/44x/ppc476.c            | 5 ++---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/44x/ppc476.c b/arch/powerpc/platforms/44x/ppc476.c
index cba83eee685c..07f7e3ce67b5 100644
--- a/arch/powerpc/platforms/44x/ppc476.c
+++ b/arch/powerpc/platforms/44x/ppc476.c
@@ -86,8 +86,7 @@ static void __noreturn avr_reset_system(char *cmd)
 	avr_halt_system(AVR_PWRCTL_RESET);
 }
 
-static int avr_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int avr_probe(struct i2c_client *client)
 {
 	avr_i2c_client = client;
 	ppc_md.restart = avr_reset_system;
@@ -104,7 +103,7 @@ static struct i2c_driver avr_driver = {
 	.driver = {
 		.name = "akebono-avr",
 	},
-	.probe = avr_probe,
+	.probe_new = avr_probe,
 	.id_table = avr_id,
 };
 
diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 0967bdfb1691..409481016928 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -142,7 +142,7 @@ static int mcu_gpiochip_remove(struct mcu *mcu)
 	return 0;
 }
 
-static int mcu_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int mcu_probe(struct i2c_client *client)
 {
 	struct mcu *mcu;
 	int ret;
@@ -221,7 +221,7 @@ static struct i2c_driver mcu_driver = {
 		.name = "mcu-mpc8349emitx",
 		.of_match_table = mcu_of_match_table,
 	},
-	.probe = mcu_probe,
+	.probe_new = mcu_probe,
 	.remove	= mcu_remove,
 	.id_table = mcu_ids,
 };
-- 
2.25.4

