Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C159A2B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 18:57:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8SbM4r90z3dtQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 02:57:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=x2IoKUEC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HL5VH/MO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=x2IoKUEC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HL5VH/MO;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8SZY6BMyz3cdx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 02:56:12 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JGjOhV031642;
	Fri, 19 Aug 2022 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=xmzi7s2MLFPEtYBKC55GJtP9/P7m7CvANaS86LsteSw=;
 b=x2IoKUECAuOZELaoXM4G1j7qH6B0YLP10eUUZODRPACmvgMQlzJoqtMz7+Uc4rnPSeO4
 qIBV1TGoD71NEpYj3VtP5fhTBV7/RFgY/1S5m6etJpTpDqbf2jdCB6Fsq1Vei70vPC7s
 ft1mrVmkzZO9+JsPXODaTIAENXgyALcI1nW7B3zfWNneRFLSuH1YKcCCNDOlrMjeRzeq
 fj207Ye8vOPLPK2PtAJhVdN5Ky4RToh+x9XT0zwRbqB5h6RyG68lU1IjQqOEKmyRnw6Q
 ddhuJQ0ofM7DCadSgP+gY1K31qgrL3Ifhmnqmas4E9d6LsL6SL5E/L+/e2xzY8Bk87ox Tg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j2e5c0220-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 16:55:26 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27JGptXP026883;
	Fri, 19 Aug 2022 16:55:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j0c6fet53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 16:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmFGvCMq9JOPHnJRgNZhG2YLBA5ySMuPPWBIECa/zgHDDmDMCkaAh+OedmHHv4brx7PFNLRaZoFJL40kdrG/kawjMMazhpfA1mY+Ve5eN85rpCyxp9jDXyB+lOsM54lq04jKjmzp7ITxkK+aCajTWwjngjxhycuu5l7d6m2HtOhLOE28sXMhy0CLqFWM7+kclQB5sYhTVttWQ38bszPgdrL6dysxV6oVAd09DdcCklQu07LML6RiWTkULBAIwOroFMheRI/m/ieg6seAaoT2nxJqqeYJs9Gs3KEgX7PlU65/xNmN8VtNIAURisT8bY91jMqvAuWtImAYMCYM/qNugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmzi7s2MLFPEtYBKC55GJtP9/P7m7CvANaS86LsteSw=;
 b=aq46+toFTmcCPTorakDx7yb0uSnZWZC7Q+xj+3c02hecNqH186JH7t5F+jFu9eHWSQXJfjL7VKA+2kTfHIuSlQmg2MrNmm+hbqJb2HoiFxTCDBNanDSee+tVbVRC2LjCoTSIRkePVSFDBVLqa1DIromnMQ0/oMPWObhhZXiq8cik/Zx3lBXQ0rXx4W0g7IvKJ4lPZhTc9/0GjPdxA3P3nmuCgmVZuZKhXwJoeyLMux5pxFcNpBw1RE2e6LD+En8tm0DqC7UYEvjDQbxXWR4nWkU8TL1CqyDXvarx3V64QBOzPozmyt2vNHYWq/zmNheCX7hOgShB/9EAetRZvamIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmzi7s2MLFPEtYBKC55GJtP9/P7m7CvANaS86LsteSw=;
 b=HL5VH/MOZ4+4EhNHSeAUhbQWAzqsFnTOK4pybq3On1ltkMDoI4VccmlGeEhzn/k4v8qVSpJS+kud81dcJ7Pad1lxOeAc391GuhfsEKL25WgdiC6MWM9aosyfjmhn1CA2hmZM32ozfBK6g7ewPzKbZuDTsq3JT5hp13kgLBx7PpY=
