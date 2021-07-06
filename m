Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 259673BDBD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 19:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK84F0mtJz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 03:02:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=DUNf9ZkK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=adyXO0Zw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=DUNf9ZkK; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=adyXO0Zw; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK83c6RnQz2xKN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 03:01:47 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gvhqn015852; Tue, 6 Jul 2021 17:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=hnhiXJa973SR6HksKm/zh9iaitWNk0/hKDpLkTgHZvM=;
 b=DUNf9ZkKxRxjPiJMlOyL6612zxhCw2Bb99RCReDfqC6VSofdXFtWfWb9nSrejFH/5B8T
 iBGL+u+AboR5qhSDyW8aedkH0f3h9gu7uQT0uVkg7/DiZ3dR3Qd8MbILVlJOF7tiSZ1O
 tmJ1BFdbz/ZGo/pHIBK5LfCBSwBR5AAlOLxzhk9Ope0nMtiGfgeMxTN5TR3jkqTIEuBv
 WwuFglUBV2lKqQ9IDJonzseqE06HqxE2tlKKUtB/J73CjbwDvKj2wru8dBUN2nAkq/Sc
 f5nGzZnobAK2w8gb+9d4kQTo9Gy6u9BJt22fuDMVEuZej/dlpKy60toRputnL3/GPjrV ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kw5k3344-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 17:01:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166H0iPS046712;
 Tue, 6 Jul 2021 17:01:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3020.oracle.com with ESMTP id 39jfq8vvxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 17:01:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KARvR2yWsMGryVnXEL+9gsZIwvmAExZUqUJhvHlGuVsInaCJRpLXnh8CxC5WSgpadc4TWn5XZoU9OUE7a9TS/LS7Kc82o9WH3I2GwHYyAqDb25cGHG0DR0gvKyqS/sbsjBTCJ3RlC2ysEE7MkG07yeMLAACazVShxwX/7Yg6CXq7X8mGF1HbtO9uHi6RlYUjbbsWobSYXa79NVMPx54VvNZwuOLR+Smivoh6hVlI3R3rTzaKlzI1coRaLHtg0s9SaekCs/7WqQHjE+cVUs8LpilXe/sWBVpn5EXdVOAqeAGrLHblcAiIx8xpBx7mJcidfoUWtq+CCGoNX7qPB/EzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnhiXJa973SR6HksKm/zh9iaitWNk0/hKDpLkTgHZvM=;
 b=cCCPneCKtQQRQNh3t8tACDBfJ6aD9r7TWl0KmdQ/0pUYRV5x33M0va+4xytJKT3yS+Zc846nl0iqRPGeSg3AdnND8M56FPqGSSd4woEy/FqYC0kuGHM7ynsuBEuM8T4JBjO46jM9f+r893E3WF++iYqe6iVfKxbJqrSH8/+j9BpD96UEvEjtNfycduJoqyKNTos+X7yiPQh81ndE+2CpeCWLinKgodQKlc/YvYZwH9LhG7J3ABvjdFIJ9Lry/bTNvlJmpTvx1flpWo51vL0eiyuh30Ern5MKM/5FJj6umyoBa0fJVX/kRqLkn0hHkf2puQasLL74ks7RXC5r0w2KtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnhiXJa973SR6HksKm/zh9iaitWNk0/hKDpLkTgHZvM=;
 b=adyXO0Zw0v11l6sUjG2I7eQ8BHU6NEesVxgznp3l54stbHFs2s+H5E0EiXJ6g0JcKzshJiFGXeBMKojBavSUT/lvEw7EbXhziYWnWVTSLjyhHx10ejknnlqCB0kIFBtRxnBTeMOQybzt1aTY+f7w7sm1iNnDdjCGKHIYUWbipp4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3352.namprd10.prod.outlook.com (2603:10b6:a03:159::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Tue, 6 Jul
 2021 17:00:14 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:00:14 +0000
Date: Tue, 6 Jul 2021 12:59:57 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YOSMDZmtfXEKerpf@char.us.oracle.com>
References: <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
 <20210706165720.GC20750@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706165720.GC20750@willie-the-truck>
X-ClientProxiedBy: SA9PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:806:28::19) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.56) by
 SA9PR13CA0164.namprd13.prod.outlook.com (2603:10b6:806:28::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.7 via Frontend Transport; Tue, 6 Jul 2021 17:00:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d90bdef9-b98b-4173-d89a-08d9409f8490
X-MS-TrafficTypeDiagnostic: BYAPR10MB3352:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3352EAE5B696C84D5DB25D7B891B9@BYAPR10MB3352.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MyYcsUaq09Y7mW+wsqZ1QEfIp6TP5AkxLqd4qctYJmLdB2nALwr16MlsGsAs1m/ekDLjspHZW8CnpNzqSLrGdEFKnbfnmnyGyQth6oSTV2U2nxYttsnFkTqN6wmqM7V9LtiN3kIf292bv5oyzGWNk0wpztENyauzD7ht/BfY3Reha5mIHMFvIi/kIvW6evsGTi8nmiIyL9C9bzEgM5B6LvyLniCLLfZzAUSHJOtB0dN8tPRi93jEixXyWhetAEmp8HlUCOn4r1BJBVtxFwXCLVtRhVhD0q0UdRXnZJW7458DxJoH6RG5qEaJJ2ixWq5ERuwqtnMsrARFh5Y+nH+do3+e07MFEhchpsHRud5yL1AOI+8/pc+2wsvXzxaL3bLcWuGB0+8oD0UabLE1+BfEBb8wELSVQA8begsTW4Py8PkIaW5TvnWH+QbkavQWGBzB0IYHUt5HHi9Nrpk/O93jUGYAxg0ZvpowdWkejxvPxsRyesbZLkI2T/pnw6gFRGrFXJCw6QRG8CRS71v624KHWVhCJRq/q6fMWGcRtbEQh+4c9ty/hsBuwXOGSxnIXKYtFmhzcFXy9b3AzP6bH2m7QH6nR0yPrmLi+3JMobTicRm98dwTcyKqVsawRfY7Oez7QMSkFryi1QDj5/OFfzn9GSD4wzLxFHhHIEZNMvE8yR1VuRmlasHB445jcDXBklD/HHMBLssVYM28rNvTprZbwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(86362001)(956004)(38350700002)(26005)(2906002)(66476007)(66556008)(52116002)(38100700002)(66946007)(55016002)(7366002)(6916009)(6666004)(7416002)(478600001)(186003)(7406005)(4326008)(54906003)(316002)(8936002)(5660300002)(7696005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scGC9Se5Jg1HS0tFM3tWW1GGNsxDg1GUpXr0qEnbNBPaAaN9kFZpgZqIj8MP?=
 =?us-ascii?Q?DDlNMqvJOZOGvLO1B839ySjnBu/u8BK07SocW8jK0qmjmBbfzDrrNL0BZ3su?=
 =?us-ascii?Q?k7t2Gvety/UNdxAuG5PC6GK/q7HkUsjSGkr2AGdKV0xK9gpM9YwsUUYtBTJV?=
 =?us-ascii?Q?W3zZZF3g0OIWKXDnNdfT7xxIRkLVQtLyQ8Nq6GU6kpanE5lIXa/YRjjmn4Gy?=
 =?us-ascii?Q?AnR+80a/Zs5x/3yugdrxu1p6UwGDiFUq1cErU9jZTo8HgX1FHS621Fg66rF/?=
 =?us-ascii?Q?LCXsuOc+cNT+BIZHOvS40+Wumf9XIohidO46vcZGJ9Kyf435Njd+ssEM4JwZ?=
 =?us-ascii?Q?v8WZeqg1HxFwRT9PTjJMVeg4vhbLTwhr6hzF3+269Kl3CDKYxdKH/oPP7gr6?=
 =?us-ascii?Q?XCSJAEKcC5nD3UsTwwv49g/By2qVe6JOhR0HqSMln0jxBkzAK044Z+gfVIgV?=
 =?us-ascii?Q?V1EDSFQpp2K4PW77wlXiASRYLbyWiWs473OdFLUI9NlnMpqc5AWs2BP8QdvK?=
 =?us-ascii?Q?t0YS4Z5sor5vEcgcZoSQgI9pQ1y26xEK6V6B+0Vs7/Jfdygwvq3Wpichi37U?=
 =?us-ascii?Q?MG1vs9DeCPIq08keLgn7ldS+P3kAOw4A+nFJxYPCr3Wa26mvTJROOhFucRbd?=
 =?us-ascii?Q?6Twte3VY343U1rwumrFD7NVChTpvzkH/v5DnRQIWsdEazPHbEhwmhMFhog2Y?=
 =?us-ascii?Q?OtoRNIihRoM8SCPBVWzXO8Ob6wrGrvuKsTKncdtk6S1kkz3tOqz4y8VxFVbk?=
 =?us-ascii?Q?Jl1Jp/TgVjTjEYgJhPVpEmNaG7jWwIvBFIJWBVoTx7pTMBAPnIigj7jERJdz?=
 =?us-ascii?Q?at1Ii5p78N5xd2z7igdghVp40rmoqCEYgK+dUDT9MOabUL3UPUyZjpBaL8TQ?=
 =?us-ascii?Q?bHqOpw6eqt/nabCPsYEif/LoyJdG5Ylnsf7462S3bR3gGu6qeGrjAQe8b8nG?=
 =?us-ascii?Q?H1/0bWAz9nj9R2/uU9OyXR/y0zekVmgzenR2uCA/9R5ewwu+tKv6DEhDt+Bh?=
 =?us-ascii?Q?Sp7me+rATNS6umegxws6SIy+20E83ct9MJl7t0U+sGfyrcvNJgLcq4DtpeYv?=
 =?us-ascii?Q?z/0Ig+4DUTF4Zn36qTE8d+aGtjGWrSVRd/1pxtVV8ek34BSfOOeKWEN9FPmo?=
 =?us-ascii?Q?omF4tld5oAmYr4Jjn9bPuMel1A2qNDPeDWVWif+qswru6KnYpJV9RwDr8W06?=
 =?us-ascii?Q?G7JpDPfNbdKHPSsR01981ICzRVsWfLRBL+Bq1inSoTeRZePyvcaek5olgbeU?=
 =?us-ascii?Q?GhgCR/BCjMx9+rqH9+MUboZ6/eBvn1A+G7jOvB7lp1YIgfHRM3tYPx435sRf?=
 =?us-ascii?Q?p2uYqQ2IdEdocUGI/OvVOenL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90bdef9-b98b-4173-d89a-08d9409f8490
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 17:00:14.2584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zckFanMHx4+DZP0mkFA8w+J/Je1MRe1YIB1zMg75U1rDdB/71vM1KTH9RAuThBkq1D1a/ffRbEbgY+fMpFE1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3352
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060080
X-Proofpoint-GUID: MmsRRZVkZuEGZIh9CZM4MvD3gN7VIZMV
X-Proofpoint-ORIG-GUID: MmsRRZVkZuEGZIh9CZM4MvD3gN7VIZMV
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 06, 2021 at 05:57:21PM +0100, Will Deacon wrote:
> On Tue, Jul 06, 2021 at 10:46:07AM -0400, Konrad Rzeszutek Wilk wrote:
> > On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> > > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > > FWIW I was pondering the question of whether to do something along those 
> > > > lines or just scrap the default assignment entirely, so since I hadn't got 
> > > > round to saying that I've gone ahead and hacked up the alternative 
> > > > (similarly untested) for comparison :)
> > > >
> > > > TBH I'm still not sure which one I prefer...
> > > 
> > > Claire did implement something like your suggestion originally, but
> > > I don't really like it as it doesn't scale for adding multiple global
> > > pools, e.g. for the 64-bit addressable one for the various encrypted
> > > secure guest schemes.
> > 
> > Couple of things:
> >  - I am not pushing to Linus the Claire's patchset until we have a
> >    resolution on this. I hope you all agree that is a sensible way
> >    forward as much as I hate doing that.
> 
> Sure, it's a pity but we could clearly use a bit more time to get these
> just right and we've run out of time for 5.14.
> 
> I think the main question I have is how would you like to see patches for
> 5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?

Yes that would be perfect. If there are any dependencies on the rc1, I
can rebase it on top of that.

> 
> Cheers,
> 
> Will
