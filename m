Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C329134F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 19:13:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CD8kX30sSzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 04:13:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CD8hp5c4xzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 04:12:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HGxDviRg; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CD8hp364wz8tWl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 04:12:26 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CD8hp2lL4z9sTc; Sun, 18 Oct 2020 04:12:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HGxDviRg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CD8hn6LGZz9sSG;
 Sun, 18 Oct 2020 04:12:25 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09HH1xxb150522; Sat, 17 Oct 2020 13:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UMtO5ZHpgdXTsEqGRYlaTFephkYLAFRXsKflEUpY1/4=;
 b=HGxDviRgFN4o2+9QIzv05tW0nS0oh4Huf6b/KIlL/QaktR1iuGY9o9D4DcVf4vs3oe5Y
 1WCGgI22q4lkKcXdv5HqQjzwLR2qB9t5wgzGaGGcV1goFk9g9DE3mGBp+KR2HuDsGYeV
 8l7gdxSRwW4hpnRAKP+o6Z+DsP8lyTSIEnrkPQAF2WgGritk8Qx4nf+qGThrvOQBS8Yf
 9j7X05Ulma1tHrindnWprn0ky8hdi3nd1fPZTfCZc3xDSqKl3tS/M40BcMePeV+jVAhb
 YKMdXTsCdZK3FS74c0cWkzP/u3pR4PkMS+Zqn/lsQmmGctJjcQbUoi/Zx8XeHjaKsD22 ZA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3483rh950b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 13:12:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09HH3gvk004431;
 Sat, 17 Oct 2020 17:12:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 347qvh8h1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Oct 2020 17:12:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09HHCIe818612586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Oct 2020 17:12:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A811B52051;
 Sat, 17 Oct 2020 17:12:18 +0000 (GMT)
Received: from [9.199.43.235] (unknown [9.199.43.235])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C896552050;
 Sat, 17 Oct 2020 17:12:17 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/elog: Reduce elog message severity
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20201007101756.40811-1-hegdevasant@linux.vnet.ibm.com>
 <87d01s0z37.fsf@mpe.ellerman.id.au>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Message-ID: <c616affd-d27f-42a9-11e8-e45ffc5293a6@linux.vnet.ibm.com>
Date: Sat, 17 Oct 2020 22:42:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87d01s0z37.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-17_14:2020-10-16,
 2020-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010170115
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/9/20 10:34 AM, Michael Ellerman wrote:
> Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
>> OPAL interrupts kernel whenever it has new error log. Kernel calls
>> interrupt handler (elog_event()) to retrieve event. elog_event makes
>> OPAL API call (opal_get_elog_size()) to retrieve elog info.
>>
>> In some case before kernel makes opal_get_elog_size() call, it gets interrupt
>> again. So second time when elog_event() calls opal_get_elog_size API OPAL
>> returns error.
> 
> Can you give more detail there? Do you have a stack trace?

I observe below log in dmesg
   [  615.708709] ELOG: OPAL log info read failed

That means elog_event called twice for same error log event.
I don't have stack trace.

> 
> We use IRQF_ONESHOT for elog_event(), which (I thought) meant it
> shouldn't be called again until it has completed.

Yes. I thought so.. But once in a while we get above message (mostly when we 
have multiple event bits are set).

-Vasant


> 
> So I'm unclear how you're seeing the behaviour you describe.
> 
> cheers
> 
>> Its safe to ignore this error. Hence reduce the severity
>> of log message.
>>
>> CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/opal-elog.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
>> index 62ef7ad995da..67f435bb1ec4 100644
>> --- a/arch/powerpc/platforms/powernv/opal-elog.c
>> +++ b/arch/powerpc/platforms/powernv/opal-elog.c
>> @@ -247,7 +247,7 @@ static irqreturn_t elog_event(int irq, void *data)
>>   
>>   	rc = opal_get_elog_size(&id, &size, &type);
>>   	if (rc != OPAL_SUCCESS) {
>> -		pr_err("ELOG: OPAL log info read failed\n");
>> +		pr_debug("ELOG: OPAL log info read failed\n");
>>   		return IRQ_HANDLED;
>>   	}
>>   
>> -- 
>> 2.26.2

