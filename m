Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19836F6D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlJ74kRZz30CX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:04:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rz1qhrmE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rz1qhrmE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlHg309Kz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:03:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U831It057480; Fri, 30 Apr 2021 04:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=aVSZFSydPsEFS09rZyUyqtuvyDTUyq1Btcmgk0wOsuk=;
 b=rz1qhrmEjcqwAEafBQe1f58Oq0UnTKkbg+evDJBnAVhcIGn0hfnhkLXb3BD1dgknrh/P
 rg6SZE/O5AdVcIXIXbacTntRt3gkYy6QwIRlo1E61H9s6ovfXm4EMcBocuaOQR9Ef6kG
 poGbRlqim3EY0JQr8ZjoIyA+yE2n9IyS4mt9bUJXig6cTHCoH6QNZfz5NKNUwjr+NQ6M
 7MIdWepvNWblPTyv9hpL6fSizwvRr5/HzPh8597TMjPO5g3jmH723O5LdWv9OEZemLoj
 SPjZVE05M8lJtcsFRISEkpisdBYBKZaRufLkfkN87XBjRQDoTeIuXRWnduX4JijlH/sw JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388dv0gaa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:03:37 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13U83bTK063344;
 Fri, 30 Apr 2021 04:03:37 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388dv0ga9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:03:37 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U7xAHD008955;
 Fri, 30 Apr 2021 08:03:36 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3882p7ksmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:03:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U83acT11862852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:03:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0950928067;
 Fri, 30 Apr 2021 08:03:36 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2FEA28059;
 Fri, 30 Apr 2021 08:03:33 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.69.54])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Apr 2021 08:03:33 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fix dcache flushing
In-Reply-To: <20210430075557.893819-1-sandipan@linux.ibm.com>
References: <20210430075557.893819-1-sandipan@linux.ibm.com>
Date: Fri, 30 Apr 2021 13:33:31 +0530
Message-ID: <87zgxg8ai4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kIM01j149GhZqrsxHc__6FwpQe6hYZiR
X-Proofpoint-GUID: SKd3z2jVkGoprZlGEG4RPTnDAH39OOwC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_03:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300056
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
Cc: jniethe5@gmail.com, rashmica.g@gmail.com, linuxppc-dev@lists.ozlabs.org,
 david@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:

> Trace memory is cleared and the corresponding dcache lines
> are flushed after allocation. However, this should not be
> done using the PFN. This adds the missing __va() conversion.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

>
> Fixes: 2ac02e5ecec0 ("powerpc/mm: Remove dcache flush from memory remove.")
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/memtrace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
> index 71c1262589fe..a31f13814f2e 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -104,8 +104,8 @@ static void memtrace_clear_range(unsigned long start_pfn,
>  	 * Before we go ahead and use this range as cache inhibited range
>  	 * flush the cache.
>  	 */
> -	flush_dcache_range_chunked(PFN_PHYS(start_pfn),
> -				   PFN_PHYS(start_pfn + nr_pages),
> +	flush_dcache_range_chunked((unsigned long)__va(PFN_PHYS(start_pfn)),
> +				   (unsigned long)__va(PFN_PHYS(start_pfn + nr_pages)),
>  				   FLUSH_CHUNK_SIZE);
>  }
>  
> -- 
> 2.25.1
