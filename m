Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B3B38C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:13:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rrvx33v3zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrSg3LjwzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:53:15 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzz6s-1gXTgh3Td8-00x1Ur; Sat, 27 Apr 2019 14:52:37 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/41] drivers: tty: serial: dz: use pr_info() instead of
 incomplete printk()
Date: Sat, 27 Apr 2019 14:51:46 +0200
Message-Id: <1556369542-13247-6-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:0divRPlMaEn/Gqkn0bF/qffr0mtJMzUIhhcgUCpKp3L8QfEx3BT
 Sct6DXQKPsKml0HbjLEbqZ0BVdAAcNgJ6gXOI6JC8K/1+PAe8EFl5Aq1lbdbexf9MvYSvJI
 wDh21F+qIQxeFuU3Myc3hkjl/lhNuC86c6zCO8DZIQRpkFEogbQN+oxEVR+QjYaXv/F2Er3
 D3Hg7fjgdOldNL+SYlAwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+RM97HlEygc=:XCYgbldeM4fHTujSYLo9ci
 ZNeOghoSWPCt1C8c6NBMLSfGNddK58lmCDc3rlfBH3ynfXNXoutb/zjRBWM8D3BIY49a4i4UE
 w61HuHHGGrE/nW055rXaTuGx9TatMuVoyD47DJXczfb3oO2GbP0EmAQmzpC+6kDBZdseEXdDC
 Q/7Dzh91Dv5viwhjSOg8QB3blGvc6npMCA3+LRAVdg7cmGKN+31NplbmdslmfdvUCt7Zt8txu
 wu1qVJ20ms6soMtiV40LnA1aD9QGbuHc7kSx8ChK0JcxawU9TBzFvD7nHcdQCkga/Pam6wIlh
 SozaRebsNHrmz6K0Nxx5GSTQPTFKcxIbQTjsZTv+UXWB6g6MdVA8xNYDMcxFB3I9a/OOa1+q6
 SDNeRbSCUbiTqPPGCr4Wlwd5pr0t1wGkI38yOimXepPKVf4067XO8agDegepX6eMqr1dnbVEl
 7E6hKunNpdkhyB0sNKvUPq+uvwV2l/VdX95oOhRD4521oJmMRY3DJ+fuI9JwMF0+0d43RkioS
 NAq5fkYK+cja/PvgpcgRoKs9fOqvE/DvkG7oyD8aLe7kzR0MXQDK6+nm2GtMVAfo9rLlZIslt
 eYSqlXLx6iAbP5p7IGgKyS6G3mEq0IT3MizlVzwRrPBrTI6P7aSZVck/9N5HOec9ocrRvZ2zy
 eP3CmOH7ndIUhAxgSzvJujudRMq1laldwLQ9qL1Fz34ZpgICHygnXc7BQ2s/IBPS3Nvdokjth
 xKIhRxBJYIbWNhrxBOQ1AQzGdb2SfJPFzpfkeQ==
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the checkpatch warning:

    WARNING: printk() should include KERN_<LEVEL> facility level
    #934: FILE: dz.c:934:
    +	printk("%s%s\n", dz_name, dz_version);

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index 559d076..e2670c4 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -931,7 +931,7 @@ static int __init dz_init(void)
 	if (IOASIC)
 		return -ENXIO;
 
-	printk("%s%s\n", dz_name, dz_version);
+	pr_info("%s%s\n", dz_name, dz_version);
 
 	dz_init_ports();
 
-- 
1.9.1

