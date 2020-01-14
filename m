Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC87613A7D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 12:02:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xnc81KGlzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 22:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.63; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=m9FJTcRd; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xnYZ3qj9zDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 22:00:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHP8i26fIaLitpC4PNREbFXqnFUx5/vceNIWcWksT9LTSq2fXPQ+lLXGf0RuTJqyn0rzZHZaWaOo/G5QmRohnIlCTKRgMg1za2eMvVn9sHavbVNkWWvhsW0+LBB9IuGTpZJ5qpezcrK7lQAH85O3NZTQC9gFqX9Zqszjpg+hPjGJB4zz06do2uPHF2GrXj+W6Qg56KPDYtsLn1JkJoUoYrxZ09S7EvI4CPrex3GYI9laNuNGfLC/HGz7UZt4jUJ8rse4U5saUcKUIyExlBul1YbC2vfCFeIGddM8MezpxZVQFWJV0HX7+XbBmDyTc3ibIgtJgy9jBkox6pChoXVGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz9sjZ5m6jN+vIIopKZdcjL1Bo1aDqrFWwtDUdDA1gI=;
 b=IMaoot7mESNza6rt0Y0q6Tg2tP2INXMMKWbPRASXcZRhsamLDsMYmIsosrR8be2DSjRt8OpfJ4IpDXTOB1Yq70zU3CNxWrTMCY445jPTD8pqENruJeTJMm3vgqLSG3l5EmYVEdNWrvb+lwZmRi//HBgfs6hQ1SuTGzC0GK0kRXRrCaLZ+jmJ9zZNGw0LZkECZLwAoP6wsAu8E+r9YheWun2GdQCO9FbwNLvjWfNf0ZkyI3IxfHf9mtAFKuybPPobTR/oD+QSOE36EwNH0SpIgfdq8f4g/U1cvN88V7O7MVOg6y+uhsE42Hm/CG5tDWfj+5xnAPfS+HHoO7oWj5AJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz9sjZ5m6jN+vIIopKZdcjL1Bo1aDqrFWwtDUdDA1gI=;
 b=m9FJTcRdcB5grvHewYHzM4H5/xljd9dvYqcxIaqlBxvCMhDbWC9Yiie0pX5lfZPAWhuTu7+woTd08u8PwdVKtAo6O5Kwu0JPozSNMy5ODIJ11NBbz3VxZSui3F+sHFEd/SfrtjoDVUmYFeCewt+lp3GumwINGh5svx0/Yo6v/mk=
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB4808.eurprd04.prod.outlook.com (20.177.33.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 11:00:25 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82%7]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 11:00:25 +0000
Received: from fsr-ub1864-101.ea.freescale.net (89.37.124.34) by
 LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Tue, 14 Jan 2020 11:00:24 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Add myself as maintainer of ehv_bytechan tty
 driver
Thread-Topic: [PATCH] MAINTAINERS: Add myself as maintainer of ehv_bytechan
 tty driver
Thread-Index: AQHVysnTMfstR3XjwkGcaoGASJ/wzg==
Date: Tue, 14 Jan 2020 11:00:25 +0000
Message-ID: <20200114110012.17351-1-laurentiu.tudor@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::31) To AM6PR04MB5878.eurprd04.prod.outlook.com
 (2603:10a6:20b:a2::25)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3391090d-9c55-445e-817c-08d798e0f586
x-ms-traffictypediagnostic: AM6PR04MB4808:|AM6PR04MB4808:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4808EAC74BB35F628528B987EC340@AM6PR04MB4808.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(199004)(186003)(6506007)(8676002)(26005)(54906003)(44832011)(6512007)(8936002)(66446008)(64756008)(16526019)(66476007)(66556008)(81166006)(36756003)(81156014)(2906002)(71200400001)(66946007)(86362001)(52116002)(4744005)(6486002)(2616005)(956004)(316002)(1076003)(110136005)(5660300002)(478600001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4808;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WS0vPEcW1cP3JCTF+8sjIunXC8KfzEKb1nVcbQD9MM9kn8IpcaMz/zSjVWB6AhhDqHNOKQ9Y2/vzFAhkRpNCO9dxN37Ay9STnRPwttqjkiWuhRFJYpf5fCXLA6r7QldwbzJonJVMPl+iSxbE6DE+tPN1/A8cllBS5CBQj8klvE0ZqW9O09QSkT0H8QyReiUJdQty3Fk/P61DhWo7KeKh0JWYHXte2tXyh7XZZpb662bnIJNqCYnT3B5MCJnIeAD98j9aK7x0CxgJUknrDyjNN1CGDOGSxVuOK9o6Nkan66lyiDYXwqeBCnsDExbMunYAh4OiKnRPjd/2fjkjYwoBul+dMkhahIhb9Gke/Fj/HrW5domcni8lTexvP2u22lwoT8GPXiUZ0yqm0qVvBf104Qm25u6A4pXDTZtCY+2xDNMk6bZXv54OMjsTzEazRFbw
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7E7CEF18CC55443BFE0A621F43FF567@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3391090d-9c55-445e-817c-08d798e0f586
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 11:00:25.7332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eorwiOtcbboatseT7jYniqPzUAxr52CMlG1T58ROZxmz1KME80q79/Mm3ZHMl7tsU+lLvrPkCjSyJt2rDk7dMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4808
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
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "timur@kernel.org" <timur@kernel.org>,
 Diana Madalina Craciun <diana.craciun@nxp.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "swood@redhat.com" <swood@redhat.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman made a call for volunteers from NXP to maintain
this driver and I offered myself.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4017e6b760be..62082e5f7101 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6155,6 +6155,12 @@ M:	Maxim Levitsky <maximlevitsky@gmail.com>
 S:	Maintained
 F:	drivers/media/rc/ene_ir.*
=20
+EPAPR HYPERVISOR BYTE CHANNEL DEVICE DRIVER
+M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	drivers/tty/ehv_bytechan.c
+
 EPSON S1D13XXX FRAMEBUFFER DRIVER
 M:	Kristoffer Ericson <kristoffer.ericson@gmail.com>
 S:	Maintained
--=20
2.17.1

