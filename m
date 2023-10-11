Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F697C4821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 05:06:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuxUElH9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuxUElH9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4yN80Dxgz3c5c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 14:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuxUElH9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MuxUElH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4yMD3bDfz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 14:05:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696993540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvOLEprUT3mwclaqpVcqIEF1+DoeNmmz2gHww9Z9kLg=;
	b=MuxUElH9lvPbYN59FRyoQU7xeurgFAM29Poks5V/yMTQ7iXRZ/Un3Pj87PiiuRdl2llE1O
	FxQpv8c8y2rleu3PfVx8V1dDrxf0S4NQcgc4vT/7JwbNQfhFtqtZ7/q1R2x1pCYXrh9MmP
	I8FnhRaVj+qyiBuKdm2zYEj6FO0Tfok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696993540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AvOLEprUT3mwclaqpVcqIEF1+DoeNmmz2gHww9Z9kLg=;
	b=MuxUElH9lvPbYN59FRyoQU7xeurgFAM29Poks5V/yMTQ7iXRZ/Un3Pj87PiiuRdl2llE1O
	FxQpv8c8y2rleu3PfVx8V1dDrxf0S4NQcgc4vT/7JwbNQfhFtqtZ7/q1R2x1pCYXrh9MmP
	I8FnhRaVj+qyiBuKdm2zYEj6FO0Tfok=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-ss5hYIS7PfysupHzS3n9rA-1; Tue, 10 Oct 2023 23:05:36 -0400
X-MC-Unique: ss5hYIS7PfysupHzS3n9rA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B969C3C0DF84;
	Wed, 11 Oct 2023 03:05:35 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8A6492C3E;
	Wed, 11 Oct 2023 03:05:31 +0000 (UTC)
Date: Wed, 11 Oct 2023 11:05:26 +0800
From: Pingfan Liu <piliu@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid
 greater than nr_cpus
Message-ID: <ZSYQ9odHpQDWN5ca@piliu.users.ipa.redhat.com>
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-4-piliu@redhat.com>
 <8216e3e3-8475-158f-dc79-1b5ba1032150@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <8216e3e3-8475-158f-dc79-1b5ba1032150@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 01:56:13PM +0530, Hari Bathini wrote:
> 
> 
> On 09/10/23 5:00 pm, Pingfan Liu wrote:
> > If the boot_cpuid is smaller than nr_cpus, it requires extra effort to
> > ensure the boot_cpu is in cpu_present_mask. This can be achieved by
> > reserving the last quota for the boot cpu.
> > 
> > Note: the restriction on nr_cpus will be lifted with more effort in the
> > successive patches
> > 
> > Signed-off-by: Pingfan Liu <piliu@redhat.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> > Cc: Wen Xiong <wenxiong@linux.ibm.com>
> > Cc: Baoquan He <bhe@redhat.com>
> > Cc: Ming Lei <ming.lei@redhat.com>
> > Cc: kexec@lists.infradead.org
> > To: linuxppc-dev@lists.ozlabs.org
> > ---
> >   arch/powerpc/kernel/setup-common.c | 25 ++++++++++++++++++++++---
> >   1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> > index 81291e13dec0..f9ef0a2666b0 100644
> > --- a/arch/powerpc/kernel/setup-common.c
> > +++ b/arch/powerpc/kernel/setup-common.c
> > @@ -454,8 +454,8 @@ struct interrupt_server_node {
> >   void __init smp_setup_cpu_maps(void)
> >   {
> >   	struct device_node *dn;
> > -	int shift = 0, cpu = 0;
> > -	int j, nthreads = 1;
> > +	int terminate, shift = 0, cpu = 0;
> > +	int j, bt_thread = 0, nthreads = 1;
> >   	int len;
> >   	struct interrupt_server_node *intserv_node, *n;
> >   	struct list_head *bt_node, head;
> > @@ -518,6 +518,7 @@ void __init smp_setup_cpu_maps(void)
> >   			for (j = 0 ; j < nthreads; j++) {
> >   				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
> >   					bt_node = &intserv_node->node;
> > +					bt_thread = j;
> >   					found_boot_cpu = true;
> >   					/*
> >   					 * Record the round-shift between dt
> > @@ -537,11 +538,21 @@ void __init smp_setup_cpu_maps(void)
> >   	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
> >   	list_add_tail(&head, bt_node);
> >   	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
> > +	terminate = nr_cpu_ids;
> >   	list_for_each_entry(intserv_node, &head, node) {
> > +		j = 0;
> 
> > +		/* Choose a start point to cover the boot cpu */
> > +		if (nr_cpu_ids - 1 < bt_thread) {
> > +			/*
> > +			 * The processor core puts assumption on the thread id,
> > +			 * not to breach the assumption.
> > +			 */
> > +			terminate = nr_cpu_ids - 1;
> 
> nthreads is anyway assumed to be same for all cores. So, enforcing
> nr_cpu_ids to a minimum of nthreads (and multiple of nthreads) should
> make the code much simpler without the need for above check and the
> other complexities addressed in the subsequent patches...
> 

Indeed, this series can be splited into two partsk, [1-2/5] and [3-5/5].
In [1-2/5], if smaller, the nr_cpu_ids is enforced to be equal to
nthreads. I will make it align upward on nthreads in the next version.
So [1-2/5] can be totally independent from the rest patches in this
series.


From an engineer's perspective, [3-5/5] are added to maintain the
nr_cpus semantics. (Finally, nr_cpus=1 can be achieved but requiring
effort on other subsystem)


Testing result on my Power9 machine with SMT=4

-1. taskset -c 4 bash -c 'echo c > /proc/sysrq-trigger'

kdump:/# cat /proc/meminfo | grep Percpu
Percpu:              896 kB
kdump:/# cat /sys/devices/system/cpu/possible
0


-2. taskset -c 5 bash -c 'echo c > /proc/sysrq-trigger'

kdump:/# cat /proc/meminfo | grep Percpu
Percpu:             1792 kB
kdump:/# cat /sys/devices/system/cpu/possible
0-1



-3. taskset -c 6 bash -c 'echo c > /proc/sysrq-trigger'

kdump:/# cat /proc/meminfo | grep Percpu
Percpu:             1792 kB
kdump:/# cat /sys/devices/system/cpu/possible
0,2


-4. taskset -c 7 bash -c 'echo c > /proc/sysrq-trigger'

kdump:/# cat /proc/meminfo | grep Percpu
Percpu:             1792 kB
kdump:/# cat /sys/devices/system/cpu/possible
0,3


Thanks,
Pingfan