Received: from DM6PR10MB4201.namprd10.prod.outlook.com (2603:10b6:5:216::10)
 by SN6PR10MB2447.namprd10.prod.outlook.com (2603:10b6:805:47::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 16:55:23 +0000
Received: from DM6PR10MB4201.namprd10.prod.outlook.com
 ([fe80::11b6:7a8a:1432:bec]) by DM6PR10MB4201.namprd10.prod.outlook.com
 ([fe80::11b6:7a8a:1432:bec%6]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 16:55:23 +0000
Date: Fri, 19 Aug 2022 09:55:19 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v6 1/2] mm: migration: fix the FOLL_GET failure on
 following huge page
Message-ID: <Yv/AdwdID9rr9xOL@monkey>
References: <20220812084921.409142-1-haiyue.wang@intel.com>
 <20220816022102.582865-1-haiyue.wang@intel.com>
 <20220816022102.582865-2-haiyue.wang@intel.com>
 <20220816175838.211a1b1e85bc68c439101995@linux-foundation.org>
 <BYAPR11MB3495F747CBF95E079E8FC8A5F76A9@BYAPR11MB3495.namprd11.prod.outlook.com>
 <20220816224322.33e0dfbcbf522fcdc2026f0e@linux-foundation.org>
 <Yv0ku1mn4LBzg/zG@monkey>
 <875yiomq9z.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yiomq9z.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: MW4PR04CA0373.namprd04.prod.outlook.com
 (2603:10b6:303:81::18) To DM6PR10MB4201.namprd10.prod.outlook.com
 (2603:10b6:5:216::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40268e7d-b4c4-4926-769e-08da82039b2d
X-MS-TrafficTypeDiagnostic: SN6PR10MB2447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xcdvxY1YDSwg1IlqXSlT6ngGTT0PvJ/wfJe2RjjDJIJlWHD582AHacu2a50DqhFLTKT99lzGKD3hmyNJ/LkKt4y8rh+sAXHAR6BqHEwig5EYy4zb8XICcdq8rlU4hYuhW7aWobKwl8vS25LG1cFyRHAg+3SB335d0YGclao2aQhN1QUpqnD9mIy/iYmpTDTm5zX6/FIhyduHpSA3zWklcDiVKS+0pvdxzx5sk7RDEgc+1q1NhQyoU6OSm8rflv9i0BcRPep/tLwcZZHA+S2o2USmQEhI6GyLc5pyPF1YJlnt6C6xKPbuYXEoJLeM6x55jmbg7aU8wR7cMT6EOCenltrSyPkz/jpeuOyVaHnaX9dFMiu9MqQceo6I17xAsH//wdKnzwOdZx1yOqlejOvQLQQAQptK1q/RKEaIUa0pqudgaJjhJiydHInTgO6niXV3Sh3Yp9gDurtcB8y/7UgZXMNzSkur4iPXKnpqv+S3a8OYmRBLyjHmGzKVnUVhtJGB2hLNC9DXr5spzb16Tdw/wFpX89wz3dLb4XmGJthRj0pqHw+oQGBG6x5bLCYH8hfrOxbBMHnQgEnmebG4a3DoQfDxqbaN80jxgMf7YIu+igkrmsfzjbhHhHZ5rMoAm4CFzlfkrWLcp+PxJzotQCefCvKQtEXyELoRdECRcDBOEbx240AtPW8yjHpYLTaIGXpmTMYqLPPBdpVCqwdfPTcm3eJifh9ES6l/NbK0RwipvR5DR8nPKHbg2fuYOrqbBJD2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4201.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(136003)(396003)(346002)(39860400002)(366004)(6486002)(5660300002)(66476007)(33716001)(66556008)(66946007)(316002)(4326008)(86362001)(8676002)(6916009)(54906003)(38100700002)(6666004)(53546011)(41300700001)(26005)(44832011)(9686003)(6512007)(186003)(7416002)(83380400001)(478600001)(2906002)(6506007)(8936002)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ui6v/EM8N1RDnRm1YgvoCLL/qqyscLqN1CpUvhVGdni0ypdPGImRwarTLRx2?=
 =?us-ascii?Q?m8OSwNkIIOVYRzJpWkPfqvduJb2w096Enp4/9Zjo3LJqgjSQmPHmSUxei1Ds?=
 =?us-ascii?Q?eJVrW3oQjBXdaKM7o5aQ1u7Vv3PHZzH+0Yd64JEWNpLBkKk2hMuOTQfHTEyp?=
 =?us-ascii?Q?SGPeHPmfL4w8Jgan50vOLmjGOiDxW5p9YyQyUc/DcjQdPWBC1mfe4eLcLnFK?=
 =?us-ascii?Q?42Zz/uVAC+6boLJrhmnxBJ7hrEb2BwzX4fvZHRWh+CoSfB+EeetQ9DqnfvU5?=
 =?us-ascii?Q?z9Yn6ud5SBKs+59G0qsA99VKK6zkCNOj+ykH3fDYIj00H/1j2i7sTCnQFcU0?=
 =?us-ascii?Q?9HBtQ4pWFyWlAwyTpajqdLa1p+WjInkfi7ndizZSzcNPPniEw2cd6RRb4X6H?=
 =?us-ascii?Q?nV6dCw0fVtZ7xFsIe6BPP5507NnsBi3rHkaFkGvI2wBRDNAOD01KDquImWxn?=
 =?us-ascii?Q?ZyMY5ugSvnjw5Y6W4IdhXnnqz9AKD1LgdEvI4kL2L/uL58GKndj3SFoUOGVP?=
 =?us-ascii?Q?KzCop7Y/OFmfA063LVRiWjh1P0he4faK/uOHhn+ovehDL1iPZW3R9EImm+H9?=
 =?us-ascii?Q?+Y9vcWTBti25CoEOWOAfbd1LILz4m2l1ALXy2r9SCIHCcAzbhF5LpuNJ27JJ?=
 =?us-ascii?Q?Q1VPR40FAsR4JvMew6Ep3kTy/SR9pxquM0iczbFnAbZy1WdNgoKNrtVJpCIW?=
 =?us-ascii?Q?VJZ06rn6PxuHXcT/Q2/DMIKQWQlqtsLiPb4dJYu59gGboyvXrFWYzQ6XoW0T?=
 =?us-ascii?Q?pltHZM9zRlRjxm8TeWuTZSlsiv2MdUaXozGZrbgcuGtt2gjzdMAo2Qnc9BNP?=
 =?us-ascii?Q?qlAPZquX/A4Nroq11gqB5d05K3PzpF2dNHAp5/9y2jhy4m77YYm8iE/BJZLC?=
 =?us-ascii?Q?cz2ms6pNj++wvg/Dv/fmnJPNRTPUyUe72rT3qXxK+/pBh/YGuusaxXMGfGGw?=
 =?us-ascii?Q?e1v0JlcTYIJjY1+DrldmJFw/330hkPExjDUfT+YIkJxrcjD9kMtejBvcQxQO?=
 =?us-ascii?Q?kBgkoI+6Y1Y8gZLYveFLNC2fJAksMhYJBATlibEr37+hJU7Am6Vrc8zT1ebC?=
 =?us-ascii?Q?Z9Q7gUnwnloqOoSc6RWribk4rsKQr9PwreUPqGOltCQVB3nPL2ClTqzRoa8W?=
 =?us-ascii?Q?W6gi+DaYEfInQgt7wRDEN8erHpFXOAHoLZPBk+h6wYSFtYkjQgriMZPG2phk?=
 =?us-ascii?Q?wK0y2WrpsayhIf0vdFzCRIAFg0lXlzwvQfLiayzMLkFGig9Zt38iv1gXw9AO?=
 =?us-ascii?Q?gcMoTF9tX9BiwZpWGT/1oA31apU77ICjV7vsUMvEQLHOWNvdgvqpyzktaRqe?=
 =?us-ascii?Q?Y/pGYuW5zQ2/TUevvnMTLgn/4M2edxouS3znwQUYppXVitClkQZJgSRpKKaq?=
 =?us-ascii?Q?Q0zZEYpDD4kX1cUoqG1IFUuLhnRnSdI4mzhWN+W2zyhoYaS40uEp8IwjowLn?=
 =?us-ascii?Q?s4Fv4VlijBNmsnW9mYU5dR33EI/97ZE+sI0vAS1Zvw2nYil4WB5N+y13F2Lk?=
 =?us-ascii?Q?jDkE828erq5wK3J3vpQnCXh+4kQXdolcbJknnQNI+LnQSp0wRsgIu0mEl4Rv?=
 =?us-ascii?Q?Ta/vL4lOz5euxebn4xtlKUuLh9QdJXuGWYX32M0BCxljmOAl6bWe8cQQb6xg?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40268e7d-b4c4-4926-769e-08da82039b2d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4201.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 16:55:23.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BrDQ7EDmcc7JCHymPjOrIeTJHio/st3QaOVb4j1dFWa/U0nOU1EaT8RR7ZcG1bTfepWEF7tiDD8zhkRZuOVLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190062
X-Proofpoint-ORIG-GUID: bmEWJnTJNwoXZrZg0WAT_wl1a4wRkwBg
X-Proofpoint-GUID: bmEWJnTJNwoXZrZg0WAT_wl1a4wRkwBg
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
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "alex.sierra@amd.com" <alex.sierra@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, "apopple@nvidia.com" <apopple@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Sven Schnelle <svens@linux.ibm.com>, "Huang, Ying" <ying.huang@intel.com>, "Wang, Haiyue" <haiyue.wang@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, "naoya.horiguchi@linux.dev" <naoya.horiguchi@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, "songmuchun@bytedance.com" <songmuchun@bytedance.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/19/22 21:22, Michael Ellerman wrote:
> Mike Kravetz <mike.kravetz@oracle.com> writes:
> > On 08/16/22 22:43, Andrew Morton wrote:
> >> On Wed, 17 Aug 2022 03:31:37 +0000 "Wang, Haiyue" <haiyue.wang@intel.com> wrote:
> >>
> >> > > >  		}
> >> > >
> >> > > I would be better to fix this for real at those three client code sites?
> >> >
> >> > Then 5.19 will break for a while to wait for the final BIG patch ?
> >>
> >> If that's the proposal then your [1/2] should have had a cc:stable and
> >> changelog words describing the plan for 6.0.
> >>
> >> But before we do that I'd like to see at least a prototype of the final
> >> fixes to s390 and hugetlb, so we can assess those as preferable for
> >> backporting.  I don't think they'll be terribly intrusive or risky?
> >
> > I will start on adding follow_huge_pgd() support.  Although, I may need
> > some help with verification from the powerpc folks, as that is the only
> > architecture which supports hugetlb pages at that level.
> >
> > mpe any suggestions?
> 
> I'm happy to test.
> 
> I have a system where I can allocate 1GB huge pages.
> 
> I'm not sure how to actually test this path though. I hacked up the
> vm/migration.c test to allocate 1GB hugepages, but I can't see it going
> through follow_huge_pgd() (using ftrace).

I thing you needed to use 16GB to trigger this code path.  Anshuman introduced
support for page offline (and migration) at this level in commit 94310cbcaa3c
("mm/madvise: enable (soft|hard) offline of HugeTLB pages at PGD level").
When asked about the use case, he mentioned:

"Yes, its in the context of 16GB pages on POWER8 system where all the
 gigantic pages are pre allocated from the platform and passed on to
 the kernel through the device tree. We dont allocate these gigantic
 pages on runtime."

-- 
Mike Kravetz

> 
> Maybe I hacked it up badly, I'll have a closer look on Monday. But if
> you have any tips on how to trigger that path let me know :)
> 
> cheers
