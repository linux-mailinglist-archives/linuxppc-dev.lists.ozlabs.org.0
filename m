Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7BA3F12F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 07:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqv8c0qH7z3bYK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 15:53:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JV/YKY0t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JV/YKY0t; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqv7p2ZCdz3cGL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 15:53:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17J5ZLPt094486; Thu, 19 Aug 2021 01:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a4SFC1CTPSL5AA0lehMOEdG9NCQMvsgSpfnKYPlS9G0=;
 b=JV/YKY0tjOs+Pl34YYmTVuNegB93BqOBsVzJ/Dx3EN5I2kNwCDTNGMBdHU6232f8tE7o
 sf5ZoZXl7cwmkmD/UYhttw6uR9ZSqdw7p8nP5nrcm5n2GjpwOE16Ni1PqytERXHHOhgZ
 Ju5sVKl//ZSv4GIRoh0IGToa+jc3jGhqJSjXePcKBssTyn6gR+HUo5iSJrajY19q7rGt
 E+VJa2w98R+eduHdCeykiz34k8f9HN4kc8D7iAhQ/kSgw+kHDm11j8ot9Oxsm73vWo8W
 kiJc0SnMJ5v1ECNVwg/j7aLGcwBc9WHWShNkoJBobmxmI2UTd7DhypYGTv0ybkwA2tBy 9w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcwxk747-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 01:52:56 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17J5hF8l017814;
 Thu, 19 Aug 2021 05:52:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3ae5f8ep28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 05:52:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17J5nL8h58654996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Aug 2021 05:49:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB12652063;
 Thu, 19 Aug 2021 05:52:50 +0000 (GMT)
Received: from Nageswaras-MacBook-Pro-2.local (unknown [9.43.70.163])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 415CD52059;
 Thu, 19 Aug 2021 05:52:49 +0000 (GMT)
Subject: Re: [PATCH v4 1/3] powerpc/perf: Use stack siar instead of mfspr
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu
References: <20210818171556.36912-1-kjain@linux.ibm.com>
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-ID: <e7660851-19e9-a276-caf1-3ec6a74441d2@linux.ibm.com>
Date: Thu, 19 Aug 2021 11:22:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210818171556.36912-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N-W88DTl0Pw41jgcwvMK2q9hcKQZil2u
X-Proofpoint-ORIG-GUID: N-W88DTl0Pw41jgcwvMK2q9hcKQZil2u
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_01:2021-08-17,
 2021-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1011 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108190030
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/08/21 10:45 pm, Kajol Jain wrote:
> Minor optimization in the 'perf_instruction_pointer' function code by
> making use of stack siar instead of mfspr.
> 
> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
> into perf_read_regs")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>


Tested this patch series, not seeing any '0' values.
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

example output:
# perf report -D | grep addr
0 26236879714 0x3dcc8 [0x38]: PERF_RECORD_SAMPLE(IP, 0x1): 1446/1446: 
0xc000000000113584 period: 1 addr: 0
0 26236882500 0x3dd00 [0x38]: PERF_RECORD_SAMPLE(IP, 0x1): 1446/1446: 
0xc000000000113584 period: 1 addr: 0
0 26236883436 0x3dd38 [0x38]: PERF_RECORD_SAMPLE(IP, 0x1): 1446/1446: 
0xc000000000113584 period: 10 addr: 0
...


> ---
>   arch/powerpc/perf/core-book3s.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index bb0ee716de91..1b464aad29c4 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2260,7 +2260,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
>   		else
>   			return regs->nip;
>   	} else if (use_siar && siar_valid(regs))
> -		return mfspr(SPRN_SIAR) + perf_ip_adjust(regs);
> +		return siar + perf_ip_adjust(regs);
>   	else if (use_siar)
>   		return 0;		// no valid instruction pointer
>   	else
> 

-- 
Thanks and Regards
R.Nageswara Sastry
