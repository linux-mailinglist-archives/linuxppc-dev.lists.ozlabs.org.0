Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6792055A33F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 23:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV8lP20X5z3chL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 07:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=zBQea/8S;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Cuwlryh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=zBQea/8S;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Cuwlryh2;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV8kZ2hryz3c8k
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 07:04:15 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OHdORV017930;
	Fri, 24 Jun 2022 21:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RaQdorPDGBosB+eXnBw1xLm5w3W/cZHiEfuq5spPXCY=;
 b=zBQea/8SpTlSvuOHWezeujLUoYhBkzvkRRI/bu4rOeAWeo0qa5/VTD1q3mObAkOFbs86
 I0dGMz2dg7XRIFleOTX2qF4Cf8s1/SHVma+hrLUjolh8GyFBfpGzggIn0VOmNq8UZIkh
 Y/ByP0pnJAHOo/5FiUkLVb6FkVfXW/zhszNau5IkLlXn/dPwcTj/huzCgQjqI/ksLvdm
 pUfB1t10DzfJc1J2oq62D2G501Vibetau8PZewae1FAdksZrP20daxXtmFbXduuUyA7e
 HM81qO/uLBgDafL9+rNuS10Wce3nZULSwYJEVc5VEUI2N6mb/xUkW0baMhYrTehCowJu Vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6at6t0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 21:04:10 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25OKug2W003091;
	Fri, 24 Jun 2022 21:04:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtd9xgthq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 21:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKDV6PrU4+H5of4GC1vNk4qjTUNYjmbuzc476n/TUnQ5ejBeB3RC1vASWKx3pe1KnySLsg7hCsn7jGLm2nOEBXNSd0fuTXCrySMbIUB3bsB2Cz1G8vxPq1p+h/sCNiWf2zdMjcclfTv+GiqJSB9uLkW8Z4e7XcSCVJHMt/1zYaSWlBJvFuGx5iaojT3gUk+yvnYbJ+OByDOeAkVxpuQanoq5bvrdtZPVxhA79slmVfkq8Y3sMU/OdEmy6RflSYz3jkYtTTPI/hc5OAM576V+j6xPBpPFjXVRU/qOmAsdKosvnpBR34HD7DiAWR4XLZPUC18yoz20DbrAmF2VOsARmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaQdorPDGBosB+eXnBw1xLm5w3W/cZHiEfuq5spPXCY=;
 b=EaEF/xaPGg5F1zN9DW48R6u+u1Pa5D26jEmYVsDTVC4BAz7cgxinZeImeJ9YSTiGJ0c8G40SQPNk/p8c/Cd8Rxaf+qSQ9xk+HAiHzh3lbuMH492CK1Np7skswZMZO1L9ffrI5JbAak5hoP77+YdH+2v7svcYie9SYiDrITqgjuMU/QrhnmRcpRXufBCpEp6Kp6al+NXYj5cZBq1RopG2iVTPeTuh8daykAVVTMen1ueMSkiec3oZO2OpPmxtg0Ai42XM6FRp99qgGs+LO10tvQ9LTQDVUx3Z2GH8+Nt3FCWQPdNj4rgZNe9PZHOeUjtb4jUn73CCRnChRcG2+T8l1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaQdorPDGBosB+eXnBw1xLm5w3W/cZHiEfuq5spPXCY=;
 b=Cuwlryh2Y9/X2ZHsEwWa9/Zg40aXzLU1T9TSnh25EXUdrkq7SrGDCyzRoMY+HOX/QcEbuPKr4LvCXFjl7MkhvvW3cf0VMbDq0LAOq2N7LIzUGMvcEBXrfO0qAM2C0NhLopoG69xrxU2wg1fuPfeGkTTYXdYcNCeqSL5oJV2f/m4=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DM6PR10MB3082.namprd10.prod.outlook.com (2603:10b6:5:70::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Fri, 24 Jun
 2022 21:04:07 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c%7]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 21:04:07 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: power9 slab-out-of-bounds in _find_First_zero_bit
