Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD75452B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 19:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJrGC5xN5z3bvb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 03:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAJ4UVHb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tAJ4UVHb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJrFd0s7Nz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 03:10:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EC1FFB82E0A;
	Thu,  9 Jun 2022 17:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69186C34114;
	Thu,  9 Jun 2022 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654794624;
	bh=3POc+x1Ax4W7ab50VF8IFwayRS48LsWW76soZtcsfyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tAJ4UVHbTSfO8QdD9ruMahKyQRcU+J64PAF2AZFhb0tRvrVLVuF7L9L5NXe+9c0v+
	 NyM3W4R+BV4Q1B6A/ZfWMYiuULX32udhDx6HUHmgk3rL0zzYNTnGu2IDFLFwZbiOXU
	 tl1u8vAhYKjljc/kCWpJUQDtjTzrZuBSPwQz3zRsHrpTVcWNGZvfu7uba4BG55UVNP
	 WnKIUvtG5EN1hH9uLuU0vtZIgw6ZCm+s9nG3ZPxmtglAkSJ/Nsgq78VgVYn0HC3b6D
	 3I7WZ1V5PPlrx7Pa4XCh2TxwzTHyQh1WVhs1FtOtHAzf6vn61otoY1xWzg54Qqz8vk
	 zx7oCLSwPZ8Vw==
Date: Thu, 9 Jun 2022 12:10:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
Message-ID: <20220609171022.GA517022@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609162725.wu45rrbqo3jyfoi2@pali>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 09, 2022 at 06:27:25PM +0200, Pali Roh�r wrote:
> On Thursday 09 June 2022 11:22:55 Bjorn Helgaas wrote:
> > [+cc Guilherme, Michael, Ben (author of 63a72284b159 and PPC folks), thread:
> > https://lore.kernel.org/r/20220504175718.29011-1-pali@kernel.org]
> > 
> > On Fri, May 06, 2022 at 12:33:02AM +0200, Pali Roh�r wrote:
> > > On Thursday 05 May 2022 15:10:01 Tyrel Datwyler wrote:
> > > > On 5/5/22 02:31, Pali Roh�r wrote:
> > > > > On Thursday 05 May 2022 07:16:40 Christophe Leroy wrote:
> > > > >> Le 04/05/2022 � 19:57, Pali Roh�r a �crit�:
> > > > >>> Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB
> > > > >>> number based on device-tree properties"), powerpc kernel
> > > > >>> always fallback to PCI domain assignment from OF / Device Tree
> > > > >>> 'reg' property of the PCI controller.
> > > > >>>
> > > > >>> PCI code for other Linux architectures use increasing
> > > > >>> assignment of the PCI domain for individual controllers
> > > > >>> (assign the first free number), like it was also for powerpc
> > > > >>> prior mentioned commit.
> > > > >>>
> > > > >>> Upgrading powerpc kernels from LTS 4.4 version (which does not
> > > > >>> contain mentioned commit) to new LTS versions brings a
> > > > >>> regression in domain assignment.
> > > > >>
> > > > >> Can you elaborate why it is a regression ?
> > > > >> 63a72284b159 That commit says 'no functionnal changes', I'm
> > > > >> having hard time understanding how a nochange can be a
> > > > >> regression.
> > > > > 
> > > > > It is not 'no functional change'. That commit completely changed
> > > > > PCI domain assignment in a way that is incompatible with other
> > > > > architectures and also incompatible with the way how it was done
> > > > > prior that commit.
> > > > 
> > > > I agree that the "no functional change" statement is incorrect.
> > > > However, for most powerpc platforms it ended up being simply a
> > > > cosmetic behavior change. As far as I can tell there is nothing
> > > > requiring domain ids to increase montonically from zero or that
> > > > each architecture is required to use the same domain numbering
> > > > scheme.
> > > 
> > > That is truth. But it looks really suspicious why domains are not
> > > assigned monotonically. Some scripts / applications are using PCI
> > > location (domain:bus:dev:func) for remembering PCI device and domain
> > > change can cause issue for config files. And some (older) applications
> > > expects existence of domain zero. In systems without hot plug support
> > > with small number of domains (e.g. 3) it means that there are always
> > > domains 0, 1 and 2.
> > > 
> > > > Its hard to call this a true regression unless it actually broke
> > > > something. The commit in question has been in the kernel since 4.8
> > > > which was released over 5 1/2 years ago.
> > > 
> > > I agree, it really depends on how you look at it.
> > > 
> > > The important is that lot of people are using LTS versions and are
> > > doing upgrades when LTS support is dropped. Which for 4.4 now
> > > happened. So not all smaller or "cosmetic" changes could be detected
> > > until longer LTS period pass.
> > > 
> > > > With all that said looking closer at the code in question I think
> > > > it is fair to assume that the author only intended this change for
> > > > powernv and pseries platforms and not every powerpc platform. That
> > > > change was done to make persistent naming easier to manage in
> > > > userspace.
> > > 
> > > I agree that this behavior change may be useful in some situations
> > > and I do not object this need.
> > > 
> > > > Your change defaults back to the old behavior which will now break
> > > > both powernv and pseries platforms with regard to hotplugging and
> > > > persistent naming.
> > > 
> > > I was aware of it, that change could cause issues. And that is why I
> > > added config option for choosing behavior. So users would be able to
> > > choose what they need.
> > > 
> > > > We could properly limit it to powernv and pseries by using
> > > > ibm,fw-phb-id instead of reg property in the look up that follows
> > > > a failed ibm,opal-phbid lookup. I think this is acceptable as long
> > > > as no other powerpc platforms have started using this behavior for
> > > > persistent naming.
> > > 
> > > And what about setting that new config option to enabled by default
> > > for those series?
> > > 
> > > Or is there issue with introduction of the new config option?
> > > 
> > > One of the point is that it is really a good idea to have
> > > similar/same behavior for all linux platforms. And if it cannot be
> > > enabled by default (for backward compatibility) add at least some
> > > option, so new platforms can start using it or users can decide to
> > > switch behavior.
> > 
> > This is a powerpc thing so I'm just kibbitzing a little.
> > 
> > This basically looks like a new config option to selectively revert
> > 63a72284b159.  That seems hard to maintain and doesn't seem like
> > something that needs to be baked into the kernel at compile-time.
> > 
> > The 63a72284b159 commit log says persistent NIC names are tied to PCI
> > domain/bus/dev/fn addresses, which seems like something we should
> > discourage because we can't predict PCI addresses in general.  I
> > assume other platforms typically use udev with MAC addresses or
> > something?
> 
> This is not about ethernet NIC cards only. But affects also WiFi cards
> (which registers phy dev, not netdev) and also all other PCIe cards
> which do not have to be network-based. Hence MAC address or udev does
> not play role there.

What persistent naming mechanism do other platforms use in those
cases?

I forgot to ask before about the actual regression here.  The commit
log says domain numbers are different, but I don't know the connection
from there to something failing.  I assume there's some script or
config file that depends on specific domain numbers?  And that
dependency is (hopefully) powerpc-specific?

Bjorn
