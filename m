Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DC7E3E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 22:24:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4601wT0Y2vzDql9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:24:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.88; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="dkzwf6eh"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4601mL0D8MzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:17:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COMNkqqzs5CsKt/H7wpCMVjTTkVi14dr6AG3zti6O+Iiyn+PVb+XywUn8QTurHnNXqW1fw35k/0sa+9GNDNS6XfMO9XlTmWnkh0bjvLbvmNHpQv1GuryucqDIXwSq1K2/7DFmshyJulQwnF9T0NQoxqAlnbiPwmIC/2mj/IajmyKh3fVY+WU/5vOGbVDGE17bqieqYRb8QIv3mULkqgh+KBKeKwkzgQoNWyaOjABxHHnGSaQgN9G2w+fIWSlFqxt9AbVPeyxNS1MW0kxj1p7HXGi8gth3hul2hALIiv75uFTRh3GgNut4NIFLN1u8D3DyTa8ETfExaS10eY/RWEUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rc8vExPXZwB8d4MZ9x7eOtOwLPlGtoP7wKctkSKqwI=;
 b=WtH0aP3OPGRC94SsYkQJzicX/cm8QtbGz6J71rfCM0iqvJLQGf5ENh8cKFQ+r2FmFw2noNiglBkjgkVASyceBX46SSyWuuV5u5VIgMW8AIczZE/Xk4qzHq1iTrHe+U/r0cinYr47Y3zT9hbFdtvYssVjDhCVnsAyPS4TiK+v33ZGN3xTV29uBBVbcZNIOpBiiiBET3CwPrfwq6YQO70lDr2liiTBPGMnghIL3uNdu7m3WdSFEjYVXniIpEj7TmwlWAJjA22ZqL8wvo3xHxWWNPd6VA/jsNi4pCvuMOoSob/l2tv9Qu/Qb9YIuzO2uBnOIXzzyk8j93rgpApwiTLR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rc8vExPXZwB8d4MZ9x7eOtOwLPlGtoP7wKctkSKqwI=;
 b=dkzwf6ehWUSsFxnj5bVwLOBn9xNIvvwFDQSCIr31mq3P0HwGJXCgap/iCH6NB44zlN7LhYK1slpIHUgBrjrQcqRc/vepEx3ywBIYXvF95EM2p7viIOmrXbO+i8vfU+fvsTrjw5JeTV5UIguu5HLvfDHazL+55l/oxKiE2ubNUs0=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6656.eurprd04.prod.outlook.com (20.179.235.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 1 Aug 2019 20:16:55 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 20:16:55 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v3 2/7] soc/fsl/qbman: Cleanup buffer pools if BMan was
 initialized prior to bootup
Thread-Topic: [PATCH v3 2/7] soc/fsl/qbman: Cleanup buffer pools if BMan was
 initialized prior to bootup
Thread-Index: AQHVSKYQDdAXIzwWDEO2MM4P3XgCBw==
Date: Thu, 1 Aug 2019 20:16:55 +0000
Message-ID: <1564690599-29713-3-git-send-email-roy.pledge@nxp.com>
References: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1564690599-29713-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38197fa7-df37-48c1-fe59-08d716bd32c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6656; 
x-ms-traffictypediagnostic: VE1PR04MB6656:
x-microsoft-antispam-prvs: <VE1PR04MB66567CC4C4D23BA725C5559586DE0@VE1PR04MB6656.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(386003)(6506007)(305945005)(7736002)(71200400001)(71190400001)(68736007)(14454004)(36756003)(54906003)(316002)(110136005)(6116002)(3846002)(486006)(186003)(66066001)(6436002)(256004)(26005)(2201001)(6636002)(3450700001)(44832011)(6486002)(102836004)(2906002)(446003)(476003)(2616005)(50226002)(64756008)(66446008)(66476007)(25786009)(81166006)(66946007)(52116002)(5660300002)(11346002)(76176011)(478600001)(66556008)(8676002)(86362001)(81156014)(8936002)(99286004)(6512007)(4326008)(2501003)(53936002)(43066004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6656;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q3/DR5KhiU0n0aX2rXM4WagF1mgdLPXZQtkbNCGb56MN3TNdsEPnGzrS3q3QTS/2ZI1hiuRnW52+WPxJorOlFdPM0Em1RvZXGraqL/Yq6iLSgVWmB745yosP4aPu54wXTRBddfYTRrK9ymkAFtNjKS6vIY1mwJsZJBU1AuJMKkCzwltBZaqv5jUPaj0noBRPLz/ns5ea7RdjmjyrKZrOuWkzc9z4LLFzViYh/IprOEm7oKXkUAbXdFK920WNDjOADPDGNo5qRk9MHcepIPBCDAgZhy2a7LzQlE43LlnwqSZJu1y1z5SFo+5WKYqSbSlKoecpwtKDOJx8oa2yjqsej5Aw113vkDGdS6VRR6Q8v1DO99zJsa1cKcxbrL9hItVCw7U4zyWe75qKj57RB206vfv9lxcx/zqzdJGXNy/WGlc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38197fa7-df37-48c1-fe59-08d716bd32c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 20:16:55.4822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6656
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
Reply-To: Roy Pledge <roy.pledge@nxp.com>
Cc: Roy Pledge <roy.pledge@nxp.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clean the BMan buffer pools if the device had been initialized
previously.  This will ensure a consistent state if the kernel
was soft restarted (kexec for example)

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/bman.c        | 17 +++++++++--------
 drivers/soc/fsl/qbman/bman_ccsr.c   | 10 ++++++++++
 drivers/soc/fsl/qbman/bman_portal.c | 18 +++++++++++++++++-
 drivers/soc/fsl/qbman/bman_priv.h   |  5 +++++
 4 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
index f84ab59..f4fb527 100644
--- a/drivers/soc/fsl/qbman/bman.c
+++ b/drivers/soc/fsl/qbman/bman.c
@@ -635,30 +635,31 @@ int bman_p_irqsource_add(struct bman_portal *p, u32 b=
its)
 	return 0;
 }
