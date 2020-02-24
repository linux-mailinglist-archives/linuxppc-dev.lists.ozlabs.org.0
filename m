Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAB169D6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:16:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qqzx1wD8zDqL9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:16:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qqxs6PPfzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:14:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O59OVR104331; Mon, 24 Feb 2020 00:14:52 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb008u7tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 00:14:52 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01O55Lii000437;
 Mon, 24 Feb 2020 05:14:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2yaux6cwwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 05:14:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O5EoBr53739956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 05:14:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 041AF13605D;
 Mon, 24 Feb 2020 05:14:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B212A136053;
 Mon, 24 Feb 2020 05:14:49 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.26])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 05:14:49 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 039B82E2F59; Mon, 24 Feb 2020 10:44:48 +0530 (IST)
Date: Mon, 24 Feb 2020 10:44:47 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 4/5] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
Message-ID: <20200224051447.GC12846@in.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-5-git-send-email-ego@linux.vnet.ibm.com>
 <87eeunubp7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eeunubp7.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-23_07:2020-02-21,
 2020-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240043
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
 Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 21, 2020 at 10:50:12AM -0600, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> > index 80a676d..5b4b450 100644
> > --- a/arch/powerpc/kernel/sysfs.c
> > +++ b/arch/powerpc/kernel/sysfs.c
> > @@ -19,6 +19,7 @@
> >  #include <asm/smp.h>
> >  #include <asm/pmc.h>
> >  #include <asm/firmware.h>
> > +#include <asm/idle.h>
> >  #include <asm/svm.h>
> >  
> >  #include "cacheinfo.h"
> > @@ -733,6 +734,42 @@ static void create_svm_file(void)
> >  }
> >  #endif /* CONFIG_PPC_SVM */
> >  
> > +static void read_idle_purr(void *val)
> > +{
> > +	u64 *ret = (u64 *)val;
> 
> No cast from void* needed.

Will fix this. Thanks.

> 
> 
> > +
> > +	*ret = read_this_idle_purr();
> > +}
> > +
> > +static ssize_t idle_purr_show(struct device *dev,
> > +			      struct device_attribute *attr, char *buf)
> > +{
> > +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> > +	u64 val;
> > +
> > +	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
> > +	return sprintf(buf, "%llx\n", val);
> > +}
> > +static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
> > +
> > +static void read_idle_spurr(void *val)
> > +{
> > +	u64 *ret = (u64 *)val;
> > +
> > +	*ret = read_this_idle_spurr();
> > +}
> > +
> > +static ssize_t idle_spurr_show(struct device *dev,
> > +			       struct device_attribute *attr, char *buf)
> > +{
> > +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> > +	u64 val;
> > +
> > +	smp_call_function_single(cpu->dev.id, read_idle_spurr, &val, 1);
> > +	return sprintf(buf, "%llx\n", val);
> > +}
> > +static DEVICE_ATTR(idle_spurr, 0400, idle_spurr_show, NULL);
> 
> It's regrettable that we have to wake up potentially idle CPUs in order
> to derive correct idle statistics for them, but I suppose the main user
> (lparstat) of these interfaces already is causing this to happen by
> polling the existing per-cpu purr and spurr attributes.
> 
> So now lparstat will incur at minimum four syscalls and four IPIs per
> CPU per polling interval -- one for each of purr, spurr, idle_purr and
> idle_spurr. Correct?

Yes, it is unforunate that we will end up making four syscalls and
generating IPI noise, and this is something that I discussed with
Naveen and Kamalesh. We have the following two constraints:

1) These values of PURR and SPURR required are per-cpu. Hence putting
them in lparcfg is not an option.

2) sysfs semantics encourages a single value per key, the key being
the sysfs-file. Something like the following would have made far more
sense.

cat /sys/devices/system/cpu/cpuX/purr_spurr_accounting
purr:A
idle_purr:B
spurr:C
idle_spurr:D

There are some sysfs files which allow something like this. Eg: 
/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state

Thoughts on any other alternatives?


> 
> At some point it's going to make sense to batch sampling of remote CPUs'
> SPRs.
> 
> 
> >  static int register_cpu_online(unsigned int cpu)
> >  {
> >  	struct cpu *c = &per_cpu(cpu_devices, cpu);
> > @@ -794,10 +831,15 @@ static int register_cpu_online(unsigned int cpu)
> >  		if (!firmware_has_feature(FW_FEATURE_LPAR))
> >  			add_write_permission_dev_attr(&dev_attr_purr);
> >  		device_create_file(s, &dev_attr_purr);
> > +		if (firmware_has_feature(FW_FEATURE_LPAR))
> > +			device_create_file(s, &dev_attr_idle_purr);
> >  	}
> >  
> > -	if (cpu_has_feature(CPU_FTR_SPURR))
> > +	if (cpu_has_feature(CPU_FTR_SPURR)) {
> >  		device_create_file(s, &dev_attr_spurr);
> > +		if (firmware_has_feature(FW_FEATURE_LPAR))
> > +			device_create_file(s, &dev_attr_idle_spurr);
> > +	}
> >  
> >  	if (cpu_has_feature(CPU_FTR_DSCR))
> >  		device_create_file(s, &dev_attr_dscr);
> > @@ -879,11 +921,17 @@ static int unregister_cpu_online(unsigned int cpu)
> >  	if (cpu_has_feature(CPU_FTR_MMCRA))
> >  		device_remove_file(s, &dev_attr_mmcra);
> >  
> > -	if (cpu_has_feature(CPU_FTR_PURR))
> > +	if (cpu_has_feature(CPU_FTR_PURR)) {
> >  		device_remove_file(s, &dev_attr_purr);
> > +		if (firmware_has_feature(FW_FEATURE_LPAR))
> > +			device_remove_file(s, &dev_attr_idle_purr);
> > +	}
> >  
> > -	if (cpu_has_feature(CPU_FTR_SPURR))
> > +	if (cpu_has_feature(CPU_FTR_SPURR)) {
> >  		device_remove_file(s, &dev_attr_spurr);
> > +		if (firmware_has_feature(FW_FEATURE_LPAR))
> > +			device_remove_file(s, &dev_attr_idle_spurr);
> > +	}
> >  
> >  	if (cpu_has_feature(CPU_FTR_DSCR))
> >  		device_remove_file(s, &dev_attr_dscr);
> 
> The cpu register/unregister stuff here looks correct.

Thanks for reviewing the patch.

--
Thanks and Regards
gautham.
