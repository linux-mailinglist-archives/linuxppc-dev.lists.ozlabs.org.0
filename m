Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46916338C8A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxlHM29kHz3d2p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:19:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PAj6CRZe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=danielhb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PAj6CRZe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlGv3y6fz3cKr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:19:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC3jXu183125; Fri, 12 Mar 2021 07:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hxxVQKiDtqnYGjgwXCtPZR5WX6tvPoKtmQBlNMZ4JxQ=;
 b=PAj6CRZeIXu1Xhsr/jpEOgCzZeIFP6K35nMg4h+noAliMVTUTiQ64S5K9CsWxT5Vbirl
 NhW+oYJAFDHo6xxdatLJ3871f9N6TwQrgnXIWk81Hpxu1PSUcSbzdeQZmyp/bAZpAvNV
 AAPy12rxk6iQQIOrq/NPnwUa2qhNa1X0RWxbP119xy06HZQ+c+PJW2a5TdmP2jqK5vWZ
 pFKy6H/Vp9GHijgI+j89+5wSeFJaZKXZp6daQBVJpF/Xm9sCL6GpzQfAM2LRnMAFiz5t
 yf+VaBtntrXc6jG6umA5qi0oZKeEjUtU8bEASYfbI0rswytvvd7vCJ1CWJzCyUVHAfIP 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3774mr8bdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 07:18:44 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12CCD29o032346;
 Fri, 12 Mar 2021 07:18:44 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3774mr8bdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 07:18:44 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12CCDS8M018216;
 Fri, 12 Mar 2021 12:18:43 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3768n4ycja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 12:18:43 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12CCIgDI11469298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Mar 2021 12:18:42 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B579AC6057;
 Fri, 12 Mar 2021 12:18:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CB66C605A;
 Fri, 12 Mar 2021 12:18:40 +0000 (GMT)
Received: from [9.80.201.156] (unknown [9.80.201.156])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Mar 2021 12:18:40 +0000 (GMT)
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <dgibson@redhat.com>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org> <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
 <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
 <20210312125527.61bc269c@yekko.fritz.box>
 <4effbb5e-6f08-03bf-cea0-60c986175668@kaod.org>
