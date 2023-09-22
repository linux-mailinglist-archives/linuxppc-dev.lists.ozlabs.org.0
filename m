Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D027AB6E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:10:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dSYvqOA0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf0y6kRPz3dCN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dSYvqOA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61a; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy6470Mz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZylTcbjmcoGSq0WzBysffRE8o4Wr74q8THHmgt4j22l37+DldJmlOwuIeRxYsktVEfrFifD3Ol68uE4iG8EK8rFUPzXOJrQQJWmVlwGGdHpVwF0rVO/BReZdWNmdHZ/z2a31DP8a4qCnf6jjtlbnc+P9TLR/ce2YiA600bMT1ag7LQ/W35nYyRZL4Xdr9RXwQ1SXi1QIAkFhMOO46t5yoh9svT80MO0DhJBRIVcOO0Q9B5cb7GoJpJIVy7G5CGlCb7+Pdz41qnxzrbIxeTv3YO3nI7xexS7mGD4a6t+ImzPp+UUYV5eLqutFZIX+Ty73wrGfMfnyOfZKQk2Z4fm3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5vC/OP2UNhWxMABCnyreU56MffKEXor916AYWgY+48=;
 b=GElbSmFCh2cW0xMmp9j4+jY4z3xSLF7LrneiVuOHO4khm3RvHB4XSgYHK8wR41W+DpfUqd1FV7P7KTcAaUFHK0yUdve+jnRR05Rg4S5dl6/WE0xrNE812GLuN0ZeR0g4RzBV629g2p4q13qgIeQcJndmR+FoQU1CgCQb22jGu3ZtfZMQZRnLVFa6CtcrwaPcSat6vDFolMQpmr0Jj39SiHxUpnMvKEjbZxCae9bWrHq6WppYffD0oneEgLSO965hmPKp0Rqjmy/aR8z3o1YhBgBSB7PbEEh7gxZsCNfWtAVIB+0oCMgQNRlX5y2NUytzBRjcri3chmtJZHhVg78NWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5vC/OP2UNhWxMABCnyreU56MffKEXor916AYWgY+48=;
 b=dSYvqOA0E9Njue3C5LRaD63gtkZszyaMzcX2mZYt3wOL0DfH15VBc6wUTUPZKaH5wurwdInR4ZoLeYBLSTwHKCJ/6s+KcSGB/5/XlKaGTbFOiyzdov48PjmXH5uYQgj0NPoX2rWfaVAg7OtMiKoCyN4WGxGzJhfLzxJPBcf6QgY8cicDcZ+qHWI+RzJHFw2wqNizqT3aiF/GxvEGTKE6Q2pD6lxgsJeZckgUAWTZO2IV9gOrhAgyy+/E4AThj1PJL0CdOOW8ObAdsvfk2W0Iy4aK0KGmxG3kDtHfkZDQ3IEv7hD8ue1+ZbYIZhnEQ+GhLHaHpkjjCOddw6NX2uT6Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:02 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/8] iommu/vt-d: Update the definition of the blocking domain
