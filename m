Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753801045DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 22:37:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JGHT2bV0zDqP8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 08:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JGFD73knzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:35:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKLVVso148036; Wed, 20 Nov 2019 16:34:56 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wact8s5vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 16:34:55 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAKLUU1i009580;
 Wed, 20 Nov 2019 21:34:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2wa8r6gd2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 21:34:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKLYsd250069932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 21:34:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F8FE7805F;
 Wed, 20 Nov 2019 21:34:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1246E7805E;
 Wed, 20 Nov 2019 21:34:52 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.47.117])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Nov 2019 21:34:52 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: remove variable 'status' set but not used
To: Michael Ellerman <mpe@ellerman.id.au>, Chen Wandun
 <chenwandun@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mahesh@linux.vnet.ibm.com, paulus@samba.org
References: <1573873650-62511-1-git-send-email-chenwandun@huawei.com>
 <87blt8csyx.fsf@mpe.ellerman.id.au>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <b1591f1d-ddd6-1cd5-afd6-c42eb4671a03@linux.ibm.com>
Date: Wed, 20 Nov 2019 13:34:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87blt8csyx.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911200181
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/18/19 9:53 PM, Michael Ellerman wrote:
> Chen Wandun <chenwandun@huawei.com> writes:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> arch/powerpc/platforms/pseries/ras.c: In function ras_epow_interrupt:
>> arch/powerpc/platforms/pseries/ras.c:319:6: warning: variable status set but not used [-Wunused-but-set-variable]
> 
> Thanks for the patch.
> 
> But it almost certainly is wrong to not check the status.

Agreed, I started drafting a NACK response, but got sidetracked.

> 
> It's calling firmware and just assuming that the call succeeded. It then
> goes on to use the result that should have been written by firmware, but
> is now potentially random junk.
> 
> So I'd much rather a patch to change it to check the status.

+1

> 
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index 1d7f973..4a61d0f 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -316,12 +316,11 @@ static irqreturn_t ras_hotplug_interrupt(int irq, void *dev_id)
>>  /* Handle environmental and power warning (EPOW) interrupts. */
>>  static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>>  {
>> -	int status;
>>  	int state;
>>  	int critical;
>>  
>> -	status = rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
>> -				      &state);
>> +	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
>> +			     &state);
> 
> This is calling a helper which already does some translation of the
> return value, any value < 0 indicates an error.

There are three possible architected failures here: Hardware, Non-existant
sensor, and an DR isolation error which namely would be reported in the status
as -EIO, -EINVAL, and -EFAULT. Further, the EPOW sensor is required, and is not
a DR entity so we can never get an -EINVAL or -EFAULT (baring broken firmware).
This leaves -EIO (HARDWARE_ERROR) and as I mention further down this will
generate its own error log in response. So, I don't think we need to do any
reporting here, and just return.

> 
>> @@ -330,12 +329,12 @@ static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>>  
>>  	spin_lock(&ras_log_buf_lock);
>>  
>> -	status = rtas_call(ras_check_exception_token, 6, 1, NULL,
>> -			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
>> -			   virq_to_hw(irq),
>> -			   RTAS_EPOW_WARNING,
>> -			   critical, __pa(&ras_log_buf),
>> -				rtas_get_error_log_max());
>> +	rtas_call(ras_check_exception_token, 6, 1, NULL,
>> +		  RTAS_VECTOR_EXTERNAL_INTERRUPT,
>> +		  virq_to_hw(irq),
>> +		  RTAS_EPOW_WARNING,
>> +		  critical, __pa(&ras_log_buf),
>> +		  rtas_get_error_log_max());
> 
> This is directly calling firmware.
> 
> As documented in LoPAPR, a negative status indicates an error, 0
> indicates a new error log was found (ie. the function should continue),
> or 1 there was no error log (ie. nothing to do).

It is highly unlikely that we will find no new error log since we are processing
an interrupt that supposedly fired to tell us there is a new one. However, the
ras_log_buf is never zeroed so in the unlikely case there is no new error log we
will parse stale data from the previous log. Better safe than sorry and just return.

In the case of an error the only error code we supposedly can get here is -1
(HARDWARE_ERROR), and the RTAS handling will generate an error log in response
to that. So, I don't think we need to report anything here. I would suggest for
the (status != 0) case that you just return.

-Tyrel

>
> cheers
> 
>>  	log_error(ras_log_buf, ERR_TYPE_RTAS_LOG, 0);
>>  
>> -- 
>> 2.7.4

