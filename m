Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61A3B1609
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 10:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8xXM4W21z3btQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:39:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=n4ocjr1h;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=N+Dv9CNv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=n4ocjr1h; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=N+Dv9CNv; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8xWn6y4Xz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 18:39:16 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N8WMEv025971; Wed, 23 Jun 2021 08:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Gaj3bJH1nWu6cTGQb4/Le70tkQtz+SbdZZs371zuQ8E=;
 b=n4ocjr1hNU93O1B8pGsPcPiYSN4slbczqk7c+6czCRsq1nps1Xt3AkaXL5u0Su7Eq02m
 vko/beTo5d3SsRnCrpuplazABNra3O7m9XbefzuCe7PF0n8/z2pHmvFjX3XeUB0M+duz
 rU4TwlYrdS4g//Yg44KGo4SKMovTDVZnDDeHQJpxmh4gBISprD1LKSU//E/4MRXQJ5fH
 viPUNXGspeKmx1DMs2LukYMD28qXoVgWRT8ZkyZdx3TaKJ0mB9QVh06cb08JETtgkz3B
 PClbnVCXm5KytAxcoR3uI/9ZAXd38htS/RWj/Lqdu/fVQqHxieB73AU3+ZDQ+9UnkvQL og== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39bf94t8jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 08:38:27 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15N8cRcR151078;
 Wed, 23 Jun 2021 08:38:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3020.oracle.com with ESMTP id 3998d8tdp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 08:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI1aUnHQhxE0AtLgfze/R8DRK+DeDYFnaJwzSqeodH0g5wP1xbTQX4TYCvBrqNLFh8JN0Pu+v8g7oe3oPcrT51Ph75Ii8Q3sKIx3Pkn0wMNwc1Z2aACj9Rh5jmQT7PSESiRHCCK0PhTuWmDFYQSm83/jacQhndlz9V1w7aICOjdLP9Vn+cpAlJXiW9q1neE0QbnZcFWZuOZsV/0Q9V52WNeGbq4RzqMYjNYWEIPTkxTEfBTHrDei4CAZCry1tPlwRitIGRtcLIVE3rglJ9fPVXc201yo207Nc4ho6X/HnAeRjsgzuxh81ffo4mZOMZ+Wx0xu8at+px9CYueFYAsBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gaj3bJH1nWu6cTGQb4/Le70tkQtz+SbdZZs371zuQ8E=;
 b=eVDrNfym1ZvFsYrr5zsrQaj6DKmdMGd+nfXO9aUBvgPungzuPacqps/PzkFUUn1JfOcHGZ7Fejvqma9G3PRm2NxULBFvZK9xs61Z24tfU0b6SyaVjL+Oa/nYKDLsR9ohJTaGTxGi6lECKxIa7l2o6sdoZPFNCbdHO6ysxj/qTiLE5d0JuAzpil/fCDWfGs45vFQdgg1Oq75aaC2xVQVifxY5Uj/wq5tFa/dnCAZwYD6+LeoscsfyWejQda/ONqlszALC9L9aJ3BiAhNXdKgZmeQg28eeT4dCbxd0t8ZVzeqj7Nd+UDkcVVfNCPeupNPNceDDgzxMTXf3ohMfCfpNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gaj3bJH1nWu6cTGQb4/Le70tkQtz+SbdZZs371zuQ8E=;
 b=N+Dv9CNvrAboAJXvhkR0yyNjco3C9tXkVw/jybJcJ0bIPTIMKyu362Pej9uqJ1R7GXKF0kNjie4Sue1XZ/AUxhrV9LwrlCjGCRcfNLKz3JtXw0vALCwxA/ZOmU7G2U6PQKl0ztxJChs+MX9v/5Cuzph4Z1mUb4OseEheJ2DP0i8=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB2503.namprd10.prod.outlook.com (2603:10b6:a02:b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 08:38:23 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4219.030; Wed, 23 Jun 2021
 08:38:23 +0000
Date: Wed, 23 Jun 2021 04:38:07 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v14 00/12] Restricted DMA
Message-ID: <YNLy7z0Zq1AXKLng@char.us.oracle.com>
References: <20210619034043.199220-1-tientzu@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619034043.199220-1-tientzu@chromium.org>
X-Originating-IP: [138.3.200.48]
X-ClientProxiedBy: SN4PR0501CA0102.namprd05.prod.outlook.com
 (2603:10b6:803:42::19) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.48) by
 SN4PR0501CA0102.namprd05.prod.outlook.com (2603:10b6:803:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.10 via Frontend
 Transport; Wed, 23 Jun 2021 08:38:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 805f75bd-cc70-41ff-1939-08d9362242b6
X-MS-TrafficTypeDiagnostic: BYAPR10MB2503:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2503181E6FA65D137481E97689089@BYAPR10MB2503.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgL9UOwPml6MZjuPphnT7OQLh1da47R+oZFlzh0Nt6n9y+7I9fiyLiVISHmsfci2GjStfWORRxneL+LzMnzAqQ6tXThPinDQ8LMpLxuNbzT1w5ghISDs6iWcni1lSqmQDH8b7p5VJsxkjlGlvS41RouWCzwUpsWNh2mX/C37tdQ/Jm16Qgw4BE1RFMmvr+PAyilu5J0s3uZiyFayNiRByKuhEofOc03sY1k2F7hzup5hTETSnb5REdNWb/hFxlvTGwxZMrcQJK29Ef2n/Xpn/w92PFaRNoaZ0rqscgHdg0Pemt3YQLJZhQzdi4Qlg6ffPpQdYH2z4dIHqmdJW9thLoq8KmXQLgJStsxPjAKC3hgTDz1NePjBDe8U5KyoVQAHvx/gLLtoOeKUm72/MIil/4wkFnvC6W54oQphei6PS2jY7hjVZ6KgPfr4I7BPeB4BF9velgXFOT1vwbR6IHe/u9dOjt5h0M6wGF9rn6NdfdyDIeofJ5HNhLHAfo2pNv1WW+eAyFvaAGFjMven/Byk9VxmS26xlDvjEx9gPT7gSn55qJRGLvhhyWoIhmBapKX0RcXj1X7LpVr2N6rwbugI5HZ+zAidxOZqzQ1ywQIBaYJM6vi90TYhlF9iI84yS9MP1oGRgoo3KiOijKFin0V5ZwdMDHdnQy5EmiFRCpQ0647eX+5JqdgDxsS5ye133aQI3OBqVUCxi6LXiO8dtXYXNZ1fjj+TnLzmYC/GVn3p3JuuRfd6EHWeDhA9TLdlIKjxS5ThMieuUr3EwXRqQtqoRqKLIVEsZcDG+2OOeVNKclGJlVQ/VbWdXCgWYBeMLoBF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(39860400002)(376002)(396003)(366004)(966005)(478600001)(66476007)(66556008)(55016002)(52116002)(8936002)(316002)(86362001)(54906003)(7406005)(7416002)(38350700002)(6916009)(7696005)(5660300002)(38100700002)(7366002)(2906002)(66946007)(83380400001)(6666004)(8676002)(16526019)(4326008)(956004)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETL4JO0gSLVK3Yd0vvyFZhuEF5lLHStrrJznjei9ayieyQm8cyAaI/4/CU1o?=
 =?us-ascii?Q?Vq3W6y2biS74NgL7vLhSUh2StsPwYm6Q97Z6ZMktjn4UdYEk8OUl46Nnwa3L?=
 =?us-ascii?Q?A/wO9Ukz3NkJya/NDyKUutJ2XBbNuHa1HbyVQPIhLVOzBXDkUePCAhO3eEWJ?=
 =?us-ascii?Q?gx1+SSeTOtxL9ylRVet1krm6z5AEOCb8YLH+BFxd6W7uWqVVADtCQAsTeunX?=
 =?us-ascii?Q?TnBYDRIjk4lL0DYp5n9kfx5fQpdZe/zqKK3ulrN5nVTfZHawfRIZLuDowxNq?=
 =?us-ascii?Q?MmfRJQzl4Rruj2WHvP2f7iWhlcAdSyqDF9+9Utaum80VYQ8UoSfLGw+0zCM6?=
 =?us-ascii?Q?97yT4lKqtGDd1XFsYmB1JwUVPWiexyY5wRJxcG+v8gnByhbUWp5pO6q2Rlss?=
 =?us-ascii?Q?mV8jDDwPZW6di7VYd5gRo6Iq8CjJvlz2H7u6XjQg7RlFdSjMKvBp/LrsFPDv?=
 =?us-ascii?Q?5p5KqZwwYt26SOS1a3m8mIoJW3OHLK0Er2jsnbnDHdHW56wujJXinCpy8M2m?=
 =?us-ascii?Q?wwkZDsOPsToE2BlrL29f73Tv8hMeQlzCabqQimzuzE8ws288Z/2SL08sGeRY?=
 =?us-ascii?Q?vXSZhIeknlI/QHxTbPKV+eWEy1mhmCQh8+211DJ+BsqHzZZg0ZOlxmcXbWyU?=
 =?us-ascii?Q?nPUzb/r+RexmWncgANiP72/L1bpInlqWYMu4XPutmWWB0auYRFy4lLfEJCiJ?=
 =?us-ascii?Q?xq2PNRewT+nIUxTPyW21zF73ZuV4qDx34RLx+ZggH+CfDdiq8tLaZBfpScEg?=
 =?us-ascii?Q?qvcnzGQrvX0B9y+mk6Lrc6FN0slIQUzhBeZr0b6tx5Ga31nF1tJRonTlXUrv?=
 =?us-ascii?Q?M1k2LDumr3sUcTe6yjbPMTfZAoyS+2nitDdTug559MbOMN3SAvc7csUo20ZW?=
 =?us-ascii?Q?v3R4IS5cfN0xYDK7wsImO7L3bvjhrcksEaozppfy2VT2m9qoCcmDNVKn4D/C?=
 =?us-ascii?Q?FLC3eC8p1zH0oSNfgTCftONWIy34RMF0gPaBP0R5lcAYG2p7aHvGGbsR/Pxn?=
 =?us-ascii?Q?1LfQ94uv7RZ715laJ1ijDPbmRnbMbH6EgOIl9KecA59ohMu9i+7SW2KvHl84?=
 =?us-ascii?Q?PEGddSU+Kzj6ZshHqZrIVDC/upL0I+QWB1JgymQax7oyi7sulgio3SkEYDCc?=
 =?us-ascii?Q?x9vCT2FV7/RlfrxcGMGBjRQRL8hxQOaB8lEtM6SyeZMi2pY8L2IUFeFlJkg9?=
 =?us-ascii?Q?N8ze4O/aDXZx3nH2bhKQHLIM9xgitniryOLU3ySZSjGMIzJuX+NVT/iaLt3B?=
 =?us-ascii?Q?Yf8DGYWPtxEnhnzknwteJfgVGmoNsMsQkxNecTvU8Mi4leX3ffe+eGjw5PPf?=
 =?us-ascii?Q?Q9HVuLF9HQM5bG1VUBklPeFz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 805f75bd-cc70-41ff-1939-08d9362242b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:38:22.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZZ2vLTNQgExjqnVBj2BwNt2chpabGrUNsp8UYuEoQc09uS/RPrRjPP5wExFxTdfWShsqtsdaDSQKUDz3MGcuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2503
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10023
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230050
X-Proofpoint-ORIG-GUID: maU1n2Hjektafvbr8bE3jvBse6G9hmyq
X-Proofpoint-GUID: maU1n2Hjektafvbr8bE3jvBse6G9hmyq
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 19, 2021 at 11:40:31AM +0800, Claire Chang wrote:
> This series implements mitigations for lack of DMA access control on
> systems without an IOMMU, which could result in the DMA accessing the
> system memory at unexpected times and/or unexpected addresses, possibly
> leading to data leakage or corruption.
> 
> For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> not behind an IOMMU. As PCI-e, by design, gives the device full access to
> system memory, a vulnerability in the Wi-Fi firmware could easily escalate
> to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> full chain of exploits; [2], [3]).
> 
> To mitigate the security concerns, we introduce restricted DMA. Restricted
> DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> specially allocated region and does memory allocation from the same region.
> The feature on its own provides a basic level of protection against the DMA
> overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system needs
> to provide a way to restrict the DMA to a predefined memory region (this is
> usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).
> 
> [1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
> [1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
> [2] https://blade.tencent.com/en/advisories/qualpwn/
> [3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
> [4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

Heya Claire,

I put all your patches on
https://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb.git/log/?h=devel/for-linus-5.14

Please double-check that they all look ok.

Thank you!
