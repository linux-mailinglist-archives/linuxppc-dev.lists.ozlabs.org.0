Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEEA7069C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:24:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLv3H4WmFz3g0f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRlTWR9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRlTWR9I;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLts76D78z3fdY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:15:55 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HD7x74026019;
	Wed, 17 May 2023 13:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=71IzhU/suCxEImZQzd6oJwcMiRsUMV86qQoas5G5IMk=;
 b=eRlTWR9IftmQW4Hg/mYxMGxfpMN0X5J5SR+uNb7uSUNUV7l+L+Z91W5sFRfpj5/iY5px
 dNPTY4uIvtc/i7UTGBG/M/r1wOCWU2rhWtNVYNdVl1bALfQ3GBushTAPtgLvHyrBjMGa
 /UvUc7vCni+jLgBGBw2mCxXRIVPm2lvQLVhlm3AlqPWtEz6W4XQo7VUeg7S8JkYxj0z8
 ZImSPF1PGDGpjO+SRE/mI2VKW4dSH9F0pyhwCso773IlduEmPWctbUN62pUtCzMmW/+j
 GM5nw6OsWFQKHxceoGiFqBjfoMBtSD66suy6rtoJ526ldiY0dvXf42B9TfuT6mbk/tQ+ 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qmybp8v21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:15:27 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34HD9Bfa004295;
	Wed, 17 May 2023 13:15:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qmybp8uye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:15:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34HB7a8h007890;
	Wed, 17 May 2023 13:15:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qj1tdstk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:15:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34HDFJjC24642088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 13:15:20 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB9002004B;
	Wed, 17 May 2023 13:15:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B6462004E;
	Wed, 17 May 2023 13:15:19 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 17 May 2023 13:15:19 +0000 (GMT)
Date: Wed, 17 May 2023 15:15:17 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] procfs: consolidate arch_report_meminfo declaration
Message-ID: <ZGTTZR3bHUhPCGq0@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230516195834.551901-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516195834.551901-1-arnd@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q66ERUsCq6HtIz6K7EGCib7iL32KIdom
X-Proofpoint-ORIG-GUID: yDb9qc7hnBY0DujT-LhQIqBO5YaGtBo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=975 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170106
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, viro@zeniv.linux.org.uk, Thomas Gleixner <tglx@linutronix.de>, brauner@kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 16, 2023 at 09:57:29PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arch_report_meminfo() function is provided by four architectures,
> with a __weak fallback in procfs itself. On architectures that don't
> have a custom version, the __weak version causes a warning because
> of the missing prototype.
> 
> Remove the architecture specific prototypes and instead add one
> in linux/proc_fs.h.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/parisc/include/asm/pgtable.h    | 3 ---
>  arch/powerpc/include/asm/pgtable.h   | 3 ---
>  arch/s390/include/asm/pgtable.h      | 3 ---
>  arch/s390/mm/pageattr.c              | 1 +
>  arch/x86/include/asm/pgtable.h       | 1 +
>  arch/x86/include/asm/pgtable_types.h | 3 ---
>  arch/x86/mm/pat/set_memory.c         | 1 +
>  include/linux/proc_fs.h              | 2 ++
>  8 files changed, 5 insertions(+), 12 deletions(-)
...
> diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> index 6822a11c2c8a..c55f3c3365af 100644
> --- a/arch/s390/include/asm/pgtable.h
> +++ b/arch/s390/include/asm/pgtable.h
> @@ -42,9 +42,6 @@ static inline void update_page_count(int level, long count)
>  		atomic_long_add(count, &direct_pages_count[level]);
>  }
>  
> -struct seq_file;
> -void arch_report_meminfo(struct seq_file *m);
> -
>  /*
>   * The S390 doesn't have any external MMU info: the kernel page
>   * tables contain all the necessary information.
> diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
> index 5ba3bd8a7b12..ca5a418c58a8 100644
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@ -4,6 +4,7 @@
>   * Author(s): Jan Glauber <jang@linux.vnet.ibm.com>
>   */
>  #include <linux/hugetlb.h>
> +#include <linux/proc_fs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/mm.h>
>  #include <asm/cacheflush.h>

For s390:

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
