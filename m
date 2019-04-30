Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C214E1007E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 22:01:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tsph4dS4zDqSG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 06:01:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tsn358KxzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 05:59:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UJmE6L046452; Tue, 30 Apr 2019 15:59:29 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6v6728nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 15:59:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x3UE1AAI025463;
 Tue, 30 Apr 2019 14:03:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 2s4eq3t43s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 14:03:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3UJxRTa61735068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 19:59:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E7857805E;
 Tue, 30 Apr 2019 19:59:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 048AE7805F;
 Tue, 30 Apr 2019 19:59:24 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.212.9])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Apr 2019 19:59:24 +0000 (GMT)
References: <20190423223914.3882-1-bauerman@linux.ibm.com>
 <877ebbsb8u.fsf@linux.ibm.com>
User-agent: mu4e 1.0; emacs 26.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/pseries: Remove limit in wait for dying CPU
In-reply-to: <877ebbsb8u.fsf@linux.ibm.com>
Date: Tue, 30 Apr 2019 16:59:18 -0300
Message-ID: <87v9yve02x.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300118
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Michael Bringmann <mwb@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello Nathan,

Thanks for reviewing the patch!

Nathan Lynch <nathanl@linux.ibm.com> writes:

> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>> This can be a problem because if the busy loop finishes too early, then =
the
>> kernel may offline another CPU before the previous one finished dying,
>> which would lead to two concurrent calls to rtas-stop-self, which is
>> prohibited by the PAPR.
>>
>> Since the hotplug machinery already assumes that cpu_die() is going to
>> work, we can simply loop until the CPU stops.
>>
>> Also change the loop to wait 100 =C2=B5s between each call to
>> smp_query_cpu_stopped() to avoid querying RTAS too often.
>
> [...]
>
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc=
/platforms/pseries/hotplug-cpu.c
>> index 97feb6e79f1a..d75cee60644c 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -214,13 +214,17 @@ static void pseries_cpu_die(unsigned int cpu)
>>  			msleep(1);
>>  		}
>>  	} else if (get_preferred_offline_state(cpu) =3D=3D CPU_STATE_OFFLINE) {
>> -
>> -		for (tries =3D 0; tries < 25; tries++) {
>> +		/*
>> +		 * rtas_stop_self() panics if the CPU fails to stop and our
>> +		 * callers already assume that we are going to succeed, so we
>> +		 * can just loop until the CPU stops.
>> +		 */
>> +		while (true) {
>>  			cpu_status =3D smp_query_cpu_stopped(pcpu);
>>  			if (cpu_status =3D=3D QCSS_STOPPED ||
>>  			    cpu_status =3D=3D QCSS_HARDWARE_ERROR)
>>  				break;
>> -			cpu_relax();
>> +			udelay(100);
>>  		}
>>  	}
>
> I agree with looping indefinitely but doesn't it need a cond_resched()
> or similar check?

If there's no kernel or hypervisor bug, it shouldn't take more than a
few tens of ms for this loop to complete (Gautham measured a maximum of
10 ms on a POWER9 with an earlier version of this patch).

In case of bugs related to CPU hotplug (either in the kernel or the
hypervisor), I was hoping that the resulting lockup warnings would be a
good indicator that something is wrong. :-)

Though perhaps adding a cond_resched() every 10 ms or so, with a
WARN_ON() if it loops for more than 50 ms would be better.

I'll send an alternative patch.

--
Thiago Jung Bauermann
IBM Linux Technology Center
