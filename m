Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A63EC33F809
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 19:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0z1y4kP3z3btt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 05:19:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=pbksK3uF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WkMu1nqA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=pbksK3uF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=WkMu1nqA; dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0z1S11z3z3034
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 05:18:34 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HIGv0T127203;
 Wed, 17 Mar 2021 18:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=wRdmGtgo4XK/l/pi1Z/4bjFdiEXScxvAsYXaLMWX8HI=;
 b=pbksK3uFoBv8jN/wwIujSF9/XgE+1CxrIBf0isrI8SiLrHTvuLVKnWlZgNG/eXUp3i4d
 kdwd4JeAFVflZy/fACUDztI9HVEQUQxstI7y8fJep0F+Pf61PFRXEbK6ZvmwE+ZhMwsO
 FcJyKerTnEuXfPsWPQoKRrkByic41cJzk7OTWwH3j7+Yfb3a2AkIvMytd9tMebRFVT9I
 N4YyxQgtvAJCF8FnQ+1IaL8uy4U18Orcmb+hx1zvuhAKEZkMyV6Eq0a0+M9eJnaPh0H9
 XpPq/T7z9q4JW1xgJU2rSlQ4Q24124LxuUH+EQUQXN6wdeRIdoNjvbrUi7DInQTHZZ1g /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 378p1nw1cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 18:18:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12HIFqvN154125;
 Wed, 17 Mar 2021 18:18:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2055.outbound.protection.outlook.com [104.47.36.55])
 by aserp3020.oracle.com with ESMTP id 3797a2xaer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 18:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7HjDhO9o2jvLEAk1ODdhP6qFJDYSs+P5TM+WQb9K6PXkt1OSyzxtXRy9ypq6yWWwSyrEkCH5ccnuk2OL7ewh+wJWCqlpZ2B4pF07YSCe3FD/avZ86nM4ekSqDo66QzGZoHA7C4Qop69tf8V3IUx4F2IalO1qTWQWFYWdKYncFNU4LUUZrYA77VMahHz5f4X7v4SsEFPh+BdmX8xSu0P+BXSLSNTA6AfPp6StO1+6Ye4z1Yc3cAhHmKFk3oLYIt2o9vJ0F/sGmx/pxeMkSUSUxoy/2iTvFBSGEday8fy75w/b0zNk0Co/eCya1sU38kCAUdvjAx+2WyTb3sa7ik8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRdmGtgo4XK/l/pi1Z/4bjFdiEXScxvAsYXaLMWX8HI=;
 b=IhjadvwVg35RkPi9ogcBV8CRs4FRKYUpA5BTiqxO43Mjqwmi3xZOgyFkewdz6WYywcxh0+YfYKouxJihsSXfq7kenqmbrh2l9e28+VWC67ouBlwvPQu+e/E/Lr0EeEcNcLVGj6JAG0sH2rjzfhTY4X0b5n5IGY9WLP5y//JAz0V0OtUnfzFclHVV38ttMTyVVGD1j9pjuZVZiYHBnnhSatRHgEJpoVsuVCJdhL2j6EPfK0w8e3Y9aLySrMgRpFSnRvIR1YLEYQC1xvJfJ39OkDOsHQ8Wnd2FH4Pis+PFkwl8vj/p8gtFGqOcJwcSTnLi48vb8iYf/ip9fk9lOP8NiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRdmGtgo4XK/l/pi1Z/4bjFdiEXScxvAsYXaLMWX8HI=;
 b=WkMu1nqAl5+fetUsDACDaVKBHUMVCafzSWtQsUp+rUa8pycmx0EH2yK2vsjAa9LYwxzJ9ouSGNGR2c4X7r5sGrqlpIqVNZBZAheS7rFi26Jlbfq5jR0QFTH2Ly9pJBHD5p8dtiUglEu7JREsNRG+vJ+Qlf/YVWwCE5j0r5MSisE=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4276.namprd10.prod.outlook.com (2603:10b6:a03:201::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 18:18:25 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 18:18:25 +0000
Date: Wed, 17 Mar 2021 14:18:18 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>, jgross@suse.com
Subject: Re: [PATCH 12/14] swiotlb: move global variables into a new
 io_tlb_mem structure
Message-ID: <YFJH6mkA8il1wjBZ@Konrads-MacBook-Pro.local>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-13-hch@lst.de>
 <20210317134204.GA315788@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
 <20210317135327.GA10797@lst.de>
 <YFJBvFjtZUiBQj4k@Konrads-MacBook-Pro.local>
 <20210317175742.GA29280@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317175742.GA29280@lst.de>
X-Originating-IP: [138.3.200.3]
X-ClientProxiedBy: CH0PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:610:32::21) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Konrads-MacBook-Pro.local (138.3.200.3) by
 CH0PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:32::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 18:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e53fdb7-ab97-400e-f073-08d8e9710e74
