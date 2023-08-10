Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FF776E4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 05:02:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIqb5lLw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDjXuGgw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLsDR1xL3z3cV2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 13:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KIqb5lLw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RDjXuGgw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLsCY1GZDz3bX2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 13:01:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691636516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=594nXTsTgZOwSIbiFys/fNQ4V66vIHVyVd6OCcJP7n4=;
	b=KIqb5lLwR/htX30FtnnACAuBpsQ/AHrNGKOdUwX5F5K41Dq/BCGuvSjMplVtv5jaIPC8YD
	lF9K4MYsWT6YlUTh1X7a2egoFdlN8aSxJWayVvwWcdVLhn/CT3SaOhdmHgswyDTzwCTjD2
	AIP4rx92nKcUIdlyuGGuQdOoAxMBY+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691636517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=594nXTsTgZOwSIbiFys/fNQ4V66vIHVyVd6OCcJP7n4=;
	b=RDjXuGgwkhk1/J4ymRywEEJXuZ66f6KIk0JS8vbJwmK9hel5Wq9J2YUJIKOmKCvQM18biy
	aB5ozSJNKo6zVmBVFiKG92npIZTWYfMUc9M4mu3k15F41zXJktw0YXG0KvaGNZoTfQjEXL
	G+bFb6pa+qvm9W4+RSl0RSNUJ7aoo3Y=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-462o-o7QOKu_hKQjukBwpw-1; Wed, 09 Aug 2023 23:01:51 -0400
X-MC-Unique: 462o-o7QOKu_hKQjukBwpw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C5D83C01BA8;
	Thu, 10 Aug 2023 03:01:50 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AEB7492C13;
	Thu, 10 Aug 2023 03:01:49 +0000 (UTC)
Date: Thu, 10 Aug 2023 11:01:46 +0800
From: Baoquan He <bhe@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V3 01/14] blk-mq: add blk_mq_max_nr_hw_queues()
Message-ID: <ZNRTGrRuwf69EgnE@MiWiFi-R3L-srv>
References: <20230808104239.146085-1-ming.lei@redhat.com>
 <20230808104239.146085-2-ming.lei@redhat.com>
 <20230809134401.GA31852@lst.de>
 <ZNQqt1C0pXspGl3d@fedora>
 <ZNQ64xhCIBU6XM/5@MiWiFi-R3L-srv>
 <ZNRGNsRzEJfzUEzH@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNRGNsRzEJfzUEzH@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Pingfan Liu <piliu@redhat.com>, Dave Young <dyoung@redhat.com>, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, kexec@lists.infradead.org, Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/10/23 at 10:06am, Ming Lei wrote:
> On Thu, Aug 10, 2023 at 09:18:27AM +0800, Baoquan He wrote:
> > On 08/10/23 at 08:09am, Ming Lei wrote:
> > > On Wed, Aug 09, 2023 at 03:44:01PM +0200, Christoph Hellwig wrote:
> > > > I'm starting to sound like a broken record, but we can't just do random
> > > > is_kdump checks, and it's not going to get better by resending it again and
> > > > again.  If kdump kernels limit the number of possible CPUs, it needs to
> > > > reflected in cpu_possible_map and we need to use that information.
> > > > 
> > > 
> > > Can you look at previous kdump/arch guys' comment about kdump usage &
> > > num_possible_cpus?
> > > 
> > >     https://lore.kernel.org/linux-block/CAF+s44RuqswbosY9kMDx35crviQnxOeuvgNsuE75Bb0Y2Jg2uw@mail.gmail.com/
> > >     https://lore.kernel.org/linux-block/ZKz912KyFQ7q9qwL@MiWiFi-R3L-srv/
> > > 
> > > The point is that kdump kernels does not limit the number of possible CPUs.
> > > 
> > > 1) some archs support 'nr_cpus=1' for kdump kernel, which is fine, since
> > > num_possible_cpus becomes 1.
> > 
> > Yes, "nr_cpus=" is strongly suggested in kdump kernel because "nr_cpus="
> > limits the possible cpu numbers, while "maxcpuss=" only limits the cpu
> > number which can be brought up during bootup. We noticed this diference
> > because a large number of possible cpus will cost more memory in kdump
> > kernel. e.g percpu initialization, even though kdump kernel have set
> > "maxcpus=1". 
> > 
> > Currently x86 and arm64 all support "nr_cpus=". Pingfan ever spent much
> > effort to make patches to add "nr_cpus=" support to ppc64, seems ppc64
> > dev and maintainers do not care about it. Finally the patches are not
> > accepted, and the work is not continued.
> > 
> > Now, I am wondering what is the barrier to add "nr_cpus=" to power ach.
> > Can we reconsider adding 'nr_cpus=' to power arch since real issue
> > occurred in kdump kernel?
> 
> If 'nr_cpus=' can be supported on ppc64, this patchset isn't needed.
> 
> > 
> > As for this patchset, it can be accpeted so that no failure in kdump
> > kernel is seen on ARCHes w/o "nr_cpus=" support? My personal opinion.
> 
> IMO 'nr_cpus=' support should be preferred, given it is annoying to
> maintain two kinds of implementation for kdump kernel from driver
> viewpoint. I guess kdump things can be simplified too with supporting
> 'nr_cpus=' only.

Yes, 'nr_cpus=' is ideal. Not sure if there's some underlying concerns so
that power people decided to not support it.

