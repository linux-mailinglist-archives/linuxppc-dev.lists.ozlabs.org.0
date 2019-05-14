Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51D1C6E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 12:20:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453DG017VHzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 20:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453DDQ6pWJzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 20:18:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EACCDk026034
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 06:18:44 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sft85c9e0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 06:18:44 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ego@linux.vnet.ibm.com>;
 Tue, 14 May 2019 11:18:43 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 11:18:41 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EAIeKq7405952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 10:18:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 918227805C;
 Tue, 14 May 2019 10:18:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 417F178064;
 Tue, 14 May 2019 10:18:40 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.248])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 10:18:40 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 01A832E3373; Tue, 14 May 2019 15:48:37 +0530 (IST)
Date: Tue, 14 May 2019 15:48:37 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RESEND PATCH] powerpc/pseries: Fix cpu_hotplug_lock acquisition
 in resize_hpt
References: <1557480294-808-1-git-send-email-ego@linux.vnet.ibm.com>
 <877eattta4.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877eattta4.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
x-cbid: 19051410-8235-0000-0000-00000E951406
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011096; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203140; UDB=6.00631507; IPR=6.00984063; 
 MB=3.00026879; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 10:18:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051410-8236-0000-0000-0000458D3FDB
Message-Id: <20190514101837.GG31206@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140075
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
Reply-To: ego@linux.vnet.ibm.com
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, May 14, 2019 at 05:00:19PM +1000, Michael Ellerman wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > During a memory hotplug operations involving resizing of the HPT, we
> > invoke a stop_machine() to perform the resizing. In this code path, we
> > end up recursively taking the cpu_hotplug_lock, first in
> > memory_hotplug_begin() and then subsequently in stop_machine(). This
> > causes the system to hang.
>
> This implies we have never tested a memory hotplug that resized the HPT.
> Is that really true? Or did something change?
>

This was reported by Aneesh during a testcase involving reconfiguring
the namespace for nvdimm where we do a memory remove followed by
add. The memory add invokes resize_hpt().

It seems we can hit this issue when we perform a memory hotplug/unplug
in the guest.

