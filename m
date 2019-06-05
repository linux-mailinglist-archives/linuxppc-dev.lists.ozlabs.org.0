Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1397F3658B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 22:34:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K0rT1pgZzDqXW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 06:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K0qC2PGbzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 06:33:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55KWCS1033242; Wed, 5 Jun 2019 16:33:04 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sxkuh2wd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2019 16:33:03 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x55IEFE9014734;
 Wed, 5 Jun 2019 18:16:24 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2swyby2s41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2019 18:16:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55KX1E233423808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 20:33:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6E18AC05F;
 Wed,  5 Jun 2019 20:33:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14447AC059;
 Wed,  5 Jun 2019 20:33:01 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.85.191.102])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 20:33:00 +0000 (GMT)
Subject: Re: [PATCH] powerpc/setup_64: fix -Wempty-body warnings
To: Qian Cai <cai@lca.pw>, mpe@ellerman.id.au
References: <1559765875-6328-1-git-send-email-cai@lca.pw>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Message-ID: <bc6d4f20-7839-43c6-95b8-cace41b4487f@linux.vnet.ibm.com>
Date: Wed, 5 Jun 2019 13:33:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1559765875-6328-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=27 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050129
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/05/2019 01:17 PM, Qian Cai wrote:
> At the beginning of setup_64.c, it has,
> 
>   #ifdef DEBUG
>   #define DBG(fmt...) udbg_printf(fmt)
>   #else
>   #define DBG(fmt...)
>   #endif

Simpler solution is just to define the debug in the else clause as such:

#define DBG(fmt...) do { } while(0)

-Tyrel

> 
> where DBG() could be compiled away, and generate warnings,
> 
> arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
> arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find dcache properties !\n");
>                                                  ^
> arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find icache properties !\n");
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/kernel/setup_64.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 44b4c432a273..23758834324f 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -575,12 +575,13 @@ void __init initialize_cache_info(void)
>  	 * d-cache and i-cache sizes... -Peter
>  	 */
>  	if (cpu) {
> -		if (!parse_cache_info(cpu, false, &ppc64_caches.l1d))
> +		/* Add an extra brace to silence -Wempty-body warnings. */
> +		if (!parse_cache_info(cpu, false, &ppc64_caches.l1d)) {
>  			DBG("Argh, can't find dcache properties !\n");
> -
> -		if (!parse_cache_info(cpu, true, &ppc64_caches.l1i))
> +		}
> +		if (!parse_cache_info(cpu, true, &ppc64_caches.l1i)) {
>  			DBG("Argh, can't find icache properties !\n");
> -
> +		}
>  		/*
>  		 * Try to find the L2 and L3 if any. Assume they are
>  		 * unified and use the D-side properties.
> 

