Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7526DCEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:35:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsdJX5sH4zDqLM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:35:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rcardoso@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X3lS24Ai; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsd5L68z2zDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:25:58 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HDC3cb042667; Thu, 17 Sep 2020 09:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gds4Lehf07U2I60c/beSjucqh1grOJeINVNEuXAh78Y=;
 b=X3lS24Aih8vx02nBgh+lWwfzAkdm0E+VnbaUcOg5BIfsXadUjBVwG+jZQkKtWks08uXn
 kFor78Bm4M8GFdFHwhI8afihxZOrFQUKOrsyEomAuaCvm1Zky++jBrQLlNOyIlNmsL4J
 J8lNJmD77jRBMKrvC3gUMUQ1lzrJ8D3IbCmo81Sn5m/Yz1Q+TxG4t3tsGGYrd7DhhKAo
 y/VkjX9iQdOp4cVXCA+FM0Wc0zIcnJX855C3IaZVHmSvhBmZgCDRHB8V9cGyjCF+EC7w
 s+kK+91RZ6/tz3e8BxQ+N7/aLVfDXdP+gNVSLaLEghyi8DJEW/PShTKxZNjYAev5mkxa Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8fnre4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:49 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HDDUFg046628;
 Thu, 17 Sep 2020 09:25:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8fnre4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:49 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HDN8Et026404;
 Thu, 17 Sep 2020 13:25:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 33m7u9rdsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:25:48 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HDPl4u43254110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:25:47 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4983AE064;
 Thu, 17 Sep 2020 13:25:47 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B63ECAE05C;
 Thu, 17 Sep 2020 13:25:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.95.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 13:25:44 +0000 (GMT)
Subject: Re: [PATCH v6 3/8] powerpc/watchpoint/ptrace: Fix SETHWDEBUG when
 CONFIG_HAVE_HW_BREAKPOINT=N
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <20200902042945.129369-4-ravi.bangoria@linux.ibm.com>
From: Rogerio Alves <rcardoso@linux.ibm.com>
Message-ID: <07c3e17e-df5a-884a-ac5d-f38cf40f2ad9@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:25:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902042945.129369-4-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170098
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
Cc: mikey@neuling.org, jniethe5@gmail.com, pedromfc@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/2/20 1:29 AM, Ravi Bangoria wrote:
> When kernel is compiled with CONFIG_HAVE_HW_BREAKPOINT=N, user can
> still create watchpoint using PPC_PTRACE_SETHWDEBUG, with limited
> functionalities. But, such watchpoints are never firing because of
> the missing privilege settings. Fix that.
> 
> It's safe to set HW_BRK_TYPE_PRIV_ALL because we don't really leak
> any kernel address in signal info. Setting HW_BRK_TYPE_PRIV_ALL will
> also help to find scenarios when kernel accesses user memory.
> 
> Reported-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
> Suggested-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Tested-by: Rogerio Alves <rcardoso@linux.ibm.com>
> ---
>   arch/powerpc/kernel/ptrace/ptrace-noadv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> index 697c7e4b5877..57a0ab822334 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> @@ -217,7 +217,7 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
>   		return -EIO;
>   
>   	brk.address = ALIGN_DOWN(bp_info->addr, HW_BREAKPOINT_SIZE);
> -	brk.type = HW_BRK_TYPE_TRANSLATE;
> +	brk.type = HW_BRK_TYPE_TRANSLATE | HW_BRK_TYPE_PRIV_ALL;
>   	brk.len = DABR_MAX_LEN;
>   	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
>   		brk.type |= HW_BRK_TYPE_READ;
> 
