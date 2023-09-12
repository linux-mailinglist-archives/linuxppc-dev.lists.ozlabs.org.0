Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7779CF87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 13:11:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fpTh+3gK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlLWR1zhfz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fpTh+3gK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlLVX3JtTz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 21:11:00 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RlLVW4yCMz4x5h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 21:10:59 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RlLVW4ph8z4x5F; Tue, 12 Sep 2023 21:10:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fpTh+3gK;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RlLVW0wwDz4x3G;
	Tue, 12 Sep 2023 21:10:58 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CB8cpe014308;
	Tue, 12 Sep 2023 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : content-transfer-encoding : mime-version; s=pp1;
 bh=nAFdfzek5QkiuKZxcG7gQzkyH1a2p2SbjMnA86/JyoY=;
 b=fpTh+3gK4rlRYHQ5TCW+p6mtECYJmapLISdRhQlVFKxXB3fS6Dv5lqb9A0o/VnQs2Ibe
 qqaWQHGNWBVYEzpioTcI/Kpk1dHl946nOG00fu/yLKLBdHoGQhrBDL6lLt5HAVSkKXRi
 Mo5JJdPGc0Uwo2WT+i+9aMX9E01WKE4EQDemVNdIObgEbyQmdK1g8kK6BYfU3TsGSsTI
 kxZwTJiM9YIt64X9Q7PNB4l3iIC3CrOJLPb6Hzo1h523WIGOODTGsRDHNLeK/Q/m3Xiw
 M+f8yCD0QS6AyI67A9Y8lWkZ87L1W9GIw0gDhRJeyKcJ3k6QXKUr0W1rHhYdKYNx+L27 JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2p73h27x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:10:54 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38CB92Ye015691;
	Tue, 12 Sep 2023 11:10:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t2p73h276-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:10:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38C8magk002724;
	Tue, 12 Sep 2023 11:05:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hktctm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:05:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38CB5mhV14942850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 11:05:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA3BC20043;
	Tue, 12 Sep 2023 11:05:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1887220040;
	Tue, 12 Sep 2023 11:05:47 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.248.226])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 12 Sep 2023 11:05:46 +0000 (GMT)
Date: Tue, 12 Sep 2023 16:35:44 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [RFC PATCH] powerpc: Make crashing cpu to be discovered first in
 kdump kernel.
Message-ID: <r4zz7mcq4r2drutkgohxo6nm4dh2pgxkqy42fgzjan6pzyz6yz@jcwucxw6lipm>
References: <169402313576.1071869.18233618318394691773.stgit@jupiter>
 <CAFgQCTtKUMxi_8PnX1iK1TSi7Zp8qkKEtoGnQRuPUUaZF+rbdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFgQCTtKUMxi_8PnX1iK1TSi7Zp8qkKEtoGnQRuPUUaZF+rbdA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V1HwEs6sY_JOc8MI7BY5SH78I4XmsoDK
