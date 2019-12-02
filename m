Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE010F2F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 23:53:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RgQN6LglzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 09:53:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.57; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="ImnkRo0m"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10057.outbound.protection.outlook.com [40.107.1.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RgNR45nBzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 09:52:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+L6IKyFsPNxONHE8p32DtpovjvFP+0kx3L6s7LJ1s+3yRVAyGcloIE92RKyQ+rEJfnELTb8juTIgeHa0A+NALKzoR/0uXviYZ0fg77VPsWSPQJSeqzB8d8nqf1054O50gFNTmfi97XryzU0/VN+5Y4VjUt4ZLoT5L1n8nFBpGDoJ2bktqAIpr4Hv8GGatueo7qMZ1n+aWweCmkvJfWx2/w0Dfx2wEzXaoHJw1qkToO/7MzeeNnuzEET7udzhvknrz/31fjoe+NZWNLS6zoyUO9PpQC1zCxD1RPC34+e1o/mDF4SsbCGVaSvha8bwwyNOee4iic19KONefK/dvVQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8FyuXm79w//A8asyiSVH3/UepC+XF9SGERVHtcW1+M=;
 b=SuHlgac0rtibdh4w5zlA7vIFhDUrxUTBpt2UeCp5vH3t2DxyF4Vvn2hkmXt/4mZz8w6xon4/qUChN/8+wSlkwNuNgNyxYcQVeXVKpKlFhJl/e4lkYk3J11PIBguDcGmlMP9Tb4F1Voloaepucu+ED+ts6Zmzo6VV8CKp56fcrz1pPQ2z0Siz84m6Qu3LBFOyrYXsI0GkyHjR24POoZibHGTgOMWbYzvA5UqUhoOtWDokaBk6VGkvJs4WjdKZ3O2yC1lagvOrz+Oq8XN1bL1CQoXGRdeMTJY81uj4TBjNEdMlPIv8kj8WoZQEGz0pSvymw9Ytnl/nAacu55gBovkkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8FyuXm79w//A8asyiSVH3/UepC+XF9SGERVHtcW1+M=;
 b=ImnkRo0m+54eJ7tv6jesz+T8D2BzdKsVkjbHT2kcVdiKR3s0PahkfVUAx7NFp6DqetPb6j/WWqtre/KrPTjFKscd/fUFD7LbyiX/LiwkERoRNqSfKo4w64qvDZKQAn0gbXqOd4Vnqy/WfDXVO/I9VowiKPrgrNggGfTr+E0Th+Q=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) by
 VE1PR04MB6639.eurprd04.prod.outlook.com (10.255.118.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 22:51:58 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::e948:7a32:ae88:906d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::e948:7a32:ae88:906d%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 22:51:57 +0000
From: Leo Li <leoyang.li@nxp.com>
To: David Miller <davem@davemloft.net>
Subject: RE: [PATCH v6 44/49] net/wan/fsl_ucc_hdlc: avoid use of IS_ERR_VALUE()
Thread-Topic: [PATCH v6 44/49] net/wan/fsl_ucc_hdlc: avoid use of
 IS_ERR_VALUE()
Thread-Index: AQHVpfw8xYSflyw9IkOdsMxlnEQBn6enLxpw
Date: Mon, 2 Dec 2019 22:51:57 +0000
Message-ID: <VE1PR04MB6687B5428E3E4FA0F8F77DF08F430@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <20191128145554.1297-45-linux@rasmusvillemoes.dk>
In-Reply-To: <20191128145554.1297-45-linux@rasmusvillemoes.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f8e19fe5-4c13-4dc1-c242-08d7777a3c6a
x-ms-traffictypediagnostic: VE1PR04MB6639:|VE1PR04MB6639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB66394E3D2D3794331BAA4C378F430@VE1PR04MB6639.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(13464003)(189003)(199004)(71190400001)(54906003)(305945005)(7696005)(6436002)(55016002)(478600001)(66556008)(9686003)(6116002)(66476007)(3846002)(33656002)(81166006)(6506007)(53546011)(102836004)(229853002)(316002)(26005)(52536014)(81156014)(8676002)(186003)(5660300002)(76176011)(446003)(8936002)(64756008)(66946007)(74316002)(256004)(76116006)(11346002)(2906002)(66066001)(99286004)(6246003)(25786009)(86362001)(14454004)(6916009)(71200400001)(66446008)(7736002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6639;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHI+Ro1l1oUKotJ9dFwGUR+h9jhDj4qj0OJdjxd8pXEJUo0HpRfigtCooYWyPQfW3GPxUZPCykti0e545kdIT94ePVd5XGWj/FNPFCDpaBYRtD3Q/nmrFKtCn6bV/PJlG9qWesacx4regJGyHnok8vtkptn7Ktt1OCpHC5844G4Mxz0ZDfqZGiOj/dZ8gPVO14talZsntRqOIyQWDAyyZnS7InFxQM5vPjDM6rGXh36yBdx29NQV5QXUQzW0L86toxKPeT2HG2tdiNnxu6bMAUg4UdUJ4DP9qwERov4ky2l+mTQjRyLFEbZx+1e3/pPav/5kuQS/hLzD6kHVUReKAyN+eJ1LayTZyTzqnUa/h3ti8mFtqrzEQDuCARuMAYiTe1FBI9B3i4IavS86M96BjeVfcYFzH0hv/gz5EhDlfLH4wnkjQHnTDycWo+NcFpqV
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e19fe5-4c13-4dc1-c242-08d7777a3c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 22:51:57.8420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Cmoq7GJ25Rua++mGquLIq17ARcLHN5IKcLl5Fy30JWq85NVWNdYgiCKuMpoDkPteTmltYYeK4m4dPjOifD+EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6639
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
Cc: Timur Tabi <timur@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Sent: Thursday, November 28, 2019 8:56 AM
> To: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>;
> Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Scott Wood <oss@buserror.net>; Timur Tabi
> <timur@kernel.org>; Rasmus Villemoes <linux@rasmusvillemoes.dk>;
> netdev@vger.kernel.org
> Subject: [PATCH v6 44/49] net/wan/fsl_ucc_hdlc: avoid use of
> IS_ERR_VALUE()

Hi David,

Would you help to review patch 44-47 in the series?  If it is fine with you=
, I can take these 4 patches with the whole series though soc tree to enabl=
e the QE drivers on ARM and PPC64 with your ACK.

Thanks,
Leo

>=20
> When building this on a 64-bit platform gcc rightly warns that the error
> checking is broken (-ENOMEM stored in an u32 does not compare greater
> than (unsigned long)-MAX_ERRNO). Instead, now that
> qe_muram_alloc() returns s32, use that type to store the return value and
> use standard kernel style "ret < 0".
>=20
> Reviewed-by: Timur Tabi <timur@kernel.org>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

