Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BEE1EB6E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 10:00:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bkxB5JH6zDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 18:00:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bksk6ZJkzDqBY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 17:57:30 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0527Xfbb012177; Tue, 2 Jun 2020 03:57:26 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bjssfcv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 03:57:25 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0527p21l015335;
 Tue, 2 Jun 2020 07:57:24 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 31bf48rwt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 07:57:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0527vN4v22741272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 07:57:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF1526E053;
 Tue,  2 Jun 2020 07:57:23 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C90A6E054;
 Tue,  2 Jun 2020 07:57:21 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.34.130])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 07:57:20 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
In-Reply-To: <af150987-156f-71dc-a4cd-e6f8e670839a@linux.ibm.com>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <20200601100925.GC3960@quack2.suse.cz>
 <2bf026cc-2ed0-70b6-bf99-ecfd0fa3dac4@linux.ibm.com>
 <20200601120705.GQ25173@kitsune.suse.cz>
 <af150987-156f-71dc-a4cd-e6f8e670839a@linux.ibm.com>
Date: Tue, 02 Jun 2020 13:27:18 +0530
Message-ID: <87y2p5oq75.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_08:2020-06-01,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020043
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
Cc: linuxppc-dev@lists.ozlabs.org, jack@suse.de, linux-nvdimm@lists.01.org,
 Jan Kara <jack@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> On 6/1/20 5:37 PM, Michal Such=C3=A1nek wrote:
>> On Mon, Jun 01, 2020 at 05:31:50PM +0530, Aneesh Kumar K.V wrote:
>>> On 6/1/20 3:39 PM, Jan Kara wrote:
>>>> On Fri 29-05-20 16:25:35, Aneesh Kumar K.V wrote:
>>>>> On 5/29/20 3:22 PM, Jan Kara wrote:
>>>>>> On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
>>>>>>> Thanks Michal. I also missed Jeff in this email thread.
>>>>>>
>>>>>> And I think you'll also need some of the sched maintainers for the p=
rctl
>>>>>> bits...
>>>>>>
>>>>>>> On 5/29/20 3:03 PM, Michal Such=C3=A1nek wrote:
>>>>>>>> Adding Jan
>>>>>>>>
>>>>>>>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
>>>>>>>>> With POWER10, architecture is adding new pmem flush and sync inst=
ructions.
>>>>>>>>> The kernel should prevent the usage of MAP_SYNC if applications a=
re not using
>>>>>>>>> the new instructions on newer hardware.
>>>>>>>>>
>>>>>>>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used t=
o enable
>>>>>>>>> the usage of MAP_SYNC. The kernel config option is added to allow=
 the user
>>>>>>>>> to control whether MAP_SYNC should be enabled by default or not.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>>> ...
>>>>>>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>>>>>>> index 8c700f881d92..d5a9a363e81e 100644
>>>>>>>>> --- a/kernel/fork.c
>>>>>>>>> +++ b/kernel/fork.c
>>>>>>>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(m=
mlist_lock);
>>>>>>>>>      static unsigned long default_dump_filter =3D MMF_DUMP_FILTER=
_DEFAULT;
>>>>>>>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
>>>>>>>>> +unsigned long default_map_sync_mask =3D MMF_DISABLE_MAP_SYNC_MAS=
K;
>>>>>>>>> +#else
>>>>>>>>> +unsigned long default_map_sync_mask =3D 0;
>>>>>>>>> +#endif
>>>>>>>>> +
>>>>>>
>>>>>> I'm not sure CONFIG is really the right approach here. For a distro =
that would
>>>>>> basically mean to disable MAP_SYNC for all PPC kernels unless applic=
ation
>>>>>> explicitly uses the right prctl. Shouldn't we rather initialize
>>>>>> default_map_sync_mask on boot based on whether the CPU we run on req=
uires
>>>>>> new flush instructions or not? Otherwise the patch looks sensible.
>>>>>>
>>>>>
>>>>> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t POWE=
R10.
>>>>> But on a virtualized platform there is no easy way to detect that. We=
 could
>>>>> ideally hook this into the nvdimm driver where we look at the new com=
pat
>>>>> string ibm,persistent-memory-v2 and then disable MAP_SYNC
>>>>> if we find a device with the specific value.
>>>>
>>>> Hum, couldn't we set some flag for nvdimm devices with
>>>> "ibm,persistent-memory-v2" property and then check it during mmap(2) t=
ime
>>>> and when the device has this propery and the mmap(2) caller doesn't ha=
ve
>>>> the prctl set, we'd disallow MAP_SYNC? That should make things mostly
>>>> seamless, shouldn't it? Only apps that want to use MAP_SYNC on these
>>>> devices would need to use prctl(MMF_DISABLE_MAP_SYNC, 0) but then these
>>>> applications need to be aware of new instructions so this isn't that m=
uch
>>>> additional burden...
>>>
>>> I am not sure application would want to add that much details/knowledge
>>> about a platform in their code. I was expecting application to do
>>>
>>> #ifdef __ppc64__
>>>          prctl(MAP_SYNC_ENABLE, 1, 0, 0, 0));
>>> #endif
>>>          a =3D mmap(NULL, PAGE_SIZE, PROT_READ|PROT_WRITE,
>>>                          MAP_SHARED_VALIDATE | MAP_SYNC, fd, 0);
>>>
>>>
>>> For that code all the complexity that we add w.r.t ibm,persistent-memor=
y-v2
>>> is not useful. Do you see a value in making all these device specific r=
ather
>>> than a conditional on  __ppc64__?
>
>> If the vpmem devices continue to work with the old instruction on
>> POWER10 then it makes sense to make this per-device.
>
> vPMEM doesn't have write_cache and hence it is synchronous even without=20
> using any specific flush instruction. The question is do we want to have
> different programming steps when running on vPMEM vs a persistent PMEM=20
> device on ppc64.
>
> I will work on the device specific ENABLE flag and then we can compare=20
> the kernel complexity against the added benefit.

I have posted an RFC v2 [1] that implements a device-specific MAP_SYNC
enable/disable feature. The Posted changes also add a dax flag suggested
by Dan. With device-specific MAP_SYNC enable/disable, it was just a sysfs
file export of the same flag.=20

1. https://lore.kernel.org/linuxppc-dev/20200602074909.36738-1-aneesh.kumar=
@linux.ibm.com/

-aneesh
