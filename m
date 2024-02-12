Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD8085180E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 16:33:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0k2ZM5Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYT4h2wkXz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 02:33:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0k2ZM5Z;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYT3y4bJBz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 02:32:46 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TYT3x5MkTz4wcN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 02:32:45 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TYT3x5J8vz4wcY; Tue, 13 Feb 2024 02:32:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e0k2ZM5Z;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TYT3x2q9cz4wcN
	for <linuxppc-dev@ozlabs.org>; Tue, 13 Feb 2024 02:32:44 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CFHNwc015762;
	Mon, 12 Feb 2024 15:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : content-transfer-encoding : mime-version; s=pp1;
 bh=5BrIjQXz6R8yZ9nyeJ8MLKCtrYJNTbQTApVo71+ZAp8=;
 b=e0k2ZM5ZleGcdOiTyrQaPvu0hS8bvJ/HVmJYxMDeBcO02r0wO8spp//yKpW6ohc5Pwgd
 vfG4rnqk6PrTowl+zas6CQ1cB+rpEEOxcNcn/CuiMTn5CZGzy5b5pJzKiBr0UEWZNIFK
 7Q3ixZ7EFAg5LRvCKfd2XMU+tCl4kq2BB7rCltZbMJNuuMQqlmW4U1ibdutiZt2bu7SE
 9xtpOGTsNKDsgYhwuaPuagezuR4TKaKlTdgtACXOYBvW8O0/KvlsBOhtvnqyxX1qfRpC
 FgtjHQ0oH1H58SgMi6HASpzIAvcmGoSJT+dwoAOnHAbNbNuGDAXFHjNboG3U71KO61hV 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7nua0f0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 15:32:39 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CFPNHR006439;
	Mon, 12 Feb 2024 15:32:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w7nua0eyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 15:32:38 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41CD2Y9Z004297;
	Mon, 12 Feb 2024 15:32:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6kv01hx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 15:32:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41CFWWKq51118386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 15:32:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 409CA2004B;
	Mon, 12 Feb 2024 15:32:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8EEF20040;
	Mon, 12 Feb 2024 15:32:30 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.16.247])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 Feb 2024 15:32:30 +0000 (GMT)
Date: Mon, 12 Feb 2024 21:02:28 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Re: [PATCH v2] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Message-ID: <vskjoo3vkwxshilehbsljocubpdswuanehbqvaljhea6joejew@m7pgm2eksxew>
References: <20240205053647.1763446-1-mahesh@linux.ibm.com>
 <6d1460a3-7a2f-4e43-a3da-d5dfd4e26bf7@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <6d1460a3-7a2f-4e43-a3da-d5dfd4e26bf7@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G7KQJhEQaTPQl6zTXByRbLJ58hxGUkM9
X-Proofpoint-ORIG-GUID: rELeqKfe6XphKR28MEi9zZc4Dnu7vMjk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_12,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402120117
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
Cc: = linuxppc-dev <linuxppc-dev@ozlabs.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-02-12 08:06:25 Mon, Christophe Leroy wrote:
> 
> 
> Le 05/02/2024 à 06:36, Mahesh Salgaonkar a écrit :
> > [Vous ne recevez pas souvent de courriers de mahesh@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
> > crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
> > interrupt handler) if percpu allocation comes from vmalloc area.
> > 
> > Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
> > wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
> > percpu allocation is from the embedded first chunk. However with
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
> > allocation can come from the vmalloc area.
> > 
> > With kernel command line "percpu_alloc=page" we can force percpu allocation
> > to come from vmalloc area and can see kernel crash in machine_check_early:
> > 
> > [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
> > [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
> > [    1.215719] --- interrupt: 200
> > [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
> > [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
> > [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
> > 
> > Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
> > first chunk is not embedded.
> > 
> > Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > ---
> > Changes in v2:
> > - Rebase to upstream master
> > - Use jump_labels, if CONFIG_JUMP_LABEL is enabled, to avoid redoing the
> >    test at each interrupt entry.
> > - v1 is at https://lore.kernel.org/linuxppc-dev/164578465828.74956.6065296024817333750.stgit@jupiter/
> > ---
> >   arch/powerpc/include/asm/interrupt.h | 14 ++++++++++++++
> >   arch/powerpc/include/asm/percpu.h    | 11 +++++++++++
> >   arch/powerpc/kernel/setup_64.c       | 12 ++++++++++++
> >   3 files changed, 37 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > index a4196ab1d0167..3b4e17c23d9a9 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -336,6 +336,16 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
> >          if (IS_ENABLED(CONFIG_KASAN))
> >                  return;
> > 
> > +       /*
> > +        * Likewise, do not use it in real mode if percpu first chunk is not
> > +        * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> > +        * are chances where percpu allocation can come from vmalloc area.
> > +        */
> > +#ifdef CONFIG_PPC64
> 
> Instead of adding this #ifdef in middle of code, could you define 
> is_embed_first_chunk as always 'true' when CONFIG_PPC64 is not defined ?

Will fix this in v3.

[...]
> > diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> > index 2f19d5e944852..674b6e1bebe9a 100644
> > --- a/arch/powerpc/kernel/setup_64.c
> > +++ b/arch/powerpc/kernel/setup_64.c
> > @@ -834,6 +834,11 @@ static __init int pcpu_cpu_to_node(int cpu)
> > 
> >   unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
> >   EXPORT_SYMBOL(__per_cpu_offset);
> > +#ifdef CONFIG_JUMP_LABEL
> 
> Why this ifdef ? Even when CONFIG_JUMP_LABEL is not selected all this 
> should just work fine.

Yes you are right. I overlooked this. Will fix it in next revision.

Thanks for your review.

-- 
Mahesh J Salgaonkar
