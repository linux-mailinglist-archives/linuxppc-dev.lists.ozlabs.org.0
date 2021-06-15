Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1F3A8BBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 00:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4NBT6DPDz3bvT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 08:23:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=p9mJd6PS;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rzJh0+Ud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=p9mJd6PS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=rzJh0+Ud; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4N9p6xrnz2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 08:22:52 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15FMCFLr031533; Tue, 15 Jun 2021 22:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Ewm2kPzkQXJo0QWHDfmpQUI+ONPvdfpRUyKyuic890s=;
 b=p9mJd6PS1dtlQ8F8vvfEP4dxRcC4JhBZvdxEX50hBkUl4ZBanGC491pLxBqW0zTtC50m
 ZQ/StQp8s6rBTSRosKg2cxueparkh2/RpFFNOfksGyhoM5jZ8OKm/DG4x5QrATvxL+pY
 Y+jIy8ndjCNyy88sS4ZxWhcmaac2dbS3SkDcYKI2IpIpXfRS9RSxpaTbhCY+huHW6r7J
 NwK4MluAUpAwvCgShkDepUawqfpj+/0vCn6GsbAxfpfyOa6IqYJRhXhsndYDpx3dzrXL
 Yr4aMuQtBskxrjSN+rbUpgxesyWRaezjaxefbEza9e+RWZW1ApDn0Ike2qvilpmpc70P HQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 395x06hgrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 22:22:01 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15FMM0fF177365;
 Tue, 15 Jun 2021 22:22:00 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by userp3030.oracle.com with ESMTP id 396wan2uq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 22:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjD5IZWjw6xLx8cXH9X5sGRYBkzibgo9DwaaGCnuTRBXFQ7gzbZI6TG2wl+rZpYDyMuAQA9SIbHVTSmC4erudeIrngYgfp5tQU28Tfn67E4k9k0i9LUdKJ/YxaEUrVwCSpKDd8D0dC1ruLWvFJIvWwxrje6QpMFzQIDsLeSiEFOjC433NUjQBRFvaY1X3iHg1AMRiVV6bnNQhV0T3S/51709QW3eePX3MFNCZrtznBZt8F9Gv27JYlgPX/NMlAlUdFkGvisf7JsUp/anlNiSpPp5QDB/uM2uqXyiroBd9UhPQVlKeBAGEmFwcMwsMwCPm80KOI43LpD7aLKS5lvDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewm2kPzkQXJo0QWHDfmpQUI+ONPvdfpRUyKyuic890s=;
 b=QvY2wxrghSsAxqlgUAUPoHUiS/FaHfr7Ky8yvkaFgP/AcgAEn1W6GEzBVyGpXg9lnu1Tx062pdqsgDm7p8dA2RCGNre8aOhPBh0OcAf6/ca5/WxFjjvMa6PBlJGnNwIm17nKu8HfQxkaa5ZuzYAwfQe2NsmFCvRjF1KdFy2EYmRbLWTUrKe3Pegb1J7B3oqmRe64wfYecYOmo+m95BeV283pI3YdeDGXBoBG7F1kwXEuCkb9pm+ACWXghBV/zg330hlCNsZfc6iZ5xQaFYDC3QHk6Lck7x3NALD+XbEF1kIQgIODeHtJ+CmA7p/FcspsjA7XY7VOoRiDek05y5mReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewm2kPzkQXJo0QWHDfmpQUI+ONPvdfpRUyKyuic890s=;
 b=rzJh0+Ud8oWUbFWOJwf8IhtTX7ACTfqPmY5tDMMLcBrbhfKjzDVD7LQ4nZWiAm8Y+RBdXJfWZdRu3F6fXqDSqOWYweNGugnPdGDds+LOb8x/XvqwDEIO8f7dbNWQXyd1oUpNfnxZXFPU6/2aDaLLozF71KvVy0frh2J1jBCGVWA=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB3764.namprd10.prod.outlook.com (2603:10b6:a03:1f9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 22:21:56 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 22:21:56 +0000
Date: Tue, 15 Jun 2021 18:21:41 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v10 03/12] swiotlb: Set dev->dma_io_tlb_mem to the
 swiotlb pool used
Message-ID: <YMkn9YIJqKxelVRI@char.us.oracle.com>
References: <20210615132711.553451-1-tientzu@chromium.org>
 <20210615132711.553451-4-tientzu@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615132711.553451-4-tientzu@chromium.org>
