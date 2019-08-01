Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F17E3F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 22:28:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46021071yczDqCX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 06:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.88; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="RLDyPFLk"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4601mQ6HWQzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 06:17:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RffXdq5IMWd99E3ft2BFBBovy6Sgjz6qb8j66RD44BjpFdi5WtdzYJIF7XNnStcR8/goxwFNrufIpkcXl9WDk/5zPx5t8cAg+0P8zE+/JJwZh8CdpTaivcEWXVKYcldskd3oOycQYU0J5NJ16gUTIacnHV+yt6u89iEYJYOcA03yadqrVaryvy+sKZzPqsIJInKy56VFQOimqepwe23jEXihUP4DhLZzwsZTYj8d7hOfGX22LxmIP/ckuWafJZCY9/kfuooecLHh0PXzQFkhW8JQW8BxhVTbltQIQQiMXXMY0mDXSSywBJBOVzTrq5UMheYFNW6VAfsEedvtvkeL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBWOZB9A9QLCsl/EiU2J6XfBNYpFfgi0BtBgM52Vh8M=;
 b=K+GowrPsjIZwOnsf5QpTiFdyvWoBQd5Wq7G1OJ0p4iD3kUKxyG/z6Jh9TCGapOZ5XJWJ3cKKdC1vG3074JEAquJm0cnW8k1tYXJLrvmvBn26A5opjHVj+UIyvQkmbFtRWLMn1OIc47vJ1byj5w7RSH8ENL+rbpb4iOmYjlFhUB2JnKGeIzB/FOe75PsItnpvYqB3v51rH7brGM74fU+Audz4QJWiP/tQMCYBJU1pscXfYug6tIXur/hYyVuAWRjdPfMegokqdaj8lNCzAG+z+WiyR4TW8FezFbfJsOy/DrKKKJuNCyiLbpmS+2/DVrxlUnra5VpUIgNqAHhx75zsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBWOZB9A9QLCsl/EiU2J6XfBNYpFfgi0BtBgM52Vh8M=;
 b=RLDyPFLkOpzZrlwtSfnEQiAiuRKS9Ldpnp+iFr7fIXxeMvOkEt0MZ1xEl5Q6QEQVo1Xpajc/t3+9X0HPmpZDVO52emIrdb+jckzvPThfBy9EovSUYTWCusXpFuRanwrb+Ux0vejNQEm2UqU5v+1vQWayf1PyvI5OsxLzuBb3kQQ=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6656.eurprd04.prod.outlook.com (20.179.235.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 1 Aug 2019 20:16:59 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::8fc:e04c:fbb6:4f1f%7]) with mapi id 15.20.2115.005; Thu, 1 Aug 2019
 20:16:59 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v3 4/7] soc/fsl/qbman: Fix drain_mr_fqni()
Thread-Topic: [PATCH v3 4/7] soc/fsl/qbman: Fix drain_mr_fqni()
Thread-Index: AQHVSKYSvUv/rPwBlkeXxjwGukCmsA==
Date: Thu, 1 Aug 2019 20:16:59 +0000
Message-ID: <1564690599-29713-5-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: 6049c9a1-f12f-452c-727d-08d716bd3535
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6656; 
x-ms-traffictypediagnostic: VE1PR04MB6656:
x-microsoft-antispam-prvs: <VE1PR04MB66560F08A80AEF6D0B649A1186DE0@VE1PR04MB6656.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:330;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(386003)(6506007)(305945005)(7736002)(71200400001)(71190400001)(68736007)(14454004)(36756003)(54906003)(316002)(4744005)(110136005)(6116002)(3846002)(486006)(186003)(66066001)(6436002)(256004)(26005)(2201001)(6636002)(3450700001)(44832011)(6486002)(102836004)(2906002)(14444005)(446003)(476003)(2616005)(50226002)(64756008)(66446008)(66476007)(25786009)(81166006)(66946007)(52116002)(5660300002)(11346002)(76176011)(478600001)(66556008)(8676002)(86362001)(81156014)(8936002)(99286004)(6512007)(4326008)(2501003)(53936002)(43066004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6656;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MIb5s+aQ0MhROi2TSCfXpU78AOwyFbta0P+YAFTHfdSSu1PDwH1Pis8mY1+y2JBuQViVJVbTMBfxhOBIC3AN0ZtCu1jekactVCAoF46ZQ8Ig3c6r3Vn1EFW26ViB07fnVrGONkXf711UZAfZHmBpLMqoMSsG2d4ErQXMW7E2/vr/bCMQMmK7vT3qTnFD1A20Ajd8XL2QqwMe4wDMIecfuTJIg8NFdvt1uA0m95PyM4wYHIyqwvJAlqJMSWdiLtBnleQtcs4nrE9lJ9ET/9ZXR6F8N1MGRqzY+170nbuYBWRDRja/cxFS88gMJZVb87ZHg6xU5ugtmFv3tn5LI5+yy5TbMz2x95jLHOsNwZgiQM1Yfc4K5u7JBTA3ame53qLh8zNFAAsQcng0AVAmEAi8ic872b7FtHbY4FFjzpX/1+o=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6049c9a1-f12f-452c-727d-08d716bd3535
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 20:16:59.6707 (UTC)
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

The drain_mr_fqni() function may be called fron uninterruptable
context so convert the msleep() to an mdelay().  Also ensure that
the valid bit is updated while polling.

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/qman.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index f10f77d..2989504 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1164,6 +1164,7 @@ static int drain_mr_fqrni(struct qm_portal *p)
 {
 	const union qm_mr_entry *msg;
 loop:
+	qm_mr_pvb_update(p);
 	msg =3D qm_mr_current(p);
 	if (!msg) {
 		/*
@@ -1180,7 +1181,8 @@ static int drain_mr_fqrni(struct qm_portal *p)
 		 * entries well before the ring has been fully consumed, so
 		 * we're being *really* paranoid here.
 		 */
-		msleep(1);
+		mdelay(1);
+		qm_mr_pvb_update(p);
 		msg =3D qm_mr_current(p);
 		if (!msg)
 			return 0;
--=20
2.7.4

