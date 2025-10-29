Return-Path: <linuxppc-dev+bounces-13481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D1C1830F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 04:37:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxCbd6t4kz3btw;
	Wed, 29 Oct 2025 14:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761709021;
	cv=none; b=PFSEmoq8X/5SjGWUG6PWqXC2sJBo0hMN5nwss4Mlc9HFuTZSnI9/yKpUe/DH/NXMDNtLv5rqA5DJEwRNQkPlI7uf+7lMyHcbR5x34jIkPo9rTmOZFwkic8lgZblM4ikSDLtoOBBi44BWudeLlfVov5X4ilaCq+ptYLPqYkLCc+HAO/1CgQQ3Nvtev8l2c2iwsK2XDFiwz19031/nf9W1/zyn/cOCyUCUJd6pAu4NyJO1Wtn3vJqM1o6mYEYsXszJiQ/uY5Szbw7FsajFPlloIvQ1OnJ3Pak3a9PBLI5aRmREzuybYUNq+78oHZHrDL5dYE3EMFagMDVYbNoBj8zwEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761709021; c=relaxed/relaxed;
	bh=QzMvpTHaJmVKbIXvoFw0cw6ZziWr5DOyEsikXtCGN78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0yoLpyKqrvnRNFMAJ5XlELuEoeNyU3gJ1a85NzJB9Fj7qpQvRnI4nkHPzEzlEL1T8Ma3BqvqPOZUZG5VRfiyrVxvcLDFwMwGDmCnQ1z2/huaGyMjIjxVtNt7AZZnii4C+rJpcxNIf2j1le5mXdlqWFr9hgnxVg3jAIEaqNWyNEhzatvZ3hoUujvpJOw/UVdmUcxknLFfUbWeunFLV2z2KsnPdWcb1SRtGkFlj+P8joChuSjbvaZkbVSPiUpPi850OAOCT6Ku9hvatpwCMyTctq1VV8VT8DfUxcsdYTHJHHbHQJh2mkEQoB520r1XcXe2Z+Dj1Zj4GnWa8L/ROocSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zja2bjye; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zja2bjye;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxCbc6vF1z3btg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 14:37:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59SNNCWH005139;
	Wed, 29 Oct 2025 03:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=QzMvpTHaJmVKbIXvoFw0cw6ZziWr5D
	OyEsikXtCGN78=; b=Zja2bjyejZsSyWZU0YbnY+z2mr+9BRh6vlNvXfIw56P4Mm
	0sjNDYDdovzSqLzkL/L/GfyF4OnGDdiMnt6iIfLbPccCGN25PFKaRRgV5r3tjOkZ
	Mi1C2Td78Jnvy8QafBojMaK8eWJcmyxVeAuQRxk5A5t80IKkvCFRxYTEX8b795W4
	kmD4SRCo6wfW/bm4SrLO0H36El5KJK8ir5oURJ5ALSAkshleyZcqNMhmwtjYp2LZ
	4Ur1KBUbax30eJtCrlPLbfkedtUefH8XpVXNXLVBb4NWCMM2gQcwjueZoiR3mIBI
	+DWCHylNIARRxe8ASetpgHZicDrvZPPOUzQ3gbiw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34ajh6v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 03:36:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59T3ajCS008179;
	Wed, 29 Oct 2025 03:36:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34ajh6v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 03:36:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T02Xwo019157;
	Wed, 29 Oct 2025 03:36:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33xy1f7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 03:36:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59T3ae1m60883382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 03:36:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43D5520043;
	Wed, 29 Oct 2025 03:36:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D331420040;
	Wed, 29 Oct 2025 03:36:39 +0000 (GMT)