X-Originating-IP: [138.3.200.0]
X-ClientProxiedBy: SN4PR0801CA0019.namprd08.prod.outlook.com
 (2603:10b6:803:29::29) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.0) by
 SN4PR0801CA0019.namprd08.prod.outlook.com (2603:10b6:803:29::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Tue, 15 Jun 2021 22:21:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84e40bf-de30-4457-be50-08d9304bfc37
X-MS-TrafficTypeDiagnostic: BY5PR10MB3764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3764EA085563323CCCF5D9FF89309@BY5PR10MB3764.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xF7BAeumBgA6E0VmbmaA3ioSAel2CytzKgdt1uIT9go9/NjNmeodkwaht6aelOZ9E6scx0YZtTQJdAXDmSneU9vu0wGcmTbUifhBUrkdlayQ6hRr/E6GKZdwmaf98Lpbj4tPlrlH1G6ZMfFQzfF0vZ5k/QVDLjMt/D9pAwjKPVWj2OoiSeud5q+Ax7HLo5os8kWWjR5DU6ih+dUDtHJ2B8UMhT2PbCAvBENqWz5H3daD9fYUgSLa9w7LeHsX0Vp8xdlQF60I0q32HPuFnlbblyWJtflvBBqu4KIWD0ALZ5jZQpKFyPZ70w2bTLf1DiPYNVR9+93noh7OsqeNiE05ClsMH7CIzUUKEIQ5k6HbzVX3wLFQQsR9fr+WKbljW96LJwkmZ2OVakWgej494Os0WvTLBO1BI4iP6FlbtrDOqPOOmCtKY6wAlvUKZIF13wPHDwFIBua4bkwooVntdBV63ohucyAmS/e5VVeI/9MjQTAzBdKXuT/6fR4ALhvqNUgSvJL8wAIXeUyk9tA8t/Rgbm9sOCAIyYxM0RpGWEcAIDmDvfaXxtrMtQCeDO/tW6GsQOgTfGz0Y+QKYcpP1BN4/975osQRX+C3Fs8t6GjNVmIa8tWn05O8vQ/DPtBpKo8nhQcvpphkFhRwJt403BvZOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39860400002)(396003)(366004)(376002)(2906002)(6666004)(26005)(16526019)(83380400001)(186003)(7406005)(7366002)(7416002)(52116002)(7696005)(38350700002)(4326008)(66556008)(5660300002)(316002)(6916009)(8676002)(956004)(55016002)(66476007)(54906003)(38100700002)(478600001)(86362001)(66946007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yDIPw9DQZfFEwfQNMtXbYoN7a1mXxAcENcJ+ekAkoDUjpxnaKujqkd8PSIcL?=
 =?us-ascii?Q?ibYS1fAosw19N/jQFKEvQ4r7kaHdcY35TcjNe3oFHnbcs0I5mEuSqWMp7tRL?=
 =?us-ascii?Q?x4aVmjTd2p8303jAsK7aKx0kMXGZc1nwKJDCphVkHCrH0gqwZRw0j6nWTkfi?=
 =?us-ascii?Q?HTBbHsrXn+KghJ7EfpJg5QO9WBCEH+mMki3nAYPMxq8GilorBPlS6Vp7iiIi?=
 =?us-ascii?Q?sOZ+dL5k3tj8WZAm8w9fN2iRYjBP2E3k6pXttRTINm/yq3ON0Gy3HsPZ0oNX?=
 =?us-ascii?Q?jAs7wdw0Kj/p0e4Z7fY3NGivEmyTEEpJsG0ZNbAx4GOrtBlOnUpimbFdqEmR?=
 =?us-ascii?Q?aK+Hz1ce0ySqp1ugn8ATZ3ThiW+lJkre3AsmkPZcL2miur3Mr5BHPcqiLFG3?=
 =?us-ascii?Q?h6ZZ+UUJHCj5iBt12pNXoKc7+o3chgv7vTVBMpb2+SmtHYlrVuG2X9M23y33?=
 =?us-ascii?Q?qtX/0e5IxDyK9RJmI4671ZDydFhjsAa/yEppblayzVwm+hw94Y0vTxoPxrb5?=
 =?us-ascii?Q?qSRXj/iDDgKSVbuCufE2s4khdvZS+yO2/5D05Vv06Uj/Mm2z52Gby9CL/ZUK?=
 =?us-ascii?Q?Erycb4ZrnqmQyEZus4oZlt5N4gkhp1nq22o2tDliqXgofkuDaDe71PSDAEQ5?=
 =?us-ascii?Q?nIBIvIwhpqc0uWHPcOKk6ILycH4IOFRynQf39o34DDW380BvOSpFRz+6uM3W?=
 =?us-ascii?Q?XA0wGPMOcGLFSE+6LjIMHnr7OekrceqvnNej/rUPrfq1CSdYGRMfQ0uRSXKU?=
 =?us-ascii?Q?Ve+QJhcl9yqQwIl+Ykn4w2Pr9xf5G0FUGgp+Mw+/CkZqE5vCx2lYEO20HhNI?=
 =?us-ascii?Q?Dqd1qzm61djsVaJH+1OfA303dEMRYhXjM+b0ZQnmqKUdAieDlwWm5ScjnfSt?=
 =?us-ascii?Q?6IGcK/3fzTM0tjVZyNMizspT4Gnn6fP0ZlUSpT+3d9d2IKLYwthcs5I7RDAw?=
 =?us-ascii?Q?cPDUf9CaH/zEmBqtRKmZWjTCbthafxumpzy0LSiGJ3eZMxMzszsOayP6FlP3?=
 =?us-ascii?Q?eAEHQjYuBmxSnUj7OhtP8AB7xWUQwC1gQN/RkeIJRg/3eS+kLNI935eiBUQM?=
 =?us-ascii?Q?McdkFy5jDJyvGzHY5MSV1NVn7QxEsqaqB/7dY83kZHZkSKRrC3LRvRXQaIOq?=
 =?us-ascii?Q?WuPumsCb+EvsTY/4+eaPKLL2gRgXi4e1KIPm4eACiVtjTQOTev4uF87KfcjI?=
 =?us-ascii?Q?vbf+eNbI6dLHDatf8rIQNhfzHiXsPR2CKYkWFfgCrS7rCgXd4miSbKuDkIgo?=
 =?us-ascii?Q?TgGG6GbecvN9yyDoTbA5ywNChqeMUCt1pJHVEgeQiyvwDrAOGgG21NxIf1mL?=
 =?us-ascii?Q?Kc1HG8uqCIPyZdyggjFPlkni?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84e40bf-de30-4457-be50-08d9304bfc37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 22:21:56.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqDAXHWgJql7g0jEA30LQdjzpX2coNygHrx1GTLbl89x8Z5+jOR2M1o7u9p+TRdkzzgjCPG584j1WtU+wXlolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3764
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10016
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150137
X-Proofpoint-ORIG-GUID: vAX6Oun_7Zlja7oqlv8C5OTIAkc2TKkM
X-Proofpoint-GUID: vAX6Oun_7Zlja7oqlv8C5OTIAkc2TKkM
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
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 09:27:02PM +0800, Claire Chang wrote:
> Always have the pointer to the swiotlb pool used in struct device. This
> could help simplify the code for other pools.

Applying: swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
error: patch failed: kernel/dma/swiotlb.c:339
error: kernel/dma/swiotlb.c: patch does not apply
..

Would you be OK rebasing this against devel/for-linus-5.14 please?
(And please send out with the Reviewed-by from Christopher)

Thank you!
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/base/core.c    | 4 ++++
>  include/linux/device.h | 4 ++++
>  kernel/dma/swiotlb.c   | 8 ++++----
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index b8a8c96dca58..eeb2d49d3aa3 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/sched/signal.h>
>  #include <linux/sched/mm.h>
> +#include <linux/swiotlb.h>
>  #include <linux/sysfs.h>
>  #include <linux/dma-map-ops.h> /* for dma_default_coherent */
>  
> @@ -2846,6 +2847,9 @@ void device_initialize(struct device *dev)
>      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>  	dev->dma_coherent = dma_default_coherent;
>  #endif
> +#ifdef CONFIG_SWIOTLB
> +	dev->dma_io_tlb_mem = io_tlb_default_mem;
> +#endif
>  }
>  EXPORT_SYMBOL_GPL(device_initialize);
>  
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 4443e12238a0..2e9a378c9100 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -432,6 +432,7 @@ struct dev_links_info {
>   * @dma_pools:	Dma pools (if dma'ble device).
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
>   * @archdata:	For arch-specific additions.
>   * @of_node:	Associated device tree node.
>   * @fwnode:	Associated device node supplied by platform firmware.
> @@ -540,6 +541,9 @@ struct device {
>  #ifdef CONFIG_DMA_CMA
>  	struct cma *cma_area;		/* contiguous memory area for dma
>  					   allocations */
> +#endif
> +#ifdef CONFIG_SWIOTLB
> +	struct io_tlb_mem *dma_io_tlb_mem;
>  #endif
>  	/* arch specific additions */
>  	struct dev_archdata	archdata;
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 97c6ad50fdc2..949a6bb21343 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -339,7 +339,7 @@ void __init swiotlb_exit(void)
>  static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
>  			   enum dma_data_direction dir)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
>  	phys_addr_t orig_addr = mem->slots[index].orig_addr;
>  	size_t alloc_size = mem->slots[index].alloc_size;
> @@ -421,7 +421,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
>  static int find_slots(struct device *dev, phys_addr_t orig_addr,
>  		size_t alloc_size)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned long boundary_mask = dma_get_seg_boundary(dev);
>  	dma_addr_t tbl_dma_addr =
>  		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
> @@ -498,7 +498,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, size_t alloc_size,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
>  	unsigned int i;
>  	int index;
> @@ -549,7 +549,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
>  			      size_t mapping_size, enum dma_data_direction dir,
>  			      unsigned long attrs)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
>  	unsigned long flags;
>  	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
>  	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
> -- 
> 2.32.0.272.g935e593368-goog
> 
