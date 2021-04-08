Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14CA357E6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 10:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGFPF1nfnz3btn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 18:51:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TWt5iJjA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TWt5iJjA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGFNp3Hzsz30CS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 18:51:22 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1388XWlM090999; Thu, 8 Apr 2021 04:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=JPO31YIp7YaE736zm9EsNRTdPMdyNOMvBoyfNGhBkzs=;
 b=TWt5iJjAbs6J5d7WF4ckyg3UXiSzW/4eHGeL7A6M33BzXCspl2oiNmiTjMvYLgxt+X8v
 m7AO6omCoGNEwFRFZsiv9nzptxkfeccbtj46EsCHjRZudqjjopSYr5KIMkwI2X3lhpJS
 x0w6Yi5/liHD4NUPqN3j9t5j7hzR2JfV5AOn6IF7w+d/3lNwN7SVCMqXMnrtPak1+3lc
 VwgkfSG0+/3ixV1dFE3oqDCP0WTxfpMpyffHxt8T+Yvw9HpB4Gak4RCp1lC41cqpya4l
 MGxVO0RhOsW8AxxL27uEY+04QuOY/Svrz/9tTEah2QQjhdpLVVBpAYSDcsAn0bInNgtm Kg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rwf18xfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 04:51:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1388hFNh013767;
 Thu, 8 Apr 2021 08:51:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 37rvs1edkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 08:51:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1388oxdM30343536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 08:50:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ACC8112061;
 Thu,  8 Apr 2021 08:50:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 445DE112062;
 Thu,  8 Apr 2021 08:50:57 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.84.91])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 08:50:56 +0000 (GMT)
X-Mailer: emacs 27.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 2/8] powerpc/mem: Remove address argument to
 flush_coherent_icache()
In-Reply-To: <8cbdcfc4446154bd3323cc68827f114aa9bbc5e7.1617816138.git.christophe.leroy@csgroup.eu>
References: <311235752428dacbee81728767aacc2bf4222384.1617816138.git.christophe.leroy@csgroup.eu>
 <8cbdcfc4446154bd3323cc68827f114aa9bbc5e7.1617816138.git.christophe.leroy@csgroup.eu>
Date: Thu, 08 Apr 2021 14:20:53 +0530
Message-ID: <87k0pdb1n6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2vphEhvteFKzicvgIXlrqy998cGG_z-6
X-Proofpoint-ORIG-GUID: 2vphEhvteFKzicvgIXlrqy998cGG_z-6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_02:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080058
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> flush_coherent_icache() can use any valid address as mentionned
> by the comment.
>
> Use PAGE_OFFSET as base address. This allows removing the
> user access stuff.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/mem.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index ce6c81ce4362..19f807b87697 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -342,10 +342,9 @@ void free_initmem(void)
>  
>  /**
>   * flush_coherent_icache() - if a CPU has a coherent icache, flush it
> - * @addr: The base address to use (can be any valid address, the whole cache will be flushed)
>   * Return true if the cache was flushed, false otherwise
>   */
> -static inline bool flush_coherent_icache(unsigned long addr)
> +static inline bool flush_coherent_icache(void)
>  {
>  	/*
>  	 * For a snooping icache, we still need a dummy icbi to purge all the
> @@ -355,9 +354,7 @@ static inline bool flush_coherent_icache(unsigned long addr)
>  	 */
>  	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
>  		mb(); /* sync */
> -		allow_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
> -		icbi((void *)addr);
> -		prevent_read_from_user((const void __user *)addr, L1_CACHE_BYTES);
> +		icbi((void *)PAGE_OFFSET);
>  		mb(); /* sync */
>  		isync();
>  		return true;

do we need that followup sync? Usermanual suggest sync; icbi(any address);
isync sequence. 

-aneesh
