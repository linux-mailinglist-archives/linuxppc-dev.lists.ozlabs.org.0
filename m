Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02523552CA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 10:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzjH2j5Qz3brk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 18:10:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=p/YlJmXW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=p/YlJmXW;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRzhb6Krjz304r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 18:10:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IQQw/
	FdUobZK6onapgarIDDbxG4poDkZyzCID4+6AYU=; b=p/YlJmXW7Cdrngp6ssJ0d
	atE0N5STZVKl2gWVRIsBXOEORPYZSnl/GgoeKa+zjUhhvT+pDjd3JWxcfSi5adQ9
	Rv5rzuvYPimKq/pdEfZP9jNx5/6ae1WwJaK8YmWEAJECQ9HTXi2823GK98lMSjPK
	+Vs6D2NA0z1zvGH2rK7kuk=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgCXnLG9fLFi4HSjFA--.37069S2;
	Tue, 21 Jun 2022 16:09:33 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/83xx: Hold the reference returned by of_find_compatible_node
Date: Tue, 21 Jun 2022 16:09:32 +0800
Message-Id: <20220621080932.4081935-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgCXnLG9fLFi4HSjFA--.37069S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw47CrWrGw17GryfAr48Xrb_yoW8Jw17pF
	sF93y3CF1kW3s5G3WIqFy8Cr4UArs5urW8tw4UCas7Aw4DWFZ8ZrZ0vF1Fvr1kGFZYyFyr
	JrZ7Ka1rtFn7ur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5WrZUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2h0nF1uwMQFAzAAAsg
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In mpc832x_spi_init(), we should hold the reference returned by
of_find_compatible_node() and use it to call of_node_put() for
refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/83xx/mpc832x_rdb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index bb8caa5071f8..e12cb44e717f 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -162,6 +162,8 @@ static struct spi_board_info mpc832x_spi_boardinfo = {
 
 static int __init mpc832x_spi_init(void)
 {
+	struct device_node *np;
+
 	par_io_config_pin(3,  0, 3, 0, 1, 0); /* SPI1 MOSI, I/O */
 	par_io_config_pin(3,  1, 3, 0, 1, 0); /* SPI1 MISO, I/O */
 	par_io_config_pin(3,  2, 3, 0, 1, 0); /* SPI1 CLK,  I/O */
@@ -175,7 +177,9 @@ static int __init mpc832x_spi_init(void)
 	 * Don't bother with legacy stuff when device tree contains
 	 * mmc-spi-slot node.
 	 */
-	if (of_find_compatible_node(NULL, NULL, "mmc-spi-slot"))
+	np = of_find_compatible_node(NULL, NULL, "mmc-spi-slot");
+	of_node_put(np);
+	if (np)
 		return 0;
 	return fsl_spi_init(&mpc832x_spi_boardinfo, 1, mpc83xx_spi_cs_control);
 }
-- 
2.25.1

