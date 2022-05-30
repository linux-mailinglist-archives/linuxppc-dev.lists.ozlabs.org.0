Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BBD5388E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:27:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqm60fTMz3cBm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:27:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aJRxENPL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aJRxENPL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBVdv67Vqz305g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 19:36:03 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U7eIp4014435;
	Mon, 30 May 2022 09:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZYzW3+GXOL8I0AfUdLsg5MVY8XGCNIfi5dgvNuU6uaU=;
 b=aJRxENPLxPxtJPLPMpZbZB6ZMNv3yb0g75x/iaJw7LwXznLfzcFFd+VhsSYa4DDin1Og
 h3EtEuduOMNJdyWcPGf8Bp6j8HIvSzuOxy/3v6U/k2EZA3ai81b28DfbzQAvyLegWbh1
 6JeeHGepvOgSmc7L30MoUcRt75rv2HhxbCLI6q4veiPA68Sc+ilz6QI6uDVuislGDiwl
 YeuRHaNHYRJKefnUIzx1TjXR7BhIi0QNPJjTPVc/RjJeQKBVl5otsnG/aMJgufq14x+Q
 SfzDBggiNkH6uIogm1bEat+ek9Ln35Wju1AiyyoOtoSpZv9Lk89aLEZ/3hCHMI9fbtzG Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gc21gt23u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:22 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24U8YFtI001535;
	Mon, 30 May 2022 09:35:21 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gc21gt22j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:21 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24U9ZEW5005489;
	Mon, 30 May 2022 09:35:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3gbcakhu93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 May 2022 09:35:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24U9KsWE50921746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 May 2022 09:20:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A464A4054;
	Mon, 30 May 2022 09:35:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55577A405B;
	Mon, 30 May 2022 09:35:11 +0000 (GMT)
Received: from [9.171.2.176] (unknown [9.171.2.176])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 30 May 2022 09:35:11 +0000 (GMT)
Message-ID: <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
Date: Mon, 30 May 2022 11:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>, Peter Xu <peterx@redhat.com>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <YpPYkzbrQmy4FjrI@osiris>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 17H2zOn_Mc5hu2MUIDRxY-AXp5vXE9mJ
X-Proofpoint-ORIG-GUID: M8apowNso6iR-DwO9jx-r0DSHd-NwVxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-30_03,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1011 mlxlogscore=980 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205300050
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.o
 rg>, Andrea Arcangeli <aarcange@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>, Brian Cain <bcain@quicinc.com>, Michal Simek 
 <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alp

ha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Am 29.05.22 um 22:33 schrieb Heiko Carstens:
[...]
> 
> Guess the patch below on top of your patch is what we want.
> Just for clarification: if gmap is not NULL then the process is a kvm
> process. So, depending on the workload, this optimization makes sense.
> 
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index 4608cc962ecf..e1d40ca341b7 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>   
>   	/* The fault is fully completed (including releasing mmap lock) */
>   	if (fault & VM_FAULT_COMPLETED) {
> -		/*
> -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> -		 * only conditionally take the lock when CONFIG_PGSTE set.
> -		 */
> -		mmap_read_lock(mm);
> -		goto out_gmap;
> +		if (gmap) {
> +			mmap_read_lock(mm);
> +			goto out_gmap;
> +		}
> +		goto out;

Yes, that makes sense. With that

Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>

