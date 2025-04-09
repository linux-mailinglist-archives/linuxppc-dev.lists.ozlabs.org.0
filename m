Return-Path: <linuxppc-dev+bounces-7560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB037A827BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 16:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXlcL2RbYz2xlP;
	Thu, 10 Apr 2025 00:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744208770;
	cv=none; b=KwRcOp7OYwuDlcRa516CKniZDwtXM8B7YYCHpUlxD5g751fYWtpU7FyzF9Yl4Vvta8LiPxmUy24jGTfjNYD+rsdqQp5c6DPs/DrMmxMnhtqeLnfRCccbQHdYUr0FEDY6dTfwM8anJFKsh57RHyjfR2o7+xXWyDIlq+9uGgdm3TpkcXptqehMasDMX37rIVhhR0MavfxA6A9nk6TJ0oGiYHFLFemnVjGupML0SirwThVactPx3tvR3TxX1Nwv6sf6+NCgq9VjZtRuwUYioHolNX2AdH5tDgWvyNzHKGOEIZKS4zNeb4F1+pjfGml50nS6SHVnpO7R7ZqNpZBl4Sza6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744208770; c=relaxed/relaxed;
	bh=dZ0mp0fbK09n1Ak/UvqxB1GCA8Znz4UQv5qeUc3rPlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4w9AkxmEtGaBnuHCc8149/vF7y993s3i82E8KzdmKx1n2cuwDZTR1H7eWl8Gi4y/A4YydRFyii92vrNF05uCd5RTmDey88bKmyF3jGdH0M9/ttmsc4N0eX6s6SDUftZuEZS8QwgZux5Hc2Blan4luACDY5Vwntr6o9cfYOmi1Kn2aSoPcDzKrvAWsOHTB6tjhU9h1rsd6kKH2kOA3N3XH7octDfIHHWnft4ciR9k7LnWkSxJu5Uh9ztvvyFbpxZoDWN6jHttS6uYupj2YZyF6LqyiGFz/0yWHPxyy88x1O+OtbTgRHqlXRZaS8yFcdtVjDEWvjNWt19w48cyzcGKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IRgQg+p0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IRgQg+p0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXlcH0YVcz2xd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 00:26:06 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5397HMTX003773;
	Wed, 9 Apr 2025 14:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=dZ0mp0fbK09n1Ak/UvqxB1GCA8Znz4
	UQv5qeUc3rPlA=; b=IRgQg+p0Df+Nfa6nCWz0aEmpIN27N+9MFzz7n1AyGBY2SS
	cXs87tCxIwF0jtud5qNjSNgLlGskDd18xPUtz+/8MSJ/uSLwVcWXURJobKL9USL7
	8EN7dKtn1kp0R6rIo4CDW/5JV5ErMnUDU9hiTGkoezgYSUuDWyh9D25PwHXGhYEU
	GwDF8p5b+jp5ID0M4C+Y0j6hOMrzAaZiI9tILkqMv9kUPI6oMQCKz/g1dMx19Fy7
	/Mi3mE2FTHiiz9sThs3WKUK09GhZCaCxCrNi4XcuR9sS8mYCsxH280QQ/YKbGiEv
	weowmHYXdl2bXlIuZEv7vv+w3bod+XI/wwk/gkeQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w7yxd3vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 14:25:59 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 539EB8On010066;
	Wed, 9 Apr 2025 14:25:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45w7yxd3vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 14:25:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 539D3ElP011078;
	Wed, 9 Apr 2025 14:25:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yr7wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 14:25:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 539EPthu51446068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Apr 2025 14:25:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2E2B20043;
	Wed,  9 Apr 2025 14:25:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A20A320040;
	Wed,  9 Apr 2025 14:25:55 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Apr 2025 14:25:55 +0000 (GMT)
Date: Wed, 9 Apr 2025 16:25:54 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from
 atomic context
Message-ID: <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
 <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
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
In-Reply-To: <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MHqebilzhsuhaERLi3oJf9wiQWwhiimV
X-Proofpoint-GUID: uhQA63QGysorbXbRGqjCOxWiIF599GSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=844
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090086
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 09, 2025 at 04:10:58PM +0200, Andrey Ryabinin wrote:

Hi Andrey,

> > @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
> >  	if (likely(!pte_none(ptep_get(ptep))))
> >  		return 0;
> >  
> > -	page = __get_free_page(GFP_KERNEL);
> > +	page = __get_free_page(GFP_ATOMIC);
> >  	if (!page)
> >  		return -ENOMEM;
> >  
> 
> I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
> to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().

I think the page address could be passed as the parameter to kasan_populate_vmalloc_pte().

> Whenever kasan_populate_vmalloc_pte() will require additional page we could bail out with -EAGAIN,
> and allocate another one.

When would it be needed? kasan_populate_vmalloc_pte() handles just one page.

Thanks!

