Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4469E98E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 22:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLt0g5Wgpz3c81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 08:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=rUQq5a/n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=1416e03d26=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=rUQq5a/n;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLszg5gvDz2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 08:36:13 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LLJKLt032074;
	Tue, 21 Feb 2023 13:36:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=FHc5Exp3df+ooM3mDBkVuix8tsyddbG5JuKZnKZi8aQ=;
 b=rUQq5a/nwDOsrzWhN7KgOruI2YZXUuZnJHIajlJc4wKaI5k2BUMViSsOmNqrwsgRkNjX
 0DPXVy9g5AcMO/FDIw+sBd3j89FvAVnrG4C/QBqD2qjO6NAKt4KHT5o3wKpGtqsp5gBe
 D8+cSEhh6dWHBcpjqX5XHzxRZ/1nQSe9On0EupDsgw6xn7wv0yHDe4dvlV/3QlLUx6Kw
 nnSm7fr34ee+09GKbpsaYn4MrLDEWgi7IVsqIebbYdQEmHldM1fz4NJvrXaFRKOmpntk
 Bnw8VD2KxXCVk94BLwy1/3zMIiGUuSf2bQC1Xx/HoUUBGi3Ffl67DGIooPFbQUDIuut/ vw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6u1vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Feb 2023 13:36:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETp5O12qqq80t5j8nU4rjUFrGjnyq4pjmCcs69ols++URZBr0TL/bjPoCrxzK1MIW6GLmwGbfGy1XDNWPxvu/hfVqYKBJiH3LXMfkHPiSu2Ry+l2HRZeanJw0iema0KvWDza0wfxJ56u+WuwEaj/1S44cW9Hm81fRunoTK2pgesbzy4Fgl0FyA4HYM8nLqyggT35ETnlWunA7AIZDsDXUpMmWNCLfBnvdUueP7DoftOJZRy/IrCJvY1L+XCZwBAELD4iMkh5CNf7TMlicnD3cfBLFWILkoWw7EanjNaeTc3WanuLiYC5NbOMwexOMmHDfHn0NF/O75kXJbbObOs/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHc5Exp3df+ooM3mDBkVuix8tsyddbG5JuKZnKZi8aQ=;
 b=VliwtDC+WbVBQlT8fG8Yrot3PXvI+bHQWGJhUzuzz3ou9Tj/Vf+jf2QhbJH86jPfq4oVMZUsbEJNK+m+QeFWK/oiF5N7ZbGMCVKNi9mtiI0SEQfsADcMa/pqfHQARGbpc+B7Mf+vq8cde0ae3HmzwPu8ThAw3YifC3Y46/7HqN/sePLA4PfLQW/32Rc34v9q8mtbSpmiSDZoFhTVE/PQLGPRveaROjVrG4Q6XuC2BVEbwd16DeRGib59GCSu9l2l+NOf/PtJbwxghK+GTjbq08g1XzIGa1xhdnsiTwLVTLar4+ny3peyLASg1riEUUl8R7+iFp5OdDlv9Qwu3X54zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 21:36:00 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 21:36:00 +0000
