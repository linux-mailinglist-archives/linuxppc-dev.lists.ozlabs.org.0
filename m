Return-Path: <linuxppc-dev+bounces-7618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA8BA85C6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 14:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYwNW0wc1z3c7S;
	Fri, 11 Apr 2025 22:04:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744373099;
	cv=none; b=dGxj5EWDxmrq4LKOv+BV3PZOh0QPQEbDFrmy5vv80+AfOoxJFqdBvwdxenXyC22U7z2ThRtb9VpKi5Mc03tPyrDkKAQhnTRaj6NqxH968Jzw6eDTxuCiKISDh5w8zR5+R9kpjy3qY7Qkv+Ksazx7OfAUqkzH2eC6lJDi2tpmGPqJ/KK4SAJ84F0nNaEMMDw00CgG5CEy5QfivZUpPMuA+K2QXATskmWF3ImjKcRTSaSxaGd3yZmK/hpmiUoXkjqHyZ+YmBmgfLoD20Rme3sGlUqC9Y2Kol4verHNMUNye3HI9zEt3kt3B3mhWhgSIM3ajAgNZbUg9bwMRp1r7FMVOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744373099; c=relaxed/relaxed;
	bh=PnqGyYgzHT0Sz+5k6BXWUk5N9daIOAt0miBGvgSDKAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRmKp7czM2wRRvP0W9uGK3yWLxCXvK64oUkquENfxBNkwbaTEQABwMOeGG6BpZAoZ8Ve4EpfudB7DPnhj6EI3i1cSRNGs25oXQMU7I1D3UZOjTJ4PMYbSxzA7V7PN2VHMGMuJww/lo5aITdbUKfIH0XEL+7MXVTOSE1kHdunzVWQWeotBZOgiYxLFJ1wLCnxyP5ud/O2WuMzgrKNgKvvvVUz3Y82EvGgsLTc62gxgeX+2gT25YviUJiEo+2VHHLfsUCiTEIx+M96lj5zGd+XWEsbqpC6Bqr/v2wKD7WRMS+8DJsdI8Kb8PB1yo32yEqX70hZg+vXLsTOEr3deAWMXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rg6+7yX1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rg6+7yX1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYwNT6jzLz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 22:04:57 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4Hwbv028306;
	Fri, 11 Apr 2025 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=PnqGyYgzHT0Sz+5k6BXWUk5N9daIOA
	t0miBGvgSDKAY=; b=rg6+7yX1oIY/hrDNoGj3DwccvaTK1QnKM/d3OmrcztqEDp
	j4j5yfP62lfxD/7TrZFOhfyN/XMIoQfZ9vBMmaXQZiQxsA6GTPDm833Y+/EC3OIe
	EVs/aJqbsqOqPuf9GkcCGI+TAuCYbMSXC3WAuwom/mXn7fzwJevaJwo4QojGds41
	jOG6NWCKAmBMEP3STFTm8r6lvpkCTgDuZRyy1CUREkt2rgPkvaChg17e2Fifu4mj
	LsxtUVPM4U+FemCOiNrQDNqf6JSM0VFG10GCRlIJZfrAUB7AhisPET/LTJCs7Vcx
	K2jP6Vv5ysev6rq9j6y5SM7EnQ6SgRS4oy8ulnNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xj5xmbq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:04:49 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53BBvsIB009672;
	Fri, 11 Apr 2025 12:04:49 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45xj5xmbq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:04:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53B8Brgm029520;
	Fri, 11 Apr 2025 12:04:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45x1k78q3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:04:48 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53BC4kR641484682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 12:04:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8519420043;
	Fri, 11 Apr 2025 12:04:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 975B920040;
	Fri, 11 Apr 2025 12:04:45 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.62.45])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 11 Apr 2025 12:04:45 +0000 (GMT)
Date: Fri, 11 Apr 2025 14:04:44 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Hugh Dickins <hughd@google.com>, Guenter Roeck <linux@roeck-us.net>,
        Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge <jeremy@goop.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v1 0/4] mm: Fix apply_to_pte_range() vs lazy MMU mode
Message-ID: <Z/kFXDwneQ9yHiJl@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
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
In-Reply-To: <D93MFO5IGN4M.2FWKFWQ9G807P@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G_BAGoiaaveYky3440tvomTW6sZpx75k
X-Proofpoint-ORIG-GUID: 0HKwRFIDMdOHgUv5TCoToIJxhDHz4gm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 mlxlogscore=591 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110077
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 11, 2025 at 05:12:28PM +1000, Nicholas Piggin wrote:
...
> Huh. powerpc actually has some crazy code in __switch_to() that is
> supposed to handle preemption while in lazy mmu mode. So we probably
> don't even need to disable preemption, just use the raw per-cpu
> accessors (or keep disabling preemption and remove the now dead code
> from context switch).

Well, I tried to do the latter ;)
https://lore.kernel.org/linuxppc-dev/3b4e3e28172f09165b19ee7cac67a860d7cc1c6e.1742915600.git.agordeev@linux.ibm.com/
Not sure how it is aligned with the current state (see below).

> IIRC all this got built up over a long time with some TLB flush
> rules changing at the same time, we could probably stay in lazy mmu
> mode for a longer time until it was discovered we really need to
> flush before dropping the PTL.
> 
> ppc64 and sparc I think don't even need lazy mmu mode for kasan (TLBs
> do not require flushing) and will function just fine if not in lazy
> mode (they just flush one TLB at a time), not sure about xen. We could
> actually go the other way and require that archs operate properly when
> not in lazy mode (at least for kernel page tables) and avoid it for
> apply_to_page_range()?

Ryan Roberts hopefully brought some order to the topic:
https://lore.kernel.org/linux-mm/20250303141542.3371656-1-ryan.roberts@arm.com/

> Thanks,
> Nick

