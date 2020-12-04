Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 103652CF179
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 17:06:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CncyR0ZkgzDrdT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 03:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ecuXoflY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CncsQ3GlRzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 03:02:02 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4FYwrH105236; Fri, 4 Dec 2020 11:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=hUpJIrtV8oZpfsQ0rmRfPMWZFu/rGS6h4C7XJw+m71s=;
 b=ecuXoflY6taS0+kSNygu1z7jne4qO8MvaGMhB6mueqXeyF3Fyn26utJ8HaPSodpHeI/B
 Qc90gEpIgQ7Fu5Ph1Gwgz3KpkejiJZCGgFpLq+sC73i/dX/hKqWSgpZ+QDOWHJIzlDsO
 FV9ruZrja/uw/7HVceok+6RuWiULURRY0PMbzWhVPfiAaLBLHNX9g77mp8CvavKBr1CM
 1qZ/jEenkOJyAv8GT+CnSLzT4rHDZjlGlzziUmSyCoIR6seNxsM1TdhUoOFGE1PRgNCw
 gING/XTfx83OxA9uofPPwL1jKgyQtbrVuRNeNvARRgIGpBruTCm21KR3aM3Xd234Wv8t Ww== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357hfa5k0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 11:01:56 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4G1adj029237;
 Fri, 4 Dec 2020 16:01:55 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3569xuxxs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 16:01:55 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4G1rqf23134504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 16:01:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A0876E059;
 Fri,  4 Dec 2020 16:01:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 351666E04E;
 Fri,  4 Dec 2020 16:01:53 +0000 (GMT)
Received: from localhost (unknown [9.65.194.14])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 16:01:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/29] powerpc/pseries/mobility: use stop_machine for
 join/suspend
In-Reply-To: <875z5hvilq.fsf@mpe.ellerman.id.au>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-14-nathanl@linux.ibm.com>
 <875z5hvilq.fsf@mpe.ellerman.id.au>
Date: Fri, 04 Dec 2020 10:01:52 -0600
Message-ID: <87wnxx1rwv.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_05:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=2
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040090
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> The partition suspend sequence as specified in the platform
>> architecture requires that all active processor threads call
>> H_JOIN, which:
> ...
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index 1b8ae221b98a..44ca7d4e143d 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -412,6 +414,128 @@ static int wait_for_vasi_session_suspending(u64 handle)
> ...
>
>> +
>> +static int do_join(void *arg)
>> +{
>> +	atomic_t *counter = arg;
>> +	long hvrc;
>> +	int ret;
>> +
>> +	/* Must ensure MSR.EE off for H_JOIN. */
>> +	hard_irq_disable();
>
> Didn't stop_machine() already do that for us?
>
> In the state machine in multi_cpu_stop().

Yes, but I didn't want to rely on something that seems like an
implementation detail of stop_machine(). I assumed it's benign and in
keeping with hard_irq_disable()'s intended semantics to make multiple
calls to it within a critical section.

I don't feel strongly about this though. If I remove this
hard_irq_disable() I'll modify the comment to indicate that this
function relies on stop_machine() to satisfy this condition for H_JOIN.


>> +	hvrc = plpar_hcall_norets(H_JOIN);
>> +
>> +	switch (hvrc) {
>> +	case H_CONTINUE:
>> +		/*
>> +		 * All other CPUs are offline or in H_JOIN. This CPU
>> +		 * attempts the suspend.
>> +		 */
>> +		ret = do_suspend();
>> +		break;
>> +	case H_SUCCESS:
>> +		/*
>> +		 * The suspend is complete and this cpu has received a
>> +		 * prod.
>> +		 */
>> +		ret = 0;
>> +		break;
>> +	case H_BAD_MODE:
>> +	case H_HARDWARE:
>> +	default:
>> +		ret = -EIO;
>> +		pr_err_ratelimited("H_JOIN error %ld on CPU %i\n",
>> +				   hvrc, smp_processor_id());
>> +		break;
>> +	}
>> +
>> +	if (atomic_inc_return(counter) == 1) {
>> +		pr_info("CPU %u waking all threads\n", smp_processor_id());
>> +		prod_others();
>> +	}
>
> Do we even need the counter? IIUC only one CPU receives H_CONTINUE. So
> couldn't we just have that CPU do the prodding of others?

CPUs may exit H_JOIN due to system reset interrupt at any time, and
H_JOIN may return H_HARDWARE to a caller after other CPUs have entered
the join state successfully. In these cases the counter ensures exactly
one thread performs the prod sequence.

>
>> +	/*
>> +	 * Execution may have been suspended for several seconds, so
>> +	 * reset the watchdog.
>> +	 */
>> +	touch_nmi_watchdog();
>> +	return ret;
>> +}
>> +
>> +static int pseries_migrate_partition(u64 handle)
>> +{
>> +	atomic_t counter = ATOMIC_INIT(0);
>> +	int ret;
>> +
>> +	ret = wait_for_vasi_session_suspending(handle);
>> +	if (ret)
>> +		goto out;
>
> Direct return would be clearer IMHO.

OK, I can change this.
