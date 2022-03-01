Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE224C9227
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 18:46:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7PnG6knqz3bg2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 04:46:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=PuP2Nuoq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EDVGv6yE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm3 header.b=PuP2Nuoq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EDVGv6yE; 
 dkim-atps=neutral
X-Greylist: delayed 549 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 04:45:47 AEDT
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7PmW2Z01z30J7;
 Wed,  2 Mar 2022 04:45:47 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 668835801CF;
 Tue,  1 Mar 2022 12:36:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 01 Mar 2022 12:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=5OE8xr6GO9X7MbNpDAcWFGeEO3b3B/8LX5WMVM
 23luQ=; b=PuP2NuoqB9WepsjY0Uqokte1F02OSePW/KnqWPOHGfC62jDMQy8d6J
 jihmHY7jaxPeYmV/brYSLMo2rdd0E65RFIbVZNaw+d6hF5TlV5h/HTFiyyQeuhEh
 tTvMohVc8vJzz2F3uGXDhJ11n60AMBcwryX0OIQ4h4vBoJz9sXnQjtTWmMBfJvV8
 ASNImP/JJmHc6aQngUkaR/9ejN6V67gkY3Ss3hOhMxZ05fa2rytR+8neryd7GnHR
 NnoILjHkJCXbghnuIwO3WAIr0wjFgm+H99CgrlgjXtrJoB87p0eZTz8QaQ9jXLS7
 eUmDU4ThQ2iD/GAcK9q8FPfYZ3dj5Siw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5OE8xr6GO9X7MbNpD
 AcWFGeEO3b3B/8LX5WMVM23luQ=; b=EDVGv6yEMy7PTbky8OfXVA9jYKh0oiM5+
 sk6xt1CX3smAZYI0P9oaKzOCIkwMemVmh9foKoLwOV/IyVUBTTJc+ljLrovpUDdP
 pIA4BCkMgcGpU96mM/8o9zjz4bY87GlxWmxlUETAhWUvR7QqjYOuAQqLjAz9vvM2
 9w41DE+muRcTBgXgq7R5mX2xPAK9bu7QEmldC6d/UhIWw84PgZEMMUkVZDfimvGr
 9rb1WTZ4HmbXffSgmjvpYAD0fz3a3kb/jxO9vzcKzkIUx9MDQUxolnVJ5gWPPm0P
 3SACLLdt3Ji3p4//lVUF9os4MIANF8EQiUgikZ8An4R/ZWSxaE7Og==
X-ME-Sender: <xms:oFkeYrv0LJt2Pjt0ZOYMYd1jCK6G-Z0GZXtRlOiCbijoVlbqDToesg>
 <xme:oFkeYsdRXoRXAxTjhPFWtM5JX8rU2-dsIwxZfpFocA89gDBFD4vx9xsWmcbxEuUyQ
 lpRakwPpYLi7A>
X-ME-Received: <xmr:oFkeYuzzdQb5kL72Vvj74Xn0xRRyhzff8uvNHTyUqFsrLF_56anw9-ykyIbZGqAzSj0KTqXLBgC1Qf0KKdPZ7IM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:oFkeYqNP0oPgoNRpau1EsmnsGvsi8MuHt5Oau7Uh5DcasQw65k9YTg>
 <xmx:oFkeYr8eoBRonSMDQgE0d2CdwAX12XsrowbLGxOxF_rvtS3YwiTEgg>
 <xmx:oFkeYqVNxx7WBcYUGhcHc73BR9KI7xEAuh9FjZrqFDwJGYsF_7MqUw>
 <xmx:olkeYkWtK93reuC1fg-f2X2RrUvR780eGtvCg6vOtajRgdiJ73bSmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 12:36:31 -0500 (EST)
Date: Tue, 1 Mar 2022 18:36:27 +0100
From: Greg KH <greg@kroah.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5ZmwiH5AxtQ69K@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> 
> 
> > On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> >> 
> >> The goal of this is to get compiler warnings right? This would indeed be great.
> > 
> > Yes, so I don't mind having a one-time patch that has been gathered
> > using some automated checker tool, but I don't think that works from a
> > long-term maintenance perspective.
> > 
> > So if we have the basic rule being "don't use the loop iterator after
> > the loop has finished, because it can cause all kinds of subtle
> > issues", then in _addition_ to fixing the existing code paths that
> > have this issue, I really would want to (a) get a compiler warning for
> > future cases and (b) make it not actually _work_ for future cases.
> > 
> > Because otherwise it will just happen again.
> > 
> >> Changing the list_for_each_entry() macro first will break all of those cases
> >> (e.g. the ones using 'list_entry_is_head()).
> > 
> > So I have no problems with breaking cases that we basically already
> > have a patch for due to  your automated tool. There were certainly
> > more than a handful, but it didn't look _too_ bad to just make the
> > rule be "don't use the iterator after the loop".
> > 
> > Of course, that's just based on that patch of yours. Maybe there are a
> > ton of other cases that your patch didn't change, because they didn't
> > match your trigger case, so I may just be overly optimistic here.
> 
> Based on the coccinelle script there are ~480 cases that need fixing
> in total. I'll now finish all of them and then split them by
> submodules as Greg suggested and repost a patch set per submodule.
> Sounds good?

Sounds good to me!

If you need help carving these up and maintaining them over time as
different subsystem maintainers accept/ignore them, just let me know.
Doing large patchsets like this can be tough without a lot of
experience.

thanks,

greg k-h
