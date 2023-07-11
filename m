Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B274E378
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:34:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VPwBRk2S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfJ+r5M0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0NhQ4rHlz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VPwBRk2S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfJ+r5M0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ming.lei@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0NgV02gRz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 11:33:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689039217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2O7OTXUeRoU92HpC9S8grafoZ034oHB9LUwzT8GPQm8=;
	b=VPwBRk2S7rACcIjARQzYduZM6GuSLRInEA/Z4u5Cv55DtZTFK6SDUzS/FO97Za+8kABy6r
	W6/izgZ40bOTco++Aq5dWeNqeBqkKZ8eiKJwJzC4Ug9Y0ydqKQT9JhOXYC3RppzVgklRR3
	s744kRztDj4NwB3MwiE71v358I3xKYc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689039218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2O7OTXUeRoU92HpC9S8grafoZ034oHB9LUwzT8GPQm8=;
	b=dfJ+r5M0s+y9Deh8MtY4TAhPA6fPEQeObwOHBYrJS3TGcM/hlUXsu6VUPpD0K4fZoT2jjo
	k/VBbZ3nYlCqPdpeyAeEjidtohX07MbXC4ABl3CbjOIDALuIx2LsNEV1tUlowzUcCo4ONk
	Q0gBvaEtzbBhFZOQcR0Sr3sTwTMT/i0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-O6L_ttexNva64r-mu9ol2Q-1; Mon, 10 Jul 2023 21:33:34 -0400
X-MC-Unique: O6L_ttexNva64r-mu9ol2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8616F38149A2;
	Tue, 11 Jul 2023 01:33:33 +0000 (UTC)
Received: from ovpn-8-26.pek2.redhat.com (ovpn-8-26.pek2.redhat.com [10.72.8.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3FBC09A09;
	Tue, 11 Jul 2023 01:33:24 +0000 (UTC)
Date: Tue, 11 Jul 2023 09:33:18 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 2/2] nvme-pci: use blk_mq_max_nr_hw_queues() to calculate
 io queues
Message-ID: <ZKyxXgJXk0XPBxe2@ovpn-8-26.pek2.redhat.com>
References: <20230708020259.1343736-1-ming.lei@redhat.com>
 <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de>
 <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
 <ZKw3H2cJzRPZa29N@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKw3H2cJzRPZa29N@kbusch-mbp.dhcp.thefacebook.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, ming.lei@redhat.com, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 10:51:43AM -0600, Keith Busch wrote:
> On Mon, Jul 10, 2023 at 05:14:15PM +0800, Ming Lei wrote:
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
> > 
> > So Cc our arch(arm & ppc64) & kdump guys wrt. passing 'maxcpus=1' for
> > kdump kernel.
> > 
> > > setups, otherwise you'll have to paper over it in all kind of
> > > drivers.
> > 
> > The issue is only triggered for drivers which use managed irq &
> > multiple hw queues.
> 
> Is the problem that the managed interrupt sets the effective irq
> affinity to an offline CPU? You mentioned observed timeouts; are you

Yes, the problem is that blk-mq only creates hctx0, so nvme-pci
translate it into hctx0's nvme_queue, this way is actually wrong, cause
blk-mq's view on queue topo isn't same with nvme's view.

> seeing the "completion polled" nvme message?

Yes, "completion polled" can be observed. Meantime the warning in
__irq_startup_managed() can be triggered from
nvme_timeout()->nvme_poll_irqdisable()->enable_irq().


Thanks,
Ming

