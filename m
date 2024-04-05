Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8189A556
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 22:04:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BvuleuUL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB8Zb2Cxkz3vgl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 07:04:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BvuleuUL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB8Yt6Ctpz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 07:03:30 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435Jw2ZT010825;
	Fri, 5 Apr 2024 20:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=802JkfxLHpBW4MTlVFkjOaWOkh7SqzuOON2PgS1hCVo=;
 b=BvuleuULtWxUrMBPb8wjECqO4NIMGWx2aAAqwsQvVnt/3tMRAKX/Aeg7apJufQ94EvlD
 kwMA+OgDCOPMxxy0ghTdFypbEHb9ylzrC03ZbzPB4NaEn9TUIWWUrxvVbRyC4SO1lHue
 zxK3Ykso0fhYOBvY3t6tIUkBSASNlXicBn0KALt/fiEsYSB4tdXVL8Eu7WHGimSS//B9
 U/20+sU/n7nBUgpmNGEBRmfpfaN+nRLyU1NlJLVs0ar20vzgxrdSx1DkxGnvd23160z7
 sYSkkwhsrk9tCC6Er2RhBWiAl2yKJtd5GPo4BmGnBcuhz+ev8JEWEHlRHP2HK3BuAHOi yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaqwhg0au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 20:03:24 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 435K3N7D020846;
	Fri, 5 Apr 2024 20:03:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xaqwhg0as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 20:03:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 435JZlBV009109;
	Fri, 5 Apr 2024 20:03:22 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x9epy4ebc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 20:03:22 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435K3J4655902508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 20:03:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E9EE5806B;
	Fri,  5 Apr 2024 20:03:19 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2827358052;
	Fri,  5 Apr 2024 20:03:19 +0000 (GMT)
Received: from localhost (unknown [9.61.105.198])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 20:03:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/pseries: Add pool idle time at LPAR boot
In-Reply-To: <4b1d3241-2caa-4bd1-b9cc-871d176c409e@linux.ibm.com>
References: <20240405101340.149171-1-sshegde@linux.ibm.com>
 <87msq86kju.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <4b1d3241-2caa-4bd1-b9cc-871d176c409e@linux.ibm.com>
Date: Fri, 05 Apr 2024 15:03:18 -0500
Message-ID: <87h6gf7f21.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Orn3WzHTtTLnCpFuf3KqnzIjnyAfgWBY
X-Proofpoint-GUID: B25vgWFyEl-8OiFcgtC8ekR2ob6yKBgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_23,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404050142
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
Cc: naveen.n.rao@linux.ibm.com, tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> On 4/5/24 6:19 PM, Nathan Lynch wrote:
>> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>
> Hi Nathan, Thanks for reviewing this.
>
>>> When there are no options specified for lparstat, it is expected to
>>> give reports since LPAR(Logical Partition) boot. App is an indicator
>>> for available processor pool in an Shared Processor LPAR(SPLPAR). App is
>>> derived using pool_idle_time which is obtained using H_PIC call.
>> 
>> If "App" is short for "Available Procesoor Pool" then it should be
>> written "APP" and the it should be introduced and defined more clearly
>> than this.
>> 
>
> Ok.I reworded it for v2. 
>
> yes APP is Available Processor Pool. 
>
>> 
>>> The interval based reports show correct App value while since boot
>>> report shows very high App values. This happens because in that case app
>>> is obtained by dividing pool idle time by LPAR uptime. Since pool idle
>>> time is reported by the PowerVM hypervisor since its boot, it need not
>>> align with LPAR boot. This leads to large App values.
>>>
>>> To fix that export boot pool idle time in lparcfg and powerpc-utils will
>>> use this info to derive App as below for since boot reports.
>>>
>>> App = (pool idle time - boot pool idle time) / (uptime * timebase)
>>>
>>> Results:: Observe app values.
>>> ====================== Shared LPAR ================================
>>> lparstat
>>> System Configuration
>>> type=Shared mode=Uncapped smt=8 lcpu=12 mem=15573440 kB cpus=37 ent=12.00
>>>
>>> reboot
>>> stress-ng --cpu=$(nproc) -t 600
>>> sleep 600
>>> So in this case app is expected to close to 37-6=31.
>>>
>>> ====== 6.9-rc1 and lparstat 1.3.10  =============
>>> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
>>> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
>>> 47.48  0.01  0.00    52.51     0.00  0.00 47.49 69099.72 541547    21
>>>
>>> === With this patch and powerpc-utils patch to do the above equation ===
>>> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
>>> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
>>> 47.48  0.01  0.00    52.51     5.73 47.75 47.49 31.21 541753    21
>>> =====================================================================
>>>
>>> Note: physc, purr/idle purr being inaccurate is being handled in a
>>> separate patch in powerpc-utils tree.
>>>
>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>> ---
>>> Note:
>>>
>>> This patch needs to merged first in the kernel for the powerpc-utils
>>> patches to work. powerpc-utils patches will be posted to its mailing
>>> list and link would be found in the reply to this patch if available.
>>>
>>> arch/powerpc/platforms/pseries/lparcfg.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>>> index f73c4d1c26af..8df4e7c529d7 100644
>>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>>> @@ -184,6 +184,8 @@ static unsigned h_pic(unsigned long *pool_idle_time,
>>>  	return rc;
>>>  }
>>>
>>> +unsigned long boot_pool_idle_time;
>> 
>> Should be static, and u64. Better to use explicitly sized types for data
>> at the kernel-hypervisor boundary.
>
> Current usage of h_pic doesn't follow this either. Are you suggesting we change that 
> as well?

Yes pretty much. h_pic() as currently written and used has some
problems:

  static unsigned h_pic(unsigned long *pool_idle_time,
                        unsigned long *num_procs)
  {
          unsigned long rc;
          unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
  
          rc = plpar_hcall(H_PIC, retbuf);
  
          *pool_idle_time = retbuf[0];
          *num_procs = retbuf[1];
  
          return rc;
  }

* Coerces the return value of plpar_hcall() to unsigned -- hcall
  errors are negative.
* Assigns *pool_idle_time and *num_procs using uninitialized
  data when H_PIC is unsuccessful.
* Assigns the outparams unconditionally; would be nicer if it allowed
  callers to pass NULL so they don't have to provide dummy inputs that
  aren't even used, as in your change.
* Should follow Linux -errno return value convention in the absence
  of a need for the specific hcall status in its callers.

>>> @@ -801,6 +805,9 @@ static int __init lparcfg_init(void)
>>>  		printk(KERN_ERR "Failed to create powerpc/lparcfg\n");
>>>  		return -EIO;
>>>  	}
>>> +
>>> +	h_pic(&boot_pool_idle_time, &num_procs);
>> 
>> h_pic() can fail, leaving the out parameters uninitialized.
>
> Naveen pointed to me this a while ago, but I forgot. 
>
> Currently h_pic return value is not checked at all, either at boor or at runtime. 
> When it fails, should we re-try or just print a kernel debug? What would be expected 
> behavior? because if it fails, it would anyway result in wrong values of app even 
> if the variables are initialized to 0.

There's nothing in the spec for H_PIC that suggests retrying on failure.
I'm not really in favor of printing a message about it either; that
practice tends to result in log noise in non-PowerVM guests.

When H_PIC doesn't work the corresponding lines should not be emitted in
/proc/powerpc/lparcfg IMO.
