Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1624171198
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:40:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sl2c6Y3RzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:40:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SkDl2xK8zDqnW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 18:04:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6wg9U061800
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 02:04:21 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydq6x2kq0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 02:04:21 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 27 Feb 2020 07:04:19 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Feb 2020 07:04:16 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 01R74F1X38207862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 07:04:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1271FAE055;
 Thu, 27 Feb 2020 07:04:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DEA5AE056;
 Thu, 27 Feb 2020 07:04:14 +0000 (GMT)
Received: from [9.199.52.121] (unknown [9.199.52.121])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 07:04:13 +0000 (GMT)
Subject: Re: [PATCH] powerpc: fix emulate_step std test
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200226055302.1577954-1-npiggin@gmail.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Thu, 27 Feb 2020 12:34:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226055302.1577954-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022707-0016-0000-0000-000002EAB029
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022707-0017-0000-0000-0000334DE2FF
Message-Id: <e46c66bb-204d-54b7-2f6e-fae41ab3ef5a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=809 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270055
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/26/20 11:23 AM, Nicholas Piggin wrote:
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

> ---
>   arch/powerpc/lib/test_emulate_step.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
> index 42347067739c..00d70253cb5b 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -160,7 +160,7 @@ static void __init test_std(void)
>   
>   	/* std r5, 0(r3) */
>   	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
> -	if (stepped == 1 || regs.gpr[5] == a)
> +	if (stepped == 1 && regs.gpr[5] == a)
>   		show_result("std", "PASS");
>   	else
>   		show_result("std", "FAIL");
> 