X-MS-TrafficTypeDiagnostic: BY5PR10MB4276:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB42767F1BCA5CBBAC71926AB6896A9@BY5PR10MB4276.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DlrkTVWW/e7zc1JJihtgu8t91wb9elr29Kftpn9KBl+1QJb20Y+TqJ+Xez3vp2i4GOfRvXtPZ/8SmAXJ6ZZLJvUyV0GUcqXZxC0gRx2H7SAJYjLJOdKEBN7F+uyEnzs0/IeIK5l9VLWE97p8xxgY/9ocTQbNWb83ZxuUl0Hp2ngZj0n77bpDnQDF7WQ0KJ+x/w6QIlUObEIRNEvbKP6w19sRjDXRtyxjBuZ3jCuP+Kp3YfjhcoikwME6r/2P5qgQ6mIqvKC1sR8gSheNln+k4Ujloj5PGIMIi1Z7WAw+dGYj8GxvYMJFJuOy+8YP99hoUbWY8JHFKIdd/flj1ERliNtufdH44C6pQ2fpEJFN7MZIIbZEnXhQnNU7JUFwaEeEhFPjiFsJqQVgR5NDJM/JjAOx/J2BqshJRCPSQqdvp8lWYTVXexE1uaQtuAhwn6QcWF33d7TZhch3n/oULxXLjRfkriOTMeV+O8wszSbIcuh4IYEHGW8CXF7gG4wtcdrMEJ4+kvozEJjrcUTDa0TMDHl0RMTgNRB0rGHG1eTBdM5ebV01BLuGP8JWhOhPI7wq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(346002)(39860400002)(376002)(9686003)(8676002)(6666004)(5660300002)(83380400001)(54906003)(2906002)(55016002)(956004)(186003)(8936002)(66556008)(86362001)(66946007)(66476007)(52116002)(26005)(16526019)(478600001)(316002)(7696005)(4326008)(107886003)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?domb47Ad3+oBW8VUH8U/3fTzd226BaZwyIt4Ktk589XTg9xrqRff2gTJNQsM?=
 =?us-ascii?Q?F0RRz7B4KIkfuTNho7905xBtmqhSd8hRYYi6Yhh4FidxRAyI0PdkapJ90rP2?=
 =?us-ascii?Q?Duh6VXDVoBt0jmNwgzgsv+lz/xPjOw4lwjhhvWhOT8rUrtCOVaaZRt9TB8qh?=
 =?us-ascii?Q?Gl/k63Wwmj6SzfgZzEN2qVdBBdLYdW6MBzAEqOBGNVTIUueofebOsfMsygrK?=
 =?us-ascii?Q?JNlx69QVB8K/XSPyCkqWZshW+yfNZmY7fZDroawbDVJAL3B1EBYzjlW2kmBy?=
 =?us-ascii?Q?qphfhRrkW0ctAXpD906/Z1OGu7b+P6L4LRTUVegT0NWjTehUeR4dq3LHO3Y/?=
 =?us-ascii?Q?A4JaKsFmDL28r5o2yLjp/3B7SRIqG6Fdfx9zopkS2W3q4nGjnSnt9mLDyVBY?=
 =?us-ascii?Q?S2+GSbASP6erGGWtIXHTLkg4gULbX5Tud7paaYactqJ4iYkc0dUUJfELg4hl?=
 =?us-ascii?Q?KYBTHs2BEK6brDLPU/OMwMuSdKJN9UyiXCTHeedttPdskD1LAcE6xb3yNkEL?=
 =?us-ascii?Q?NSaRWuHXceX3WnXfCqNHuyuxNuYOwH8mekK1z7KRetySHoG6eg1o/umnsEj/?=
 =?us-ascii?Q?PGIevtlu0+g1LLclkCGA/RnyHIjBPw+P6ZmlkLoAqWvTfgxV482uZsU8WjI8?=
 =?us-ascii?Q?BrFvm5qTfWdmQA7h+941UM8+rSnlOc6u8XhcJnkmRPWHNReW70TuyrBDPAZH?=
 =?us-ascii?Q?2nDkyLy0iLZCU5MgU0J9mHbJbu3jrEGYwEmu4EgTkQ/bh1oeyCziqZCq4skv?=
 =?us-ascii?Q?3mtc45SCPGo1Y71Em4OdBhtILrujMgbGIeqd3qfGHWVL3dbqB2mKOvOCAdNT?=
 =?us-ascii?Q?FK+0qhAIFkwnBLUa60DREeJOsXqiWsRMcdjRDIa5rKUEpX4XTxRE7c4lAcfK?=
 =?us-ascii?Q?d+549ZIsR4ZHRhF1uETZ30Jhodx9a8vNX/HoUromjdvgLYtZDD5nIDcrmXF7?=
 =?us-ascii?Q?m8SxdloxpjRQVelZF1w93lYY0hsJ2CSebFYt+r3EV9xD3vE0gCYdUUtw/URV?=
 =?us-ascii?Q?HLOzhWwHE18D1XZCaXpqG0ejTis8ZusHILwkTUKkkuG/JKlzyKVBjw+MAq84?=
 =?us-ascii?Q?rUV2ywbP4fsoMAsP6QNgfMEXDBl+98gn44bpj6m6ZXCmI8/Gjxh2UxmsOEOR?=
 =?us-ascii?Q?o8jmXUZKCtWCc6DN2MqhrJs7aYcvc8mEoHtGbTu9C9Fni/JASSfmOsG4sMXV?=
 =?us-ascii?Q?T1jPGOUiBIohSwXgjPnWHYctM7LXbzAYaJgHJDTz7o8Fokjv4wzsG8qwZlm2?=
 =?us-ascii?Q?upwC5cY2mtoUKIvbv6WNJp5ePGenSKReqkb/j7+yyO3M/3rbW/JBfdwcTeG8?=
 =?us-ascii?Q?wCNUQ4k3NEt9x/k+If00eHng?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e53fdb7-ab97-400e-f073-08d8e9710e74
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 18:18:25.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6oHeA/c3erElwCCUHT4pLP7VcA2cD28uRMJfL/ipJKFjinXMf5e2REZiVVnm+Bjd+7a51uJLsAwHYcPMvBY7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4276
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170126
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170126
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

