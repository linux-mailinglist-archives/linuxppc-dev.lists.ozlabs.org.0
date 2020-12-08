Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57E2D2BA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 14:11:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr0tl5XRhzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 00:11:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OfmyK43T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr0kH1T6gzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 00:04:06 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8D3Qbv016690; Tue, 8 Dec 2020 08:03:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oIOijThOXh3Ubk4ERzVOcimKiRVPNd69O+RDNr9ZaRU=;
 b=OfmyK43TF5bGF2RmiimLLUDWT/qBGJX6IwSMgJ7915UKUi5jczn00JdH2jE/VzJeSMff
 /6BwOMS1guptBP/UAS2dboIuypf4v3k/ycUqR5USjaOTShVUGH2ZlVCWkmiFnsd4UjHZ
 20/GXOW1votPFcKFg3O7KWwkeatFreN4l+y9PuU7HrCOouAcEQLbRSca82H1gSmz0IRB
 a1kuRaCZ3MQQjzXfeA/FpK5LYu06JL2YGRvKLlJnAYm4P0Awrz0M/cdkUzR+G2I9+3Yy
 Y+RbY/G0KIbVX9zzLDit6aWwy/UKVDEAWHGWglRwBxZEE/lTmwv/fZFjytEFaWs67wap hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufqhdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 08:03:33 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8D3UO7017030;
 Tue, 8 Dec 2020 08:03:30 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5ufqhb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 08:03:30 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8ClW0X027043;
 Tue, 8 Dec 2020 13:03:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3581u8n9b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 13:03:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8D0rrT56951294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 13:00:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A275A405B;
 Tue,  8 Dec 2020 13:00:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF03DA4059;
 Tue,  8 Dec 2020 13:00:51 +0000 (GMT)
Received: from [9.102.23.62] (unknown [9.102.23.62])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 13:00:51 +0000 (GMT)
Subject: Re: [PATCH v3 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
 <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <0e25f03d-9f59-b963-312c-c3ae1d7953a2@linux.ibm.com>
Date: Tue, 8 Dec 2020 18:30:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080080
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

On 12/8/20 2:07 PM, Christophe Leroy wrote:
> search_exception_tables() is an heavy operation, we have to avoid it.
> When KUAP is selected, we'll know the fault has been blocked by KUAP.
> Otherwise, it behaves just as if the address was already in the TLBs
> and no fault was generated.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> v3: rebased
> v2: Squashed with the preceeding patch which was re-ordering tests that get removed in this patch.
> ---
>   arch/powerpc/mm/fault.c | 23 +++++++----------------
>   1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 3fcd34c28e10..1770b41e4730 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>   		return true;
>   	}
>   
> -	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
> -	    !search_exception_tables(regs->nip)) {
> -		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
> -				    address,
> -				    from_kuid(&init_user_ns, current_uid()));
> -	}
> -
>   	// Kernel fault on kernel address is bad
>   	if (address >= TASK_SIZE)
>   		return true;
>   
> -	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
> -	if (!search_exception_tables(regs->nip))
> -		return true;
> -
> -	// Read/write fault in a valid region (the exception table search passed
> -	// above), but blocked by KUAP is bad, it can never succeed.
> -	if (bad_kuap_fault(regs, address, is_write))
> +	// Read/write fault blocked by KUAP is bad, it can never succeed.
> +	if (bad_kuap_fault(regs, address, is_write)) {
> +		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
> +				    is_write ? "write" : "read", address,
> +				    from_kuid(&init_user_ns, current_uid()));
>   		return true;
> +	}


Should we update bad_kuap_fault to check for !is_kernel_addr() and 
error_code & (DSISIR_PROT_FAULT | DSISIR_KEYFAULT). I am wondering 
whether we can take another fault w.r.t kernel address/user address and 
end up reporting that as KUAP fault?

>   
> -	// What's left? Kernel fault on user in well defined regions (extable
> -	// matched), and allowed by KUAP in the faulting context.
> +	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
>   	return false;
>   }
>   
> 


-aneesh