Received: from localhost (unknown [9.43.31.117])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Oct 2025 03:36:39 +0000 (GMT)
Date: Wed, 29 Oct 2025 09:06:38 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/kexec: Enable SMT before waking offline CPUs
Message-ID: <knhs5gainynhozku6kb2ygxy63gyy73sbnqg3vcizk45oatzry@uig2z3mlux5u>
References: <20251025080512.85690-1-nysal@linux.ibm.com>
 <20251028105516.26258-1-nysal@linux.ibm.com>
 <f19a9080-8d6d-492b-b5de-88f24ce5c015@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f19a9080-8d6d-492b-b5de-88f24ce5c015@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=69018bcd cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pdyEjUt-03yZH7Vt8f0A:9 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: qGox9TmZr_I6z2dz0QchiiIJ8wqnTGgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX22qf3S+UnQPN
 So4IyXKzEu1wspyocduwEdhAEGFLdlo51zS10xNVniKwDVmrfQVQTBRxIDe45Fp2JZoUc9V4KyK
 WDov73i8L/xRVe8349Vpn2AKUM0WWaEVHp6Ss0YcsNcR8i2bzQhfROm3Mr6hx3tCxLSNytuAOdu
 GKtfd3TRWEKD71KAcfj/48sObrZy51dlRM4/iOQu+iU+cnP+R+KnuoyMIsnYE3CqlcXqGVcbgKl
 Y3I8FpKN82HHkxHw/TH/wrhZe1XmXxrgXJNNJyhs6yTp4GeG52SmRQOy06vpagvDudThhvY6Wuh
 OFkVjdu3q759X7ZXw2Jgt8zuS3l40+9Lqi9HgS4SFJAHixDTTrWk3sE6vkyuewRJnHEWW/JXp6E
 f0NHcYnexMButBwO7mm+zfnTnPsvpQ==
X-Proofpoint-ORIG-GUID: jQY3FGIrBfmGOWdrz3YpfNC3vzFNxcKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

hi Shrikanth,

On Tue, Oct 28, 2025 at 10:56:05PM +0530, Shrikanth Hegde wrote:
> Hi Nysal.
> 
> On 10/28/25 4:25 PM, Nysal Jan K.A. wrote:

[snip]

> > --- a/arch/powerpc/kexec/core_64.c
> > +++ b/arch/powerpc/kexec/core_64.c
> > @@ -202,6 +202,23 @@ static void kexec_prepare_cpus_wait(int wait_state)
> >   	mb();
> >   }
> > +
> > +/*
> > + * The add_cpu() call in wake_offline_cpus() can fail as cpu_bootable()
> > + * returns false for CPUs that fail the cpu_smt_thread_allowed() check
> > + * or non primary threads if SMT is disabled. Re-enable SMT and set the
> > + * number of SMT threads to threads per core.
> > + */
> > +static void kexec_smt_reenable(void)
> > +{
> > +#if defined(CONFIG_SMP) && defined(CONFIG_HOTPLUG_SMT)
> > +	lock_device_hotplug();
> 
> I was looking at usage of lock_device_hotplug, looks like a good candidate for
> guard() use case. Could be done on its own patch/series.
> 

Agree, we can look at it as a separate patch.

> > +	cpu_smt_num_threads = threads_per_core;
> > +	cpu_smt_control = CPU_SMT_ENABLED;
> > +	unlock_device_hotplug();
> > +#endif
> > +}
> 
> 
> Will this work too? It might be better since we anyway going to bring that CPU up
> by doing add_cpu afterwords.
> 
> 	cpu_smt_num_threads = threads_per_core;
> 	cpuhp_smt_enable()
> 

There is some reasoning in 4d37cc2dc3df, which made the switch to use the core
device API, against calling cpu_up() directly. The other issue is 
cpuhp_smt_enable() can skip bringing up a CPU in certain cases, for example
when a core is offline.

> > +
> >   /*
> >    * We need to make sure each present CPU is online.  The next kernel will scan
> >    * the device tree and assume primary threads are online and query secondary
> > @@ -216,6 +233,8 @@ static void wake_offline_cpus(void)
> >   {
> >   	int cpu = 0;
> > +	kexec_smt_reenable();
> > +
> 
> If we do above, just change the below logic to complain if any present CPU is offline.
> 
> >   	for_each_present_cpu(cpu) {
> >   		if (!cpu_online(cpu)) {
> >   			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",
> 

Thanks for the review.

--Nysal

