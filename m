Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA15EE0F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:03:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fD9J0DC7zDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:03:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="eygtER5t"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4m36MzzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LGnDyzf1Nf9qX67cl5Ry+Kwov3oatuWiMcH3vAM3o4=;
 b=eygtER5twLXpHb6oBDMihNF9QsBDIUO+9jaLnfkQCZLbtc1WXhcTqnGbZLyOccmCNZeY50l/mYSEJF5OUJXY2+egSilTQ2WrCt+LquDyd5h4V/8yUqH9ykw0d5AReNNDK1ba3CuSVePFarfdfC65CS41GQh0bPAbi2vdmdgkQIo=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 20:59:24 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:24 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 0/7] soc/fsl/qbman: Enable Kexec for DPAA1 devices
Thread-Topic: [PATCH v2 0/7] soc/fsl/qbman: Enable Kexec for DPAA1 devices
Thread-Index: AQHVMeIxggwE/pgZKkC1gIn9RzIwTA==
Date: Wed, 3 Jul 2019 20:59:24 +0000
Message-ID: <1562187548-32261-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN6PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:805:16::18) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b7775e0-3fb2-454b-2541-08d6fff95404
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:
x-microsoft-antispam-prvs: <VE1PR04MB64645D3910FBD5F6F5D4139E86FB0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(14454004)(2501003)(81156014)(81166006)(4326008)(478600001)(305945005)(8676002)(14444005)(2906002)(7736002)(50226002)(476003)(486006)(2616005)(25786009)(3450700001)(86362001)(2201001)(68736007)(44832011)(36756003)(66946007)(26005)(66476007)(66556008)(64756008)(73956011)(71200400001)(71190400001)(66066001)(53936002)(6116002)(52116002)(386003)(6506007)(66446008)(8936002)(256004)(102836004)(186003)(99286004)(6486002)(5660300002)(110136005)(316002)(3846002)(6436002)(43066004)(6512007)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kEgrJ/76lvuSbcdISeEYNOGofK4u6rhLdtPFgo8ujbzETNSWb5+E8qa5rpY7rsSiIn+XrRpaSzGiAeGUbqm9KH6jRiLJJB6AYe2Cfe040dD22Au+brdMfBhTXTpm7oJWyVnYmqUaN+Jhr1b/vCH5fk7TxwHrxWRTJPLAVNnL0XtnGe0xWLAlICaYF1k8ct6Xxg03WYPKjX2BV6u5EO9bJBh/PjcWwe63WLppquDHROGpVNn/rQ3HSbP0dqFTEvaj38bG5qoRu152CfM14EMIuL1n0LMLz7Ekf4ei87ksXEyh4hCWV4brO7/9eVnQEVK6qFUfbIGblgyJ0lUrC6SVwAz7GE+x8gaXqQEsbZQBb5NpxNFXvXg3P7N/ZWjH13aAKVpmvQobXjSkbv4RYAp98qZOdDdNy8Q+7OKsDxb2ev4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7775e0-3fb2-454b-2541-08d6fff95404
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:24.4689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6464
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
Cc: Roy Pledge <roy.pledge@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most DPAA1 devices do not support a soft reset which is an issue if
Kexec starts a new kernel. This patch series allows Kexec to function
by detecting that the QBMan device was previously initialized.

The patches fix some issues with device cleanup as well as ensuring
that the location of the QBMan private memories has not changed
after the execution of the Kexec.

Changes since v1:
	- Removed a bug fix and sent it separately to ease backporting

Roy Pledge (7):
  soc/fsl/qbman: Rework QBMan private memory setup
  soc/fsl/qbman: Cleanup buffer pools if BMan was initialized prior to
    bootup
  soc/fsl/qbman: Cleanup QMan queues if device was already initialized
  soc/fsl/qbman: Fix drain_mr_fqni()
  soc/fsl/qbman: Disable interrupts during portal recovery
  soc/fsl/qbman: Fixup qman_shutdown_fq()
  soc/fsl/qbman: Update device tree with reserved memory

 drivers/soc/fsl/qbman/bman.c        | 17 ++++----
 drivers/soc/fsl/qbman/bman_ccsr.c   | 36 +++++++++++++++-
 drivers/soc/fsl/qbman/bman_portal.c | 18 +++++++-
 drivers/soc/fsl/qbman/bman_priv.h   |  5 +++
 drivers/soc/fsl/qbman/dpaa_sys.c    | 63 ++++++++++++++++------------
 drivers/soc/fsl/qbman/qman.c        | 83 +++++++++++++++++++++++++++++----=
----
 drivers/soc/fsl/qbman/qman_ccsr.c   | 59 +++++++++++++++++++++++---
 drivers/soc/fsl/qbman/qman_portal.c | 18 +++++++-
 drivers/soc/fsl/qbman/qman_priv.h   |  8 ++++
 9 files changed, 246 insertions(+), 61 deletions(-)

--
2.7.4

