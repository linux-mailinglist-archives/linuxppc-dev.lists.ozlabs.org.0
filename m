Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E73EB2A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 10:30:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmGw00X3vz3bYQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 18:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nTNDyfn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nTNDyfn/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmGvK0xYMz2yhl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 18:29:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17D860Ic107783; Fri, 13 Aug 2021 04:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zBo3KLKtYkiucb3R/Fw6SCi+ekxnyWrLRncvE3xkrOc=;
 b=nTNDyfn/Dq8k/Tdqy+LCqn1et5JAz/kTl7m16E+6GJpHt/jAAOWJ3+1OlebpNSDc85li
 VoxklYRIG0K96uO5R+odaNCXJx8+wqZPOUCEIiCabv2VncbcupyEtXZZUNRbptcrHWFY
 LB4cCr6M6Tia8IAvYnO4tSEc8RDyEQUoRbmUbTGgf7B2cGAcRdK4HD+hOpFQrgIZI+qh
 /tmDJ4YD8Y77HtPF6K/UDsFJfcG4dBV5foyS0i42mZfvRSsu/MkadFXBDVHazl5cKIsE
 3qQjErv4+c/nhChFg+x8DK/yg73+s9+LwKY6Dlxu0gYbfLjCMWRDv653b6KkkFAyKKPH dg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ad0qyt0dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 04:29:43 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17D8SvMq016102;
 Fri, 13 Aug 2021 08:29:43 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3a9hth1mbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 08:29:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17D8TfiB34472388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 08:29:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79E7BBE061;
 Fri, 13 Aug 2021 08:29:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B9CBE06D;
 Fri, 13 Aug 2021 08:29:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.43.137])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Aug 2021 08:29:38 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powerpc/perf: Use stack siar instead of mfspr
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20210813082450.429320-1-kjain@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <37c6279f-a05c-7dd9-b034-05ca524bc6b0@linux.ibm.com>
Date: Fri, 13 Aug 2021 13:59:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210813082450.429320-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 35T_vDVn8D-oOOnkOqbnzNn4Q6kNXfj0
X-Proofpoint-ORIG-GUID: 35T_vDVn8D-oOOnkOqbnzNn4Q6kNXfj0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_01:2021-08-12,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108130048
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/13/21 1:54 PM, Kajol Jain wrote:
> Minor optimization in the 'perf_instruction_pointer' function code by
> making use of stack siar instead of mfspr.
> 
> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
> into perf_read_regs")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Please ignore this patch-set as I mentioned wrong version number. I will resend
this patch-set again with correct version. Sorry for the confusion.

Thanks,
Kajol Jain
> ---
>  arch/powerpc/perf/core-book3s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index bb0ee716de91..1b464aad29c4 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2260,7 +2260,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>  		else
>  			return regs->nip;
>  	} else if (use_siar && siar_valid(regs))
> -		return mfspr(SPRN_SIAR) + perf_ip_adjust(regs);
> +		return siar + perf_ip_adjust(regs);
>  	else if (use_siar)
>  		return 0;		// no valid instruction pointer
>  	else
> 
