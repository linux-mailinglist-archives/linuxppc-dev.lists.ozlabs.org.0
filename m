Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AE1776D77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 03:19:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3Fsu839;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dwhFIP5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLpxF3WKsz3cQD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 11:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A3Fsu839;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dwhFIP5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLpwK0r7Nz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 11:18:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691630316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RyE1XhIfdOavy1+yd7tZWH6XrA0A0ZMjPep4bJOZxA=;
	b=A3Fsu839pyA4VM4uZIr6VXdbFy9Tg6/G7MicivBy0GbByahVspoYfXZVktHowrb9j405JF
	bRznq8M7/FLjDWq0dUJ9KkKaGmJsj13bCeUtWtR0raHZcU0BspREf8dEQ3jI71UPs/IJmO
	roWoTh640VGD1ngfffCac6YS/jrdVFY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691630317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8RyE1XhIfdOavy1+yd7tZWH6XrA0A0ZMjPep4bJOZxA=;
	b=dwhFIP5ldiUCN2lTDMP+qjp1F/ckFv1Ng3XZJBs2nXA9FFuOD77+jpl5tN+U31cg6wkmPr
	h6AEZN175ga9LWzdCFXaxg47hVTuWDvAmzVuuVkmRCNm5oXQ5pLYAJ53ekpO3ad/lmY5jE
	r+BINhDjKkiAtCU1iWV9bG/UpehZfQc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-yJgvA4ilMeOrCYwrgq4MeA-1; Wed, 09 Aug 2023 21:18:33 -0400
X-MC-Unique: yJgvA4ilMeOrCYwrgq4MeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 448DA1C04182;
	Thu, 10 Aug 2023 01:18:32 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45ECB2166B25;
	Thu, 10 Aug 2023 01:18:29 +0000 (UTC)
Date: Thu, 10 Aug 2023 09:18:27 +0800
From: Baoquan He <bhe@redhat.com>
To: Ming Lei <ming.lei@redhat.com>, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH V3 01/14] blk-mq: add blk_mq_max_nr_hw_queues()
Message-ID: <ZNQ64xhCIBU6XM/5@MiWiFi-R3L-srv>
References: <20230808104239.146085-1-ming.lei@redhat.com>
 <20230808104239.146085-2-ming.lei@redhat.com>
 <20230809134401.GA31852@lst.de>
 <ZNQqt1C0pXspGl3d@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNQqt1C0pXspGl3d@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Pingfan Liu <piliu@redhat.com>, Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/10/23 at 08:09am, Ming Lei wrote:
> On Wed, Aug 09, 2023 at 03:44:01PM +0200, Christoph Hellwig wrote:
> > I'm starting to sound like a broken record, but we can't just do random
> > is_kdump checks, and it's not going to get better by resending it again and
> > again.  If kdump kernels limit the number of possible CPUs, it needs to
> > reflected in cpu_possible_map and we need to use that information.
> > 
> 
> Can you look at previous kdump/arch guys' comment about kdump usage &
> num_possible_cpus?
> 
>     https://lore.kernel.org/linux-block/CAF+s44RuqswbosY9kMDx35crviQnxOeuvgNsuE75Bb0Y2Jg2uw@mail.gmail.com/
>     https://lore.kernel.org/linux-block/ZKz912KyFQ7q9qwL@MiWiFi-R3L-srv/
> 
> The point is that kdump kernels does not limit the number of possible CPUs.
> 
> 1) some archs support 'nr_cpus=1' for kdump kernel, which is fine, since
> num_possible_cpus becomes 1.

Yes, "nr_cpus=" is strongly suggested in kdump kernel because "nr_cpus="
limits the possible cpu numbers, while "maxcpuss=" only limits the cpu
number which can be brought up during bootup. We noticed this diference
because a large number of possible cpus will cost more memory in kdump
kernel. e.g percpu initialization, even though kdump kernel have set
"maxcpus=1". 

Currently x86 and arm64 all support "nr_cpus=". Pingfan ever spent much
effort to make patches to add "nr_cpus=" support to ppc64, seems ppc64
dev and maintainers do not care about it. Finally the patches are not
accepted, and the work is not continued.

Now, I am wondering what is the barrier to add "nr_cpus=" to power ach.
Can we reconsider adding 'nr_cpus=' to power arch since real issue
occurred in kdump kernel?

As for this patchset, it can be accpeted so that no failure in kdump
kernel is seen on ARCHes w/o "nr_cpus=" support? My personal opinion.

> 
> 2) some archs do not support 'nr_cpus=1', and have to rely on
> 'max_cpus=1', so num_possible_cpus isn't changed, and kernel just boots
> with single online cpu. That causes trouble because blk-mq limits single
> queue.
> 
> Documentation/admin-guide/kdump/kdump.rst
> 
> Thanks, 
> Ming
> 

