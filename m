Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8F3792056
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 07:04:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxzYfISo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxzYfISo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfthN2KrQz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 15:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxzYfISo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AxzYfISo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RftgR6J4bz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 15:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693890191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QF++iXxEZpFrQCnUt3ZrjX7wcQsJCw0Lcgs8IhL6Xus=;
	b=AxzYfISoEu17fCftaFqDG0vjpLHEVF7YF02GnFWWAKF+3b8stvDNlKV1azCdSqUdXMHhJz
	tiA0yoH3rd9eR8XB+Mn5yDExnBzyzrWTm6+dtSX9j0TQGkvs+3hOa1VO3dVDED5EVQLTY/
	4JP4fHSZLXHBXRk+YbNfMxsphUOWMYs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693890191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QF++iXxEZpFrQCnUt3ZrjX7wcQsJCw0Lcgs8IhL6Xus=;
	b=AxzYfISoEu17fCftaFqDG0vjpLHEVF7YF02GnFWWAKF+3b8stvDNlKV1azCdSqUdXMHhJz
	tiA0yoH3rd9eR8XB+Mn5yDExnBzyzrWTm6+dtSX9j0TQGkvs+3hOa1VO3dVDED5EVQLTY/
	4JP4fHSZLXHBXRk+YbNfMxsphUOWMYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-4rUGPEBPMYipOttOl5wP7g-1; Tue, 05 Sep 2023 01:03:06 -0400
X-MC-Unique: 4rUGPEBPMYipOttOl5wP7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B587B1817904;
	Tue,  5 Sep 2023 05:03:05 +0000 (UTC)
Received: from localhost (unknown [10.72.113.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B496340C6CCC;
	Tue,  5 Sep 2023 05:03:04 +0000 (UTC)
Date: Tue, 5 Sep 2023 13:03:01 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH V3 01/14] blk-mq: add blk_mq_max_nr_hw_queues()
Message-ID: <ZPa2hbRQUdFRNqr9@MiWiFi-R3L-srv>
References: <20230808104239.146085-1-ming.lei@redhat.com>
 <20230808104239.146085-2-ming.lei@redhat.com>
 <20230809134401.GA31852@lst.de>
 <ZNQqt1C0pXspGl3d@fedora>
 <ZNQ64xhCIBU6XM/5@MiWiFi-R3L-srv>
 <ZNRGNsRzEJfzUEzH@fedora>
 <ZNRTGrRuwf69EgnE@MiWiFi-R3L-srv>
 <772c4140-3035-16d8-0253-f5893c3698e2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <772c4140-3035-16d8-0253-f5893c3698e2@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K . Petersen" <martin.petersen@oracle.com>, Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, Keith Busch <kbusch@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari, Michael

On 08/11/23 at 01:23pm, Hari Bathini wrote:
> 
> 
> On 10/08/23 8:31 am, Baoquan He wrote:
> > On 08/10/23 at 10:06am, Ming Lei wrote:
> > > On Thu, Aug 10, 2023 at 09:18:27AM +0800, Baoquan He wrote:
> > > > On 08/10/23 at 08:09am, Ming Lei wrote:
> > > > > On Wed, Aug 09, 2023 at 03:44:01PM +0200, Christoph Hellwig wrote:
> > > > > > I'm starting to sound like a broken record, but we can't just do random
> > > > > > is_kdump checks, and it's not going to get better by resending it again and
> > > > > > again.  If kdump kernels limit the number of possible CPUs, it needs to
> > > > > > reflected in cpu_possible_map and we need to use that information.
> > > > > > 
> > > > > 
> > > > > Can you look at previous kdump/arch guys' comment about kdump usage &
> > > > > num_possible_cpus?
> > > > > 
> > > > >      https://lore.kernel.org/linux-block/CAF+s44RuqswbosY9kMDx35crviQnxOeuvgNsuE75Bb0Y2Jg2uw@mail.gmail.com/
> > > > >      https://lore.kernel.org/linux-block/ZKz912KyFQ7q9qwL@MiWiFi-R3L-srv/
> > > > > 
> > > > > The point is that kdump kernels does not limit the number of possible CPUs.
> > > > > 
> > > > > 1) some archs support 'nr_cpus=1' for kdump kernel, which is fine, since
> > > > > num_possible_cpus becomes 1.
> > > > 
> > > > Yes, "nr_cpus=" is strongly suggested in kdump kernel because "nr_cpus="
> > > > limits the possible cpu numbers, while "maxcpuss=" only limits the cpu
> > > > number which can be brought up during bootup. We noticed this diference
> > > > because a large number of possible cpus will cost more memory in kdump
> > > > kernel. e.g percpu initialization, even though kdump kernel have set
> > > > "maxcpus=1".
> > > > 
> > > > Currently x86 and arm64 all support "nr_cpus=". Pingfan ever spent much
> > > > effort to make patches to add "nr_cpus=" support to ppc64, seems ppc64
> > > > dev and maintainers do not care about it. Finally the patches are not
> > > > accepted, and the work is not continued.
> > > > 
> > > > Now, I am wondering what is the barrier to add "nr_cpus=" to power ach.
> > > > Can we reconsider adding 'nr_cpus=' to power arch since real issue
> > > > occurred in kdump kernel?
> > > 
> > > If 'nr_cpus=' can be supported on ppc64, this patchset isn't needed.
> > > 
> > > > 
> > > > As for this patchset, it can be accpeted so that no failure in kdump
> > > > kernel is seen on ARCHes w/o "nr_cpus=" support? My personal opinion.
> > > 
> > > IMO 'nr_cpus=' support should be preferred, given it is annoying to
> > > maintain two kinds of implementation for kdump kernel from driver
> > > viewpoint. I guess kdump things can be simplified too with supporting
> > > 'nr_cpus=' only.
> > 
> > Yes, 'nr_cpus=' is ideal. Not sure if there's some underlying concerns so
> > that power people decided to not support it.
> 
> Though "nr_cpus=1" is an ideal solution, maintainer was not happy with
> the patch as the code changes have impact for regular boot path and
> it is likely to cause breakages. So, even if "nr_cpus=1" support for
> ppc64 is revived, the change is going to take time to be accepted
> upstream.

I talked to pingfan recently, he said he posted patches to add 'nr_cpus='
support in powerpc in order to reduce memory amount for kdump kernel.
His patches were rejected by maintainer because maintainer thought the
reason is not sufficient. So up to now, in architectures fedora/RHEL
supports to provide default crashkernel reservation value, powerpc costs
most. Now with this emerging issue, can we reconsider supporting
'nr_cpus=' in powerpc?

> 
> Also, I see is_kdump_kernel() being used irrespective of "nr_cpus=1"
> support for other optimizations in the driver for the special dump
> capture environment kdump is.
> 
> If there is no other downside for driver code, to use is_kdump_kernel(),
> other than the maintainability aspect, I think the above changes are
> worth considering.

Hi Hari,

By the way, will you use the ppc specific is_kdump_kernel() and
is_crashdump_kernel() in your patches to fix this issue?

Thanks
Baoquan