X-Proofpoint-GUID: 8NSqnpgng7Bk3lhnbl7_sKkLl2Cn7oHR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120092
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
Reply-To: mahesh@linux.ibm.com
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Baoquan He <bhe@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Wen Xiong <wenxiong@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-09-11 21:23:42 Mon, Pingfan Liu wrote:
> Hi Mahesh,
> 
> I am not quite sure about fdt, so I skip that part, and leave some
> comments from the kexec view.
> 
> On Thu, Sep 7, 2023 at 1:59 AM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> >
> > The kernel boot parameter 'nr_cpus=' allows one to specify number of
> > possible cpus in the system. In the normal scenario the first cpu (cpu0)
> > that shows up is the boot cpu and hence it gets covered under nr_cpus
> > limit.
> >
> > But this assumption is broken in kdump scenario where kdump kernel after a
> > crash can boot up on an non-zero boot cpu. The paca structure allocation
> > depends on value of nr_cpus and is indexed using logical cpu ids. The cpu
> > discovery code brings up the cpus as they appear sequentially on device
> > tree and assigns logical cpu ids starting from 0. This definitely becomes
> > an issue if boot cpu id > nr_cpus. When this occurs it results into
> >
> > In past there were proposals to fix this by making changes to cpu discovery
> > code to identify non-zero boot cpu and map it to logical cpu 0. However,
> > the changes were very invasive, making discovery code more complicated and
> > risky.
> >
> > Considering that the non-zero boot cpu scenario is more specific to kdump
> > kernel, limiting the changes in panic/crash kexec path would probably be a
> > best approach to have.
> >
> > Hence proposed change is, in crash kexec path, move the crashing cpu's
> > device node to the first position under '/cpus' node, which will make the
> > crashing cpu to be discovered as part of the first core in kdump kernel.
> >
> > In order to accommodate boot cpu for the case where boot_cpuid > nr_cpu_ids,
> > align up the nr_cpu_ids to SMT threads in early_init_dt_scan_cpus(). This
> > will allow kdump kernel to work with nr_cpus=X where X will be aligned up
> > in multiple of SMT threads per core.
> >
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/kexec.h  |    1
> >  arch/powerpc/kernel/prom.c        |   13 ++++
> >  arch/powerpc/kexec/core_64.c      |  128 +++++++++++++++++++++++++++++++++++++
> >  arch/powerpc/kexec/file_load_64.c |    2 -
> >  4 files changed, 143 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> > index a1ddba01e7d13..f5a6f4a1b8eb0 100644
> > --- a/arch/powerpc/include/asm/kexec.h
> > +++ b/arch/powerpc/include/asm/kexec.h
> > @@ -144,6 +144,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
> >  int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
> >                         unsigned long initrd_load_addr,
> >                         unsigned long initrd_len, const char *cmdline);
> > +int add_node_props(void *fdt, int node_offset, const struct device_node *dn);
> >  #endif /* CONFIG_PPC64 */
> >
> >  #endif /* CONFIG_KEXEC_FILE */
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 0b5878c3125b1..c2d4f55042d72 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -322,6 +322,9 @@ static void __init check_cpu_feature_properties(unsigned long node)
> >         }
> >  }
> >
> > +/* align addr on a size boundary - adjust address up */
> > +#define _ALIGN_UP(addr, size)   (((addr)+((size)-1))&(~((typeof(addr))(size)-1)))
> > +
> >  static int __init early_init_dt_scan_cpus(unsigned long node,
> >                                           const char *uname, int depth,
> >                                           void *data)
> > @@ -348,6 +351,16 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
> >
> >         nthreads = len / sizeof(int);
> >
> > +       /*
> > +        * Align nr_cpu_ids to correct SMT value. This will help us to allocate
> > +        * pacas correctly to accomodate boot_cpu != 0 scenario e.g. in kdump
> > +        * kernel the boot cpu can be any cpu between 0 through nthreads.
> > +        */
> > +       if (nr_cpu_ids % nthreads) {
> > +               nr_cpu_ids = _ALIGN_UP(nr_cpu_ids, nthreads);
> 
> It is better to use set_nr_cpu_ids(), which can hide the difference of
> nr_cpus_ids under different kernel configuration.

Yup, I have fixed that in RFC v2 at https://lore.kernel.org/linuxppc-dev/169426331903.1523857.16489366285648613217.stgit@jupiter/

> 
> > +               pr_info("Aligned nr_cpus to SMT=%d, nr_cpu_ids = %d\n", nthreads, nr_cpu_ids);
> > +       }
> > +
> >         /*
> >          * Now see if any of these threads match our boot cpu.
> >          * NOTE: This must match the parsing done in smp_setup_cpu_maps.
> > +
[...]
> >  /* too late to fail here */
> >  void default_machine_kexec(struct kimage *image)
> >  {
> > @@ -341,6 +455,20 @@ void default_machine_kexec(struct kimage *image)
> >                 printk("kexec: Unshared all shared pages.\n");
> >         }
> >
> > +       /*
> > +        * Move the crashing cpus FDT node as the first node under /cpus node.
> > +        * This will make the core (where crashing cpu belongs) to
> > +        * automatically become first core to show up in kdump kernel and
> > +        * crashing cpu as boot cpu within first n threads of that core.
> > +        *
> > +        * Currently this will work with kexec_file_load only.
> > +        *
> > +        * XXX: For kexec_load, change is required in kexec tool to exclude FDT
> > +        * segment from purgatory checksum check.
> > +        */
> > +       if (image->type == KEXEC_TYPE_CRASH && image->file_mode)
> > +               move_crashing_cpu(image);
> > +
> 
> Could "kexec -e" have the same logic? Then nr_cpus can work for both
> "kexec -p" and "kexec -e".

I see that for normal kexec path we always migrate to reboot_cpus
(which is by default is logical cpu 0) before kexec'ing into new kernel.
Hence, the 3rd hunk of this patch which aligns up nr_cpu_ids to nthreads
is enough to support nr_cpus.

However, if someone chooses to change reboot_cpu other than 0, either
through reboot_cpu= kernel parameter or by
"echo cpunum > /sys/kernel/reboot/cpu", then kexec -e will need to move
reboot_cpus fdt node to first position for nr_cpus to work.

Simple way to confirm this is:

$ kexec -l <vmlinux> --initrd=<initrd> --command-line="... nr_cpus=8"
$ echo 8 > /sys/kernel/reboot/cpu
$ kexec -e

Kexec kernel fails to boot.

Will work on changes to make kexec -e to work for nr_cpus in v3.

Thanks for your review.
-Mahesh.

> 
> Thanks,
> 
> Pingfan
> 
> >         paca_ptrs[kexec_paca.paca_index] = &kexec_paca;
> >
> >         setup_paca(&kexec_paca);
> > diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> > index 110d28bede2a7..42d55a19454a7 100644
> > --- a/arch/powerpc/kexec/file_load_64.c
> > +++ b/arch/powerpc/kexec/file_load_64.c
> > @@ -1027,7 +1027,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
> >   *
> >   * Returns 0 on success, negative errno on error.
> >   */
> > -static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
> > +int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
> >  {
> >         int ret = 0;
> >         struct property *pp;
> >
> >

-- 
Mahesh J Salgaonkar