=20
-static int bm_shutdown_pool(u32 bpid)
+int bm_shutdown_pool(u32 bpid)
 {
+	int err =3D 0;
 	struct bm_mc_command *bm_cmd;
 	union bm_mc_result *bm_res;
=20
+
+	struct bman_portal *p =3D get_affine_portal();
 	while (1) {
-		struct bman_portal *p =3D get_affine_portal();
 		/* Acquire buffers until empty */
 		bm_cmd =3D bm_mc_start(&p->p);
 		bm_cmd->bpid =3D bpid;
 		bm_mc_commit(&p->p, BM_MCC_VERB_CMD_ACQUIRE | 1);
 		if (!bm_mc_result_timeout(&p->p, &bm_res)) {
-			put_affine_portal();
 			pr_crit("BMan Acquire Command timedout\n");
-			return -ETIMEDOUT;
+			err =3D -ETIMEDOUT;
+			goto done;
 		}
 		if (!(bm_res->verb & BM_MCR_VERB_ACQUIRE_BUFCOUNT)) {
-			put_affine_portal();
 			/* Pool is empty */
-			return 0;
+			goto done;
 		}
-		put_affine_portal();
 	}
-
+done:
+	put_affine_portal();
 	return 0;
 }
=20
diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman=
_ccsr.c
index dc6d7e5..cb24a08 100644
--- a/drivers/soc/fsl/qbman/bman_ccsr.c
+++ b/drivers/soc/fsl/qbman/bman_ccsr.c
@@ -195,6 +195,16 @@ int bman_is_probed(void)
 }
 EXPORT_SYMBOL_GPL(bman_is_probed);
=20
+int bman_requires_cleanup(void)
+{
+	return __bman_requires_cleanup;
+}
+
+void bman_done_cleanup(void)
+{
+	__bman_requires_cleanup =3D 0;
+}
+
 static int fsl_bman_probe(struct platform_device *pdev)
 {
 	int ret, err_irq;
diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bm=
an_portal.c
index c78cc69..cc06d95 100644
--- a/drivers/soc/fsl/qbman/bman_portal.c
+++ b/drivers/soc/fsl/qbman/bman_portal.c
@@ -100,7 +100,7 @@ static int bman_portal_probe(struct platform_device *pd=
ev)
 	struct device_node *node =3D dev->of_node;
 	struct bm_portal_config *pcfg;
 	struct resource *addr_phys[2];
-	int irq, cpu, err;
+	int irq, cpu, err, i;
=20
 	err =3D bman_is_probed();
 	if (!err)
@@ -181,6 +181,22 @@ static int bman_portal_probe(struct platform_device *p=
dev)
 	if (!cpu_online(cpu))
 		bman_offline_cpu(cpu);
=20
+	if (__bman_portals_probed =3D=3D 1 && bman_requires_cleanup()) {
+		/*
+		 * BMan wasn't reset prior to boot (Kexec for example)
+		 * Empty all the buffer pools so they are in reset state
+		 */
+		for (i =3D 0; i < BM_POOL_MAX; i++) {
+			err =3D  bm_shutdown_pool(i);
+			if (err) {
+				dev_err(dev, "Failed to shutdown bpool %d\n",
+					i);
+				goto err_portal_init;
+			}
+		}
+		bman_done_cleanup();
+	}
+
 	return 0;
=20
 err_portal_init:
diff --git a/drivers/soc/fsl/qbman/bman_priv.h b/drivers/soc/fsl/qbman/bman=
_priv.h
index 751ce90..aa3981e 100644
--- a/drivers/soc/fsl/qbman/bman_priv.h
+++ b/drivers/soc/fsl/qbman/bman_priv.h
@@ -76,3 +76,8 @@ int bman_p_irqsource_add(struct bman_portal *p, u32 bits)=
;
=20
 const struct bm_portal_config *
 bman_get_bm_portal_config(const struct bman_portal *portal);
+
+int bman_requires_cleanup(void);
+void bman_done_cleanup(void);
+
+int bm_shutdown_pool(u32 bpid);
--=20
2.7.4

