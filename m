Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451C1F13C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:44:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gQJ946YMzDqRn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gQGW1vNRzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:43:15 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0587ZFTq189619; Mon, 8 Jun 2020 03:43:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31geq6mqtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:43:07 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0587aTBM194869;
 Mon, 8 Jun 2020 03:43:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31geq6mqt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:43:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0587eplR024525;
 Mon, 8 Jun 2020 07:43:05 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 31g2s9as81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:43:05 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0587h4VB42336708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 07:43:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A02AAE066;
 Mon,  8 Jun 2020 07:43:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2C0AE05C;
 Mon,  8 Jun 2020 07:43:01 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.88.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 07:43:00 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Jan Kara <jack@suse.cz>, "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
In-Reply-To: <f8113a5b-be3b-3627-7535-ed2c9e0293f9@linux.ibm.com>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <CAPcyv4jrss3dFcCOar3JTFnuN0_pgFNtBPiJzUdKxtiax6pPgQ@mail.gmail.com>
 <7f163562-e7e3-7668-7415-c40e57c32582@linux.ibm.com>
 <CAPcyv4i7k7t8is_6FKAWbWsGHVO0kvj-OqqqJTzw=VS7xtZVvQ@mail.gmail.com>
 <20200601095049.GB3960@quack2.suse.cz>
 <BN6PR11MB41328EB6F894DB391DC09DAEC68B0@BN6PR11MB4132.namprd11.prod.outlook.com>
 <20200603082628.GE19165@quack2.suse.cz>
 <f8113a5b-be3b-3627-7535-ed2c9e0293f9@linux.ibm.com>
Date: Mon, 08 Jun 2020 13:12:58 +0530
Message-ID: <877dwi9f5p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_03:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 cotscore=-2147483648
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080053
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, "jack@suse.de" <jack@suse.de>,
 Jeff Moyer <jmoyer@redhat.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 6/3/20 1:56 PM, Jan Kara wrote:
>> On Tue 02-06-20 17:59:08, Williams, Dan J wrote:
>>> [ forgive formatting, a series of unfortunate events has me using Outlook for the moment ]
>>>
>>>> From: Jan Kara <jack@suse.cz>
>>>>>>> These flags are device properties that affect the kernel and
>>>>>>> userspace's handling of persistence.
>>>>>>>
>>>>>>
>>>>>> That will not handle the scenario with multiple applications using
>>>>>> the same fsdax mount point where one is updated to use the new
>>>>>> instruction and the other is not.
>>>>>
>>>>> Right, it needs to be a global setting / flag day to switch from one
>>>>> regime to another. Per-process control is a recipe for disaster.
>>>>
>>>> First I'd like to mention that hopefully the concern is mostly theoretical since
>>>> as Aneesh wrote above, real persistent memory never shipped for PPC and
>>>> so there are very few apps (if any) using the old way to ensure cache
>>>> flushing.
>>>>
>>>> But I'd like to understand why do you think per-process control is a recipe for
>>>> disaster? Because from my POV the sysfs interface you propose is actually
>>>> difficult to use in practice. As a distributor, you have hard time picking the
>>>> default because you have a choice between picking safe option which is
>>>> going to confuse users because of failing MAP_SYNC and unsafe option
>>>> where everyone will be happy until someone looses data because of some
>>>> ancient application using wrong instructions to persist data. Poor experience
>>>> for users in either way. And when distro defaults to "safe option", then the
>>>> burden is on the sysadmin to toggle the switch but how is he supposed to
>>>> decide when that is safe? First he has to understand what the problem
>>>> actually is, then he has to audit all the applications using pmem whether they
>>>> use the new instruction - which is IMO a lot of effort if you have a couple of
>>>> applications and practically infeasible if you have more of them.
>>>> So IMO the burden should be *on the application* to declare that it is aware
>>>> of the new instructions to flush pmem on the platform and only to such
>>>> application the kernel should give the trust to use MAP_SYNC mappings.
>>>
>>> The "disaster" in my mind is this need to globally change the ABI for
>>> persistence semantics for all of Linux because one CPU wants a do over.
>>> What does a generic "MAP_SYNC_ENABLE" knob even mean to the existing
>>> deployed base of persistent memory applications? Yes, sysfs is awkward,
>>> but it's trying to provide some relief without imposing unexplainable
>>> semantics on everyone else. I think a comprehensive (overengineered)
>>> solution would involve not introducing another "I know what I'm doing"
>>> flag to the interface, but maybe requiring applications to call a pmem
>>> sync API in something like a vsyscall. Or, also overengineered, some
>>> binary translation / interpretation to actively detect and kill
>>> applications that deploy the old instructions. Something horrid like on
>>> first write fault to a MAP_SYNC try to look ahead in the binary for the
>>> correct sync sequence and kill the application otherwise. That would at
>>> least provide some enforcement and safety without requiring other
>>> architectures to consider what MAP_SYNC_ENABLE means to them.
>> 
>> Thanks for explanation. So I absolutely agree that other architectures (and
>> even older versions of POWER architecture) must not be influenced by the new
>> tunable. That's why I wrote in my reply to Aneesh that I'd be for checking
>> during mmap(2) with MAP_SYNC, whether we are in a situation where new PPC
>> flush instructions are required and *only in that case* decide based on the
>> prctl value whether MAP_SYNC should be allowed or not.
>> 
>
> v2 version of the patch series does that
>
> https://lore.kernel.org/linuxppc-dev/20200602074909.36738-1-aneesh.kumar@linux.ibm.com/
>
>> Whether this solution is overengineering or not depends on how you think
>> it's likely there will be applications trying to use old flush instructions
>> with MAP_SYNC on POWER10 platforms...
>> 
>
> Now considering that with ppc64 we never had a real persistent memory 
> device available for the end-user to try and the new instructions are 
> only needed on newer hardware, can we assume we have enough time to get 
> the userspace to use new instructions?
>
> As a safety net, we can keep the dax device-specific sysfs control. But 
> in reality, by the time newer hardware gets released, we can get the 
> distributions updated to flip the CONFIG_ARCH_MAP_SYNC_DISABLE=n?
>
> With this:
> 1) vPMEM continues to work and since it is a volatile region. That 
> doesn't need any flush instructions.
>
> 2) We get pmdk and other user applications updated to use new 
> instructions and make sure updated packages are made available to all 
> distributions
>
> 3) On newer hardware, the device will appear with a new compat string. 
> Hence older distributions won't initialize pmem on newer hardware.
>
> 4) If we have a newer kernel with an older distro, we use the per 
> namespace sysfs knob that prevents the usage of MAP_SYNC.
>
> 5) After a year or so we mark the CONFIG_ARCH_MAP_SYNC_DISABLE=n
> on ppc64 when we are confident that everybody is using the new flush 
> instruction.
>

Is this approach ok for distributions? If so I can repost the series
dropping the prctl change.

-aneesh
