Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCE74E560
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 05:36:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvchCIrI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDmn/cTG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0RPZ6KZkz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UvchCIrI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDmn/cTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0RNg47kdz30fB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 13:36:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689046559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAKJNLVa7Dz/gEOC8l+W1ubVM3SUfpJDz/d6N9kvm8w=;
	b=UvchCIrIJ3Pf974kKJ9AdYMuL8pVjeyd0GDjCPxIUkKmJVgAMLDmla4mVd4pB9W+wAKx3n
	e7CRs4OZrtmPTU0+UtA+ZxSMyUvhTKpGJRTfZTsvMCk8xL5oC2W1f4NLd2kmWBQ8sxAWCZ
	kXiBDt0TnR93Kj2DsWrzdGWqKTNNX2s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689046560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAKJNLVa7Dz/gEOC8l+W1ubVM3SUfpJDz/d6N9kvm8w=;
	b=TDmn/cTG1svhfcDOHbxw1FRLOq42ro+AYvaRAJ5YLX3M5EOrCX0dVnBi8Mn9ZnSK2RSWop
	Oz9O3amuWmuqPyrBtRyaq1Fs4jcc5V2iONawmi2qdmBys6rsm581/XuemFKrWA/a1yiHUD
	b1Wf30nrqeJSsoPgJgFJZVeRzCXkGHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-rnGtRtxZNxW8idSVCPY9jA-1; Mon, 10 Jul 2023 23:35:56 -0400
X-MC-Unique: rnGtRtxZNxW8idSVCPY9jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765518028B2;
	Tue, 11 Jul 2023 03:35:55 +0000 (UTC)
Received: from localhost (ovpn-12-93.pek2.redhat.com [10.72.12.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2547DC52D9C;
	Tue, 11 Jul 2023 03:35:53 +0000 (UTC)
Date: Tue, 11 Jul 2023 11:35:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH 2/2] nvme-pci: use blk_mq_max_nr_hw_queues() to calculate
 io queues
Message-ID: <ZKzOFkokjTVwd4Ry@MiWiFi-R3L-srv>
References: <20230708020259.1343736-1-ming.lei@redhat.com>
 <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de>
 <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Keith Busch <kbusch@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/10/23 at 05:14pm, Ming Lei wrote:
> On Mon, Jul 10, 2023 at 08:41:09AM +0200, Christoph Hellwig wrote:
> > On Sat, Jul 08, 2023 at 10:02:59AM +0800, Ming Lei wrote:
> > > Take blk-mq's knowledge into account for calculating io queues.
> > > 
> > > Fix wrong queue mapping in case of kdump kernel.
> > > 
> > > On arm and ppc64, 'maxcpus=1' is passed to kdump command line, see
> > > `Documentation/admin-guide/kdump/kdump.rst`, so num_possible_cpus()
> > > still returns all CPUs.
> > 
> > That's simply broken.  Please fix the arch code to make sure
> > it does not return a bogus num_possible_cpus value for these
> 
> That is documented in Documentation/admin-guide/kdump/kdump.rst.
> 
> On arm and ppc64, 'maxcpus=1' is passed for kdump kernel, and "maxcpu=1"
> simply keep one of CPU cores as online, and others as offline.

I don't know maxcpus on arm and ppc64 well. But maxcpus=1 or nr_cpus=1
are suggested parameter. Because usually nr_cpus=1 is enough to make
kdump kernel work well to capture vmcore. However, user is allowed to
specify nr_cpus=n (n>1) if they think multiple cpus are needed in kdump
kernel. Your hard coding of cpu number in kdump kernel may be not so
reasonable.

Please cc kexec mailing list when posting so that people can view the
whole thread of discussion.

Thanks
Baoquan

> 
> So Cc our arch(arm & ppc64) & kdump guys wrt. passing 'maxcpus=1' for
> kdump kernel.
> 
> > setups, otherwise you'll have to paper over it in all kind of
> > drivers.
> 
> The issue is only triggered for drivers which use managed irq &
> multiple hw queues.
> 
> 
> Thanks,
> Ming
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

