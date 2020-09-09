Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6AF26270A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 08:06:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmWk84QpWzDqD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:06:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qK+i5Myo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmWh930NJzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 16:04:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08962K10173414; Wed, 9 Sep 2020 02:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+X3RFdinBGBcMGu71k2l0UAXgDapb4BXm7KRlOYIx7c=;
 b=qK+i5Myo9CiCvYjgdMhtUaRYsZGQXEk8Ma0VUGkvKElK5eFseLkOTx1vjo2tYVk2qikL
 to2aTP4b+zunnJws/TrawrUyNhPW5/QcjulhLxk0PJuxqvKvGpHots7KgErYkLtdjB23
 hz62mDhLVy0uV4aAiwAcE7Iqwr6DedcDHM1szIVPMYZcz2jEBk4HpYp2+6M9p48No51Z
 f+GzMWWAHbUm0d4R6wXQd31HWqbeEM+H2l9y65lPTcC+GWCJXBebxYNFSRiLef55w9Y9
 JNWE0uZwOuKvLiyjNugYtYJCller8bmKlm3i9TEry9+DSBVP33Xq7TH7pYzDXCw4J9EI qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33es8srakr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 02:04:39 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08962Sv0174176;
 Wed, 9 Sep 2020 02:04:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33es8srak9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 02:04:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08962Ikp017723;
 Wed, 9 Sep 2020 06:04:38 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 33c2a94acp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 06:04:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08964b3B52691222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 06:04:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C90BCAE064;
 Wed,  9 Sep 2020 06:04:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EE12AE05C;
 Wed,  9 Sep 2020 06:04:35 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.95.249])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Sep 2020 06:04:35 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com
Subject: Re: [PATCH v1 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
In-Reply-To: <b07bac7a882c69deb9e6c8f234a68b3022f29072.1596734105.git.christophe.leroy@csgroup.eu>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <b07bac7a882c69deb9e6c8f234a68b3022f29072.1596734105.git.christophe.leroy@csgroup.eu>
Date: Wed, 09 Sep 2020 11:34:31 +0530
Message-ID: <871rjb5vv4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_03:2020-09-08,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090050
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
> ---
>  arch/powerpc/mm/fault.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 525e0c2b5406..edde169ba3a6 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -214,24 +214,14 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>  	if (address >= TASK_SIZE)
>  		return true;
>  
> -	if (!is_exec && (error_code & DSISR_PROTFAULT) &&
> -	    !search_exception_tables(regs->nip)) {
> +	// Read/write fault blocked by KUAP is bad, it can never succeed.
> +	if (bad_kuap_fault(regs, address, is_write)) {
>  		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - exploit attempt? (uid: %d)\n",
> -				    address,
> -				    from_kuid(&init_user_ns, current_uid()));
> -	}
> -
> -	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
> -	if (!search_exception_tables(regs->nip))
> -		return true;

We still need to keep this ? Without that we detect the lack of
exception tables pretty late.



> -
> -	// Read/write fault in a valid region (the exception table search passed
> -	// above), but blocked by KUAP is bad, it can never succeed.
> -	if (bad_kuap_fault(regs, address, is_write))
> +				    address, from_kuid(&init_user_ns, current_uid()));
>  		return true;
> +	}
>  
> -	// What's left? Kernel fault on user in well defined regions (extable
> -	// matched), and allowed by KUAP in the faulting context.
> +	// What's left? Kernel fault on user and allowed by KUAP in the faulting context.
>  	return false;
>  }
>  
> -- 
> 2.25.0