From: Daniel Henrique Barboza <danielhb@linux.ibm.com>
Message-ID: <0f27271d-cb4d-986c-95c6-3173b43f70e5@linux.ibm.com>
Date: Fri, 12 Mar 2021 09:18:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4effbb5e-6f08-03bf-cea0-60c986175668@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1011 impostorscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120086
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
Cc: "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, linuxppc-dev@lists.ozlabs.org,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/21 6:53 AM, Cédric Le Goater wrote:
> On 3/12/21 2:55 AM, David Gibson wrote:
>> On Tue, 9 Mar 2021 18:26:35 +0100
>> Cédric Le Goater <clg@kaod.org> wrote:
>>
>>> On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 3/9/21 12:33 PM, Cédric Le Goater wrote:
>>>>> On 3/8/21 6:13 PM, Greg Kurz wrote:
>>>>>> On Wed, 3 Mar 2021 18:48:50 +0100
>>>>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>>>>   
>>>>>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>>>>>>> target for a source located on the same chip when possible. This field
>>>>>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
>>>>>>> on pSeries under KVM when NUMA nodes are defined but it is undefined
>>>>>>
>>>>>> This sentence seems to have a syntax problem... like it is missing an
>>>>>> 'and' before 'on pSeries'.
>>>>>
>>>>> ah yes, or simply a comma.
>>>>>   
>>>>>>> under PowerVM. The XIVE source structure has a similar field
>>>>>>> 'src_chip' which is only assigned on the PowerNV platform.
>>>>>>>
>>>>>>> cpu_to_node() returns a compatible value on all platforms, 0 being the
>>>>>>> default node. It will also give us the opportunity to set the affinity
>>>>>>> of a source on pSeries when we can localize them.
>>>>>>>   
>>>>>>
>>>>>> IIUC this relies on the fact that the NUMA node id is == to chip id
>>>>>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
>>>>>> with this change.
>>>>>
>>>>> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
>>>>> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
>>>>> in Cc:)
>>>   [...]
>>>>>
>>>>> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
>>>>> the node id. This value is built from the chip id in OPAL, so the
>>>>> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
>>>>> property are unlikely to be different.
>>>>>
>>>>> cpu_to_node(cpu) is used in many places to allocate the structures
>>>>> locally to the owning node. XIVE is not an exception (see below in the
>>>>> same patch), it is better to be consistent and get the same information
>>>>> (node id) using the same routine.
>>>>>
>>>>>
>>>>> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
>>>>> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
>>>>> unifies the controllers of the system to only expose one the OS. This
>>>>> is problematic and should be changed but it's another topic.
>>>>>
>>>>>   
>>>>>> On the other hand, you have the pSeries case under PowerVM that
>>>>>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT.
>>>>>
>>>>> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meaning
>>>>> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
>>>>> chip id.
>>>>>
>>>>> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
>>>>> always correct btw)
>>>>
>>>>
>>>> If you have a way to reliably reproduce this, let me know and I'll fix it
>>>> up in QEMU.
>>>
>>> with :
>>>
>>>     -smp 4,cores=1,maxcpus=8 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>>
>>> # dmesg | grep numa
>>> [    0.013106] numa: Node 0 CPUs: 0-1
>>> [    0.013136] numa: Node 1 CPUs: 2-3
>>>
>>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
>>> 		ibm,chip-id = <0x01>;
>>> 		ibm,chip-id = <0x02>;
>>> 		ibm,chip-id = <0x00>;
>>> 		ibm,chip-id = <0x03>;
>>>
>>> with :
>>>
>>>    -smp 4,cores=4,maxcpus=8,threads=1 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>>
>>> # dmesg | grep numa
>>> [    0.013106] numa: Node 0 CPUs: 0-1
>>> [    0.013136] numa: Node 1 CPUs: 2-3
>>>
>>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
>>> 		ibm,chip-id = <0x00>;
>>> 		ibm,chip-id = <0x00>;
>>> 		ibm,chip-id = <0x00>;
>>> 		ibm,chip-id = <0x00>;
>>>
>>> I think we should simply remove "ibm,chip-id" since it's not used and
>>> not in the PAPR spec.
>>
>> As I mentioned to Daniel on our call this morning, oddly it *does*
>> appear to be used in the RHEL kernel, even though that's 4.18 based.
>> This patch seems to have caused a minor regression; not in the
>> identification of NUMA nodes, but in the number of sockets shown be
>> lscpu, etc.  See https://bugzilla.redhat.com/show_bug.cgi?id=1934421
>> for more information.
> 
> Yes. The property "ibm,chip-id" is wrongly calculated in QEMU. If we
> remove it, we get with 4.18.0-295.el8.ppc64le or 5.12.0-rc2 :
> 
>     [root@localhost ~]# lscpu
>     Architecture:        ppc64le
>     Byte Order:          Little Endian
>     CPU(s):              128
>     On-line CPU(s) list: 0-127
>     Thread(s) per core:  4
>     Core(s) per socket:  16
>     Socket(s):           2
>     NUMA node(s):        2
>     Model:               2.2 (pvr 004e 1202)
>     Model name:          POWER9 (architected), altivec supported
>     Hypervisor vendor:   KVM
>     Virtualization type: para
>     L1d cache:           32K
>     L1i cache:           32K
>     NUMA node0 CPU(s):   0-63
>     NUMA node1 CPU(s):   64-127
> 
>     [root@localhost ~]# grep . /sys/devices/system/cpu/*/topology/physical_package_id
>     /sys/devices/system/cpu/cpu0/topology/physical_package_id:-1
>     /sys/devices/system/cpu/cpu100/topology/physical_package_id:-1
>     /sys/devices/system/cpu/cpu101/topology/physical_package_id:-1
>     /sys/devices/system/cpu/cpu102/topology/physical_package_id:-1
>     /sys/devices/system/cpu/cpu103/topology/physical_package_id:-1
>     ....
> 
> "ibm,chip-id" is still being used on some occasion on pSeries machines.
> This is wrong :/ The problem is :
> 
>    #define topology_physical_package_id(cpu)      (cpu_to_chip_id(cpu))
> 
> We should be using cpu_to_node().


IIUC the "real fix" then is this change you mentioned above, together with
this xive patch as well, to stop using ibm,chip-id for good in the pserie
  kernel. With these changes QEMU can remove 'ibm,chip-id' from the pseries
machine without impact. Is this correct?

If that's the case, then I believe it's ok to go forward with the QEMU side
change (just for 6.0.0 and newer machines). Or should I wait for the kernel
changes to be merged upstream first?


Thanks,


DHB


> 
> C.
> 
>>
>> Since the value was used by some PAPR kernels - even if they shouldn't
>> have - I think we should only remove this for newer machine types.  We
>> also need to check what we're not supplying that the guest kernel is
>> showing a different number of sockets than specified on the qemu
>> command line.
>>
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>>   
>>>
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>   [...]
>>>
>>
>>
> 
