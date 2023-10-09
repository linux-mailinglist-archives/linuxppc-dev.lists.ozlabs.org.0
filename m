Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F98E7BE469
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 17:17:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KP8MzxYL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S42h81MdQz3vYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 02:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KP8MzxYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S42gF57jfz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 02:16:25 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399FG2Kd011326;
	Mon, 9 Oct 2023 15:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=o3zBO2zjGTMR5NxNWvkao8DtpMbTx8DRhZ5lwEapP9g=;
 b=KP8MzxYLU9EVbrfUrpC9SAh6nyoCQU6JrD2IOePBQlGjcQixcEZgrWCWQn55Xh7p77+b
 GDpstf0RGpMgHpyiJ7Lb5+FjzLs/h3DAU68TtHdkaapz6GgN5N2YCwhuMpJE8WNCNEuH
 kVK9XjubVix9sc+mjLkLIaULqxyRS0Xyh/J4QknXQ0jVgR+mGOApHQjwuj80djCXUzZI
 SPhadR1fzpi1SzPFjFfljIfXqiwdYSDIQ3yX5UbDKntOfvMYBHAKBMshLYzJlY0Qjcp6
 A2h+x8b30inzGgK/FDsXf+qTHhctkvXodXmJ1h0ApiAPsUIbALlCc1TAicfcVzs9Z9/V xg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm0s80hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 15:16:13 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399D16Jd000647;
	Mon, 9 Oct 2023 15:12:14 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5k9m1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 15:12:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399FCDAI18154088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 15:12:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0F5C58064;
	Mon,  9 Oct 2023 15:12:13 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9ECBF5805A;
	Mon,  9 Oct 2023 15:12:13 +0000 (GMT)
Received: from [9.61.118.13] (unknown [9.61.118.13])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 15:12:13 +0000 (GMT)
Message-ID: <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
Date: Mon, 9 Oct 2023 10:12:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: KUEP broken on FSP2?
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <87a5ssrl9c.fsf@mail.lhotse>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <87a5ssrl9c.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sBwAStO7kUnnKRB4M6dqsOSvxI-wlcu8
X-Proofpoint-GUID: sBwAStO7kUnnKRB4M6dqsOSvxI-wlcu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/9/23 08:14, Michael Ellerman wrote:
> Eddie James <eajames@linux.ibm.com> writes:
>> Hi,
>>
>> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes
>> attempting to get into userspace. The init script works, but the first
>> binary (mount) I run results in oops. Can anyone help me to debug this
>> further or suggest anything?
> Hi Eddie,
>
> It looks like breakage in syscall_exit_finish.
> Can you test this? Patch is against v6.1.


That worked! Perfect. Thank you very much! Will you send it upstream?


Thanks,

Eddie


>
> cheers
>
>
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 3fc7c9886bb7..decd2594fb9c 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -135,7 +135,8 @@ ret_from_syscall:
>   	lis	r4,icache_44x_need_flush@ha
>   	lwz	r5,icache_44x_need_flush@l(r4)
>   	cmplwi	cr0,r5,0
> -	bne-	2f
> +	bne-	.L44x_icache_flush
> +.L44x_icache_flush_return:
>   #endif /* CONFIG_PPC_47x */
>   	kuep_unlock
>   	lwz	r4,_LINK(r1)
> @@ -170,10 +171,11 @@ syscall_exit_finish:
>   	b	1b
>   
>   #ifdef CONFIG_44x
> -2:	li	r7,0
> +.L44x_icache_flush:
> +	li	r7,0
>   	iccci	r0,r0
>   	stw	r7,icache_44x_need_flush@l(r4)
> -	b	1b
> +	b	.L44x_icache_flush_return
>   #endif  /* CONFIG_44x */
>   
>   	.globl	ret_from_fork
