Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F0553F73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 02:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSPDS751fz3cD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 10:20:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=dvYTpi2K;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=I2OjtEAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=dvYTpi2K;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=I2OjtEAM;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSPCk3N6Nz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 10:19:58 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M0JD02004543;
	Wed, 22 Jun 2022 00:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=gVCgyGS215qeuzVyh3NQ1QmLGn7c+lAD2oWKU3YYHCU=;
 b=dvYTpi2KO0H7AYAKJEd5OB0Hxx6hl3skv5Qg51vCWo/9f80z3o3/UHUEvIa+nF8uRXln
 wtMcz9S2d3VesV6EutRxAYzF0TBTaakaiXLfNdY99D5J40vc1psxjXHTs1C4P0f8f6YY
 GGgwKay1vHqL5ys5BqfO2bmuDl4GE/5J77OmeKvamfWsAX2Hfd7EUv2zjV9idtEE/ne0
 EfWG2o903joIpoGT0ZUefYeVkXCZEL6z4Xw5vZPnHbFmPE2kSlLvFiFUGwClRQqg3xde
 JIDLQtZyVSyv32lpGWgLVo+DDSLL58SQSoZ5SUzchIZbf9tLqCo3iShcKoTG1CmtHX7n cg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs54cpyun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 00:19:14 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25LNoaFl013391;
	Tue, 21 Jun 2022 23:56:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gtg3vqywj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 23:56:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXvRpOqTnS13F3ZbGoSjJ8JhQr7xmBGHb8RYC7AbW+vYrkYRAXPo997g01OLL77KdY7B4c1Y7e/W1bXa3mmh12RCTGaTp4lDHNEi5+B6RFrWmrDm4eEY2Q/TeETrtAuk+qocTkbQkd8uHublF1qy6M/mDG5vDMhPx7+RIa4Bx/leZ4+DLxNnUEvc1kXPfNDmGogdUqLeATP4pyQN3mAOwknkxdYRneaF/0GWYpP/BuvNFKgJ5gxENEuZsdwacFW9lwBLzcsCfSMLw6nAfNeEhBbz1mR+9wJ7/LP6tHQxoymfiUyobQSR0Hf441h9hE1UpkWTPr9a1Aw8Qg0WSjbgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVCgyGS215qeuzVyh3NQ1QmLGn7c+lAD2oWKU3YYHCU=;
 b=ZooVdaMO6lQRv+09OAur/bK2hK6WbvvD3YcyicOPWjohfxwRruIUCBH25W/1PWGDLJ+vsQFfRQc614FABF+qlaa78u883x7YJQLJCq7m9LCaxhwKXboMJWHZ6snMgDj5VTOHgMPZe7Tt9c2xaORqI4iPg0khWulEAX3PVv6zqoOTTk2cosH//ysq7CIltLRk3nKlHtgcrZoz4x8W0Sp8EoZ9b8Fpw6G73us/1+UC/UttlZ05VKiot5Wl1KNQkO13vokgaD3d2AbFQ6QLAEnQfuDg6l8hDMvwlcu37/Hvh0psMkf0B2zwLqYdUMkNEGLD/iQCudn7D90ffCmy+QhN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVCgyGS215qeuzVyh3NQ1QmLGn7c+lAD2oWKU3YYHCU=;
 b=I2OjtEAMjpJfcn+KxqTZbFfzYyM3dG/SlosbEVW7CARxHw4+zPvJiEn5SaduKIuTU5Cf0BFJ2iwcNUrcv35YLU+XWxFrdKHtfj7L13MJ5iu58HoMqTZTjP8OqJdkKwAmT+LpGsDV7rMcCDhriw/LmI7YUnLeOyP+gRbk4elLvPo=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MWHPR10MB1501.namprd10.prod.outlook.com (2603:10b6:300:24::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 23:56:40 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 23:56:39 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] hugetlb: Lazy page table copies in fork()
Date: Tue, 21 Jun 2022 16:56:20 -0700
Message-Id: <20220621235620.291305-5-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621235620.291305-1-mike.kravetz@oracle.com>
References: <20220621235620.291305-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR15CA0066.namprd15.prod.outlook.com
 (2603:10b6:301:4c::28) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcafded0-41c6-4927-404e-08da53e1af1a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1501:EE_
