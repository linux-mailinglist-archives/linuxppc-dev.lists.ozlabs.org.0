Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DD558CBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 03:19:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTfQy1l5dz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 11:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=U1kub83+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ohzeBA7V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=U1kub83+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ohzeBA7V;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTfQ46lkNz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 11:18:14 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NKO4e2021387;
	Fri, 24 Jun 2022 01:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=X0wZFwJM7HorEIHoN1dxv0HhK0CEDajbZ8Hh+qh7JgM=;
 b=U1kub83+kY2l6eeSTjrIqiDKE0Whighv93CGqtRTfZCGfhLMbwZ7tBK/JTv9VVlgy5zL
 HpHGnWG6iX5PWfOvgd3ibvdguNM6O+AbqnquZk5oXT++cs8p7rlu9AqLxGYsctAbptYc
 E7EAb/ISefkt5+OE9Y1Ut2ShQ/I4yZ65IZoiXW3qc2cT+td6sagKeEfK3dZoAePfg9kB
 sFsNFJSw4TWJvdGYWQ7mICm/llU2g60coLkGnFP1O6e+3hPCtDw+gK/4BJaWo9xXz39s
 nFeI0IwrjNEubAC6ANp7FV4CxY9PBkIXU+lB2ocvzypbnAaJm3i1656ryEhWZRehJoET Bg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs6at4m25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 01:18:02 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25O1HEES039755;
	Fri, 24 Jun 2022 01:18:00 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtf5f66pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 01:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL0AcSC+OCaX9NwaBxfRrzfwy1eQYrk5g8SpLI4lsTiefW9ozOOGBpv71Tc0WcpWhjPokCy8Y0/Pq1WbkAV7a4iNmreJk4a0ZhzM0B3G7dYnqY5aN1zYuUnB4p/7c51iesLbUIN3sehHvNSVKTwh3nCM2FJp1AwD9AZ2XPo/kUhdXAAKAZV4VZ/exTdz++zGnwXMImDjBmuYXDExSVky9Rj6QXUqRiGOF6mDKZ388ecwYrbFB0Mjw5PvSSX8ti8rMSbuuLEBU66YhlwqGefEOdum0SuyDIRhk8uyvla4PAQlXodIfPJXoqG8yorsNzuI/duARIT80U1xgZMv3QD5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0wZFwJM7HorEIHoN1dxv0HhK0CEDajbZ8Hh+qh7JgM=;
 b=UN/ng0F3NN+QlgeHJnQ8FwZqC+SObkpRUkE8A/FN2yfgexIqVxkk6OE+KbOy3Qi+NlVRL/WT6CAXzi/A+wI85v5O78BY//cqt24RxXod68EE83aD4CGg19wgWeef4zTKdKX+ezp3DeHziX6cqz+d4WDM2MGkdVcucEUUj4MyK1FwlI4xLRP3k6QF6r/OWK3c9ssyPpQYKo6wCDziLXAtZ+yjScLqmItPrGA43tscUoliKjyTHgUKXipWOw8sWtj20HcW3Oh4K6abM+VixIddcz6O6GDLS2YEMiLRFtR8qXFRnoFcvYcrvsI9cVemvpjCim1cMVWXNL09+aaNfl2pKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0wZFwJM7HorEIHoN1dxv0HhK0CEDajbZ8Hh+qh7JgM=;
 b=ohzeBA7VT/thHCMxicUsa0xwmv+jp4ogqUQAk37ZhZJFFq2TDZzagU9fB1CSoFEEknCxW5FlYdpqDX/ZJpAch/R1Ya+tVNEqLZNocmZXjCFdJcCmRxnF1naLP/yYXCcYuEu4bBE14RZK5ruLXe0n8g4q8e8pfKdLRm1+9pPL0I4=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CY4PR10MB1720.namprd10.prod.outlook.com (2603:10b6:910:a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Fri, 24 Jun
 2022 01:17:58 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c%7]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 01:17:58 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Paul
 Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt
	<benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/prom_init: Fix kernel config grep
