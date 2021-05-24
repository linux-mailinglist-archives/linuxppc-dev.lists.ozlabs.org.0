Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8FC38F173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 18:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpjG21RmMz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 02:24:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=qrHgrHMx;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dfaZOae0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=qrHgrHMx; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=dfaZOae0; dkim-atps=neutral
X-Greylist: delayed 1831 seconds by postgrey-1.36 at boromir;
 Tue, 25 May 2021 02:23:40 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpjFS5Wj3z2yX9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 02:23:40 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OFVodS005312; Mon, 24 May 2021 15:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=ANT5xKW4nx9m49D6/G8fs6o+OuyuuDORxrGpmun4OaE=;
 b=qrHgrHMxhsaF79ZYG/kLlxpYPZVP4f+0Z+b18LeoJSWSx9YeuGQ8XtIHf4YmV5tJ8jEm
 wKNa7q0c1VUC9ewublNDludWoJ030qKy6ECaKENS+S2x07OmSU8YG+BfNBZEInFLYEBJ
 gHGlfVqOFRVX+yMgpTU59cWsKgebxhaf/Q/vD0ly10EAmhVaBE2FABLCaEE57qX0cWhj
 8lQ0BKBx3Zp0XJwQ1cNH2TsisPKNn6vrVqU1IlP/4EBriQWhRUCwDjMMQ9xZ+iwsD7/6
 HKH5UkdWS+DoxN3WMrAGq7YjgP3G6dq1rCrUc5mX5GLRumpFMx4/VsFUPTIOTIi6K5Pf Dg== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38r267r8mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:51:29 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14OFlg7X024516;
 Mon, 24 May 2021 15:51:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 by userp3020.oracle.com with ESMTP id 38qbqrbpx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:51:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHh0pj5ZxiT6YLjthu35y50e/lVzAGsa6PPkJf7HWbnxfw+iTaQfD98asDhw56/aF2Ssdx1kNirBcf2OMT97qkcWwEnB8EpyW8PvzaLL77u/ilkzzIRb7sdDVHKUV+LetcRwz+w0tACsMm7NfcqrY69HgfpWGfVJaKXIPg0El38fX8IoghQwoGzRcw3fqfl37J5nkwLq9ptDmJs9+uil163icWL3ICiYQdYWq6t4FTAMkfLjQVVAwdGR7vGHv6jUXR9Wef8sSNTe1ZHkJKAPZt5ARkX243QhHu3kQJSiLceIbw6zEWLwqQxmGGpVJrG+Qi6+4in3G/8xDIPbyO3zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANT5xKW4nx9m49D6/G8fs6o+OuyuuDORxrGpmun4OaE=;
 b=OAeqYh0f58V6IHL07eBrGHgQtKQMwhJ+cvnN6gbcy/AmzrjSD0fpF3y57dU/hVpsxKeUK7w9M1hLHfut4tsYajBxnJY94efai/gcO5TUihbkIn1bzBKnwRK93rbB0sRl/qg9VCLYNq1zL5AKUNyQ8tegrfwAAvR6I6lyr3NOAGsQ5XhR+UEqdLeM0q1ftvej6Xh6JqhmtkJuUs5IlFk9eeDyC0jQeFy39V7tebh3BKrQX8/zbc0BUovYXZExHr9MlxhtM97o1R28dhG4ojvOXCUwim4WhVq+Hf41pIvqYzlTqyfABJYlYAQw59ZiCD9qYAROLgil0cHlMvNtqPwZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANT5xKW4nx9m49D6/G8fs6o+OuyuuDORxrGpmun4OaE=;
 b=dfaZOae0bFVaquGcd68p7COHf7NSnMoK+q5vEUfpruHVPdGCrSde54IdgopJb/+t5XxGdHvyUxuuxW76oxZ/xZXqsZTguhBaFsx9K+Uh0hAXVDiCICJntr//mWTrUy6AwQUmpYmcJhbPYBm2bFXngVLZdmqCWTfKPnQVhlpz+/w=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3096.namprd10.prod.outlook.com (2603:10b6:a03:151::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 15:51:23 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:51:23 +0000