Thread-Topic: power9 slab-out-of-bounds in _find_First_zero_bit
Thread-Index: AQHYiA3x5VQrcuJdXESkF1Wg/+Ovsg==
Date: Fri, 24 Jun 2022 21:04:07 +0000
Message-ID: <20220624210400.gic4akzlwwdqkxym@revolver>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 913d7c28-6159-4faa-47c8-08da562513fb
x-ms-traffictypediagnostic: DM6PR10MB3082:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XFE7j7x0QOXvmytiBGZ4UFtTtFL4hVwpisRFKYrqtZVc8SXDC05WK4xTqTAtIUXf4lcW8uHOytWRRsjNYhmO3CJ9VcezOUOcMEw0kf3h8dLggY//t7eJt1r+NayE+ovUF6pIJzurDUqnawqjel3QhFGq69jyvQgvStnc+VxV3pSvX/VQLzh0tO6uiMm8hKyN0+Oqhn3riDhlFHdCXrHm21wkJqS7knzOHYM8X9iMhq/xnWYcelPSzKTKHJqWkn51jkVfYb+wJVqzzX/NsYRa2LsE9I8nccU4wg0V55fbtPU3w/FPLNLVBER6ZVoLfqLt5fxVtfQXhGpSrKENHKxtFURdDRNkzltcLHSsw8zXGIw7GPqpvmSS0BTfg2c0qyxn+5F1P3hmZRwwcQhvN21s8FuW9w89conFsQo/i+7Bg27C81OQocPkA4CuBTvhO1qEaOyxCeN6VV31aufG44ajpOP7ZZtGNvf1mRcretpE8RBG8lL0IbOoDy1tPgee+gNmZ/chMe+ZUiv2JonZsa8VAAc0oKklGYMQvWo6VcroY7ajnpGNFscm40md/kx/8jgjqRyV6sdC5nSVSuQlKp1xWSEN/qxjcoXBaFj/0+yNJaaT9DFbY+8LSIoL66/LSohgLVN8F7RqLzKbxf/zIiglzsf8bJrQE4eI+UFxvLfgbxiroXfK4fLxpy1zZO1ryWQ8R6viq67fs++/7QrKtY/66p1rPgjnIswFgcuPOoDMy5P25Cu5wZ4yz3sJgi/qad62AiUXmr8CT7mF4Udm0HyfubAX7hR33iRX/k/TolK9dE4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(366004)(39860400002)(376002)(136003)(71200400001)(66446008)(91956017)(44832011)(8676002)(66476007)(66556008)(5660300002)(8936002)(76116006)(316002)(2906002)(6486002)(4326008)(33716001)(64756008)(66946007)(186003)(38100700002)(41300700001)(9686003)(110136005)(6512007)(83380400001)(478600001)(122000001)(1076003)(86362001)(38070700005)(6506007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?H7Qkab6qY9ZQbMsa6QOqUCYX2bFYq6L82j0ex6ZUApY1oegRVrZKdXeggCMS?=
 =?us-ascii?Q?VM83y5yioTL8WIYaoC366iUND+H2qCkJyOLFzZ5sarCWGJRoV1ZVEf747N7G?=
 =?us-ascii?Q?ji+gTnzOo3HWK8g+MdTuCyuL9wgRyMV5kDiuGKyfYdlyIPIkyB1dNCOwh43X?=
 =?us-ascii?Q?8F8+Ugny7Qt4hxuMGFekleO22u9h+U0Ow8umXO+utvzeUXOkoU34nskFxgyC?=
 =?us-ascii?Q?gD2I65eZH5DRy8Emzfmwe69g3Sg+zLq1mh6iP8EzsMVqP1HCu0Eo3Rev/rv6?=
 =?us-ascii?Q?TpNx0zTAe5NTCIn8w8gmpwBSDGaCgJaBsuxN83TfyXktjTPNxQNMzXcB9Mve?=
 =?us-ascii?Q?OEWP2y5POiKftRU3knDtBcbIeh7J4W5aSf8dnkzZsAN/pjaPjUfhL8zTwRbC?=
 =?us-ascii?Q?PH/KnbynZ6TwLb/xYWHU5aY1dxBuuCSR0uZ5+TUWXfvqdP+8MRoOZE220S8Y?=
 =?us-ascii?Q?nQaSsU6U4dFNDRdC7156wmZ6kvwIjN3U0shsIdY7iK+taerMdwP22DMfflhr?=
 =?us-ascii?Q?h7+wlZW/N0PPRt/t4Q5wm3tmZ0QE+sxYMrW9gKAZHbXGV60tXYejicNfX617?=
 =?us-ascii?Q?SHFEi5L4toyM9BgcuXcA5RMBkqDULwb7DCxLv5rQqzkdEh3STl/Oet775kJZ?=
 =?us-ascii?Q?nbH/3Q5p7I4PQcKsViDTnUeVxMDLLY+vyxCJYYoKLKPlIF1cVbn6qx4avQMA?=
 =?us-ascii?Q?RYqCpZ/6+q9vKv6OD5TcLQ6lS96MsPtcxgRsutGA3iqh324fGOuUibaosQTV?=
 =?us-ascii?Q?doQIF4TgpKBcgfStprrampoC9CZv/ctNA4Z7tKRMRjcxAqfM/+zLqP3lbA6X?=
 =?us-ascii?Q?+U4B4kgNyiZ3gh6X2L8wkQRJgQoWMR29RoUvuLmqLvchUaiUvpkyzQ/Eukw2?=
 =?us-ascii?Q?hCvd9D4BYeNbRu9UedEJhVZCpUAOTLqkcfJ+qTj1FxA5JDaKHJ4+C90sXNlc?=
 =?us-ascii?Q?zL/n0/n+yOvnKZKTurQYsfa0+tdhAoPmU3hCQXsiHyGMzeGb6hoQW3fHc/gi?=
 =?us-ascii?Q?gE1nP3fktcZjlPCyCUm2tiI2Y0uRMmvMD+qngN2JSDYX1OhRo7Px29oSb5dY?=
 =?us-ascii?Q?MmG6ODXpPpEj1t89LI7bBvPfvA6uLnC3v+6Yx9CcHpo6dB5qiuBGw/9Zcxoo?=
 =?us-ascii?Q?gicuROSv4roqyiz/EndvwNEmvlonyptxR/TcjsL4FXDHKT5krGHaxew+2qqE?=
 =?us-ascii?Q?B1HLpuds3fzp9Pt5WSBZhna810W87kaSDmKClu/uOd5f4ScXhLqYUpDyaHdy?=
 =?us-ascii?Q?y45sZc/8sD7GJUCFJ8TEwPHj0cGX30ILY2ZYLX2Kpi9LdCm3iN9Ibx4iuGEv?=
 =?us-ascii?Q?T40iLmRu5gl81Jp8zoZLUAWGH1mL1edEB09vSiAyU/zY7w3ym7ua6EAvpRAe?=
 =?us-ascii?Q?DUcMY2Q6bqbWyZ41rIrKhTW5Tve9bIHJiNf73k+wbOOX+J913t+kB5oSp3wX?=
 =?us-ascii?Q?sD7u5gj13BL+cUmeuSftdquSt99gbvlcutKYjCa/uPJN4E6WnJ6tOKJ0I3VE?=
 =?us-ascii?Q?uoLPGMo3EDO4/qXCmYBzfpVD4a/52oKuhNhv3EjwjFUMsEIlzze7oI4evhoZ?=
 =?us-ascii?Q?O4wd85dXw2BpvVrwamvRG2WOBIRERs7Hz4/GOEolpg+R5H1sYpOadl8EIL3H?=
 =?us-ascii?Q?iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37AA98ED64A78646AD7A02D2C5D8BB19@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913d7c28-6159-4faa-47c8-08da562513fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 21:04:07.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odizNqW3pmAgBqCI3amokUTIMMZrM7OIxVPioRY6eTBWqVqUt0DIccsSx5wUDk9gert890V3Q+IXbNeVT0eYKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3082
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_09:2022-06-24,2022-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=698 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240080
X-Proofpoint-ORIG-GUID: xa1totMhVfvo-ZTXpaSYdwh8imZvTu1c
X-Proofpoint-GUID: xa1totMhVfvo-ZTXpaSYdwh8imZvTu1c
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

