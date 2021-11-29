Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFE462894
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 00:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J32BZ6sqVz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 10:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=sel1 header.b=hANVq6B6;
	dkim=pass (1024-bit key; unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=selector1 header.b=kjybq5TO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=selinc.com (client-ip=148.163.143.141;
 helo=mx0b-000e8d01.pphosted.com;
 envelope-from=prvs=096727bffe=eugene_bordenkircher@selinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=sel1 header.b=hANVq6B6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=selector1 header.b=kjybq5TO; 
 dkim-atps=neutral
Received: from mx0b-000e8d01.pphosted.com (mx0b-000e8d01.pphosted.com
 [148.163.143.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J329k2Q9Qz2xBD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 10:48:40 +1100 (AEDT)
Received: from pps.filterd (m0136176.ppops.net [127.0.0.1])
 by mx0b-000e8d01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATMijaF031184;
 Mon, 29 Nov 2021 15:48:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=sel1;
 bh=0O6tqRRoDyTk9tPRlrjdIwXyLxaV1MZkBUNCqycrmuk=;
 b=hANVq6B6sNBu6QRcj/XkQwW+enLzF4TcYyN7YmaynK4VSUTX6ZffPG0xPEQfeTwg+YJp
 rT2DgFUh+GD/JiVZTr3JlaAHbosxUTi3kCWp2ZhkfIGFhMvhi3j6z3TuCvkv3AoRwo4v
 X/3E32xQsKeUu3qmhEIdErK0G/y2NwRiz3LA4+lfHJ45HA+bjCYak+UORBK21Pdp5Al7
 kr1PjTvtj8l8t8chQxdtgkFW+H/gOQs2H7KfldNgfE67H1y1cV+qZn5Hv6DXuCg3sa9h
 uAPKpBRaSpx3an1Ag0ykyNo7QygiGtuLia2qPU4KqGnZV3bUVhtfPYJQRqJed65i4I8J wA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=Eugene_Bordenkircher@selinc.com
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0b-000e8d01.pphosted.com (PPS) with ESMTPS id 3cmt548j4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 15:48:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdJavker3of2QpXO5fdClO4EsSt7R2uW2KpPrv+jAJLWUq5gTgT/ZEl/ioCheeTTmQbFD2hudcvYG4ZLJ50DmquOH4UVAnEQ0Oh+KwMF1ryTQM/MpObNnCS3dj56BGu7sKh4BEFMY17zIhqkJ+0ocGi59IStmSWv8z2Nv4Ejh3aBefktBcKAcA/uor4o/IokTiIzC3/RRLh3IFP/2qqXd6KzgpnFxqkt1M5oCR57cCZpDbLyCvk5pL4oP/8zlVAV8L0Sxgd54tvbuvUEu8Y89ZLu5LQvolsvkr0d1XxsfvUVYvBj4h/zUZ4wz3CFyKObqVePVZCdj0NmQYQ9zlNamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O6tqRRoDyTk9tPRlrjdIwXyLxaV1MZkBUNCqycrmuk=;
 b=RttY7D/eU/yLOZY1aL3wMb9VrMp1171WFh3FM1Eo5v6JWG3r3ch+pzvjsj3VF0Bp/0+v92QiUEy/E6eUZnqE7xE/wiOfhjBysjMw05dexYNGB6rRIIq/xnLnGdAfW4yxP7Czg5XPgYkdJsEruCPtGwIft8yPip+UuJ286J2drHdz1rQ+V3Y6msZSCsH1G6B+iICF5+ojTFUl6h/k0qudVAGS1OmUfMFxMlTil+NdEqh1/bUcNSZipGnfioXgjWA7AidwxD8EqLdFURprMyZiKqPnskrMdcZ4fQzaO9r+qI6p2P73UPi7L7JVhpWwR8Ly9TIIjFEQUacc8MuU1/Gv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=selinc.com; dmarc=pass action=none header.from=selinc.com;
 dkim=pass header.d=selinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O6tqRRoDyTk9tPRlrjdIwXyLxaV1MZkBUNCqycrmuk=;
 b=kjybq5TO/knHHyiJlcwtX4/hEXYVk3QK6zb86nQ0b0EZFSdm9jdWGSE9uM12YA43Sq6YWhC1lC2KOu5MBRHS7xi5FHP2SrQP4KkH+ddNExKpbuZveeaflX0PWlViCgM9KqFAqVp8EGskySHSKwSSYSVGf2zO884m/GRDvO1kE+c=
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 (2603:10b6:301:34::25) by MWHPR22MB0318.namprd22.prod.outlook.com
 (2603:10b6:300:72::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 23:48:23 +0000
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492]) by MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492%4]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 23:48:23 +0000
From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
To: Leo Li <leoyang.li@nxp.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqA=
Date: Mon, 29 Nov 2021 23:48:23 +0000
Message-ID: <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e05c38d4-f729-451d-2fa9-08d9b392bafa
x-ms-traffictypediagnostic: MWHPR22MB0318:
x-microsoft-antispam-prvs: <MWHPR22MB031871687AB7B49EE192CB3D91669@MWHPR22MB0318.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: edFfaWPWwG6jFGGT5DVd/k+DpCyBx2aXKShFIUH2exSfTE8/i5G9VVsMNzdE5wJ2UeqjC/VZKYBbFu+lrLKHgxVA5hwCKdn+7vN0ZwPfVcoQOp3+9YrR4tPYR2cXUz9V4P9wueYYtKXID080sy5NGZVfBlfybC2f1iXOq3Y/mzGSHK3juLuhJlfcItaAWm20NRP+NF9TCOMQVB1o3qXeDHVaLIv7aqmHt9zyQxspqGI9o2gEZbrymUaFrlX03uAw8HOaEQKIk1isy2c718acSH28p532/QT2ynietv/pP0fHvG3/nsf6T6jJfQS3FJPVeLZ3Tk9i2lv9WWx5iapTHkuDltLE1S8qFOgHgeWmtF/rR8eMo/v1E10+MV+AthSe21CfysTu9LT4rk5eJSDTcFg4zhPslpWCd8YAxwocmul/PttcsvCCGa3ih4ZmekT18FFK35mZLKepj+AaG2ObBPbC2JCHdDY5MZQf3KMkoumVsEXDFa4ydvRTy7zQ+hOyQDITwN/hqesFmAcXun34E43D62oMD6eOaCRtqg0XN25R7ZV6Vkf497u8UgwAf6/R7n+KqOrThG5HsGFxP3tEe4HtNqk8rJ4bQ2XWMiDDuLmTX9Pm9JmrkLtyCBrI/JQf5BYBtPkRmIJjnGoCHFwABqFs1oZJB7udIzexa77KcqLYPxscUO8Bi6ObmjwssC5TBZBRIbK9Jqv3RV0/QBTa+PGIeH6kebWSFt2sDIkRjhE/fkWKmG9/HAf9BvI2qWHpV1V3+AKb8ePe1couyEUabMz9PjBrfKF8tAZ57AcIlwYjxfFse64ulyizLdJxf4W0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2201MB1520.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(4001150100001)(26005)(7696005)(86362001)(110136005)(54906003)(53546011)(19627235002)(71200400001)(9686003)(55016003)(316002)(4326008)(83380400001)(2906002)(508600001)(186003)(8676002)(38070700005)(38100700002)(66476007)(33656002)(6506007)(5660300002)(66446008)(122000001)(64756008)(66946007)(45080400002)(52536014)(76116006)(66556008)(491001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6i0AoXETVoyj52JLjFZ/0n0RtaZZn5HBxcdYZcQWr0ECeYvh0KTkCrIWpN4n?=
 =?us-ascii?Q?Ykq8iryrIFMaYZEpp1zjPiPkuJNxaCv8L2EKAxWBCNVUTHJehfvK7LoosF/C?=
 =?us-ascii?Q?ZQ5Nu0aw4tRkzHtzqg+ZhpaFQ7Y/eckZpmM3mDbg7fvEhn3xwrjw9H4aXPlx?=
 =?us-ascii?Q?Yxv3eWro/GIA44gwllwlAytQTLe6T5iFIXiEs+sISDSLPr0wIv+KbKGAc5B4?=
 =?us-ascii?Q?Gp+l4rZfqWMCk29+5YPvNgBi/zINxC9q6KPYFKJxq7EsEo/luZ4jEwhGGA2o?=
 =?us-ascii?Q?k/IS8RXy5Akf8nVlU+nAgaYFsnCyji4PIvpN0Ian0Lzg6Noq6xGrro92QyIs?=
 =?us-ascii?Q?RrrM3szu26EoSPas43fRi6PGX2SZUTIeV3pMy1wIMDUNWvXCUtV2O6Pwd4h9?=
 =?us-ascii?Q?gGYqH5Rzfi1pY1kr2x1d0FC6dMUk5RmxUwTGARWc9Q+872Mbh01jd6y7AJhi?=
 =?us-ascii?Q?Y47bKLaDMx1seBBXUmhS/BYKLD1rJ9VM+rqTRJTjY4dgLitZQJ3nyI7DCiSU?=
 =?us-ascii?Q?Bt2ogufj6xC6nzaIu08ULSxbqYPsT3ZDdhDSYkYk9w7F9a0kMM9W8x2yfDN8?=
 =?us-ascii?Q?z5XjDqHykvGPPVhv3GCopPTmFBUlOnWwRinsxJuM8Ijg3ECZys3irLW4EbCo?=
 =?us-ascii?Q?25iUtzL4Xek0nsfrQS4+HhHkxLhQ+y39XfPEnqhAj5laXWL1tcEWieGGJZZ0?=
 =?us-ascii?Q?T1yXwdttcLCogSJB5vhTkcZToSxQLStJ/sR/3cfsxyabdXIMu9H8AVtF5WRN?=
 =?us-ascii?Q?8Msr7qXiqCksiSIRraJD8tNwkUSlp9GQVPyrZFc7vVGrUTDOF/vJx3usoAVm?=
 =?us-ascii?Q?Y0tWE0hZRR6ELNrVFQJ7sZaRFLiKkxnWjNaeadQPa+ZK/zrqg/facHFjEpel?=
 =?us-ascii?Q?ZFg7GNGnp3a6QrhBLPry+v87dlq9aaBKteUqfZXMph9yvxGhIjqm9nL9uadH?=
 =?us-ascii?Q?NIddktXtvp5x+FcI/D3ZSLhgInZJa3NINlZ+lebxfCFhhp8xpTNSzbHrCOov?=
 =?us-ascii?Q?bOZWssUxHGXFA3ZZoxlu6gHVX33C88mH9vNqSV1EjsO5AJCWf5Z0XaVZ+IW9?=
 =?us-ascii?Q?+PDr5WHEdY8DJx103fRxEVguoUwNrvZN2q/dw7pPM/4NrZQ2KhLISPfGmu9+?=
 =?us-ascii?Q?IEWty0Q/73lytD5SfMz/MzMQUB6Xji80alKR3CwBX5VUqFj3N6m4hMzwgNkt?=
 =?us-ascii?Q?We3SlV0S2RctxFBVHuARND5bFoI3p4cYJIfhKP66yEEBSHa1bfQco+nXs7xE?=
 =?us-ascii?Q?Tb8gDA5XLSkKmiUqYPxKQrCoPN8JDrG5l28lzikObPDj/chd6cqAVva4RQc9?=
 =?us-ascii?Q?fC7izuSx2KIG/ow18B9bewdy2RtR/xVf4xjfhGav7Npo4ykC1ZF63L0uVtBP?=
 =?us-ascii?Q?JJmjjnZgjQlu1e69XFIwBYMLeyDF+DEbs36RvxlRCDwjaJ5u8VGs9yIe9jOq?=
 =?us-ascii?Q?mObI2JDKmJ2PKULL9oYBlEymsjSlRECV76iW1AFUrRU9HBc2jsWrncWdzJdH?=
 =?us-ascii?Q?ZCtPuCB4QmLswhogXAOEt5d0EpAlPSiw/msPNQTSxhzrbXBD1KrHoR6LteR+?=
 =?us-ascii?Q?IoWDyyMkLcmrW55sSZauP8OoXsHEhikGGZMH9n5wlo9zfluT4N8s6Vu0yMGA?=
 =?us-ascii?Q?WJRmsjrVDPbQrChraBHFTpPQU5C4KOPTt70x7CrzOw+P+b0I3UVCkKAmfOI0?=
 =?us-ascii?Q?sOhrzQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2201MB1520.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05c38d4-f729-451d-2fa9-08d9b392bafa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 23:48:23.0852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hEKXDDnuY3PCs8Uun22cZYI7auBp2+nLICjzYD6qDV3gLci9NZ62s47/LjL6/gtM7cxY+4krABbNgdKwqbxf29+BMX397eCXBdeAKaUBXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR22MB0318
X-Proofpoint-ORIG-GUID: 8CQp1Q_vNh7BGEjlFd1lw7SCujdW9ekZ
X-Proofpoint-GUID: 8CQp1Q_vNh7BGEjlFd1lw7SCujdW9ekZ
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290114
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Agreed,

We are happy pick up the torch on this, but I'd like to try and hear from J=
oakim first before we do.  The patch set is his, so I'd like to give him th=
e opportunity.  I think he's the only one that can add a truly proper descr=
iption as well because he mentioned that this includes a "few more fixes" t=
han just the one we ran into.  I'd rather hear from him than try to reverse=
 engineer what was being addressed. =20

Joakim, if you are still watching the thread, would you like to take a stab=
 at it?  If I don't hear from you in a couple days, we'll pick up the torch=
 and do what we can.

Eugene T. Bordenkircher

-----Original Message-----
From: Leo Li <leoyang.li@nxp.com>=20
Sent: Monday, November 29, 2021 3:37 PM
To: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>; Thorsten Leemhu=
is <regressions@leemhuis.info>; jocke@infinera.com <joakim.tjernlund@infine=
ra.com>; linuxppc-dev@lists.ozlabs.org; linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org; balbi@kernel.org
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to=
 unrecoverable loop.

[Caution - External]

> -----Original Message-----
> From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
> Sent: Monday, November 29, 2021 11:25 AM
> To: Thorsten Leemhuis <regressions@leemhuis.info>; jocke@infinera.com=20
> <joakim.tjernlund@infinera.com>; linuxppc-dev@lists.ozlabs.org; linux-=20
> usb@vger.kernel.org
> Cc: Leo Li <leoyang.li@nxp.com>; gregkh@linuxfoundation.org;=20
> balbi@kernel.org
> Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list=20
> leads to unrecoverable loop.
>
> The final result of our testing is that the patch set posted seems to=20
> address all known defects in the Linux kernel.  The mentioned=20
> additional problems are entirely caused by the antivirus solution on=20
> the windows box.  The antivirus solution blocks the disconnect=20
> messages from reaching the RNDIS driver so it has no idea the USB=20
> device went away.  There is nothing we can do to address this in the Linu=
x kernel.

Thanks for the confirmation.

>
> I propose we move forward with the patchset.

I think that we should proceed to merge the patchset but it seems to need s=
ome cleanup for coding style issues and better description before submitted=
 formally.

>
> Eugene T. Bordenkircher
>
> -----Original Message-----
> From: Thorsten Leemhuis <regressions@leemhuis.info>
> Sent: Thursday, November 25, 2021 5:59 AM
> To: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>; Thorsten=20
> Leemhuis <regressions@leemhuis.info>; Joakim Tjernlund=20
> <Joakim.Tjernlund@infinera.com>; linuxppc-dev@lists.ozlabs.org; linux-=20
> usb@vger.kernel.org
> Cc: leoyang.li@nxp.com; gregkh@linuxfoundation.org; balbi@kernel.org
> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list=20
> leads to unrecoverable loop.
>
> Hi, this is your Linux kernel regression tracker speaking.
>
> Top-posting for once, to make this easy to process for everyone:
>
> Li Yang and Felipe Balbi: how to move on with this? It's quite an old=20
> regression, but nevertheless it is one and thus should be fixed. Part=20
> of my position is to make that happen and thus remind developers and=20
> maintainers about this until the regression is resolved.
>
> Ciao, Thorsten
>
> On 16.11.21 20:11, Eugene Bordenkircher wrote:
> > On 02.11.21 22:15, Joakim Tjernlund wrote:
> >> On Sat, 2021-10-30 at 14:20 +0000, Joakim Tjernlund wrote:
> >>> On Fri, 2021-10-29 at 17:14 +0000, Eugene Bordenkircher wrote:
> >>
> >>>> We've discovered a situation where the FSL udc driver
> (drivers/usb/gadget/udc/fsl_udc_core.c) will enter a loop iterating=20
> over the request queue, but the queue has been corrupted at some point=20
> so it loops infinitely.  I believe we have narrowed into the offending=20
> code, but we are in need of assistance trying to find an appropriate=20
> fix for the problem.  The identified code appears to be in all=20
> versions of the Linux kernel the driver exists in.
> >>>>
> >>>> The problem appears to be when handling a USB_REQ_GET_STATUS
> request.  The driver gets this request and then calls the=20
> ch9getstatus() function.  In this function, it starts a request by=20
> "borrowing" the per device status_req, filling it in, and then queuing=20
> it with a call to list_add_tail() to add the request to the endpoint=20
> queue.  Right before it exits the function however, it's calling=20
> ep0_prime_status(), which is filling out that same status_req=20
> structure and then queuing it with another call to list_add_tail() to=20
> add the request to the endpoint queue.  This adds two instances of the=20
> exact same LIST_HEAD to the endpoint queue, which breaks the list=20
> since the prev and next pointers end up pointing to the wrong things. =20
> This ends up causing a hard loop the next time nuke() gets called, which =
happens on the next setup IRQ.
> >>>>
> >>>> I'm not sure what the appropriate fix to this problem is, mostly=20
> >>>> due to
> my lack of expertise in USB and this driver stack.  The code has been=20
> this way in the kernel for a very long time, which suggests that it=20
> has been working, unless USB_REQ_GET_STATUS requests are never made. =20
> This further suggests that there is something else going on that I don't =
understand.
> Deleting the call to ep0_prime_status() and the following ep0stall()=20
> call appears, on the surface, to get the device working again, but may=20
> have side effects that I'm not seeing.
> >>>>
> >>>> I'm hopeful someone in the community can help provide some
> information on what I may be missing or help come up with a solution=20
> to the problem.  A big thank you to anyone who would like to help out.
> >>>
> >>> Run into this to a while ago. Found the bug and a few more fixes.
> >>> This is against 4.19 so you may have to tweak them a bit.
> >>> Feel free to upstream them.
> >>
> >> Curious, did my patches help? Good to known once we upgrade as well.
> >
> > There's good news and bad news.
> >
> > The good news is that this appears to stop the driver from entering=20
> > an infinite loop, which prevents the Linux system from locking up=20
> > and never recovering.  So I'm willing to say we've made the behavior=20
> > better.
> >
> > The bad news is that once we get past this point, there is new bad=20
> > behavior.  What is on top of this driver in our system is the RNDIS=20
> > gadget driver communicating to a Laptop running Win10 -1809.
> > Everything appears to work fine with the Linux system until there is=20
> > a USB disconnect.  After the disconnect, the Linux side appears to=20
> > continue on just fine, but the Windows side doesn't seem to=20
> > recognize the disconnect, which causes the USB driver on that side=20
> > to hang forever and eventually blue screen the box.  This doesn't happe=
n on
> > all machines, just a select few.   I think we can isolate the
> > behavior to a specific antivirus/security software driver that is=20
> > inserting itself into the USB stack and filtering the disconnect=20
> > message, but we're still proving that.
> >
> > I'm about 90% certain this is a different problem and we can call=20
> > this patchset good, at least for our test setup.  My only hesitation=20
> > is if the Linux side is sending a set of responses that are=20
> > confusing the Windows side (specifically this antivirus) or not. =20
> > I'd be content calling that a separate defect though and letting=20
> > this one close up with that patchset.
>
> P.S.: As a Linux kernel regression tracker I'm getting a lot of=20
> reports on my table. I can only look briefly into most of them.=20
> Unfortunately therefore I sometimes will get things wrong or miss somethi=
ng important.
> I hope that's not the case here; if you think it is, don't hesitate to=20
> tell me about it in a public reply. That's in everyone's interest, as=20
> what I wrote above might be misleading to everyone reading this; any=20
> suggestion I gave they thus might sent someone reading this down the=20
> wrong rabbit hole, which none of us wants.
>
> BTW, I have no personal interest in this issue, which is tracked using=20
> regzbot, my Linux kernel regression tracking bot=20
> (https://urldefense.com/v3/__https://eur01.safelinks.protection.outloo
> k.com/?url=3Dhttps*3A*2F*2Furld__;JSUl!!O7uE89YCNVw!a6nsIMfn544OIzmshw3H
> bMBVcbwor4cV2Q5OsST7-86jy_YZKvDsN-558Ris4wh8Zawz4puN$
> efense.com%2Fv3%2F__https%3A%2F%2Flinux-
> regtracking.leemhuis.info%2Fregzbot%2F__%3B!!O7uE89YCNVw!aHa5_mLM
> nBeDjINlAtV19tBHm-
> He9jbusXucMA5h7oonHvNFwYpOHAaaqqewPOuGK9HAzJUz%24&amp;data
> =3D04%7C01%7Cleoyang.li%40nxp.com%7C859ce1560a7344729cea08d9b35d2e
> 67%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377380350721308
> 84%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DONQZyAKXNgok
> 6LgYvnaAL7LVY%2B5Wl7pXglZDqWUJZMc%3D&amp;reserved=3D0 ). I'm only=20
> posting this mail to get things rolling again and hence don't need to=20
> be CC on all further activities wrt to this regression.
>
> #regzbot title: usb: fsl_udc_core: corrupted request list leads to=20
> unrecoverable loop