On Wed, Mar 17, 2021 at 06:57:42PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 17, 2021 at 01:51:56PM -0400, Konrad Rzeszutek Wilk wrote:
> > On Wed, Mar 17, 2021 at 02:53:27PM +0100, Christoph Hellwig wrote:
> > > On Wed, Mar 17, 2021 at 01:42:07PM +0000, Konrad Rzeszutek Wilk wrote:
> > > > > -	alloc_size = PAGE_ALIGN(io_tlb_nslabs * sizeof(size_t));
> > > > > -	io_tlb_alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > > > -	if (!io_tlb_alloc_size)
> > > > > -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> > > > > -		      __func__, alloc_size, PAGE_SIZE);
> > > > 
> > > > Shouldn't this be converted to:
> > > > 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
> > > > 	if (...)
> > > > 
> > > > Seems that it got lost in the search and replace?
> > > 
> > > Yes, I messed that up during the rebase.  That being said it magically
> > > gets fixed in the next patch..
> > 
> > Yes. However if someone does a bisection they are going to be mighty unhappy
> > with you.
> 
> Sure, I was planning on fixing it anyway.  Just waiting for feedback
> on the rest of the patches before doing a respin.

I put the patches up-to this one on :

 git://git.kernel.org/pub/scm/linux/kernel/git/konrad/swiotlb devel/for-linus-5.13

Would you be OK rebasing on top of that and sending the patches?

Juergen, would you be OK testing that branch on your Xen setup?