When trying v5.19-rc3 on my ppc64 VM with KASANs enabled, I get the
following on boot:

[    0.174621] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.175501] BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/=
0x140
[    0.176132] Read of size 8 at addr c00000000f7f0410 by task swapper/0/1
[    0.176900]=20
[    0.177844] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.=
19.0-rc3+ #8
[    0.179461] Call Trace:
[    0.179907] [c0000000119677d0] [c0000000075af350] dump_stack_lvl+0x74/0x=
a8 (unreliable)
[    0.181107] [c000000011967810] [c000000000632220] print_report+0x330/0x7=
40
[    0.181977] [c0000000119678e0] [c000000000632980] kasan_report+0x100/0x1=
f0
[    0.182788] [c0000000119679c0] [c000000000634de4] __asan_load8+0xa4/0xe0
[    0.183560] [c0000000119679e0] [c0000000018b92b0] _find_first_zero_bit+0=
x40/0x140
[    0.184119] [c000000011967a20] [c0000000000c5f7c] xive_spapr_get_ipi+0xc=
c/0x220
[    0.184689] [c000000011967ad0] [c0000000000c1adc] xive_setup_cpu_ipi+0x1=
ec/0x420
[    0.185231] [c000000011967b90] [c00000000a033b3c] pSeries_smp_probe+0x44=
/0xd4
[    0.185825] [c000000011967bc0] [c00000000a01c77c] smp_prepare_cpus+0x62c=
/0x688
[    0.186359] [c000000011967cb0] [c00000000a00ea94] kernel_init_freeable+0=
x24c/0x520
[    0.186893] [c000000011967d90] [c000000000012b00] kernel_init+0x30/0x1c0
[    0.187395] [c000000011967e10] [c00000000000ce54] ret_from_kernel_thread=
+0x5c/0x64
[    0.188124]=20
[    0.188429] Allocated by task 0:
[    0.188820]  kasan_save_stack+0x34/0x70
[    0.189298]  __kasan_kmalloc+0xb8/0xf0
[    0.189617]  __kmalloc+0x148/0x570
[    0.189909]  xive_spapr_init+0x478/0x6fc
[    0.190212]  pseries_init_irq+0x48/0x284
[    0.190523]  init_IRQ+0x4c/0x8c
[    0.190810]  start_kernel+0x25c/0x4d0
[    0.191130]  start_here_common+0x1c/0x20
[    0.191549]=20
[    0.191845] The buggy address belongs to the object at c00000000f7f0410
[    0.191845]  which belongs to the cache kmalloc-8 of size 8
[    0.192594] The buggy address is located 0 bytes inside of
[    0.192594]  8-byte region [c00000000f7f0410, c00000000f7f0418)
[    0.193250]=20
[    0.193499] The buggy address belongs to the physical page:
[    0.194324] page:c00c00000003dfc0 refcount:1 mapcount:0 mapping:00000000=
00000000 index:0x0 pfn:0xf7f
[    0.195277] flags: 0x7ffff000000200(slab|node=3D0|zone=3D0|lastcpupid=3D=
0x7ffff)
[    0.196521] raw: 007ffff000000200 0000000000000000 5deadbeef0000122 c000=
00000f7e0300
[    0.197023] raw: 0000000000000000 0000000086660666 00000001ffffffff 0000=
000000000000
[    0.197558] page dumped because: kasan: bad access detected
[    0.197938]=20
[    0.198128] Memory state around the buggy address:
[    0.198676]  c00000000f7f0300: fc fc fc fc 03 fc fc fc fc 03 fc fc fc fc=
 03 fc
[    0.199218]  c00000000f7f0380: fc fc fc 03 fc fc fc fc 03 fc fc fc fc 03=
 fc fc
[    0.199671] >c00000000f7f0400: fc fc 02 fc fc fc fc 04 fc fc fc fc 04 fc=
 fc fc
[    0.200122]                          ^
[    0.200464]  c00000000f7f0480: fc 00 fc fc fc fc fa fc fc fc fc 02 fc fc=
 fc fc
[    0.200905]  c00000000f7f0500: fa fc fc fc fc fa fc fc fc fc fa fc fc fc=
 fc 00
[    0.201379] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Thanks,
Liam=
