Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C83B3357
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 17:59:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9lFG64dnz3dYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 01:59:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=aqQbQjyq;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hXwyChdV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=aqQbQjyq; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=hXwyChdV; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9lB30CXXz3c8f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 01:56:41 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OFlHY2002748; Thu, 24 Jun 2021 15:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=RNYw98/G7tITOD2JUar0dJNWfAGLFBejbGFGi7BFxgQ=;
 b=aqQbQjyqegqFFnwtAq+5yiLyt5h8lG/pDmyIHA/MMoi5T34sx1AvnFhUht5va4XsSA6d
 nutlUpL4XKHUE9M/hskFiiMJE17MzAoePlEvjGQZfG+SaeA+m5Qi14lxV6OIl8YVdrtQ
 sEH7iw9Od05GdCfppgzN3oiUpYVrXycnaef5LvZ8QCv6IenuMHu2ohLQx7jliSJkMmWr
 KbdtLf6sWZSJUZBlyZQ7yWZ+VPmy1CM93o2HXrkG1iMWmLzTH/8i7tHHt/ojfaiO+Auy
 KoTMM7Y2qSpmUhJbLydHEANcRCnR8xyuEmvMPGzyLdGoG7b8rrWUwEpSWmxdnlHd8HIW Qw== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c2wnkce0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 15:55:50 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15OFtnlS067641;
 Thu, 24 Jun 2021 15:55:49 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 3996mgr9nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 15:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM8WdCAKxMuFmxRPdPWYfm6JwwLhm1EY+o1dOG6Omv7D9qMZiMQaefpWR/bF4JgkKwjVnExBGL/J+fF4S95dogPEHJU1EpiQjI2PXoOMSp7OQRckAKQDeQidnCG3UAm/5I7dwqxKMSf9qS5LIDmZx0J18vw7FoSYHNc0bkoWOFIry4SpJKI4dUtlMv/QdH/wp+LlSqia3OOoPIqoHC+onGIhoWWo+QsIHEvYujOX1AamdzODyJe1mWWlNrlDkenIFvJMY7Fsy4y9RJR/PGGzbIWJhyv+UPAPsxnYhjGpMOqqpvgl8Xg3lrC66nUP/ru3vdlVSUh7T/xj9+U2fajsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNYw98/G7tITOD2JUar0dJNWfAGLFBejbGFGi7BFxgQ=;
 b=WGHZouTD0dBnGgiqwn40+bzGuLU6p1CWMn6EExAKVsxFXkLy8h0mVXFktwuN77Sc0aQ9plxHvEOyVT1kwjoQAui3vykvm7QFkfJzMWXQwqLhK1xevJEdYKtVjmNkvQ4OqawI708Kh5cS06l7TuvyBqhWyGQn4m81IzftzVurnsj+jQ/YaeF1+8kQfXStOvUudGWpBdqbJqSyHc98vtbbRdrMZLQvdP0KeFJVP0RgzdsbdtM0ZVz+1Dn+CjkqbJpUk1ZhbvyuuCYX6lYDY6rgBfP0FDaKBS46FKyUj/IlLK7L/ppaqHti1FvQjI5/7e/jf6hWYSZR0Sv9CbtPeMBGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNYw98/G7tITOD2JUar0dJNWfAGLFBejbGFGi7BFxgQ=;
 b=hXwyChdVOMENoPgUAxpZq/b2l5rUNKZx1FBCKR8Z7ZASLfBfUH2NFv79FCNZwcAhHcLO+Jto3lpHZwwV7PVvHmsTjQ1YZnM4zjBbn4XlOUhtVq225tlgBvs1GJkiyTWxcBbf2nmtz4leINU+ePuZojZhj/BIT/vsf2rk0nDsvwM=
Authentication-Results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 15:55:34 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 15:55:34 +0000
Date: Thu, 24 Jun 2021 11:55:19 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Qian Cai <quic_qiancai@quicinc.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YNSq56zyJ7EYdTcI@char.us.oracle.com>
References: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
 <20210624114829.GB1382@willie-the-truck>
 <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com>
