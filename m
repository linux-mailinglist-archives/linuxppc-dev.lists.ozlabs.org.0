Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6B41C447
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 14:07:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFVH28D7z30BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 22:07:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvQR/6m3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pvQR/6m3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFTW3LxFz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 22:06:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18TBTxqh019793; 
 Wed, 29 Sep 2021 08:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=b2XGeAY8whVnLJR0kZ9I69bvWf3X991KBuZuE31Zp08=;
 b=pvQR/6m35PLLYVluvRABpTRiPxHmtJXPXE9rJpn+aVkISK5iGpwSDTpvgIMSsi643zgq
 rOyC9rviRbclan0/NLHwo2c7W1H50ajONBYWYE49lH5dU5XlgdkPv7oVxgAtVEQ3G/+h
 W43ZQXAf2BcJxV8tF9uq77wOsdIwFPcRKSYkd6ev2EtcLS+rqFh2C1unxXR6/FGhDIts
 /warU+pjOnejGUAaPcaX9IEQlklhE7qG/0dPcJtjnouLsOTL76SyLZItQn8EXhEJPGFg
 ZPYFR9hkSZw/X+kIxW/bTPnWqMRKVRz4p1bz6vm7EDzEGhVMzREsvF23bUWnQOafTGfP 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcqaw8r7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 08:06:17 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18TBh6DX011349;
 Wed, 29 Sep 2021 08:06:16 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcqaw8r6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 08:06:16 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18TC6E0L007233;
 Wed, 29 Sep 2021 12:06:16 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3b9udb7h0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 12:06:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18TC6EPf18743620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 12:06:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C55C12405A;
 Wed, 29 Sep 2021 12:06:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54536124053;
 Wed, 29 Sep 2021 12:06:13 +0000 (GMT)
Received: from localhost (unknown [9.211.96.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Sep 2021 12:06:13 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 4/4] powerpc/pseries/cpuhp: remove obsolete comment
 from pseries_cpu_die
In-Reply-To: <87h7e40wac.fsf@mpe.ellerman.id.au>
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
 <20210927201933.76786-5-nathanl@linux.ibm.com>
 <4479e869-1c98-4473-262c-3aeb37b8fca2@gmail.com>
 <87h7e40wac.fsf@mpe.ellerman.id.au>
Date: Wed, 29 Sep 2021 07:06:12 -0500
Message-ID: <87k0izfux7.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RTIxofU0ZzsspR_SSIYYb1GwY-jg8td4
X-Proofpoint-GUID: T6AaFwAJPES2ysZBTWeC5Sk1NvOrerxi
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_04,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109290075
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> This is enough to say that we can't easily see the history behind this comment.
>> I also believe that we're better of without it since it doesn't make sense
>> with the current codebase.
>
> It was added by the original CPU hotplug commit for ppc64::
>
> https://github.com/mpe/linux-fullhistory/commit/0e9fd9441cd2113b67b14e739267c9e69761489b
>
>
> The code was fairly similar:
>
> void __cpu_die(unsigned int cpu)
> {
> 	int tries;
> 	int cpu_status;
> 	unsigned int pcpu = get_hard_smp_processor_id(cpu);
>
> 	for (tries = 0; tries < 5; tries++) {
> 		cpu_status = query_cpu_stopped(pcpu);
>
> 		if (cpu_status == 0)
> 			break;
> 		set_current_state(TASK_UNINTERRUPTIBLE);
> 		schedule_timeout(HZ);
> 	}
> 	if (cpu_status != 0) {
> 		printk("Querying DEAD? cpu %i (%i) shows %i\n",
> 		       cpu, pcpu, cpu_status);
> 	}
>
> 	/* Isolation and deallocation are definatly done by
> 	 * drslot_chrp_cpu.  If they were not they would be
> 	 * done here.  Change isolate state to Isolate and
> 	 * change allocation-state to Unusable.
> 	 */
> 	paca[cpu].xProcStart = 0;
>
> 	/* So we can recognize if it fails to come up next time. */
> 	cpu_callin_map[cpu] = 0;
> }
>
>
> drslot_chrp_cpu() still exists in drmgr:
>
>   https://github.com/ibm-power-utilities/powerpc-utils/blob/e798c4a09fbf0fa0f421e624cfa366a6c405c9fe/src/drmgr/drslot_chrp_cpu.c#L406
>
>
> I agree the comment is no longer meaningful and can be removed.

Thanks for providing this background.

> It might be good to then add a comment explaining why we need to set
> cpu_start = 0.

Sure, I can take that as a follow-up. Or perhaps it should be moved to
the online path.

> It's not immediately clear why we need to. When we bring a CPU back
> online in smp_pSeries_kick_cpu() we ask RTAS to start it and then
> immediately set cpu_start = 1, ie. there isn't a separate step that sets
> cpu_start = 1 for hotplugged CPUs.

Hmm I'm not following the distinction you seem to be drawing between
bringing a CPU back online and a hotplugged CPU. kick_cpu is used in all
cases AFAIK.