Thread-Topic: [PATCH] powerpc/prom_init: Fix kernel config grep
Thread-Index: AQHYh2g98rHFMi+ZP0CRTS7R5UIdJg==
Date: Fri, 24 Jun 2022 01:17:58 +0000
Message-ID: <20220624011745.4060795-1-Liam.Howlett@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 004c9577-af0a-42a3-fd98-08da557f5ffc
x-ms-traffictypediagnostic: CY4PR10MB1720:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  daA+tjB9ZxK2nDUin2XLTE5hR6QEPY9tvG2GgOc91FlWSmvcgRaaQ7ZW/uFSQDANqE0zx43bG98WzxBJxGX5PeQYbU2yuL55N735icYgr2HxO9EPzhVGig/+li7JkMBoPX8S4CrFathSd2yhcxN6CkXy2FhOBHSmowD2HJ+VSczoI/zCSZ+ildEAQvjDMdLvJetnumkoqV7DMsqikY7AzUn/c/BTdpBJxtQcETjhLcSgbl0jxma6C7m04oyY2/lARWqk6ME2MCPcw5SM5dEN+/Kc0+bF9iucoqBk2yeIzge11HvUrFD4ZxbEq4qS+A3XAT5eIBWnGYnKpMOuRM3KbWqzTJR10kh22NQAKDBmkWVWFWBLTCMEkVE9kaNntvRGPOpSGCWjjlTSFojDwx5WzegKEwW2wxYGF3IMNSZWWtncdAPcoylTj53V5VAx1iGoxS2OJt1KJ41U9TrKnz+urWGzo/PYy0l9HAd155R2eUTdy4r0MvTOSube47WEZ3cevdWPZ/9Khb23rw41sK5qPlssY2qYnU31O/nz1p8OcMuG5oMTVIqLMfWw7+xzSipuunSdAnlBmdMuPNDKqC+AcugMZIx4e3mYF8pNjUikQsRhTCdfOSF9FpvnSiCphSnVJpabRzZlzsZqC3HN9uqTO6OseLTiqOKIl7vL3bRvSKgrywSKQdRtMMimK/WKXZzELvdHn1vBuJEAGeirzuQ7aZZgPep8szGZeHjB+RB9Ia76ylwqJd5/1yvox6UdtAZCIrlFYgv3eBGf3SWXD4QcDkxBCZUfbmQ0wCQtMGyxq/I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(346002)(376002)(396003)(39860400002)(36756003)(316002)(1076003)(66556008)(26005)(122000001)(2616005)(38100700002)(66946007)(91956017)(44832011)(76116006)(66476007)(8676002)(110136005)(86362001)(66446008)(4744005)(8936002)(71200400001)(64756008)(2906002)(5660300002)(186003)(38070700005)(6486002)(83380400001)(6512007)(41300700001)(478600001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?RFZN4c6eLsBDU4KWih35IWeLWZ4GhH+DfIOLmBV06tGWsQnQEM8t0jX60a?=
 =?iso-8859-1?Q?uCXLXBqB9xEHlTJdAGxfbIuoh5ar+j7MT0nW8L+sIQ+mzHGtHcwsAHwyJ0?=
 =?iso-8859-1?Q?Ct671VinteCOSNT3fhKKNQYG28ARpFl2xzS+v9Ggsf3B7fcqCnxj7FqTEy?=
 =?iso-8859-1?Q?lVmO6QHRbAasWQbzs/nQLbB1y03JFdI/epI+MlKRJ30KLOSGs0jRoN5wPq?=
 =?iso-8859-1?Q?s5tbgbhyInfFkVw90JiUgCl3eMlHGwY+yzgM5HqV4iDDfS93f5Tsf2vw0D?=
 =?iso-8859-1?Q?yeoUkvx2TMlfAGShya8otpPz6nNqSZXqtiVE91w/tgxlpHzkwFIPupqsTh?=
 =?iso-8859-1?Q?HSL1Y+0Ua0yN6aQ1Kl6BZp0AEQJY1AH4WSB0CQe6NcfQ/82clXQ3131Uz1?=
 =?iso-8859-1?Q?y3XK1zFZ3LveXpYdbIdQC08URK62+i+wPaic412oJE4OLJCwDy7sq24ZuT?=
 =?iso-8859-1?Q?cEtjFfJJOgCTnpufKP6fVAHS30kia7ydrnKamaA/gn8KqfutXvHdrqwYHN?=
 =?iso-8859-1?Q?4qW0DeLb5nusrQRZpcvSnd1+sAcYKAerqjw0EqehCdw9JJsY02R5FDJaEq?=
 =?iso-8859-1?Q?KByAl8++AeR5+UnbrBbMtPzFyBMPiNVO3nmQENTrmx6jRjH0N5jmQCP7/9?=
 =?iso-8859-1?Q?m9FUkMnUMDJdUwjt2pKuZeQUV7qu2q5xDOyVnOZFs2ovvyiLuwEM6nJkTJ?=
 =?iso-8859-1?Q?Ncj4S8NtxZ74oC4KAMOuFqxujdp8wVyZO89s593DY38npKKlPGcO5naNiL?=
 =?iso-8859-1?Q?9v+Z4P8VT6sUkq2ZoEmni1V+gYasodm/NaH4C6oXorDUuzP4xClYyH4Hge?=
 =?iso-8859-1?Q?clTHOUKX0rwWQ3URmFpIykGOxLGEnMapK6l3Hgzee1PfeIHnwzIsJq1Fn1?=
 =?iso-8859-1?Q?xrGw9kXsZPulSCyaHsERVjbZA4uvLBJKJ+n8d8cHMtq59PUAEO9nlIXILH?=
 =?iso-8859-1?Q?4kkWwyVJ3ff+0oBtm9UbC/uYTRTMsSDLz/fEK4NE/SF75tOCWAe8voU+pe?=
 =?iso-8859-1?Q?AVk5IC5fncyWJAdJT+5kKFLZr/zAsgOPSEwg/rd5ddHKVvDn1WZraZrafd?=
 =?iso-8859-1?Q?PW7Xvij4YkuqDyZrMYvzJtstm6GfvPmqhZZ7nAdyX0ue01xH/bKBJcEMOl?=
 =?iso-8859-1?Q?BBSJtejGiC+OhGVeh6ER6NoN5dSlbkPYGqxjeD1PK3xKq9PYegkdCVzzyI?=
 =?iso-8859-1?Q?XIlallCRQxijxizh5i8V5wWAwsl07cqSdPet0s11hCgqK6QSfl6vPu76/N?=
 =?iso-8859-1?Q?mhjYilWsDFB+/pShfdbFjlB7Yv3qA7/VOPEzmDxQHaGXQsAoJ3eVlHtZNX?=
 =?iso-8859-1?Q?kIxRZQAhow6qoND+mxwPkljLMPfdnS+EPhm1JA8RVPPLwfJVIInN6mjq1E?=
 =?iso-8859-1?Q?sTDswgpfWi+LLEJOHXr0ENpu9ez5q+OnsVlTQHFMSEmv1MAtfj6sEamzy0?=
 =?iso-8859-1?Q?Y+n15Pq+VoovzFPRxtt7kup8UX64/McnVB5GokO76p76TZinnpPn+J/wZz?=
 =?iso-8859-1?Q?KBwTh9YoxImL8YQG0jxv3PMdP7sE1pe+SqHrzQb8hLutP8r6D2SZKhryC1?=
 =?iso-8859-1?Q?gWHrZhyvigXh9Mnx6rh+7Merk6EgAzaOJ/MqQ56Dz+TaE1M7z/HPXyDpeg?=
 =?iso-8859-1?Q?YKaHb9va3f6qADZ770VL1COpL6nYjk6sV2/7Il9EW0N9ItNkHYqwStzA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004c9577-af0a-42a3-fd98-08da557f5ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 01:17:58.5344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9aJh4B0oECkl5RCzuAqIrIpsup3LAlQ+0pOHgGVtODi4r90AvxKhpBmag9lG1DeJBHSZBXCVNoh3u7EHnzVP0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1720
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_01:2022-06-23,2022-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206240004
X-Proofpoint-ORIG-GUID: MpZ6P_J928fJX3AxOHKa25gDIKfPzlim
X-Proofpoint-GUID: MpZ6P_J928fJX3AxOHKa25gDIKfPzlim
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When searching for config options, use the KCONFIG shell variable so
that builds using non-standard config locations work.

Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 arch/powerpc/kernel/prom_init_check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/p=
rom_init_check.sh
index b183ab9c5107..dfa5f729f774 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -13,7 +13,7 @@
 # If you really need to reference something from prom_init.o add
 # it to the list below:
=20
-grep "^CONFIG_KASAN=3Dy$" .config >/dev/null
+grep "^CONFIG_KASAN=3Dy$" ${KCONFIG_CONFIG} >/dev/null
 if [ $? -eq 0 ]
 then
 	MEM_FUNCS=3D"__memcpy __memset"
--=20
2.35.1
