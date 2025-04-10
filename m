Return-Path: <linuxppc-dev+bounces-7570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3894A84799
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 17:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNkK3h0yz3bnr;
	Fri, 11 Apr 2025 01:18:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298313;
	cv=none; b=hLU6c76vG1xASNinnUjXM0qO58wT4RNXBwD4uribt93AOfwaEQOWa/S5795v3jPxrCb55UwqcaSKed4aGutuOEwQpkjiM910AM/+qI22tE7jSZdmlqO9hAFtOR4vY69IHXtESUf/dfS5PglQNk04YKvayaaBebtaYXAy8ItSDoQoEyeLL1ewoeqBFWSM0K2rWyafTc2YDDdKGuAiqT7j4UIihVP+JyAnOd9kAIig/yBBVMpKLSDWmxgtPUIjwm5rBKuS0yOwrgJq0+Gw6n3EtuOWB8ZOTIOWVrI65Ts1x2kAKteRStksej5S05+6r2UT0HXXgQjWdsHN5/t92eQbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298313; c=relaxed/relaxed;
	bh=8yZK2G8CEMH6GwaqesHa1lpHB+Zat5CGXDOr1+EXSC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvG6ShhaUlLnYe6IHWsG25huoAagHxNpcNYQ+/Bo2v6GM9iPfO4khpH694yP4nRTd/c9wj1Q6DLLGx0BNsZYOEImYhqX2pvxROKAAOrtu3tI3FBz2R1YHSLL0TfHXngUyypQjy9tJPgDdnKvAHe0oRWaphRI+QNi1+LJuKTOJiz6EkZ8eIHLAAkTVB/jse7I7SDAQJ4Fp0M4SJIL5Jv5URSA1zxsJfsI7PEau4ADBtx+JCg6RKXdpd0PqhHur3WkAFvcJ8HdNnJ1iB8FeWZpjOxx7Lc6GxpCheGTwUi8KdCJFmARwyvw0xL8rjhOmZc4L/t53Cx+HNi88AqTJwn72w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFA2NdY/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XFA2NdY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNkJ3sxXz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 01:18:32 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEK7vi022679;
	Thu, 10 Apr 2025 15:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8yZK2G8CEMH6GwaqesHa1lpHB+Zat5
	CGXDOr1+EXSC4=; b=XFA2NdY/+9mY/FXZshAh96j80DyvTbKTueTNVZhU0+yxab
	LQAS6lEJM05MHO0qcxITWU3AUuUwWhbR+rH5gkM+i5KY2ZDS+KKPgm1w0TTco7lI
	1ejRJgDisSwZgBF3F7/68V/hVDGKZc5EEq9Xbxm5cvuOYh4E30FthuwpbSU11IR+
	iDHdgVm8V9yC0zoCKXcaGa8GjQj57F15LDzr//DrGKBhJwZitM11zufCoRjeljn7
	kao0b+0vHjeDd5MF+VPhYDC+2gDDWrc+hl5DxvXUunM3PNAcgrnztpsj+jwiIr5G
	heQFmmMTR5ltMcYN1TVWdpLd/G4AaU/rogD2SyZg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qdg47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:18:25 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AF8TYT001916;
	Thu, 10 Apr 2025 15:18:24 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qdg44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:18:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD96gI025537;
	Thu, 10 Apr 2025 15:18:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm6hc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:18:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AFIMnK41025908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 15:18:22 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E809920043;
	Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95A3620040;
	Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 15:18:21 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:18:20 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from
 atomic context
Message-ID: <Z/fhPL5bH2A2Cs97@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
 <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
 <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jHtw6lgVB7srP7G4ujZD7xCcxXdTfHSC
X-Proofpoint-ORIG-GUID: fFGj102REu_S4ew0_ixvtgn6rzege4GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=961 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100109
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 09, 2025 at 04:56:29PM +0200, Andrey Ryabinin wrote:

Hi Andrey,

...
> >>> -	page = __get_free_page(GFP_KERNEL);
> >>> +	page = __get_free_page(GFP_ATOMIC);
> >>>  	if (!page)
> >> I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
> >> to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().
> > I think the page address could be passed as the parameter to kasan_populate_vmalloc_pte().
> 
> We'll need to pass it as 'struct page **page' or maybe as pointer to some struct, e.g.:
> struct page_data {
>  struct page *page;
> };
...

Thanks for the hint! I will try to implement that, but will likely start
in two weeks, after I am back from vacation.

Not sure wether this version needs to be dropped.

Thanks!

