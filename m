Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74F49E3A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 14:38:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl1rX3DbVz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 00:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=XjlmlVWJ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=m/BosvjD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=XjlmlVWJ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=m/BosvjD; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl1qc4ySkz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 00:37:42 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RAsI1t011844; 
 Thu, 27 Jan 2022 13:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=m2EbgOXpg1L2yzzrf8e4fTKk+yXD8AWuUFG+TXgfKzI=;
 b=XjlmlVWJQM+Zk9J3kXM2m8JJhnwiWlG7cNbBNfb8LpVbXFDOssJie+7b2Dax7nAt5emo
 jO+DcrzqW/F909Mrp3m4M0445PvNOCBVjT8KVuoDqmbgUqxkELhTW3kElWnMXX2+mD+W
 EDTS80zeLPweLlIxpa16xQbRgzvCz55MQe/4BfpKmmRbhGWx5R3o4gXhNvrY37VVMIS2
 z6ycKLlrAlRPuwNPl4dtoZirxAmmAV9ZrSwZPnpE+XlTh6MZ/WB4kSkdrslaYIaNorOy
 9Wk0cjYIMdd3RTFz7Hvv+HwZlMepeLzG5izRVjFJWZIroCkggLFC7QpP8jYQpJn3G+rL zQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaah3e1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 13:37:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20RDVMeh079928;
 Thu, 27 Jan 2022 13:37:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by userp3030.oracle.com with ESMTP id 3dr723f123-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 13:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ68dP0bfe0x3rFXyZ8VfWgIsvetUFVhZXQV4yHkZf/lprGWr5Lu/r1j5Ra5lllr3NK+B7sEc0itAsO61MHM4L9XRRJsaod+B5HMpEIBCfnfa1bIc5K688gAW+XUoPqVvHSvCSykK/+SkEuCfkABBaLimrBpTychz27fV+pBJXeofgqqfhhsNtbCWSLr31OiPqyuaD+NEVeyfqcT113glZ8NCb82cCWyGsf+Xx2sRsuOQK4MdLKSAa+YnYD8nBRZog1HH9z4x3TxBs9HU3asf1aiUSNsux0hrrVIqCgLy9Q6CM05W8ZsrNwI2KpPYHQJWsQu99Mb3eh2TKf+ilrx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2EbgOXpg1L2yzzrf8e4fTKk+yXD8AWuUFG+TXgfKzI=;
 b=E6NdnAloTQCd6azIuPjObytfJwC7KfaYLESvC1O26W4/ViRmsshdDzDrVrcpyK17U6PoByTO91Fr7HjGtzAHTfJLmIcaF39CLWAWboSN3RcC7j33eYi9ELjq+dDcMPCjQmsJA+DXb86ch1mKMryG47mq9FpyWVtFtQiYG4PvSaMY2L0BFa9ZdCTWUl7FM5U8LuLlmMNRM1k8e1L0w9QL+9Zr4sd3p0At1hJtbhpaMAY2vnx4mcCCMOKXBB742Ga3hvEEepye9yHvW+ZUgdJD5+qMCFX6Yb1udU7SOd6X4r0nqKhCuZM7D3bWlSRoHR4Vt4u0V3Kj7H9WSx2qFRh+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2EbgOXpg1L2yzzrf8e4fTKk+yXD8AWuUFG+TXgfKzI=;
 b=m/BosvjDuGu+aVlF2R1AvHYI/UlQYkQD5RN4SR0G/wJ9teO7P+a41+nBAN0nPjlIaa3Yrhg7xyZbTJw/Qlku15Wpk90/Va366ecuD0jwRTN/5sJss2Z0Yavc4gJtOSgGwprPu11h2D7KqLw93yn0D7I6ZdjVpbskJGWPRhffr4o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA1PR10MB5709.namprd10.prod.outlook.com
 (2603:10b6:806:23e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 13:37:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 13:37:22 +0000
Date: Thu, 27 Jan 2022 16:37:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: WARN_ON() is buggy for 32 bit systems
Message-ID: <20220127133706.GE1978@kadam>
References: <20220126115616.GY1978@kadam>
 <8bfa7bbe-7343-2d2f-d20b-d4789523c89c@csgroup.eu>
 <20220126134948.GA1978@kadam> <87y231l9hz.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y231l9hz.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcb121f2-a2b6-43bd-28cb-08d9e19a24cd
X-MS-TrafficTypeDiagnostic: SA1PR10MB5709:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB570988193FC24AFCFB1384398E219@SA1PR10MB5709.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6VXehEGSBzjy8kxwheR+ZGlYrwUc8y7vKd6C/HwiZIwJ+hqrRQnIT8LRNCZyedX/V1A1G7X4XH97ygKX1Q6SF0oAzXNJVQd3BRZn2iYhwrBniApV7dWYwQJlJVDdl+4qF83KRWe1XRSQyQtZpRrTvqHFXLgz5+CXyq3T/KCqaIEbL5/mqEsMl6Fz1ISXXIg7ppMxjr0BAzT9u2g+z68En+O4gceuLsDBsRvK3fIYoonjF8yX6FuZQP7tnE6nPqkhtnWouwYedZNnmcn4b4/kk3zmCnv/NpKKM4AlsW8Soc2WKorsz+5OGvPMNJKd5usCh6r1I+4+nazR1CNg58z6f8SAKS2RMo1T5cqLp9SLeMCHq76tYFZ2vt2NxEpO9VC5uY5/nU8KUw4ow4KkcyI3VeP4HlmZfX4SoDwThLzVsw2I5bRXfcTgngtPnYqfYX1MINoNGeLxd3UYGFVYMw3H4PB/Qik29My4swYMEwvoEyPR/VL9Rss7AFmar/gAuHqm7W6FLC6xvYxjokjT1hwW9SnveC2WyKdhBP15kw9wIog8+BH05YERbClseqa8wLL8eyHXtrD3jOVULeofF4t8Ow7gpJKr1jWw0PwfkuwPKM466q52qxOQoRYTi1jeE61GNjfRPa9pq8mWwUvCIO1iiEKmUM6eyghMSb/XOA46NIVrG9p8MVdFsOeo6Lu6M7z1zP7G8tvqwqvWcBek/QyAmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(9686003)(6916009)(33716001)(26005)(316002)(186003)(66476007)(38350700002)(33656002)(6506007)(6486002)(83380400001)(6666004)(44832011)(6512007)(1076003)(38100700002)(66946007)(4326008)(86362001)(5660300002)(52116002)(508600001)(54906003)(8936002)(2906002)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IHpDHH4qDGRPbzts5qgkfBxmvMhatf58AVBt0zUbE8Q5i6tRc+ZZODyH7s06?=
 =?us-ascii?Q?t9w5hPUXz4zhYhJ5DG1mRsW1sDHkO4NVm08aBthcmyVJh5Ype7yMWPekOXOP?=
 =?us-ascii?Q?MLBohddtGckCXcgVVA/X9dvxw4TV6aooSMudUqAytZ1rLx0H20MNzuyb2E39?=
 =?us-ascii?Q?A9p1LguU9KobGd9eNFTLsY0jt84xH5Ggv66DvWh6GIFaWponjtWRzPy8gt67?=
 =?us-ascii?Q?ePUVSqq9fmY4n0eua6YWRdfy60nP6SPODNh+hc0VGNP34p7M2OUVsSqDw1Ek?=
 =?us-ascii?Q?s43nb410MTItfKa1MEP6OtXAqtGH9zSALy9eG20pnIv1kyvypGsAbi0ltfiG?=
 =?us-ascii?Q?nkENZq00ghyUC619elbSLCThebIMqxOTeMtSjYCAxuzs+JI0RAN3UBWedJ3w?=
 =?us-ascii?Q?0K29aigRkmSKxszmcuuW4CsT75EKIlm3FJqveGBYlqYetayEbEta0ZJF6yOa?=
 =?us-ascii?Q?3FjBlEDwQZUePt8do/PlFuVRRqQxgX3oAaVdptBDHmDZRowFc2Oc2g8hsRV+?=
 =?us-ascii?Q?sG/6Ul9+GJHzSoA6Hjkq8r/GAyoJDocR/MD/A/dg4A1izvDJz0eHlPoNmSpT?=
 =?us-ascii?Q?sKXd2MGHgE9ERVH8faGArwGyYciL4/wWWfmqO57d7nOXgu4oe79qo9LHzdx6?=
 =?us-ascii?Q?8WTLqx3BMiW02JfmfuPVwzvuGnCLHgfHkFcs2yCoTO4WcSkC/QN/ygaKrQlh?=
 =?us-ascii?Q?p4UR9HcYXbxDy39E0xBkdmv49YHqgQPiYvlF3glvLOAqLYMYZgGomzjE7/b2?=
 =?us-ascii?Q?iUyu2B8azjZJiOGwMt46MK1Fa6Ng5vK3B6RiV40IfY1nLPoDZ4R4eoaD8fcV?=
 =?us-ascii?Q?c1Vj7rqWsJOEjhkTF3r3X+9GFipwg2dy+wOsiWyG035B7fmAh7oF9t6J+JZg?=
 =?us-ascii?Q?CfrH++bmbrWjeOlFFmbRk0jPYJwz277WlkR9ENdlK0GqYzwDvkmyNpVlz8ZJ?=
 =?us-ascii?Q?/16AQ59QealB09Y3Naeth71I/eIYfXnPzlxPj0L30nMooVKUv8BWBmOHaGR2?=
 =?us-ascii?Q?4hdA7qTvNHpxn+gI8BEl+9oJZGSZWUOAOGYtGFAWuzJL3jQNKr1QGfN6P2e5?=
 =?us-ascii?Q?4r32t+JyLCyhCfHw5tCm231UlgTEsWY31rQNHc+QPIw4Er+KQrw2VjApMFnA?=
 =?us-ascii?Q?Lp1Cq1s5RokntNQz18w936q0qAYacqmWl0mRttyOe5f0WYt+95HQgApM8Y8n?=
 =?us-ascii?Q?UpZBbro3vF73w9eYmqY8VMtn2Lr4AQv7SC6LnSIb62z1+YE7KUXMD2NT8LZe?=
 =?us-ascii?Q?EsA4O50Fvlgi5CXuvlgtzXYDAsTHU1dv/ir+oSivfjdBXwDmARW/30iveXV9?=
 =?us-ascii?Q?FZZ1VcJ6NJx9yIZZ6NJTICPODqgO45nLU7O9BRawnw6kfM5UljrsMEqx0eDu?=
 =?us-ascii?Q?t4G5KgzuyqGarytW7e2nyaXxX2iD+FwVNVjN/abgi165JndHs2uvSvPVJ0jS?=
 =?us-ascii?Q?3oDwg+LXDfkJ9U9Pqk2ge+RmI1a+1nTK0RiNNP0pOyeC/v63kNYppc8g2CQ6?=
 =?us-ascii?Q?z299Ih34xfMoDzVIZYkaBDtWm3b0mYVMLNlQKeCSuTxoUi5pUDaWBy/dgqLs?=
 =?us-ascii?Q?y9i/Y9GgpYgIzq/OnNai4HIW3p3zfxIB41RWQj8/fY3ewHT4UhbCNj1gIgS9?=
 =?us-ascii?Q?C8YZgqLQxTj8MSxUu4YD/nP2QHFteEQ35dK5VJUcvosoSWumnzkgw6kQpSlU?=
 =?us-ascii?Q?SOj8lGlg53XkhYoLpGkEzkKmtK4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb121f2-a2b6-43bd-28cb-08d9e19a24cd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 13:37:22.2335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCBFZBSy/GW+H7zKBVAf9RqJ1F6VyNcjT5JsyauYlqmwbNmRsTQw0+Z8mmrLlat4rXZUyCVx9cjuNM4ejYxtJ/YZL/DMZJoS00ufYSZUhgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5709
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270081
X-Proofpoint-GUID: 8jig_4yBxKkeg0MrXqNCGCVmYh-QXwVO
X-Proofpoint-ORIG-GUID: 8jig_4yBxKkeg0MrXqNCGCVmYh-QXwVO
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 27, 2022 at 10:10:32PM +1100, Michael Ellerman wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> > On Wed, Jan 26, 2022 at 12:21:49PM +0000, Christophe Leroy wrote:
> >> The code is enclosed in a #ifdef CONFIG_PPC64, it is not used for PPC32:
> >> 
> >> /arch/powerpc/include/asm/bug.h
> >>    99  #ifdef CONFIG_PPC64
> >
> > Ah...
> >
> > You know, life would be a lot easier for me personally if we added an
> > #ifndef __CHECKER__ as well...  I can't compile PowerPC code so I can't
> > test a patch like that.
> 
> Ubuntu & Fedora both have cross compilers packaged, or there's cross
> compilers on kernel.org. But I assume you mean you'd rather not bother
> compiling for powerpc, which is fair enough.
> 
> Do you mean something like below?

Yes, please.

> 
> I'm not sure about that, as it would prevent sparse from checking the
> actual BUG_ON code we're using, vs the generic version which we never
> use on 64-bit. Is there a smatch specific macro we could check?

There isn't a Smatch define.  This shouldn't affect Sparse at all unless
there was a bug in the WARN_ON() macro.

regards,
dan carpenter

