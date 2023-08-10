Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE248776CF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 02:10:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfL1l8cR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfL1l8cR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLnPn4W3Kz3cRk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 10:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfL1l8cR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfL1l8cR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLnNs2KHHz3bW4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 10:09:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691626184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhYjGeDQjHaify9fYveKNlg3W8+1+0vVy9IFYKIMw0M=;
	b=FfL1l8cR5sNVh0mqLfZJic+s/OsrA46/7HlCSRFeiroyzaAgW1bEvy+bkS8vR5QR80PKVU
	4PTQBdavPGzt3vGCbvOl06tf7aHwsmL760rOEjpt5ouNfGSNq7pq9OGSJbFf8ldQjfeOkG
	3che6bKxBuI53ePFrc8Be8QPNkzaDWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691626184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RhYjGeDQjHaify9fYveKNlg3W8+1+0vVy9IFYKIMw0M=;
	b=FfL1l8cR5sNVh0mqLfZJic+s/OsrA46/7HlCSRFeiroyzaAgW1bEvy+bkS8vR5QR80PKVU
	4PTQBdavPGzt3vGCbvOl06tf7aHwsmL760rOEjpt5ouNfGSNq7pq9OGSJbFf8ldQjfeOkG
	3che6bKxBuI53ePFrc8Be8QPNkzaDWU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-dBjPouXWOO-yZ4G5_5ahoA-1; Wed, 09 Aug 2023 20:09:40 -0400
X-MC-Unique: dBjPouXWOO-yZ4G5_5ahoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0557D3802BBC;
	Thu, 10 Aug 2023 00:09:40 +0000 (UTC)
Received: from fedora (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7C02026D4B;
	Thu, 10 Aug 2023 00:09:32 +0000 (UTC)
Date: Thu, 10 Aug 2023 08:09:27 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V3 01/14] blk-mq: add blk_mq_max_nr_hw_queues()
Message-ID: <ZNQqt1C0pXspGl3d@fedora>
References: <20230808104239.146085-1-ming.lei@redhat.com>
 <20230808104239.146085-2-ming.lei@redhat.com>
 <20230809134401.GA31852@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809134401.GA31852@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Pingfan Liu <piliu@redhat.com>, Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Baoquan He <bhe@redhat.com>, Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 09, 2023 at 03:44:01PM +0200, Christoph Hellwig wrote:
> I'm starting to sound like a broken record, but we can't just do random
> is_kdump checks, and it's not going to get better by resending it again and
> again.  If kdump kernels limit the number of possible CPUs, it needs to
> reflected in cpu_possible_map and we need to use that information.
> 

Can you look at previous kdump/arch guys' comment about kdump usage &
num_possible_cpus?

    https://lore.kernel.org/linux-block/CAF+s44RuqswbosY9kMDx35crviQnxOeuvgNsuE75Bb0Y2Jg2uw@mail.gmail.com/
    https://lore.kernel.org/linux-block/ZKz912KyFQ7q9qwL@MiWiFi-R3L-srv/

The point is that kdump kernels does not limit the number of possible CPUs.

1) some archs support 'nr_cpus=1' for kdump kernel, which is fine, since
num_possible_cpus becomes 1.

2) some archs do not support 'nr_cpus=1', and have to rely on
'max_cpus=1', so num_possible_cpus isn't changed, and kernel just boots
with single online cpu. That causes trouble because blk-mq limits single
queue.

Documentation/admin-guide/kdump/kdump.rst

Thanks, 
Ming

