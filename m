Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1133F789
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 18:52:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0yRk44hzz3bpb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 04:52:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=q7MYbIvZ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=zfL6FH13;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=q7MYbIvZ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=zfL6FH13; dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0yR945cRz300T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 04:52:20 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HHjfH8009868;
 Wed, 17 Mar 2021 17:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=AuI7WZwh+THy66uOk/dX3AZL5VQVLUSbLO1vN8BYNn0=;
 b=q7MYbIvZ6XMGjyOchRWzSW4ZJV9PXDxgAxsHR0bCU11jzHqB/0qlMbzS3LR1GwamuOw2
 WGAsF+dk2sTsXcFjn3Ep5sB6cZFzB0l1SZwuw3qVfusDBr0u2qHzdLrZpcBUbt6cWt9b
 GPypjNYpqC7IN5y0SL3GpbZ6Syyx8iTesdRhrGgYBJSR/etjfiKlCpKYAz3+7ykbf/PV
 5K3Hkey9IOQya3dHeRFJ+dO+8kKyESEFG4UZjKkUnn5UeitjYfIOuUcBza3f9zce5LF1
 eHF1ufETgY/oRCyEeyi87FMVH6XNwAPu9ca0hzlE2pzd4nXTLslJyWiKxurd0gNsX5Am tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1nvxtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 17:52:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HHolTG188948;
 Wed, 17 Mar 2021 17:52:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3030.oracle.com with ESMTP id 3796yv54qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 17:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kcn/OjkRge8LRRP9YU/yXyzkWHOmNItw1fflnCQtErFqe43UOBpVw/FXv2hgRoNipg6yCqhebnN8HMd+pYJwPVuUgl6jY/noZ/u+hrjO8j9kkVP40XTNyKcBCTD7mwcmV/URn9aWl7ceK/hz8ns6oTU7mh195Ur8WxXn3LmEZenbl7jsx8plEe14shYAw0gE0DHH4hH1tHk17Co7VYohUf3EWIVoTCS4pkQQoziIM7mjBBPeqP+Bb+deOqdvEeAqRT1i7OzgXmGQdbXC+TdBxf+rCea73JMHUm+Rpr6P1B/zOAtHECHQdlgXiY3mZua9jUctRyD5m7SxiMUxqzJgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuI7WZwh+THy66uOk/dX3AZL5VQVLUSbLO1vN8BYNn0=;
 b=oSYlbGapY7yAud4JHRULDxIdcFgcRiWIVoYYb1MMcgGKqy6sGKKDR6sYcucR+6huAwI7iTbrLSWiW0hhStMiAu7t2Aoezm1GPFZvH4U5vvs4uhEof+uZrAGo5wdWClXFR1obEnYK2HrB9i+9p4EsBLV2A9ZVo+0P+iYs8WgmQ9A719Ch04jnrTP6V8OTcvKTQkTO41Eo96mjpzQUfhdvFy8Q1kh3mQbR9NgZaaegoFsuRlXmfWggICuTwkIM5I+k9bjNL2NpKwIlVoiFtqsYFuirPVzb3elhERj7twf8OEScJkMb6upOJ07V/d1Ty8Wtw4woAZfoZyHfXbR5ZlmH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuI7WZwh+THy66uOk/dX3AZL5VQVLUSbLO1vN8BYNn0=;
 b=zfL6FH13MdOTEy+2aWuMUWZXnarmlVGA9yqKLcNVH/ruodNqoCx3nSr5i+xV9uwxm+3SUOLWhj6/VW1qJR5omKaTK3b3pLufrKLZ66AhgWzcyGXhL6WoN3jJ1vOrvsucvpj1p107v7eLPo78TZzvsC6h5uiGKZCmpopdHH/zSJU=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3685.namprd10.prod.outlook.com (2603:10b6:a03:124::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 17:52:01 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 17:52:01 +0000
Date: Wed, 17 Mar 2021 13:51:56 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-13-hch@lst.de>
 <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
 <20210317135327.GA10797@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317135327.GA10797@lst.de>
X-Originating-IP: [138.3.200.3]
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Konrads-MacBook-Pro.local (138.3.200.3) by
 SJ0PR13CA0157.namprd13.prod.outlook.com (2603:10b6:a03:2c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Wed, 17 Mar 2021 17:52:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fbf9615-15e3-487b-32ef-08d8e96d5e39
X-MS-TrafficTypeDiagnostic: BYAPR10MB3685:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3685B8A2D0DE7D5B105A71AE896A9@BYAPR10MB3685.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cg6vtXO6MX/vimR6TjsQK3eGF7dB1pf/RHbbE/yxEHzIpd43hQ4lNXA1O4mM/0q4O2BDRSLiuW/desJr6Lqo22PJgRHWhFbgQL+2kziLt8xMoWcKVTAwd7JYEkdesN5VZao+Zrxm5lB4Bcf7oIHzr+LokzLdmZQoSwoC6sHPQpUBxS6sPW3N2UX7L4FgwYbz8ypk0w7/9Em+CdiFnvqfLgL/+0AXvw7vjR6bPVfRWMBu71PRN7GbZ/0KyrHsKRyKSsTyiBwruage4hNuKMRiT3RmkLLVLmSn4amNIrUABsu7ZLHKVh53myhYMFegW/q/5zFEZh+q4BA6gUxPc+c2aroz21R1xrJDW9pKoIIzabN6ucPPkpRREnjZp6UBlu73p/amgqcc7ao6G102wTl0DU17cETBT8X3Lp+MxIBQw4WV22lbOeg2IKQNwUUbptfsLqHkbp/7y70iR3ypmM+K+KfBJCLjz7RJjjNGmu5iqKw9PiJjlNElCwBz1p0yOH1S1qIqIWCK97/I4KB1+fp5arG0mYBfJ/gGOyf71HXyVXH+ob1FMAX+4F/E18EwkNR0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(9686003)(478600001)(107886003)(16526019)(956004)(4326008)(186003)(55016002)(26005)(52116002)(54906003)(86362001)(6666004)(83380400001)(66556008)(2906002)(6916009)(4744005)(8936002)(5660300002)(66946007)(7696005)(66476007)(6506007)(8676002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pFahNcWwbr+sh5HdDal7q2UqMPQ5bGD0l0l+kCf79QilCOQvTr+8iLTPRWMx?=
 =?us-ascii?Q?lsbkwOiEoP4oFpERPxfbqL5tlPCHfMgwcjoWK/K5PWO13lzHRDhgKMWWVGRX?=
 =?us-ascii?Q?kA3AyabgIFN7VTYzbONsr/zhCaTmWlCF15l3sADlGp3Fa0Sn23YKBFl8a+1A?=
 =?us-ascii?Q?YbRVOdDu82odfOej1PCUI5GV88CqHIvnL5N5zfEo1uwZg/wga/MOJNr2J+3Z?=
 =?us-ascii?Q?WsvCY1flmMxEBrvClV1cEbBRsHsXje6FmgCVMhDdp3uMGUJ/CEBnVBHtHg9/?=
 =?us-ascii?Q?uX1EJOYLQ7OPtgWPXg3lObGyz2zdvfUcV9Jw0QDhLLGIfGDvAyS7CEJge3go?=
 =?us-ascii?Q?hUwdocRbhc1v+QA1XukKKu6yPCt0vPIsCC/gX29HzBpUjPmAZHlQvNMpsTqu?=
 =?us-ascii?Q?ONgObmKaE1OMlDgFAQfl4hKtDKILPHX31Z3TPmS1793vKMr9bgwuBg4qfqLk?=
 =?us-ascii?Q?7xUkVveiG00YNfA9k3R3HfAF1TBlY94GAZWrHoJYS5Fc324PYVsVnAr8hSjf?=
 =?us-ascii?Q?qvhOzeuJmJMiWgI9bsy7Od1ZSKTKhNbqX5S/8He/BdUj37QuJcARu8n46LHh?=
 =?us-ascii?Q?FND/lAc7iIlxsLiXWGw5IaKGEwyqRdJMxWY/uBokjO8LwVxL4qMBVsWTgdrX?=
 =?us-ascii?Q?gK/yzjMTGi++lEr9GkZH0Vm0+JQBU59M+uRm86cja/z6bOdhKB7+Q++N4tvj?=
 =?us-ascii?Q?GENnWLErIJddMOaLzKm4X6Ym+hNA7x3AH0fio5kgZxozODfE+LbZcia8nvA8?=
 =?us-ascii?Q?4dHuW+HfsBBz2PVeawU3PlSkKN1pN17NV2j0RN2Sasfv6J2d8fajbwgEo5Nt?=
 =?us-ascii?Q?QW30RBSpoFgasw21s4xXE/2F0oNb7NuP44hItFC8WOcP/0qk+TwaTXRb+650?=
 =?us-ascii?Q?P+WxjqQBQC3ya1R99iWqMIhtJOP40M89yM8C/tFUyf5G2kUeN600LF4ljdfX?=
 =?us-ascii?Q?iVkIcYF0QD8pYhbnroz2hiNKqL/49EuNP8eYrZCrYM3jY0B9f7VyzWQnGk9c?=
 =?us-ascii?Q?bCbEzHJDNsxo4YR/+QA1LxYbiwhLkY+i35LP3IjEJyYCptn6sGchJocVslDa?=
 =?us-ascii?Q?/YQVR0J5a/rZ/l/h3OGrPuzkWroBd/QshiPMH3BCDXkN6PEdUiON4KsNjrDt?=
 =?us-ascii?Q?EvmfYMPtRlXHYHORQTpAGIq+2SG6kFkxytWR4cYbu5yHsNWjq7eVeClxF3Um?=
 =?us-ascii?Q?s7BFLsrGenkp3bVbxpxNj0HxWXbnb6U181zEAv3jdQ4Ji6FgvuSgNF7k6/lD?=
 =?us-ascii?Q?eQZzledKoRnPYnMCLs5NmcJdfxz/4qB4Lxg9gA7XmENBZm9u2lDEVKEb8bzS?=
 =?us-ascii?Q?Ljz9mVtM0NWuuvNj9MkR+C4H?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbf9615-15e3-487b-32ef-08d8e96d5e39
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 17:52:01.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/8aLUIRs+feJbm4KItJpG0Ipp0ZNh2sYGazLu/mxiZBrxNC3dcUS2K2QRWICEvQzErxzpvKggL0kf42ENh5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3685
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170123
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170122
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Dongli Zhang <dongli.zhang@oracle.com>, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 02:53:27PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 17, 2021 at 01:42:07PM +0000, Konrad Rzeszutek Wilk wrote:
> > > -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> > > -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > -	if (!io_tlb_alloc_size)
> > > -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> > > -		      __func__, alloc_size, PAGE_SIZE);
> > 
> > Shouldn't this be converted to:
> > 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > 	if (...)
> > 
> > Seems that it got lost in the search and replace?
> 
> Yes, I messed that up during the rebase.  That being said it magically
> gets fixed in the next patch..

Yes. However if someone does a bisection they are going to be mighty unhappy
with you.
