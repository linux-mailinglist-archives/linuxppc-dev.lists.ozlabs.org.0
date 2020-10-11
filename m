Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A580828A7EA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 17:08:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8QDK1DP4zDqrn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 02:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CfEGZfKU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8QBb1LckzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 02:06:40 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09BF33fE023272; Sun, 11 Oct 2020 11:06:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sy1N5uAIdsWT4lQhaRuuM0iLkmyDiXUQN2jdXsQanbg=;
 b=CfEGZfKUciJZAo/7Be/ba1fOqyrlBfZ7bMrsOf0gv4aFga54yA44S05NyaNOwEQd6j89
 +STUG3H1iYHijlAjHlPuaJUcMHnpqeY48dEGsFlJH5Tqw4VfXY7ZZiDyjoJabLWVQKXO
 gRKFOsOR+7bzrhEf+k2s5ghMiBmPqOUogXV8qQz3W5bLiPM9+9wb0H63AT676rttxwid
 /OJTlOv5a0fgiKzwf1Vc4o2X96lIYzd2lcrLE71vPbIxPTDoQ+/BhL1Byrm6Rp1t0b5d
 GfeI2w4JfNgSTBLlzP6zwecioPUx36YfPZDzCpUnSac9uCd6WyA7FwWKigkNJZK48Hxb eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34437c94bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 11:06:31 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09BF6V3i032009;
 Sun, 11 Oct 2020 11:06:31 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34437c94af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 11:06:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09BF3MCh028051;
 Sun, 11 Oct 2020 15:06:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 34347gs7ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 15:06:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09BF6PVl32309540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Oct 2020 15:06:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F72342041;
 Sun, 11 Oct 2020 15:06:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D984F4203F;
 Sun, 11 Oct 2020 15:06:23 +0000 (GMT)
Received: from [9.199.42.133] (unknown [9.199.42.133])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Oct 2020 15:06:23 +0000 (GMT)
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, bala24@linux.ibm.com
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <01733550-9581-a894-be11-dd0b5991d306@linux.ibm.com>
Date: Sun, 11 Oct 2020 20:36:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-11_11:2020-10-09,
 2020-10-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=938 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010110143
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 paulus@samba.org, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/10/20 10:39 am, Ravi Bangoria wrote:
> From: Balamuruhan S <bala24@linux.ibm.com>
> 
> Unconditional emulation of prefixed instructions will allow
> emulation of them on Power10 predecessors which might cause
> issues. Restrict that.
> 
> Fixes: 3920742b92f5 ("powerpc sstep: Add support for prefixed fixed-point arithmetic")
> Fixes: 50b80a12e4cc ("powerpc sstep: Add support for prefixed load/stores")
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index e9dcaba9a4f8..e6242744c71b 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1346,6 +1346,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  	switch (opcode) {
>  #ifdef __powerpc64__
>  	case 1:
> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +			return -1;
> +
>  		prefix_r = GET_PREFIX_R(word);
>  		ra = GET_PREFIX_RA(suffix);
>  		rd = (suffix >> 21) & 0x1f;
> @@ -2733,6 +2736,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		}
>  		break;
>  	case 1: /* Prefixed instructions */
> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
> +			return -1;
> +
>  		prefix_r = GET_PREFIX_R(word);
>  		ra = GET_PREFIX_RA(suffix);
>  		op->update_reg = ra;
> 

LGTM

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
