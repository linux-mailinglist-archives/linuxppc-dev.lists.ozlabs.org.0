Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF77821E88
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 16:16:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EMxxMyBo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Gfc3TyHz3bsd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 02:16:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EMxxMyBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4Gdp489Tz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 02:16:13 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 402FD2u4005057;
	Tue, 2 Jan 2024 15:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=yGhxx0AeGI7e5qMoZUz2ZFXRvV8uArHlbUZ/vA1WFT4=;
 b=EMxxMyBotsV3r5bVh+No//1QUJnmPyCQhr3Qfj7fuVehNMH2bxq5pdKzlf0dua83Qdhi
 fvplI9ZhOAa1QNvPGXlfnYKsp3FsCLAFZNSlWnMNhwKL8FirsuijhVGw0WQOLLAnRh3i
 qImJFN3JvE0hEjrM3UyUnuMoBHzqAFB5WrzJzgatiiVCqb8B4WJ8osGD9FzotkDNxCs5
 ExyVCd26rxBRCLRiy4yodjfsgGkyCgUsWzKX1oeoX20Qq6SAzFe8ZBaJE1L/JLZgcat3
 vx0EVdAKyDNpunj2WmDONv4FDnlh/oXPaSdi3Qfz8qAmd0UtPrMXK21QanzjA6UaTd54 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vcmxb82ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 15:16:08 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 402FDFAE005332;
	Tue, 2 Jan 2024 15:16:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vcmxb82e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 15:16:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 402DFPVO027288;
	Tue, 2 Jan 2024 15:16:07 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vawht5u9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 15:16:07 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 402FG6Xn46334666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jan 2024 15:16:06 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86BCC5805C;
	Tue,  2 Jan 2024 15:16:06 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 614F658054;
	Tue,  2 Jan 2024 15:16:06 +0000 (GMT)
Received: from localhost (unknown [9.61.111.122])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jan 2024 15:16:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Haren Myneni
 <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <87il4do9xq.fsf@kernel.org>
References: <20231227083401.2307526-1-haren@linux.ibm.com>
 <87il4do9xq.fsf@kernel.org>
Date: Tue, 02 Jan 2024 09:16:06 -0600
Message-ID: <87sf3frcjt.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ht1gu10XFbJi5LaLXpe5Tl4MVpsj6wkI
X-Proofpoint-GUID: 2AH68VSb6MmN8tsASXsuPdsXYBQylO69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_04,2024-01-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401020117
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
Cc: haren@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@kernel.org> writes:
> Haren Myneni <haren@linux.ibm.com> writes:
>
>> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
>> index 71d52a670d95..5cf81c564d4b 100644
>> --- a/arch/powerpc/platforms/pseries/vas.c
>> +++ b/arch/powerpc/platforms/pseries/vas.c
>> @@ -38,7 +38,30 @@ static long hcall_return_busy_check(long rc)
>>  {
>>  	/* Check if we are stalled for some time */
>>  	if (H_IS_LONG_BUSY(rc)) {
>> -		msleep(get_longbusy_msecs(rc));
>> +		unsigned int ms;
>> +		/*
>> +		 * Allocate, Modify and Deallocate HCALLs returns
>> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
>> +		 * for the long delay. So the sleep time should always
>> +		 * be either 1 or 10msecs, but in case if the HCALL
>> +		 * returns the long delay > 10 msecs, clamp the sleep
>> +		 * time to 10msecs.
>> +		 */
>> +		ms = clamp(get_longbusy_msecs(rc), 1, 10);
>> +
>> +		/*
>> +		 * msleep() will often sleep at least 20 msecs even
>> +		 * though the hypervisor suggests that the OS reissue
>> +		 * HCALLs after 1 or 10msecs. Also the delay hint from
>> +		 * the HCALL is just a suggestion. So OK to pause for
>> +		 * less time than the hinted delay. Use usleep_range()
>> +		 * to ensure we don't sleep much longer than actually
>> +		 * needed.
>> +		 *
>> +		 * See Documentation/timers/timers-howto.rst for
>> +		 * explanation of the range used here.
>> +		 */
>> +		usleep_range(ms * 100, ms * 1000);
>>
>
> Is there more details on this range? (ms *100, ms * 1000)

The preceding comment ("see Documentation/timers/timers-howto...")
should be removed, that document does not really explain this range
directly.

What timers-howto does say is that the larger a range you provide, the
less likely you are to trigger an interrupt to wake up. Since we know
that retrying "too soon" is harmless, providing a lower bound an order
of magnitude less than the suggested delay (which forms the upper bound)
seems reasonable.

>
> can we use USEC_PER_MSEC instead of 1000.

agreed

>>  		rc = H_BUSY;
>>  	} else if (rc == H_BUSY) {
>>  		cond_resched();
>
>
> It would be good to convert this to a helper and switch rtas_busy_delay
> to use this new helper.

I have reservations about that suggestion.

The logic for handling the 990x extended delay constants conceivably
could be shared. But any helper that handles the "retry immediately"
statuses has to know whether it's handling a status from an RTAS call or
an hcall: RTAS_BUSY and H_BUSY have the same semantics but different
values.

Also I don't really want kernel/rtas.c to gain more dependencies on
pseries-specific code as long as there are non-pseries platforms that
use it (chrp, maple, cell).

Tolerating a little duplication here should be OK IMO.

> One question though is w.r.t the clamp values.
> Does that need to be specific to each hcall? Can we make it generic?
>
> rtas_busy_delay() expliclity check for 20msec. Any reason to do that?
> timers-howto.rst suggest > 10msec to use msleep.

I understand it to suggest (roughly) 20ms for the threshold:

        SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
                * Use usleep_range
[...]
                        msleep(1~20) may not do what the caller intends, and
                        will often sleep longer (~20 ms actual sleep for any
                        value given in the 1~20ms range).

20ms is also the threshold used by fsleep().
