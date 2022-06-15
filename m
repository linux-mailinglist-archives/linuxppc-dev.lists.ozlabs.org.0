Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D20254D7A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlhM2l56z3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRlBO4Lc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sumit.dubey2@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jRlBO4Lc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNRM24MTJz30F8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 23:42:37 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDeDnn020625;
	Wed, 15 Jun 2022 13:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=pp1;
 bh=hnYy/Frrc0+wzaTcrROi85o8/FtSNtCJC9Z/ol1ymdU=;
 b=jRlBO4LcbMyQkFiDSRGupntD5raYAUJBHqmYzHLLloiGE5qLBH09ZheHNnsyuSg9wht1
 xV6PYFN5tisiZBmIjW6feuOLWAMLbm/MmVSk6HA0gV65NP6nJuJjvi/pVG9mnmUiNdWK
 U0Ai/7ISmasv2XdQ2Ku6qx7Xl/yw17WGP1r1M6vcqLqys963gUAhcCo/h6UKNUht3YsL
 y/Mc31TCb3ySXF/o97uIAQWvGyN1/Pe3DvrNzFZoq+1S9kx/ZmvU9mPzdxKY76RtgsGX
 u42U/EXA9eBU+gydluRHWKpMlsbll/hYk7efHfBTHCbM4G4S1Q0fdLbHnzhAVhVIxXqO eQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gppw4267a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 13:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXBfzW1LcpgpyEOiueAC8kZJ8C2dG4q/j6jF7q9RMjOKOFZ0MMgCzpR+KwGQPgYBrxfqib8/pBxykjax1AOE2j4gVvRYHGUu6D2Cl3UxF37/DWY7G05i0dv5Oa3qVHowy3xBVheBhXJJLtDvwxGc4v3lNsAc/8qwL3gzOTdeEI+gEW0d/Mq7oHnr122+QDb6CIbf9TDwfuYshBxgAMj2j0J7m0U3epctAIqhZrH1hLVgFWGJw5YamXSxEbWRVKFbgcY4vE/zjJcdIfyRhpuIRZsKE0yALPHFFLxboKrMafXsv72cdQPtFfUwujm2/HDuTpF/cwJr0Zf5JMXLhcLmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnYy/Frrc0+wzaTcrROi85o8/FtSNtCJC9Z/ol1ymdU=;
 b=H06J7lc7wr0vmI1U4xyr83j+dD+Kwg//rPj2GNPdx6XNiTaI4htC9a0EDoS6Bqr8essFbBbPwPmSwwmcrjotDVFoKio9PuyTRAU/boWcv4I3neV/b2btnoFiWp9/2xjTmrlFFgmrAhxvuMNdPMvfeclB2cEPbLbUCwf832HeWDXAUFOetbgPkPlXjXl+IVOVi4AJ3rOvzSjxBA5j/gi2nqsdzuS83U4/qtqNoj63Gu1Jf+a8zV9my0c7wNraQmqk+nc0PtE/VGjGFcXREF9dStzLwvUM6zy5ztPAaGl2wIA0zJWd34t61ac8bx67fp0wycLMFt7YIFiB0QRRRX9F3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SN6PR15MB2240.namprd15.prod.outlook.com (2603:10b6:805:22::28)
 by BN7PR15MB2338.namprd15.prod.outlook.com (2603:10b6:406:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 13:42:26 +0000
Received: from SN6PR15MB2240.namprd15.prod.outlook.com
 ([fe80::e4a1:2216:a39c:4e1b]) by SN6PR15MB2240.namprd15.prod.outlook.com
 ([fe80::e4a1:2216:a39c:4e1b%5]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 13:42:26 +0000
From: Sumit Dubey2 <Sumit.Dubey2@ibm.com>
To: naveen.n.rao_linux.vnet.ibm.com <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Enable execve syscall exit tracepoint
Thread-Topic: Re: [PATCH] powerpc: Enable execve syscall exit tracepoint
Thread-Index: AdiAvY/nWQ+eUto5TgS/I+8fmXhM1w==
Date: Wed, 15 Jun 2022 13:42:26 +0000
Message-ID:  <SN6PR15MB22407BADB366C5A34B299E68D6AD9@SN6PR15MB2240.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b774b4b4-056e-4c44-858f-08da4ed4e2a0
x-ms-traffictypediagnostic: BN7PR15MB2338:EE_
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-microsoft-antispam-prvs:  <BN7PR15MB233817B0B9219ACB0762CEF9D6AD9@BN7PR15MB2338.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +N+GmcbfX1GcHaPper/eSbFzdODgljLr/m0Nde+Tuqg8VBsx6vJFGKrurYsQ1kI0bk0EL5U7AN5c1jb+4OkujKm0maMVmaouipG2IXAB/JRY8qFJy9ZaASmi9GtrybKGn2ex0nZ0Rs4ckwduEneO8zWYIn6Yz/yUA//Pss+resIRGf0PYVItM+iJj5hRZ98wFs1x8i1RzIO4suqARhYzHJ36RcUS0OZ7Fnf+LpkG1XCk3SJzRcmHE2ss0xSoRrkQlAO/fDEKq+bYU4bZ7CYiVOh9/j729aIQv4IROvmKEeWc5F0lU5Bn3xRpTLu2uAqdDJhV0snMLWD9Xj53GRh2XJZkVIkbSHQdHXNLfBuAwZ1BAT4NMU18epoD9oI0YF+eQg8hadQEP5fNKteLL8YbQ/tu8BoSgb5Wx8SFXD2FzuK8uA7MHUFSYsB8RG+pcPMd+bpI7EMV1kKZ0i5fTLK4sccnDLYRuXmrC37rOKSOihKFABDEVgtKxFPTJZgnk9bJBV3Gkw7ViSt0b86UAC7cU3WmMrUR8wlGzWJRfN6hxrGMhXnOqSni43lFT+ZZsGFIZEC/cZBxyh1BHLyLomOdusWy8xc7ZIPJD0jhs/vysOV7tPzy5TP23AA04L131jA+HhT7oxYIv+zfozv2R7lXmGeGes2eP0SQhqLR1dmObBEhfby74vLwOOapVMuDfF97oN8YLdsfBBDjeSPW4/DYVg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR15MB2240.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(55016003)(54906003)(86362001)(508600001)(66556008)(316002)(33656002)(9686003)(122000001)(186003)(6916009)(52536014)(66946007)(8676002)(558084003)(66446008)(64756008)(8936002)(4326008)(66476007)(38100700002)(5660300002)(2906002)(6506007)(7696005)(26005)(71200400001)(38070700005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?lu7/BkTzavj9cTsW4AVJyi0ujq5oFyW+bGlmI1fFJu0UdWIE2EH1xQRpRDZ+?=
 =?us-ascii?Q?LtBSo/+kp23ttoAoUgXamWn9Vi1aa2rI8fUYb/onm0KZhKfbq9PMumA8n0YD?=
 =?us-ascii?Q?omj9FX79IzxuSi/b15oW6CdvjW6lLDqAvFR1zOTzu6tNxc4Uw5qGoxBe1TXC?=
 =?us-ascii?Q?7yH/dEFUjR81NNtv0h2yFOKAKwM8YIRPOfUhPLWYSH/xBK2ncJTgoJf21Gi6?=
 =?us-ascii?Q?cC50HpHmridCGkcsi0xqktMsKZ8NCeW/0iaQyM+slKGQrSOMwAO0XvZKVH2+?=
 =?us-ascii?Q?d+gjQwtMK8HOlaob+nMp31xdnS5qYqmRwnFpHFwzqwAa/X6LvjXwW3rf3va7?=
 =?us-ascii?Q?nf5eNeX7SEdbHhuSD7SJCkeDTL/cAzXtby8QEd+fOQK9Ya8gbEU9IkVWM7v1?=
 =?us-ascii?Q?3dCMXzUp+c6be4DVdF2lmMkBdDVdv5H+UnD1SLYvi5UpQX01ut1b7HJBp5k/?=
 =?us-ascii?Q?cYU6oniFw1Hl8qmBiKVCscDNzRM8+K0w6mXEn5K93ruA64TxS1TJPnKV2W56?=
 =?us-ascii?Q?nWiLA66B5x9fIz4YBLY5a6XnQFGknhgztuwAVwFAK5XsN8d0ZhdFafBS9JJe?=
 =?us-ascii?Q?doVayRPthmSuSikzKYczasvPZSo7NuXuUoIDIg9iK/khxbkDzGr0nUv41o/k?=
 =?us-ascii?Q?BtvFO3r/c6o4fd7lDltWCjElSwZXnr4BJZe/cU0Kvnqo/PNah+j7ccZPuWJH?=
 =?us-ascii?Q?dq3nJv+IDeDzdZzYkASW7ThoyPVwAuKru8H4QP1swtpsPKlGfGISP/MXC7ck?=
 =?us-ascii?Q?Wqk3Fl5CSfOB4JhBgS48txWHQHr7/29jgQDCRG7/xcGlZD4O4E+b7kqx5FYB?=
 =?us-ascii?Q?QirFiJ+znsMuzgT4atfBfdqsM3KHYhgajglXXzyKbQHGg/DiA3LCUJ0ZUzuh?=
 =?us-ascii?Q?ffQRSUd8/2cy4jfiHcHI9u5l5jB1Ce4Q2oWWGeHeCE+luTWieSYtSUtilyRe?=
 =?us-ascii?Q?5ZfxlOQktR7Rg+HvzKQunPu/PQrEe+tFXnFmZTVw+4G6tX61b2RoouJA+D9p?=
 =?us-ascii?Q?20hGm+Xb/Bjl9Keme0GH0WcgQJwKOv05VXzrZ3srB7T/j8rN6kWricgG7gmP?=
 =?us-ascii?Q?OrGLxVWiEmMcDPfw0szuCnujkaUgmYN+x//xQYuNr5aNq3XceEV+i8/CjEe7?=
 =?us-ascii?Q?dCcFWA87ACT/WB6Qxndv/uDKW74kF1V+5VQFZaShQzTmMSGkGc2cT7uAUT3a?=
 =?us-ascii?Q?95+mQO7F1nngmNa+N8C2x47v7v1RWXe9UHnEqbGEhyQIpdJqFrjjzln9KI8P?=
 =?us-ascii?Q?fW0CbcBHItXPDFlmOqyc2nqOU33cw6/LMQeUb++t4LDhZ4wJeCWNH6F2CS6i?=
 =?us-ascii?Q?olCSn492M5WXoHxSoGvpGbvohwmi29PuyRlWBE1Z/SoKHDsJqeB6MCUEfbnC?=
 =?us-ascii?Q?oorTICY9f6nG9R4tsLL3FRLq9VSF7eha1gIO1LkpQCk6UnLSVEumUcdNuDf8?=
 =?us-ascii?Q?Kd9KKts94itQjLatoZKiD+GVd+j9dyWL5nY/w2vBHXeYe6JfdQrUS5YynsFU?=
 =?us-ascii?Q?AztuGHbVXDHHNcwLekO5vGOPlBrYhFTIH0eVO0ARNQZkKeBfAv01ZjLth7ec?=
 =?us-ascii?Q?qu/7AuSfAuWTeT0WOE6O1/Q6K0rxCR7LvWW1cFeuqs4iu7N8ZlUmj0e43Dxs?=
 =?us-ascii?Q?xy1+vXNCmj1RnG7iDSgQxaNWi/xCj77IOyWT6uW1rFsdf8aZwBBzV7d0xLnI?=
 =?us-ascii?Q?mTFxZNVheSoLyFYzJIQHkkWAsMhByZ1AlPuqMHhAB1a3nsvF4DwMcsQrsqvw?=
 =?us-ascii?Q?SKubSxdahg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR15MB22407BADB366C5A34B299E68D6AD9SN6PR15MB2240namp_"
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR15MB2240.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b774b4b4-056e-4c44-858f-08da4ed4e2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 13:42:26.8081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRIavAsTbkNG2mdkK6K+bfOo5o9AC3dCTYpIVveKMt8+NfzFs3/JWIOYea72dgbwTIjUAaRYkeZGDO2dUclz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR15MB2338
X-Proofpoint-GUID: EMUpR_2TC-93uiFk74A_oUiVcZvkeOql
X-Proofpoint-ORIG-GUID: EMUpR_2TC-93uiFk74A_oUiVcZvkeOql
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_13,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=499
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150054
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_SN6PR15MB22407BADB366C5A34B299E68D6AD9SN6PR15MB2240namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tested-by: Sumit Dubey2 <Sumit.Dubey2@ibm.com<mailto:Sumit.Dubey2@ibm.com>>

--_000_SN6PR15MB22407BADB366C5A34B299E68D6AD9SN6PR15MB2240namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Tested-by: Sumit Dubey2 &lt;<a href=3D"mailto:Sumit.=
Dubey2@ibm.com">Sumit.Dubey2@ibm.com</a>&gt;<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR15MB22407BADB366C5A34B299E68D6AD9SN6PR15MB2240namp_--
