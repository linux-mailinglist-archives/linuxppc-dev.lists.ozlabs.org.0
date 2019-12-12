Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDF11D30A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:03:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Yg9S47XjzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.78; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=youri.querry_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20078.outbound.protection.outlook.com [40.107.2.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yg7B1kMxzDr48
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:01:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDjTypG92CNi91KiP5P5CgaBTO0iczW8dUEPATPoJ9RCNAso3YFHBNR3HNXg7CFuUxkbzYBZmFYchdEx1XMGKOouKfjR61A7kqFecT4oZn6/ZZUKCOUrcW9Iqllwjjfn07M/7+u46IdLnS4TikM6qNZsF2siOIWwE5+iWIDtUKASc3y02+6PrSEZHVo93Sw5c7QznIuvR+/xIovOIwaVAwf9EMJnSYfw2E+bxWvAUtbAi//kCYHNByXGRrcawJElidAtJja8jAuT4UafCerd7JvThK4qfoih0h3Gu3VbHbSrlRtCh9rFXUUkJ+DnfHUjqhwEpbKvXPwOqBbz5xGQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9lwkZ0sgfq21w7jcSqrK/oZ735Z6ZdzVYTaN9hifEU=;
 b=FtcDZXC2+opcNvtsv1w2hipsDRZ2VcJxR1X0rLfLBJmUHemkkKWP7E+VkGts5R2Vb59BuYJJ+QHmWEVm+4RHGqGJi+34zvDdifAG5y2XWuStVip8rhA6pLfppE18dtH9EBDgQjyeL02N8H4BBP+mYfnxpu776FJ5Q8WH3YrHrvwF/bF9vahOvvIBXPOMHZ6C0okfYuXpYaUA4LDCWCr3nnm9B3OtXGJB3o/PU/SGksDMbuV1AMTqP8odctKYDBMNXGpmuhY28lVkKQirPdT6NixyDCWGdWz/ELiZHkt6XsoETV6KfXK7CXvkuVJHucZwNt6+e3SZm9Go40RjiIeJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9lwkZ0sgfq21w7jcSqrK/oZ735Z6ZdzVYTaN9hifEU=;
 b=ek8oJ4F/QKztECnOb7AhxrmSCKJzNrytEWVUWKpRS8lUePCiw/QoEqzihit8lGZmNkPjbLsIzeNpTIDG0bJSaJUoixhQLjZVYvsz2Qrdn/nY36zrhqbXFWaODl2C6AjcDhESpvfTP5OuOP54EDdIfFKAXEX798N3/AUYhntbXFk=
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com (20.179.11.140) by
 DB8PR04MB6650.eurprd04.prod.outlook.com (20.179.251.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 17:01:10 +0000
Received: from DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe]) by DB8PR04MB5931.eurprd04.prod.outlook.com
 ([fe80::5002:adf2:99f5:a4fe%7]) with mapi id 15.20.2516.020; Thu, 12 Dec 2019
 17:01:10 +0000
From: Youri Querry <youri.querry_1@nxp.com>
To: Roy Pledge <roy.pledge@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
Subject: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
Thread-Topic: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
Thread-Index: AQHVsQ3AyGczVLMI40Km2qz47OLo9w==
Date: Thu, 12 Dec 2019 17:01:10 +0000
Message-ID: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To DB8PR04MB5931.eurprd04.prod.outlook.com
 (2603:10a6:10:ae::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=youri.querry_1@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eef162b9-dccf-4868-76a3-08d77f24e329
x-ms-traffictypediagnostic: DB8PR04MB6650:|DB8PR04MB6650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB665085F9B4811F9D0B4C4EB6F3550@DB8PR04MB6650.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(478600001)(26005)(52116002)(66446008)(6506007)(86362001)(6512007)(316002)(4326008)(2906002)(71200400001)(186003)(36756003)(6486002)(5660300002)(4744005)(81166006)(81156014)(2616005)(6636002)(64756008)(8676002)(66476007)(66946007)(8936002)(110136005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6650;
 H:DB8PR04MB5931.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ER9sFAM2lVRxox33xBPtov+ChSZOPjM0twI0gLFFwOYQyXKH2xNb7PUmLFT1eSEKRxAwYo1+QA6A7cmXOWJKRIOf7Kmu7kbG7x1lwkOgsAgBjEBpwaj7UBc7rp0GVNQhhKayttGjbLrMCATQFhhK5TRxjykaE64mBno4NN8uCW3Hb4kWDN/Exm1YGHYiISOco1ANI8DR7/yL8/dzr6QP0WkXXUI9p9ZJgigtlIQ0stwaK2ct4E8HUm0HdiCJSq9cu4cHgZqcdUgxPgrpT1EMEliUrbad0JwLecQQ30SgJllpFETZv5gw738Ofm2KKOmcM8CYIicy1wcNxd+bgvpuGPI+1obE0DyAylTKHu04mHFiW+q5QEBDaDX7U9Dain+HXFGQqZ8XQ+wCDa15QuQXJ73rXbRDiV5M70Oi4cu33a77wfNe4eS12K0NYUzicmZt
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef162b9-dccf-4868-76a3-08d77f24e329
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 17:01:10.5698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZXrsNpXKKiM+4mYB+wC4GPKaKIR1g1kV24vrcsFoXXIiYQqcI11PUUplqeFyvSKxu0gCU0i6REYSCBP/19J8Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6650
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
Cc: Youri Querry <youri.querry_1@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch set consists of:
- We added an interface to enqueue several packets at a time and
  improve performance.
- Make the algorithm decisions once at initialization and use
  function pointers to improve performance.
- Replaced the QMAN enqueue array mode algorithm with a ring
  mode algorithm. This is to make the enqueue of several frames
  at a time more effective.

Youri Querry (3):
  soc: fsl: dpio: Adding QMAN multiple enqueue interface.
  soc: fsl: dpio: QMAN performance improvement. Function pointer
    indirection.
  soc: fsl: dpio: Replace QMAN array mode by ring mode enqueue.

 drivers/soc/fsl/dpio/dpio-service.c |  69 +++-
 drivers/soc/fsl/dpio/qbman-portal.c | 766 ++++++++++++++++++++++++++++++++=
----
 drivers/soc/fsl/dpio/qbman-portal.h | 158 +++++++-
 include/soc/fsl/dpaa2-io.h          |   6 +-
 4 files changed, 907 insertions(+), 92 deletions(-)

--=20
2.7.4

