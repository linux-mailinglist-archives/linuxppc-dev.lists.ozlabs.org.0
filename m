Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D18C0574
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:17:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSZyA/tB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZRKD0NMXz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 06:17:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OSZyA/tB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZRJT18QTz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 06:17:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56189CE1A66;
	Wed,  8 May 2024 20:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13308C113CC;
	Wed,  8 May 2024 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715199424;
	bh=AeePNuL7SFwUOG4gPSg8rwAm8IPCSABF4FYA1EDT90I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSZyA/tB5lOjpS4LC/9SY0EU+oSR2ADLqzy+2Oxxm/z6SO+lSeYqArptx9zIchIXk
	 UiNicWJF1t0rqW+/75aVsY9qju7Ua4/12VQZiJiUlaEiH4nP7dtm6m8nHPMJVkL/e7
	 dT4l7ucoWkMp4DEZQmkg02x4F/I3bajuOdqHxt96PxG7vcQGPSxmIVSWWk4UWM2Npy
	 5j8C7jHMtngGG50t8cy9/OfatYDYYOm8fCYKK5P4uKlv6Q2FcvJcfql94ojXTASiir
	 Unt1u5D51eAHSMTj76PGlYkMWXCG+OJIRRO2EgobbMJJ0WcJKSBDeElVhnooiXnVGX
	 evN2ku1af2CsA==
Date: Wed, 8 May 2024 21:16:54 +0100
From: Simon Horman <horms@kernel.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
Message-ID: <20240508201654.GA2248333@kernel.org>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com>
 <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
  davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2024 at 12:27:10PM -0700, Allen wrote:
> On Tue, May 7, 2024 at 12:23 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > > The only generic interface to execute asynchronously in the BH context is
> > > tasklet; however, it's marked deprecated and has some design flaws. To
> > > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > > behaves similarly to regular workqueues except that the queued work items
> > > are executed in the BH context.
> > >
> > > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
> >
> > I doubt you're going to get many comments on this patch, being so large
> > and spread across all drivers. I'm not going to bother trying to edit
> > this down to something more sensible, I'll just plonk my comment here.
> >
> > For the mvpp2 driver, you're only updating a comment - and looking at
> > it, the comment no longer reflects the code. It doesn't make use of
> > tasklets at all. That makes the comment wrong whether or not it's
> > updated. So I suggest rather than doing a search and replace for
> > "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> > it with) just get rid of that bit of the comment.
> >
> 
>  Thank you Russell.
> 
>  I will get rid of the comment. If it helps, I can create a patch for each
> driver. We did that in the past, with this series, I thought it would be
> easier to apply one patch.

Hi Allen and Russell,

My 2c worth:

* In general non bug-fix patches for networking code should be targeted at
  net-next. This means that they should include net-next in the subject,
  and be based on that tree.

  Subject: [PATCH net-next] ...

* This series does not appear to apply to net-next

* This series appears to depend on code which is not present in net-next.
  f.e. disable_work_sync

* The Infiniband patches should probably be submitted separately
  to the relevant maintainers

* As this patch seems to involve many non-trivial changes
  it seems to me that it would be best to break it up somehow.
  To allow proper review.

* Patch-sets for net-next should be limited to 15 patches,
  so perhaps multiple sequential batches would be a way forwards.

Link: https://docs.kernel.org/process/maintainer-netdev.html
