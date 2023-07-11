Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E236874E587
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 05:54:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dStQQq21;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TB9HD5ko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Rnd5nwDz3c26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dStQQq21;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TB9HD5ko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Rmm5HBTz30fB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 13:53:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689047604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=np4ZI6Y9u+osACrZKJ15QQ6k0qV43pdokF3OlXrj8ck=;
	b=dStQQq21TubsJDZ6s8hG7yE3mEUCdDIu7E8IADlfNQ2qmhC9oeyFDRa99K1ppIBjuH0r59
	HoPaEvURg2JZXFrBY/OIOpmOY9VeBPX7OewBm7FoImtdxeuVP6XAk8jqWb5T4kBSbOIlAC
	wHGuFS8YCWwAd8n0S+gCjOov8Z8wzZw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689047605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=np4ZI6Y9u+osACrZKJ15QQ6k0qV43pdokF3OlXrj8ck=;
	b=TB9HD5koRoHjAHjDemjMpzWDaXBiFbcp8gyRx3q4S+R1gBaN0SOXNUbyaB7D546hOZeDVY
	FPdWoOZEeTr6yknecTxadWLmW1duWSFq7bdTIvlW+0rkkp5xR2zhRP9CQNM00Chn2C+Ajk
	26Qn0NBFPKf4FYbeUYJSXHjuxjoYLIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-5JME2jPnPjy37hQuhsn9ag-1; Mon, 10 Jul 2023 23:53:21 -0400
X-MC-Unique: 5JME2jPnPjy37hQuhsn9ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A109D80006E;
	Tue, 11 Jul 2023 03:53:20 +0000 (UTC)
Received: from ovpn-8-26.pek2.redhat.com (ovpn-8-26.pek2.redhat.com [10.72.8.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 132EDC09A09;
	Tue, 11 Jul 2023 03:53:05 +0000 (UTC)
Date: Tue, 11 Jul 2023 11:53:00 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 2/2] nvme-pci: use blk_mq_max_nr_hw_queues() to calculate
 io queues
Message-ID: <ZKzSHDPR7Jfoz/G8@ovpn-8-26.pek2.redhat.com>
References: <20230708020259.1343736-1-ming.lei@redhat.com>
 <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de>
 <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
 <ZKzOFkokjTVwd4Ry@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzOFkokjTVwd4Ry@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, ming.lei@redhat.com, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Keith Busch <kbusch@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

On Tue, Jul 11, 2023 at 11:35:50AM +0800, Baoquan He wrote:
> On 07/10/23 at 05:14pm, Ming Lei wrote:
> > On Mon, Jul 10, 2023 at 08:41:09AM +0200, Christoph Hellwig wrote:
> > > On Sat, Jul 08, 2023 at 10:02:59AM +0800, Ming Lei wrote:
> > > > Take blk-mq's knowledge into account for calculating io queues.
> > > > 
> > > > Fix wrong queue mapping in case of kdump kernel.
> > > > 
> > > > On arm and ppc64, 'maxcpus=1' is passed to kdump command line, see
> > > > `Documentation/admin-guide/kdump/kdump.rst`, so num_possible_cpus()
> > > > still returns all CPUs.
> > > 
> > > That's simply broken.  Please fix the arch code to make sure
> > > it does not return a bogus num_possible_cpus value for these
> > 
> > That is documented in Documentation/admin-guide/kdump/kdump.rst.
> > 
> > On arm and ppc64, 'maxcpus=1' is passed for kdump kernel, and "maxcpu=1"
> > simply keep one of CPU cores as online, and others as offline.
> 
> I don't know maxcpus on arm and ppc64 well. But maxcpus=1 or nr_cpus=1
> are suggested parameter. Because usually nr_cpus=1 is enough to make
> kdump kernel work well to capture vmcore. However, user is allowed to
> specify nr_cpus=n (n>1) if they think multiple cpus are needed in kdump
> kernel. Your hard coding of cpu number in kdump kernel may be not so
> reasonable.

As I mentioned, for arm/ppc64, passing 'maxcpus=1' actually follows
Documentation/admin-guide/kdump/kdump.rst.

'nr_cpus=N' just works fine, so not related with this topic.

After 'maxcpus=1' is passed, kernel only brings up one of cpu cores as
online during booting, and others still can be put into online by
userspace. Now this way causes IO timeout on some storage device which
uses managed irq and supports multiple io queues.

Here the focus is if passing 'maxcpus=1' is valid for kdump
kernel, that is we want to hear from our arch/kdump guys.

If yes, something needs to be fixed, such as, what this patchset is
doing.

> 
> Please cc kexec mailing list when posting so that people can view the
> whole thread of discussion.

Already Cc kexe & arm/powerpc & irq list.


Thanks,
Ming