Date: Fri, 22 Sep 2023 14:07:53 -0300
Message-ID: <2-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce71af4-7882-45ce-0a71-08dbbb8e7a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yoFqgxH86SzkkwuJcT9PUK/ATzN3KJdsX/HC0mIUgVPPYX6WwGlYMzf40fYiBDQvA3Ez02ItHasRaLOH7MVoDikqQN/PbvYCQ6S0tus9k7cGEfMQLYOU8JoVRwJAJI7WxQ4eNudCEih5tRhkMapHz+fOh5pbP23HXtVt0d/SepoeIuGrH9LarjWivagxZZ+oMan/iot22jZIBkoNNeIzc+0BLpuP2y0sBOgrabEJGBTfrj4KabwgSLY3hu85PfPAQswmygQUL3lWoMPJjNA5xjkpH6rDaDMlBbYp7neUAgjjTQ7CGgSiMTAgniPzMMFlF1O8siK4xZpKIRvINRvKQhed80CRUzWllT9HT/R/5PaTp8fnQMt+tpUDlJA6xsI3PbimJTf5QzbsdJOGSNfsc5VbRyzE/B407lZTXhz8FdlyAcJ5EgDYY2tVhvZrk3T+Vhu4u7/gPx8oSksDxA/KONaD+2Iu5b8jcr1YR4+/3Ktz/KBEIO40UaAmp/Z87LZTV1rHTXfHV1XyyUfvhU3X+W8rv2iMaD4ANBMEz/L9W+L92CMbM6whHGjPzy6KFOfBMjvMAMnPnbXKpcp5m60iVGOFGvjrJKEkh1EDeDZyBOcSiwq9dNKJ38alXLMlQ7kL
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MNq1XJTTehdAPpQKLOfqzbFVWQh2hHYSdXPH+blRLqqAn1O01ZUIW88vn9H4?=
 =?us-ascii?Q?l/hyqCKP3F7LUTLRhjq1GLgInMWcHv95CBnIBEMMAX7cbr+efZTCE53tfL5T?=
 =?us-ascii?Q?klHkOeeu/Cs6LV88i4yD/nqMpsLdUWJLQp7T4kLR+15ZmBsjoUH7HdRp/Ehy?=
 =?us-ascii?Q?6a1rHJsWDlxa8cVP7xB7BwJ4eguMt8b12mCEq0X0ejtb68UICUmocbl5tBXi?=
 =?us-ascii?Q?OcPfR4dryV25ilMQLRZnBn2ekzi5KjZy2gxVQiZ+ZulcpQq7PDm+T4uKP4Kf?=
 =?us-ascii?Q?N+ZGp6lZy1IDeQ1L/lWvjtEMDGrtAkKVMIhVYtUTZJphTEeD3ofM4JGYUb3q?=
 =?us-ascii?Q?n2pYngmIDs/23Ix4UPmha7riXokeZ0mnSisKMAp7YcjfrSbdRxrni+4vyNNr?=
 =?us-ascii?Q?at4KYYMuUVuTDTE1hKjnJGqPSBVY94PTRStW0oudtRu5Ja799Onpm2Ghn4oA?=
 =?us-ascii?Q?kMtPeKhhzP+WPq9n9ES6/+f/K6TnuRGVf+YMs4eG92q6GaDaCXkwcSJci85B?=
 =?us-ascii?Q?0cn7FXVU55XuYWEqV27n3Lg6LFVC04AtgPBLrmp5fMJUB8615oQor6adFkmf?=
 =?us-ascii?Q?6AEqQQ21Q09rfILkYvXl9s0hXGDDMkAp7J6SJKSnIzMPZ0eYu8x7NEhlZK3R?=
 =?us-ascii?Q?1qCIiqt1WFeQmjehJ92jYJ7NHAhlze1RO8lpHgtz8Xp8V/J6ZTldZ7jEL/2s?=
 =?us-ascii?Q?qAMav5fF87Fz54p5Yv6obvfJRt+ClP/ZuppMJhzRLFa+v+jBOWFgaFx1sdyk?=
 =?us-ascii?Q?TmJU6ToC+wR08AvQZ05e5ZwfqFSze6GrGblu/wmx82TzxA1RCXoq6Fmo1Abm?=
 =?us-ascii?Q?d9fx107ufB8pV8vcY7nCy3mtojlZpp1VSpzpqOkZCDCDWzGoyLp9Ano5HR5Y?=
 =?us-ascii?Q?7pEew9qPr9zx/UxW4MThbkWbA2wkEH3YRj0meEkpQ4hhD3H8KQjg7hLqNhum?=
 =?us-ascii?Q?7evPZrj5WHG5Qj3rtlz8TrpMyJFB091eJRvADUrMIquJVkW5LqufvQWTy5kf?=
 =?us-ascii?Q?nK34UkYtB6vnpjxEjNrNWwEyKovh726F6YaeQ+3UoJHHUuExgQmZZB+scEvi?=
 =?us-ascii?Q?IK414WN8/8MhrlnTuln3dAZyhF3OTEJY60atVM30UWBof8JJngqHYiiyOxSF?=
 =?us-ascii?Q?rsK0BZsKscgOy/EqPAOsnkWHCt/W7+XlOEWcsOSG35FTKdjpykxdJSZ0Pql3?=
 =?us-ascii?Q?Akm6RWUqJElGt1hREZewsW2XDFLx1as6TtFUi2lMhfvCBchTh5V2t8ysR/eu?=
 =?us-ascii?Q?L101pxLBw1wnmvQu9BEhNo/CR6sC33bh5eQnm2nQGh15qz7jmod6WZ0TBkBR?=
 =?us-ascii?Q?hI7Hjh47sjA672kJr7SyB1kduPxmrwgSO9vxGzJsvGtvgJC4VqcpZLo1fww+?=
 =?us-ascii?Q?P5oVNNvZxk2KRg6/6YWtuUmoVkmy1OwBwu107a/kd2p9zFdIUjQt2miMA2dT?=
 =?us-ascii?Q?VA6TgUM445fuekIWuNP5IXD11/kgweKQNaDXg83VchyZOGZgw17B2fIF+c6W?=
 =?us-ascii?Q?SWhkN93bnEZI67CSV+Zx73ZDIPm8XSpHfQYDop1NZDTkKxgtmV7Sk7ONcwdY?=
 =?us-ascii?Q?I7Hk5I0ncdUOOlnu3PrjN1cCgHWGowDpRBXnyGw5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce71af4-7882-45ce-0a71-08dbbb8e7a32
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IE80NDlaI3LXaLK2oN4QD7In7XjMVk/HL3/bjkyjaT88FOXFhXrIyC6TOHE6p+B+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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

The global static should pre-define the type and the NOP free function can
be now left as NULL.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index c8036caad24e7a..0d0cb2534972a2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4029,9 +4029,9 @@ static int blocking_domain_attach_dev(struct iommu_domain *domain,
 }
 
 static struct iommu_domain blocking_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
 	.ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= blocking_domain_attach_dev,
-		.free		= intel_iommu_domain_free
 	}
 };
 
@@ -4075,7 +4075,7 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 
 static void intel_iommu_domain_free(struct iommu_domain *domain)
 {
-	if (domain != &si_domain->domain && domain != &blocking_domain)
+	if (domain != &si_domain->domain)
 		domain_exit(to_dmar_domain(domain));
 }
 
-- 
2.42.0