X-Microsoft-Antispam-PRVS: 	<MWHPR10MB1501AD9C6ED28189518CA133E2B39@MWHPR10MB1501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	s9Ix0Q0WjEyHx3o1CIVwKZPZa5eEwG/qDjXsyMIqzrcYKO7J25YRBYHN6yiMeyN/0+rIfqrEODucNANWNcf9firw2GxDlFgtba0/qy0DquthtnDgMzFtLYg39yPV/nIRC3Hk/Y3BZiogQjMYcsOnl/wWApK+x121xRhee9F+G3fCSBz19sJ3Wb+k2JiihT/20uFnxRekXill8+9kz+ss9Jb7oBPBVT8jik4SLf29AmeuNBn1K092frsD23sVfBFigi8O3zVAwURvdDvlSjfM4Hdi1egYiHfmMZG9DIjhGvSdI8M6sRNKsqJnWVh2nIqIcoZB8b3wu/iRX04t5cAn/nnARByzNF3Rg6ugExORt12f8ICFLeGH8d/e8pBVhWPoS470tuoTM46YnZU64oCvBVHYOFn0q/MIUjjEelfybe3krYV+0S/arGahRDkbtxp8eNsOtoSZPjlwk9DFZlVCbyhAmmzbwEp3cMF5u6k+cqEnUJkgcehg4tIKeZgfbq5ERN7jOo6iDbxeaGV00wnT3f2QFQvxa3li9dqpMMGcxTlI10PODG3pg+4tNU+6pNwiJ55AZxaVKAQaxHNlX2y4StUDaBaoSgXEGltWdXrhhKQLuHVe/wBqFmqPxGMip3R/GSstmSLxn4rqULWE4MLadkQ7i+kLSeXQ2U097AaJ4qyzI5DlibbcZzUAJcUDLQ5V
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(136003)(39860400002)(346002)(376002)(2906002)(86362001)(4326008)(6486002)(44832011)(6506007)(54906003)(921005)(8676002)(36756003)(66476007)(66556008)(26005)(6512007)(66946007)(186003)(6666004)(38100700002)(7416002)(316002)(478600001)(1076003)(8936002)(2616005)(41300700001)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TlPjM4obrF6PM8hCyNaTJwD0HbbSMvxJ/Y+ivR3qBy/GrkX2KHcMP9Lq0KVB?=
 =?us-ascii?Q?4V7/aNt1eBOgIbGB7uZ/GhLf56ElWlPad3feEk05SjPqflFzDGfA7MzFLw2B?=
 =?us-ascii?Q?/IJRcmenn9DYLhb5cUWEJV8kf5awRjtG7BLYUzQLtddMAKO4eiyTIXkDKABo?=
 =?us-ascii?Q?FU88IEwPLc9rMcQnK6d3OMx2wqu5k+qiK2JcnRJ4uSAxsUzLR+olyX/QRZRL?=
 =?us-ascii?Q?bTimLbioY+a45ti7xPU2ae9R3Anm+ujWHeNSyH0OLtONtMkjH3OLV1ZdPpCw?=
 =?us-ascii?Q?h37+vJb4XthkIIGbeNosNv4aywm+P5S5LJn4h80CXQYbkswtfhE/wuq2uk1h?=
 =?us-ascii?Q?NhNJ1FmzeO4gHWgFnQwv0k/2HkIYdQXsilUCYFihmd0wVEp6OaNhsafprPL5?=
 =?us-ascii?Q?GIMsyxUoxePb6+xEIpmd9766l88Dqm5USFrXlBngZuNYk9MnXCScYfZStB/r?=
 =?us-ascii?Q?KkFmHXUF6WSeOzJ1bv+kukYngo/Yiuja06EihS2kWvxCzpNTXut181QJ7kpW?=
 =?us-ascii?Q?iWDjilPvU5X2AHeRefpGUZ6hMGZUqPslhS4cqPkf4pjCDBLxoQp1Trl1xSoi?=
 =?us-ascii?Q?3CiBlJmuAe46FYP5/wOBTzIAZZ392NfbSCDy5eAFQllgooSKp7QL2zLg3DYQ?=
 =?us-ascii?Q?S1zKYzHIYHHI2WqQjmidibRcrNHwQ6Dc8FbnhUFSosdefZI4QMo+orharWkI?=
 =?us-ascii?Q?RM1aLFGIqmy+v7oXXrdWGvYOsCMsf7ZJUhYQtTQO29p2dcbuuRHal2GNHTxL?=
 =?us-ascii?Q?58zLSsauIqMcwNmqxXY1zsRFJRXX83R/SbCwQ5UKevKAZ6zR07NvwM+wjCTa?=
 =?us-ascii?Q?xSIh3qHeB1Ap/fs/7y/eSAdiWzBJD4F5DGFj8drZUlYkQBV0yO+YrPHT9kc6?=
 =?us-ascii?Q?I5/KA4c/zQiUFl2pEp9moeKpHtwPqFPktLC1d8uI56plBuMUf/7qKi7DEAbo?=
 =?us-ascii?Q?vgWRE/dT9dKTpA6xHQyRvZoGTBqK1sj4+vHhueDfpoyb3VjXjJ6q7Q1yJcNJ?=
 =?us-ascii?Q?uSacWe/FUO09ngIO/8wnfIh6hnG76xPa7Ab0dFHgWeexIcaGODFoAnYkeJqd?=
 =?us-ascii?Q?8Kr2YF3K1WnxStg9dwpz6++hO74qyRi0GPTzuW59DNLPw8SujBj67wx7mPwm?=
 =?us-ascii?Q?OmLJbLZ+b5iPoV3kZimkZSC9SiAyV3BJ4hOwXp8faQQvIP+7yTpjvmsXyEqT?=
 =?us-ascii?Q?GquX66ASlDtlz4PDu765CLyL8T5XWprpaEpRsfUtxHIN6yO/mjbv0z5yzcVe?=
 =?us-ascii?Q?9W+nO7zbS00qf6iVgtySNn2pfGImfXBT/ASX0DvddfMyFEiZnzMrgixPJVS8?=
 =?us-ascii?Q?qijaNiIYkAnP+YD95J7CTk6V+XdGM9AQWZEXldu7DPOBWN4O8JrkOLwLqIic?=
 =?us-ascii?Q?eOsmj7KTGFFd78xFRqX6VZoXvx27pZIC6wPtfjH93rg9p+fSgqyQ8QlFIg8n?=
 =?us-ascii?Q?3Cmd4NgLCZUso7k3lNNEXYrdyK8s9xOFnQLuTirmM/dwV/j53kaeGxuT72km?=
 =?us-ascii?Q?p3V3bp+QoANYA+7FM2QqfY6UtxtaU4csYX+6c+mUMLItxvmQvitTv8m2nlVo?=
 =?us-ascii?Q?Q77eUtBFbEu0ss0TcpAFKQXNN5qo1bAVS3WA1dyYa11mfPNnhQPHCvfoHGpj?=
 =?us-ascii?Q?LWS9lJGrA5S7ARa2qObQ8wy9+1Ds/gvBNa2wzoxlU1F2efj30L7xB1JPz8/l?=
 =?us-ascii?Q?cH3vYhrNqSz0pdDvib7fqRECuihjrxbEQGU9oE2U0n8G9GLygCBK6NFqwv8k?=
 =?us-ascii?Q?umfYQSxbQDWsBt7FWBvVbQtCgwlri+w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcafded0-41c6-4927-404e-08da53e1af1a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 23:56:39.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r98VtNgmrYghT2NI87WKK3IrU8gNeo9TSUm3gAK4NPDQpZ7ShdRVyVVGE3uBRBSzdbEvE2ccn98MqtUA/U24rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1501
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-21_10:2022-06-21,2022-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210105
X-Proofpoint-GUID: HkzJfwX2EwmDyf35LBsT6Gri-nMPTsN7
X-Proofpoint-ORIG-GUID: HkzJfwX2EwmDyf35LBsT6Gri-nMPTsN7
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
Cc: Mina Almasry <almasrymina@google.com>, James Houghton <jthoughton@google.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lazy page table copying at fork time was introduced with commit
d992895ba2b2 ("[PATCH] Lazy page table copies in fork()").  At the
time, hugetlb was very new and did not support page faulting.  As a
result, it was excluded.  When full page fault support was added for
hugetlb, the exclusion was not removed.

Simply remove the check that prevents lazy copying of hugetlb page
tables at fork.  Of course, like other mappings this only applies to
shared mappings.

Lazy page table copying at fork will be less advantageous for hugetlb
mappings because:
- There are fewer page table entries with hugetlb
- hugetlb pmds can be shared instead of copied

In any case, completely eliminating the copy at fork time should speed
things up.

Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
Acked-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index fee2884481f2..90d2a614b2de 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1262,7 +1262,7 @@ vma_needs_copy(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
 	if (userfaultfd_wp(dst_vma))
 		return true;
 
-	if (src_vma->vm_flags & (VM_HUGETLB | VM_PFNMAP | VM_MIXEDMAP))
+	if (src_vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
 		return true;
 
 	if (src_vma->anon_vma)
-- 
2.35.3