> > With lockdep enabled we get the following
> > error message before the hang.
> >
> >   swapper/0/1 is trying to acquire lock:
> >   (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: stop_machine+0x2c/0x60
> >
> >   but task is already holding lock:
> >   (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50
> 
> Do we have the full stack trace?

Yes, here is the complete log:

[    0.537123] swapper/0/1 is trying to acquire lock:
[    0.537197] (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: stop_machine+0x2c/0x60
[    0.537336]
[    0.537336] but task is already holding lock:
[    0.537429] (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50

[    0.537570]                                   
[    0.537570] other info that might help us debug this:
[    0.537663]  Possible unsafe locking scenario:
[    0.537663]
[    0.537756]        CPU0                                     
[    0.537794]        ----                                       
[    0.537832]   lock(cpu_hotplug_lock.rw_sem);                                                        
[    0.537906]   lock(cpu_hotplug_lock.rw_sem);             
[    0.537980]                                       
[    0.537980]  *** DEADLOCK ***                                                           
[    0.537980]                                                                                      
[    0.538074]  May be due to missing lock nesting notation                           
[    0.538074]                                                                    
[    0.538168] 3 locks held by swapper/0/1:               
[    0.538224]  #0: (____ptrval____) (&dev->mutex){....}, at: __driver_attach+0x12c/0x1b0
[    0.538348]  #1: (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50
[    0.538477]  #2: (____ptrval____) (mem_hotplug_lock.rw_sem){++++}, at: percpu_down_write+0x54/0x1a0
[    0.538608]
[    0.538608] stack backtrace:                                              
[    0.538685] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc5-58373-gbc99402235f3-dirty #166
[    0.538812] Call Trace:                                          
[    0.538863] [c0000000feb03150] [c000000000e32bd4] dump_stack+0xe8/0x164 (unreliable)
[    0.538975] [c0000000feb031a0] [c00000000020d6c0] __lock_acquire+0x1110/0x1c70
[    0.539086] [c0000000feb03320] [c00000000020f080] lock_acquire+0x240/0x290
[    0.539180] [c0000000feb033e0] [c00000000017f554] cpus_read_lock+0x64/0xf0
[    0.539273] [c0000000feb03420] [c00000000029ebac] stop_machine+0x2c/0x60     
[    0.539367] [c0000000feb03460] [c0000000000d7f7c] pseries_lpar_resize_hpt+0x19c/0x2c0
[    0.539479] [c0000000feb03500] [c0000000000788d0] resize_hpt_for_hotplug+0x70/0xd0
[    0.539590] [c0000000feb03570] [c000000000e5d278] arch_add_memory+0x58/0xfc
[    0.539683] [c0000000feb03610] [c0000000003553a8] devm_memremap_pages+0x5e8/0x8f0
[    0.539804] [c0000000feb036c0] [c0000000009c2394] pmem_attach_disk+0x764/0x830    
[    0.539916] [c0000000feb037d0] [c0000000009a7c38] nvdimm_bus_probe+0x118/0x240
[    0.540026] [c0000000feb03860] [c000000000968500] really_probe+0x230/0x4b0
[    0.540119] [c0000000feb038f0] [c000000000968aec] driver_probe_device+0x16c/0x1e0
[    0.540230] [c0000000feb03970] [c000000000968ca8] __driver_attach+0x148/0x1b0
[    0.540340] [c0000000feb039f0] [c0000000009650b0] bus_for_each_dev+0x90/0x130
[    0.540451] [c0000000feb03a50] [c000000000967dd4] driver_attach+0x34/0x50
[    0.540544] [c0000000feb03a70] [c000000000967068] bus_add_driver+0x1a8/0x360
[    0.540654] [c0000000feb03b00] [c00000000096a498] driver_register+0x108/0x170
[    0.540766] [c0000000feb03b70] [c0000000009a7400] __nd_driver_register+0xd0/0xf0
[    0.540898] [c0000000feb03bd0] [c00000000128aa90] nd_pmem_driver_init+0x34/0x48
[    0.541010] [c0000000feb03bf0] [c000000000010a10] do_one_initcall+0x1e0/0x45c
[    0.541122] [c0000000feb03cd0] [c00000000122462c] kernel_init_freeable+0x540/0x64c          
[    0.541232] [c0000000feb03db0] [c00000000001110c] kernel_init+0x2c/0x160
[    0.541326] [c0000000feb03e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68


> 
> >   other info that might help us debug this:
> >    Possible unsafe locking scenario:
> >
> >          CPU0
> >          ----
> >     lock(cpu_hotplug_lock.rw_sem);
> >     lock(cpu_hotplug_lock.rw_sem);
> >
> >    *** DEADLOCK ***
> >
> > Fix this issue by
> >   1) Requiring all the calls to pseries_lpar_resize_hpt() be made
> >      with cpu_hotplug_lock held.
> >
> >   2) In pseries_lpar_resize_hpt() invoke stop_machine_cpuslocked()
> >      as a consequence of 1)
> >
> >   3) To satisfy 1), in hpt_order_set(), call mmu_hash_ops.resize_hpt()
> >      with cpu_hotplug_lock held.
> >
> > Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > ---
> >
> > Rebased this one against powerpc/next instead of linux/master.
> >
> >  arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
> >  arch/powerpc/platforms/pseries/lpar.c | 8 ++++++--
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> > index 919a861..d07fcafd 100644
> > --- a/arch/powerpc/mm/book3s64/hash_utils.c
> > +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> > @@ -38,6 +38,7 @@
> >  #include <linux/libfdt.h>
> >  #include <linux/pkeys.h>
> >  #include <linux/hugetlb.h>
> > +#include <linux/cpu.h>
> >  
> >  #include <asm/debugfs.h>
> >  #include <asm/processor.h>
> > @@ -1928,10 +1929,16 @@ static int hpt_order_get(void *data, u64 *val)
> >  
> >  static int hpt_order_set(void *data, u64 val)
> >  {
> > +	int ret;
> > +
> >  	if (!mmu_hash_ops.resize_hpt)
> >  		return -ENODEV;
> >  
> > -	return mmu_hash_ops.resize_hpt(val);
> > +	cpus_read_lock();
> > +	ret = mmu_hash_ops.resize_hpt(val);
> > +	cpus_read_unlock();
> > +
> > +	return ret;
> >  }
> >  
> >  DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n");
> > diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> > index 1034ef1..2fc9756 100644
> > --- a/arch/powerpc/platforms/pseries/lpar.c
> > +++ b/arch/powerpc/platforms/pseries/lpar.c
> > @@ -859,7 +859,10 @@ static int pseries_lpar_resize_hpt_commit(void *data)
> >  	return 0;
> >  }
> >  
> > -/* Must be called in user context */
> > +/*
> > + * Must be called in user context. The caller should hold the
> 
> I realise you're just copying that comment, but it seems wrong. "user
> context" means userspace. I think it means "process context" doesn't it?
>

Yes, from the qemu process context. I will fix this part of the
comment and also change the should to must.

> Also "should" should be "must" :)
>

Thanks for the review.


> > + * cpus_lock.
> > + */
> >  static int pseries_lpar_resize_hpt(unsigned long shift)
> >  {
> >  	struct hpt_resize_state state = {
> > @@ -913,7 +916,8 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
> >  
> >  	t1 = ktime_get();
> >  
> > -	rc = stop_machine(pseries_lpar_resize_hpt_commit, &state, NULL);
> > +	rc = stop_machine_cpuslocked(pseries_lpar_resize_hpt_commit,
> > +				     &state, NULL);
> >  
> >  	t2 = ktime_get();
> 
> cheers
> 