X-Originating-IP: [138.3.200.4]
X-ClientProxiedBy: SA9PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:806:22::12) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.4) by
 SA9PR13CA0037.namprd13.prod.outlook.com (2603:10b6:806:22::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Thu, 24 Jun 2021 15:55:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47a9ea18-e738-4e61-fbf3-08d937288021
X-MS-TrafficTypeDiagnostic: BY5PR10MB4369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4369D2979C2AD8BE7FE6D7AE89079@BY5PR10MB4369.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIKtg1nGNwOGX/aAaFn8EHHEnbyV5IkwHkkuYXUp6k76Is7d9bdSAuPeFMKzDbynBrUFtPXcBBcOAg+K30PVogyrqTv5fhy0R7G0/sHAWNrHQ/lFQSpfaTX2xK/2YBZbLAeiShOfclW5vOI4kJhYLT6VVyn57NaJ/BQHD81zFJguqkqtDOL6wADv5yRVX4vRbWkeC+VsomJxA7zCIqwVfiBqMexwhX8rjODEohyYNNpaTgs/mvFB+OG6+/XO6U9E7RxrfFlIAldxqaOSoTJT1ABJXdFF4Ahj5S7Aq+G4hLuq5h0vbDwW9Yq+pfSvpj6USemdxbU/LzUvq1KxgcbozaI7G4V/htvgn3gy0UJYq36HKpIGPf/ZbUbvO6G5h3Z6m5BjlrGRgbAngGBhatcwiolCofQS8X2hSQ3YPKjoEFEUNd7X1y4O0Dvq6LD5yaqCi/87sWcHBkU5qYqCKDQmhSBq5hzAYGBpyQr68YdpgHd8nBpiFbtkOxx63l7qofF6mNhuHzESTgQlMviuRRVaUhs00cqwog7GmiNu3OPc1W6O0p2ZpF64BqRDE6BwHUNCqEoh2PteD8lwLoSuXoBVUFHqP33id9l2L03q6AwW5V/0TzLUopi/IMjHLQDl0WV2x8AsyEo9WIOnKcp3Dt0Okg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(39860400002)(366004)(16526019)(186003)(7696005)(5660300002)(26005)(53546011)(52116002)(8676002)(8936002)(54906003)(66946007)(66556008)(7406005)(7366002)(7416002)(38100700002)(38350700002)(316002)(86362001)(956004)(66476007)(4326008)(55016002)(6666004)(6916009)(2906002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pzrYT5KFOELAqgkJjyJORIMiyHCjPKag7JOn1S020u7H2SZZdrqAEa05ox3Z?=
 =?us-ascii?Q?RzQ3wPVi9fuiOmzNXyjiYkYlwOe94CXVj8uiR3dN4Ety7pwLzN1QeAFJs3wB?=
 =?us-ascii?Q?783ongZwdHB5ERPGiDNHj0wl2zHiawi9NFVvKzZwgkv/SihvE4IMf3gVjrgD?=
 =?us-ascii?Q?TxYRoonszISPvvgXK3qgtrj+5ahQQYNKtIe72NI9p4E5/NlqCBu7OozxQLDu?=
 =?us-ascii?Q?uZZk0rwDw2rPzX/dYCWPD99anJ4cFuqd+nGeHHLzq8D63NHC1jWXez2Dh+D9?=
 =?us-ascii?Q?rL8HcO6cXqWxz8ssh7gT65g4yXWQciy33vVmx1n58LvC9jWBfhPGjE9M8YkO?=
 =?us-ascii?Q?3dbFaGGiA21ivSudT70ymRcdVS3PUDoRHh+FnYUQ+EoPEf+XH42UKSkYbbpl?=
 =?us-ascii?Q?mdaS9SZefg95MWLd50QE8T69wh0w6+S27gZg90UC0db498aNFjmLHQI1YmfJ?=
 =?us-ascii?Q?8NBZja5YLY5b23id3MFhT7Dh9uOCqG76ZOl+LNYinlf0mO+W/OwjlcxKdOLQ?=
 =?us-ascii?Q?kiwdRiJmHjcyk8u+mkUg9QOh7WDtRTdkxSUWtigB5aU0vMI//qMLg/XC5Crf?=
 =?us-ascii?Q?eEF44YyTCGi6osipfB3SlrqSD393vMd2sEUiB13cFffjizlvn6K1hdp+dIzs?=
 =?us-ascii?Q?ohAX+IbXY2ZTxRWt1MskDdWn3UQoSy5tUR9aohrmIxxrOguZ1ZZV/cp6ECPH?=
 =?us-ascii?Q?korY4eI4zPBlMHFbl0e5oI/YtJlx2/mdePnJ+L/CtryZJUgLfkzC8Gu2lVzw?=
 =?us-ascii?Q?M3Fwu3k1xaKiYjQnPyRzqgghY/5cm4+ZxqvidTXw2/YNZsbru1AmxPcA9EOv?=
 =?us-ascii?Q?BgE4kpquarvJf3NR/LKoRsN4DXCrH+b4Zq0MXD8erPLztv/JAEc4JnmoZeYN?=
 =?us-ascii?Q?3jwrGoaPXywipomTboj98NQ2ADpEjjuvDth7c4Y236smR3ys3txbKPPCUaWJ?=
 =?us-ascii?Q?Ic48SPkBZavF9Bak/cYl8GGtHSEgJgGR6x4UlhIYUN2lwJAz49pK8k6HNugP?=
 =?us-ascii?Q?fFLulRcf98upNYuLOL/gQQQbZaQq/I/XjVend8aJyEni/96Gai8UXZh5RPr5?=
 =?us-ascii?Q?ZeQIN1QQ8XfgW84/xAECXatWu9qP82oU1HMwcwvxvCqeS0bUJZD+oa/uE+A4?=
 =?us-ascii?Q?oY+y+wIf2Mc5Cz8CegYFw8FTdFmgoxS7zN2rq6TBmJ+iRsRnLULcxYuwXNYc?=
 =?us-ascii?Q?YNl2IpC10ufiGeYFq6ceCbf8VjbvQuKdatPrRqLL/kCed52R9oWkaVtM9MJ9?=
 =?us-ascii?Q?UFkVvUCt/euMMP3/L1wXvszZ/aaubH7kTE2uZm9ka3qMomuhTQuzqHVCyAMo?=
 =?us-ascii?Q?qzlWa2SSvHCCB7vu9QO/IJP7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a9ea18-e738-4e61-fbf3-08d937288021
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 15:55:34.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z26jQfjV7+erWEAS2AX9aQ5SeIm8Yv6bME/x0sm9C+HkxWYLELC+OsTOztxxJP0mmnZCMziJj6LrscyRc1Kzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10025
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240088
X-Proofpoint-GUID: p8KxGgb5y0yeXuOQo-n6HxcOzf5mDbyT
X-Proofpoint-ORIG-GUID: p8KxGgb5y0yeXuOQo-n6HxcOzf5mDbyT
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Will Deacon <will@kernel.org>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Saravana Kannan <saravanak@google.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 10:10:51AM -0400, Qian Cai wrote:
> 
> 
> On 6/24/2021 7:48 AM, Will Deacon wrote:
> > Ok, diff below which attempts to tackle the offset issue I mentioned as
> > well. Qian Cai -- please can you try with these changes?
> 
> This works fine.

Cool. Let me squash this patch in #6 and rebase the rest of them.

Claire, could you check the devel/for-linus-5.14 say by end of today to
double check that I didn't mess anything up please?

Will,

Thank you for generating the fix! I am going to run it on x86 and Xen
to make sure all is good (granted last time I ran devel/for-linus-5.14
on that setup I didn't see any errors so I need to double check
I didn't do something silly like run a wrong kernel).


> 
> > 
> > Will
> > 
> > --->8
> > 
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 175b6c113ed8..39284ff2a6cd 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> >  
> >  static inline bool is_swiotlb_force_bounce(struct device *dev)
> >  {
> > -       return dev->dma_io_tlb_mem->force_bounce;
> > +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> > +
> > +       return mem && mem->force_bounce;
> >  }
> >  
> >  void __init swiotlb_exit(void);
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 44be8258e27b..0ffbaae9fba2 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> >                 dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
> >         unsigned int nslots = nr_slots(alloc_size), stride;
> >         unsigned int index, wrap, count = 0, i;
> > +       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
> >         unsigned long flags;
> >  
> >         BUG_ON(!nslots);
> > @@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
> >         for (i = index; i < index + nslots; i++) {
> >                 mem->slots[i].list = 0;
> >                 mem->slots[i].alloc_size =
> > -                       alloc_size - ((i - index) << IO_TLB_SHIFT);
> > +                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
> >         }
> >         for (i = index - 1;
> >              io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
> > 
