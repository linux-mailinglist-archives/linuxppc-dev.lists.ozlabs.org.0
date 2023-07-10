Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2874DB8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:52:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnFzUs11;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R096D4rJRz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:52:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnFzUs11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R095M1ZSRz30h2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:51:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFF196101E;
	Mon, 10 Jul 2023 16:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463C9C433C8;
	Mon, 10 Jul 2023 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689007906;
	bh=5z3WsJxJGTtWjrX2KHLkkdeETGptB61J+3QAspj8jBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnFzUs11tjzs+9ReI3FmujHvobKv5/wZaFYYlv72apTaj5q+5nJjG3Xvck7oyN0Bb
	 3r44Ru3KtKzPCZgCsOL43nG19l61vH11QqTchheHpnKzoOF/dVEenhPlN7QrlfjL2c
	 FeX3O0mEnPMK13b8PlAUX6IiOnBOVP4/wLoDDuUj4ZMDIksPVrHBzd1QOTy9kmahwx
	 eobFZLlT4bSmSj1mrHmB1i/EikuL3cWQ95AmcH8Dqn1YdcXFE0GbnrJEJjvnJhy8yW
	 ZKEcOl6J/0mSWQsL0oTMC9iBItuU/lUz+vZp71BaggN8U1ScOprjLHgJij04ThusAj
	 TUT5ije+zaq+w==
Date: Mon, 10 Jul 2023 10:51:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH 2/2] nvme-pci: use blk_mq_max_nr_hw_queues() to calculate
 io queues
Message-ID: <ZKw3H2cJzRPZa29N@kbusch-mbp.dhcp.thefacebook.com>
References: <20230708020259.1343736-1-ming.lei@redhat.com>
 <20230708020259.1343736-3-ming.lei@redhat.com>
 <20230710064109.GB24519@lst.de>
 <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKvL58L58rY3GWnt@ovpn-8-31.pek2.redhat.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, Wen Xiong <wenxiong@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Dave Young <dyoung@redhat.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 05:14:15PM +0800, Ming Lei wrote:
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
> 
> So Cc our arch(arm & ppc64) & kdump guys wrt. passing 'maxcpus=1' for
> kdump kernel.
> 
> > setups, otherwise you'll have to paper over it in all kind of
> > drivers.
> 
> The issue is only triggered for drivers which use managed irq &
> multiple hw queues.

Is the problem that the managed interrupt sets the effective irq
affinity to an offline CPU? You mentioned observed timeouts; are you
seeing the "completion polled" nvme message?
