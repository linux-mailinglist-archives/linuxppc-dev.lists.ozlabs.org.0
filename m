Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB21ECC3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 11:12:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cNTL6rN5zDqBN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 19:12:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cNR13smSzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 19:10:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05391su8164142; Wed, 3 Jun 2020 05:09:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dfmmv9et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 05:09:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05391u3g164343;
 Wed, 3 Jun 2020 05:09:57 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dfmmv9dh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 05:09:56 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05395lFo029288;
 Wed, 3 Jun 2020 09:09:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 31bf47b422-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 09:09:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05399qRi66126294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 09:09:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E0775206C;
 Wed,  3 Jun 2020 09:09:52 +0000 (GMT)
Received: from [9.199.50.204] (unknown [9.199.50.204])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 103C45204F;
 Wed,  3 Jun 2020 09:09:49 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: Jan Kara <jack@suse.cz>, "Williams, Dan J" <dan.j.williams@intel.com>
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
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <f8113a5b-be3b-3627-7535-ed2c9e0293f9@linux.ibm.com>
Date: Wed, 3 Jun 2020 14:39:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603082628.GE19165@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_06:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030067
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
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/3/20 1:56 PM, Jan Kara wrote:
> On Tue 02-06-20 17:59:08, Williams, Dan J wrote:
>> [ forgive formatting, a series of unfortunate events has me using Outlook for the moment ]
>>
>>> From: Jan Kara <jack@suse.cz>
>>>>>> These flags are device properties that affect the kernel and
>>>>>> userspace's handling of persistence.
>>>>>>
>>>>>
>>>>> That will not handle the scenario with multiple applications using
>>>>> the same fsdax mount point where one is updated to use the new
>>>>> instruction and the other is not.
>>>>
>>>> Right, it needs to be a global setting / flag day to switch from one
>>>> regime to another. Per-process control is a recipe for disaster.
>>>
>>> First I'd like to mention that hopefully the concern is mostly theoretical since
>>> as Aneesh wrote above, real persistent memory never shipped for PPC and
>>> so there are very few apps (if any) using the old way to ensure cache
>>> flushing.
>>>
>>> But I'd like to understand why do you think per-process control is a recipe for
>>> disaster? Because from my POV the sysfs interface you propose is actually
>>> difficult to use in practice. As a distributor, you have hard time picking the
>>> default because you have a choice between picking safe option which is
>>> going to confuse users because of failing MAP_SYNC and unsafe option
>>> where everyone will be happy until someone looses data because of some
>>> ancient application using wrong instructions to persist data. Poor experience
>>> for users in either way. And when distro defaults to "safe option", then the
>>> burden is on the sysadmin to toggle the switch but how is he supposed to
>>> decide when that is safe? First he has to understand what the problem
>>> actually is, then he has to audit all the applications using pmem whether they
>>> use the new instruction - which is IMO a lot of effort if you have a couple of
>>> applications and practically infeasible if you have more of them.
>>> So IMO the burden should be *on the application* to declare that it is aware
>>> of the new instructions to flush pmem on the platform and only to such
>>> application the kernel should give the trust to use MAP_SYNC mappings.
>>
>> The "disaster" in my mind is this need to globally change the ABI for
>> persistence semantics for all of Linux because one CPU wants a do over.
>> What does a generic "MAP_SYNC_ENABLE" knob even mean to the existing
>> deployed base of persistent memory applications? Yes, sysfs is awkward,
>> but it's trying to provide some relief without imposing unexplainable
>> semantics on everyone else. I think a comprehensive (overengineered)
>> solution would involve not introducing another "I know what I'm doing"
>> flag to the interface, but maybe requiring applications to call a pmem
>> sync API in something like a vsyscall. Or, also overengineered, some
>> binary translation / interpretation to actively detect and kill
>> applications that deploy the old instructions. Something horrid like on
>> first write fault to a MAP_SYNC try to look ahead in the binary for the
>> correct sync sequence and kill the application otherwise. That would at
>> least provide some enforcement and safety without requiring other
>> architectures to consider what MAP_SYNC_ENABLE means to them.
> 
> Thanks for explanation. So I absolutely agree that other architectures (and
> even older versions of POWER architecture) must not be influenced by the new
> tunable. That's why I wrote in my reply to Aneesh that I'd be for checking
> during mmap(2) with MAP_SYNC, whether we are in a situation where new PPC
> flush instructions are required and *only in that case* decide based on the
> prctl value whether MAP_SYNC should be allowed or not.
> 

v2 version of the patch series does that

https://lore.kernel.org/linuxppc-dev/20200602074909.36738-1-aneesh.kumar@linux.ibm.com/

> Whether this solution is overengineering or not depends on how you think
> it's likely there will be applications trying to use old flush instructions
> with MAP_SYNC on POWER10 platforms...
> 

Now considering that with ppc64 we never had a real persistent memory 
device available for the end-user to try and the new instructions are 
only needed on newer hardware, can we assume we have enough time to get 
the userspace to use new instructions?

As a safety net, we can keep the dax device-specific sysfs control. But 
in reality, by the time newer hardware gets released, we can get the 
distributions updated to flip the CONFIG_ARCH_MAP_SYNC_DISABLE=n?

With this:
1) vPMEM continues to work and since it is a volatile region. That 
doesn't need any flush instructions.

2) We get pmdk and other user applications updated to use new 
instructions and make sure updated packages are made available to all 
distributions

3) On newer hardware, the device will appear with a new compat string. 
Hence older distributions won't initialize pmem on newer hardware.

4) If we have a newer kernel with an older distro, we use the per 
namespace sysfs knob that prevents the usage of MAP_SYNC.

5) After a year or so we mark the CONFIG_ARCH_MAP_SYNC_DISABLE=n
on ppc64 when we are confident that everybody is using the new flush 
instruction.

-aneesh

