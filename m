Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A82D2D94
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:54:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr39Z52txzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:54:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=faURiADe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr37t4FVSzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:52:58 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8EXdhO146133; Tue, 8 Dec 2020 09:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PD55eNn2hAA6jWhNRAG2rmT98Hb/Lth5nkMCZmpHNMs=;
 b=faURiADelUKs2MAIR+pImaEZM+GWhw9lfuUaL90rz3Kazz76OUUYWzK/dd1z/VVQpii3
 auKx9RQ7+screQnLc4RrgKnaLQiB/kUPqnfekRY8SEOZDM/h2ieRsEPrhxzpCxE01G2F
 i1+zP5V2fiVqo0Cx7alCQDOHG4m4GwYOcHSK3/MOzbxFXEQVgjTNsld5B7V7vvyfHJK3
 r0LyEGmBJOtpWxqS4G/vAPbFQ3zSMOrnCWVJ+x2jD9MD7RLQdertsIWUSeBUiUmL9DRy
 8r+g3VAP50qRMAFl/UM3rC12PSbKfXYxav4giVC8yZ9qb1OULAFd4QzAa6bqzYAzXzu4 Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35aany1yy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 09:52:41 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8EYRRs150930;
 Tue, 8 Dec 2020 09:52:41 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35aany1yxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 09:52:41 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8Eh1MQ013215;
 Tue, 8 Dec 2020 14:52:40 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3581u9eens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 14:52:40 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8Eqdp925035008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 14:52:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7CBAE09B;
 Tue,  8 Dec 2020 14:52:39 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4362EAE09A;
 Tue,  8 Dec 2020 14:52:37 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.71.234])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 14:52:36 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com
Subject: Re: [PATCH v3 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
In-Reply-To: <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
References: <0d37490a067840f53fc5b118869917c0aec9ab87.1607416578.git.christophe.leroy@csgroup.eu>
 <731bdee26a5a5c81cd815ed624a6fb3bdef8b4db.1607416578.git.christophe.leroy@csgroup.eu>
Date: Tue, 08 Dec 2020 20:22:35 +0530
Message-ID: <87lfe8qrik.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080086
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
>  arch/powerpc/mm/fault.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 3fcd34c28e10..1770b41e4730 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -210,28 +210,19 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>  		return true;
>  	}
>  
> -	if (!is_exec && address < TASK_SIZE && (error_code & (DSISR_PROTFAULT | DSISR_KEYFAULT)) &&
> -	    !search_exception_tables(regs->nip)) {
> -		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
> -				    address,
> -				    from_kuid(&init_user_ns, current_uid()));
> -	}
> -
>  	// Kernel fault on kernel address is bad
>  	if (address >= TASK_SIZE)
>  		return true;
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
>  		return true;
> +	}


With this I am wondering whether the WARN() in bad_kuap_fault() is
needed. A direct access of userspace address will trigger this, whereas
previously we used bad_kuap_fault() only to identify incorrect restore
of AMR register (ie, to identify kernel bugs). Hence a WARN() there was
useful. We loose that differentiation now?


>  
> -	// What's left? Kernel fault on user in well defined regions (extable
> -	// matched), and allowed by KUAP in the faulting context.
> +	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
>  	return false;
>  }
>  
> -- 
> 2.25.0
