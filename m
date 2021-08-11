Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF253E8AC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 09:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl1CX3m1Cz3bVp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 17:09:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=VvRErVBC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=meftvM7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=185.5.136.251; helo=fallback19.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=VvRErVBC; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=meftvM7i; 
 dkim-atps=neutral
Received: from fallback19.mail.ru (fallback19.mail.ru [185.5.136.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl1Bk2KmCz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 17:08:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BSRvWXJ6AUEh3MXH/F2aKR3+mLuspHfiAAB6aprloyA=; 
 t=1628665726;x=1629271126; 
 b=VvRErVBCXhciS9aDJm3VVe/Oriuadx4eks6A0ninwH730GYRn05I119ohGZaHioV6pj1zTMEMZ26FaA0EqYuwGvkcJh1sf1dxAX+NVTkT/yIBf4H7Gs+J++EBX7jzioezbKbKNTNCWAEXkVN11uj35FpYaAQ4HicYDP341qN8IM=;
Received: from [10.161.64.42] (port=51798 helo=smtp34.i.mail.ru)
 by fallback19.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mDiLx-0005h0-4p; Wed, 11 Aug 2021 10:08:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BSRvWXJ6AUEh3MXH/F2aKR3+mLuspHfiAAB6aprloyA=; 
 t=1628665721;x=1629271121; 
 b=meftvM7iDCXoLtYng370TVBfgd+xUrkCyBx6xl4+rwYSYP5uNyM8W/ffEP10O0gtljsN3XHjzWAN05nX+a29tLKUALn/kSKinzcSJt9fEuaWfIEywzPM7/4hJ2MzZUqmfDG3rzv2fEb1Htu4Hj3fQtyt+ig5fzhn7ILCr/1Yuuw=;
Received: by smtp34.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mDiLm-0007hF-UO; Wed, 11 Aug 2021 10:08:31 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Saravana Kannan <saravanak@google.com>
Subject: [PATCH] soc: fsl: qe: fix static checker warning
Date: Wed, 11 Aug 2021 10:10:36 +0300
Message-Id: <20210811071036.44658-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD972FF4A7D76DB5E242D14FEF1BD8BF4AC182A05F538085040E59C94EACD29F4762F4AF1E4B8A52623318EFA9FEBE4AA3FACE93DD33B14FD3B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE758E3775C3D7FDEE4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D0D183F14C070BA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8240CF83AFB524C3A88B733580272E2356F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE709B92020B71E24959FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B02B6BDC1B5FAA2C5A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC77DE509F9BBE239A3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637664EAD4E21776A47D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FB26E97DCB74E625235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505D23A70E920103B1A28ED62B0A7548DB6
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F869433C352ECFE052C88953D285C375F949C2B6934AE262D3EE7EAB7254005DCEDA0EE70D6C6970CA79510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21FB936CB490224F2464EEA7BD89490CAC0EDDA962BC3F61961
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34FDC9529E4578B99CD8E9DE3A87194A707306DB5D682B89DD99B46FA98BD01403EF634974F1D5F9981D7E09C32AA3244C8F6951928DDC352B3C1E23CB3C8DC76F64EE5813BBCA3A9DAD832FF50B3043B1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6qlzQV0oSZMhbINMbSEkUQ==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24DCDBB06740E13E3EBA8B7438B250720B37A15BC1A8C06B00EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4EE34287C01580B6095C43D2429CE7A3C2B8C540259D1F90968F3CF0E9FE49B695F82FD4667692B9D13DA63390880685D2ED391CAF014C04E2AA3AE6F0D53E819
X-7FA49CB5: 0D63561A33F958A543D1C5E329813337AD8EAB81A677E7D80BCB9DC51BD87DFACACD7DF95DA8FC8BD5E8D9A59859A8B6A183FDCE24978B01CC7F00164DA146DAFE8445B8C89999728AA50765F79006374DFE161FF66DC085389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC88D6D1DB188AF5101F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB29735652A29929C6C4AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B6ACE00135B021D8CA089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C6B668463F4F89F86DF779C82BF5D3A3042D89C05D77BFF469C2B6934AE262D3EE7EAB7254005DCEDA0EE70D6C6970CA7DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6qlzQV0oSZNflVBGRZSZuw==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C90056DE2D996C7A1955606E28506374728FD86AE044CCEF11DE87151379E4073B253C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch be7ecbd240b2: "soc: fsl: qe: convert QE interrupt
controller to platform_device" from Aug 3, 2021, leads to the
following static checker warning:

	drivers/soc/fsl/qe/qe_ic.c:438 qe_ic_init()
	warn: unsigned 'qe_ic->virq_low' is never less than zero.

In old variant irq_of_parse_and_map() returns zero if failed so
unsigned int for virq_high/virq_low was ok.
In new variant platform_get_irq() returns negative error codes
if failed so we need to use int for virq_high/virq_low.

Also simplify high_handler checking and remove the curly braces
to make checkpatch happy.

Fixes: be7ecbd240b2 ("soc: fsl: qe: convert QE interrupt controller to platform_device")
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/fsl/qe/qe_ic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index e710d554425d..bff34ee2150a 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -54,8 +54,8 @@ struct qe_ic {
 	struct irq_chip hc_irq;
 
 	/* VIRQ numbers of QE high/low irqs */
-	unsigned int virq_high;
-	unsigned int virq_low;
+	int virq_high;
+	int virq_low;
 };
 
 /*
@@ -435,9 +435,8 @@ static int qe_ic_init(struct platform_device *pdev)
 	qe_ic->virq_high = platform_get_irq(pdev, 0);
 	qe_ic->virq_low = platform_get_irq(pdev, 1);
 
-	if (qe_ic->virq_low < 0) {
+	if (qe_ic->virq_low < 0)
 		return -ENODEV;
-	}
 
 	if (qe_ic->virq_high != qe_ic->virq_low) {
 		low_handler = qe_ic_cascade_low;
@@ -459,7 +458,7 @@ static int qe_ic_init(struct platform_device *pdev)
 	irq_set_handler_data(qe_ic->virq_low, qe_ic);
 	irq_set_chained_handler(qe_ic->virq_low, low_handler);
 
-	if (qe_ic->virq_high && qe_ic->virq_high != qe_ic->virq_low) {
+	if (high_handler) {
 		irq_set_handler_data(qe_ic->virq_high, qe_ic);
 		irq_set_chained_handler(qe_ic->virq_high, high_handler);
 	}
-- 
2.31.1