Date: Mon, 24 May 2021 11:51:15 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
Message-ID: <YKvLc9onyqdsINP7@0xbeefdead.lan>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org>
 <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: BL1PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:208:256::30) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 0xbeefdead.lan (130.44.160.152) by
 BL1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:208:256::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend
 Transport; Mon, 24 May 2021 15:51:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d633d6-6886-4ffa-a44a-08d91ecbc7c4
X-MS-TrafficTypeDiagnostic: BYAPR10MB3096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB30962A69BA3EEA748AD71B7989269@BYAPR10MB3096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +N83Gd+vIa6HFf9GGeGnQWALIhCS11sTuVASeml3ScVVX4kKnQ90+wmWu14xkc2kHAqM1eBMxPhJwGeSP1ybhcQrmrrji/5Yh7NI5AKUXOSH//YUcD6OdkMRAPXEUco7bX2XJlO026ptDlGszXsM+Qa8JjiU6tmYWji57vfTiq/orKeqqgLkQHHAbtjWkRyI55C7TsR9l0l/uGNPf2zuLhmtdqFq7BbjIeQdl0xyufGalOxjj9196lHp1FNjL/SqzSY7fuqeTDLezHQhjzsoYnQed+4S+L2XK93PL6Ztq780tsZ493ifPS/HCl5OePy8j0a77gIgGXbjYuB6dL7SOtjhjltMz5UNPpwNpFBtRPA6YEzQkVsYU2+C+mRoaDQLRUApxKvPMxyhVlgCmur+apUde+Z1cur4qY3HGPq8MNusIwBdSQXjy3MqoIrHAg1GzcilGenGQEIBP9M6Pp2FxeOcLajvKTZnSFz4rx5xSzOSb/3jU4rboTLnN2THtqpEAIu7J8uMBHd7w2LwkCDrb3jSHbbbADhvIT7ZgOKjYwPZzUYaXrCfDQ0xqAz4K1HYih6FqE/23ProZp2orcZc565JO1gB+og9ZYUOk8XLtb9Tlxo8Ch+pQ2nGiyYPQefAwCCY2HafKeS577/MPO3p3e89ufUhQsTgLk375bvPYqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(8936002)(8886007)(9686003)(4326008)(66946007)(66556008)(66476007)(52116002)(5660300002)(36756003)(2906002)(6506007)(7366002)(6916009)(7406005)(8676002)(7696005)(7416002)(316002)(4744005)(956004)(186003)(26005)(16526019)(54906003)(38100700002)(38350700002)(86362001)(478600001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oo36w6L3PwdgG9nBNqyN8WBm2OiXwQ483HbbfXjA5xY9AczPozaEoVkR4yfg?=
 =?us-ascii?Q?zPCJY/w1sw6eV/0nk7eRpYHNzc4hCTjl8JUJcnX4BZhXwaPlqkM7aS+QPTKo?=
 =?us-ascii?Q?qI7C8haJTOXJh1eYTxkF64beSG/lXI9LtquWwRHsYot3B7TnIKK7JxJkBOEU?=
 =?us-ascii?Q?jex4r6FRmWgSalUFUAiS/BosSJcYPT4O+BUqIPg20Tt2M/R/gRoaEgIrKarm?=
 =?us-ascii?Q?2QW5ufRML0QU6582vWejdu4B2ed+ng64wCsojkX2RdUissmkr22DCRol05KR?=
 =?us-ascii?Q?O5svXcOsJTPtKdnznmuJBT/qKUsG+pM3hfYP9bCsZfx7mP76i2WwZyyUa89L?=
 =?us-ascii?Q?P2LUjGZkt6NhNSfkmgknUZfE2uf13dl34AxWqw8yrNnskWa80CJNWj/s3v+k?=
 =?us-ascii?Q?JiLlJszvn+zi6iZxd0aL5PhkJXVKSIiDbKf2p258OMmg04Z9GIlN8GKcydI6?=
 =?us-ascii?Q?YDKtjkq1sbYlaNhe/i1SLA70JOFp1kG3S3hrLptP+NNmLl5QOCe0EE4JNX0U?=
 =?us-ascii?Q?uxw+nslQVakkslnuc2Obq4izZ9RniboX9QsNmT2/w8chqFD7fvq/+S181GFQ?=
 =?us-ascii?Q?zC/5MXz0QLqyN3bDkLG3fdrzqV4sZbYDWpt4rmayhVS7Drui1B+duAY1RGuK?=
 =?us-ascii?Q?ahnSToT+WLZyeq5h+e8lzNlmBptd6o2wWy+QE7ayMzWQPSjmBSqTcd2QCvNI?=
 =?us-ascii?Q?eYb3yRAEt4AqYqjJ1svN+KQ1sJhzlNyGOtJ63Gq/bfpXy0wfxy/XVCdvwF8i?=
 =?us-ascii?Q?IsYjdxlVZAxbWdyCz9IJowF45rNCNxb0OGtaqs7L99BRJWZkJ5wLqCG87Z7P?=
 =?us-ascii?Q?SDNpGOfFSQvG2E/uBgZZpf+ETp/pkk3U4yfsL2DuubLUrNC62S8vmGXZC1SP?=
 =?us-ascii?Q?AbhY2VlH5coloSgcUmuOG+bOzuJdJM+Ta6iG3/A7rsu5TD1aGBfRZ4/IpbEm?=
 =?us-ascii?Q?cB6yPsjhd/D5j7EDbXHu25ujKcNPvGD1YiDrCEAHHZkq1ZnPiktcyMZMiXog?=
 =?us-ascii?Q?BlcrNxx1ptCLXNa9EBkgxPR6C5FEGY/rqokiWWCqvHvxWv7rKEFTvmN4tPMZ?=
 =?us-ascii?Q?2HZpCcGL7R3M77OMDGBuPY8uz2AbQ6Gvwwp0eoe994DjRE9rzCPEh1IganGQ?=
 =?us-ascii?Q?VgT4GwAgR6pZGeQDAh6/bi/Rw4KsW1rxYU+oTxQ9GcwvoWRNiF3tQGyv5EvJ?=
 =?us-ascii?Q?GDPsI2BGsOyLmqo2suSJAwDu9AheDXYoPMQ+EWv3hnFMywAbDJudvbtJ3v4+?=
 =?us-ascii?Q?BOO1BjKfpBgL5nFsIgwXDKrXjYXHTl010/nKw44YQHT31Je6nbYgVC7pXSWA?=
 =?us-ascii?Q?aoEzv4EB4ztnyFFtarSDv7i/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d633d6-6886-4ffa-a44a-08d91ecbc7c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:51:23.0272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxAllPJF1Dj9LN1/8w73nsJA1i57Xgng16mblVk0eANUe4Km8DzVt6OxfeczoB8PyL61CptsY18dgcIG9dyUCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240095
X-Proofpoint-ORIG-GUID: sc6PYAtMB6pfPEa5xGNcqSGSSBmqt-Er
X-Proofpoint-GUID: sc6PYAtMB6pfPEa5xGNcqSGSSBmqt-Er
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
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 18, 2021 at 02:51:52PM +0800, Claire Chang wrote:
> Still keep this function because directly using dev->dma_io_tlb_mem
> will cause issues for memory allocation for existing devices. The pool
> can't support atomic coherent allocation so we need to distinguish the
> per device pool and the default pool in swiotlb_alloc.

This above should really be rolled in the commit. You can prefix it by
"The reason it was done this way was because directly using .."