Date: Tue, 21 Feb 2023 16:35:54 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Pali Roh??r <pali@kernel.org>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Message-ID: <Y/U5Ova9P78omJ66@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <20230221201311.sadp3sq7xr25hcuu@pali>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221201311.sadp3sq7xr25hcuu@pali>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 6273007f-0674-453f-28e4-08db1453a009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MUwigYmkoxOlLpfED/PVJQpjRMmVrBW0TO6q1m/b9fppQcusKko9kt/Er0l6vB/BIlg9cEDvHi/mkwz3BSR6f1tGXu+mjHP2IZM8Ww8o29VH3GONMqjJSaxm0EzBoAzRJe6tGtB51X7ChUYtOOlJEDy7taApl1uZzzr7TJaR9MeaWT90FohR3RRAaFJ6go3swpQFvkZhWyp1KuMZg65ATybsaAd7UcFyHO2xw4Jbmf0/M7B8IKw2lMTH863lrwmEiTReUkBtCSrL4fUSXz+P31nBI87dJNP9EbaMKc0sfBjY/bbEpJ+WFYLp3gsU+IlluqCH0v2WQ8D+5AlyrJNH4OwTRBvJ2FwYsDkxNFaSG64kxq79M6qJttmGdoOWSorhYa98V1dnIIzByXLd3r6TvWA8L1pvAGmkJA86ro3DNXocdQsl2KL4AgzGDcRYJdY1WMppeEstixhd0vtTVVKYO63qdLoKOkAP0cdht8AYoLc0rbOiv1sjj95ELPtzvHqPJy8zJ+63vDseb6UB3uc4dxijIZgcr5IvQmRKQN0nm/KSBWokIyeTtxsTKzIk5k9mhEgW0Sxco500Bghxp7RcVslDMfAKukGKSA36xb1qDThDoEbxY8qTNaRH7Um1jouz
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(451199018)(2906002)(2616005)(36756003)(83380400001)(38100700002)(86362001)(6916009)(8676002)(66476007)(66946007)(66556008)(4326008)(478600001)(44832011)(5660300002)(8936002)(41300700001)(54906003)(186003)(6666004)(6512007)(6506007)(26005)(6486002)(966005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2JlORsNQlqht+S88uCBuzPeq4AJO+yZKBk5+c37pUsnXiMiHXLnAX40izCma?=
 =?us-ascii?Q?JRCwrjSUuPyPF7NV5wcZt6c06lbm1v7EnLgPVAxtpuk0FY4xLl/nQC4xhexJ?=
 =?us-ascii?Q?+WeXmBOo86mbTCfdlyDONZ0c5coPJ3WQ3vrayGXtXmCdbZX+MNfJltZ43Rua?=
 =?us-ascii?Q?kDgca1c6Ye5A1MMNDyjEIHjkgrwvlDfLCDhrWudURIA7tzL3FHYDtKdf/QIh?=
 =?us-ascii?Q?MmC5OVMQ9PqBOC05FQgbXMr2VQ7fiw/AhjZ8h321l8KhmA6qRBNKhXZYKnWT?=
 =?us-ascii?Q?FVmTMwNA621NzUc/tuZwThkbWzOitD4lkJYCYnwmqS/zgENn9gOhzUKKV/gS?=
 =?us-ascii?Q?OgnuVFupvM7xR/VAUtMa0Wn/CmYVXAbDOJxsIFInvK5fxQdNJJ8LmKxl2JC2?=
 =?us-ascii?Q?6iZtrCwoo5VVlNZ1vDBHE2/1OUnEeCPQ5RpJ92hc9e75DbtroR7peeCb/3aJ?=
 =?us-ascii?Q?hSV0vm3jO2RhRDbUhduXQJFu8fMjbMIEoAwliyqlYZ1wykwQIaEm1WorgIOw?=
 =?us-ascii?Q?O/+rcp6MGAUwsVU3hMtEU7GDMPGlEF8dGjIimXXDyX5Q8CFlsdO61m9FsLCI?=
 =?us-ascii?Q?kNpHoCmE//9ozaBF59wIRYbGZDmz8erehnSqC70S2Ss4kAlypESoUSU6U0wR?=
 =?us-ascii?Q?FJ0ioAowAgb1A2ot2djHW5ZYluxQ72WUcvknfl8sOhGRpzAgAkuZAVsWPHIg?=
 =?us-ascii?Q?4f/LYGJL7G+qL/N0cBltEgxUObBzpTM+P3mfkvWzhePw7cVO8HW3vuR+NfO9?=
 =?us-ascii?Q?rL15XtwSzhUYf0r9E/nRcz5UDtcwVS+KRGyVm1471hafCpTx9TJAeIzLvve8?=
 =?us-ascii?Q?LlFdSu18v3PzM6JSBNO0vNHCx3RVJwmyH1uxzjHGbaqsv3sGtKV2omnPfqvc?=
 =?us-ascii?Q?H7opIa98BK74z+RDA2fu+Mlwjnzz4ESnaH5RUCxYUkzMzJx5mPTN/GTirm11?=
 =?us-ascii?Q?SdIynT3v5IJZP0swHFWP5yVQH3M4fmCebFfKAxxI3TeV+bbAWxQjkXt7BHfP?=
 =?us-ascii?Q?IQKf/JjPQy3msEr1phAIAuUCW4gJAD2g5V6IoxsljL1+F4zoMAOX0R7kP1QR?=
 =?us-ascii?Q?eCuHgAzWSGRHtsWV9zB8AIG96r4ieSQ4McdfIlRdgIhvQCpwbUfLBsQAodRP?=
 =?us-ascii?Q?e5wZsnnoWINroAFan1pzGdZd6R2HSwtdRjqpc1GE/EZR8PzgeZF4F9KPrJye?=
 =?us-ascii?Q?xiO0eC+mDz54EcF+GKDTeDBy14XLWJqt803Zg6P3DAMs2c+ECLIPrHra6f5n?=
 =?us-ascii?Q?mTY7l8FjvrOpLfeSUp8DTcxGMPmbi9uZC9Mc6cegnPdovl1dVhTQaBGsiWW+?=
 =?us-ascii?Q?bvzMEnReazeqf9XfOVA7UkZSbR58y/OSIMIEcnzAHmeptaY1/Sjgu0PMQaRO?=
 =?us-ascii?Q?9375twpM/bUgWl9Am35Opf40AM/Lmc2hU4y38tk/KpNHLUWrwbPnbmQgrp4W?=
 =?us-ascii?Q?YP90TZVmmYf7wI7y4VQhRxZWz0ZstC2mS8Yy3jYFmm0NrlKnWylcOPTWQq1w?=
 =?us-ascii?Q?POuvMY18PCokmT80+y9rQFjsA//tKm/uFbHDx++bo+ZxVdSPqOhNrQIQjgEH?=
 =?us-ascii?Q?7TkWjmp+l/Uz9x7aFifChfUJplfL4YStR/EGWt60nnP/qsFmHYlz620vsTo/?=
 =?us-ascii?Q?yVgF8spOwPEC49fRn7ms+XQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6273007f-0674-453f-28e4-08db1453a009
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:36:00.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rF5DzWJfdkmSKU6aYNyF0tURA6h2SLvVOTaM8S4QYfZbrm6hapNGADd7ALJfa1pswvZti6R3arJz3N//etR+F+Xroj6CpbjnxWDvI9jJnss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-Proofpoint-ORIG-GUID: 2oWhvjDCGqDvcXX3PjF2FoVYteee5os_
X-Proofpoint-GUID: 2oWhvjDCGqDvcXX3PjF2FoVYteee5os_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_12,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=310 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302210187
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
Cc: Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms] On 21/02/2023 (Tue 21:13) Pali Roh??r wrote:

> Hello! I would like to let you know that I have there patch series which
> creates one generic machine descriptor for all P2 boards:
> https://lore.kernel.org/linuxppc-dev/20230218111405.27688-1-pali@kernel.org/
> 
> Basically it allows any P2 board to boot one universal kernel binary
> just with correct DTS file. After P2 is merged I was thinking about
> looking at P1 boards too.
> 
> So I would suggest to do some "big" removal of older code after this is
> merged, so I do not have to rebase again my patch series which is
> basically cleanup and make maintenance easier.

Thanks for the update -- I don't want to make extra work for anyone.

If I drop the MPC8568/P1 removal for now, then would you agree that your work
and the remaining changes - this ADS/CDS removal can continue in parallel?

Thanks,
Paul.
--

> 
> I understand that removing old machine descriptions with board code for
> old boards which nobody use and nobody wants to maintain is logical
> step.
> 
> But if something like generic machine descriptor for P1 happens too
> (like I did for P2 in above patch series), it would mean that the only
> board specific information would be stored in DTS files.
> And does it make sense to remove just old DTS files? Are there any
> maintenance with them? (Do not take it wrong, just I'm asking)
