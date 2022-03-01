Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B94C926B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 18:58:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Q3T1VNPz3bpX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 04:58:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ZBUT+xBE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EY31l7G2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm3 header.b=ZBUT+xBE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EY31l7G2; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7Q2m0PVHz30NZ;
 Wed,  2 Mar 2022 04:58:07 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F34E5801D0;
 Tue,  1 Mar 2022 12:58:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 01 Mar 2022 12:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=1b8nHfrBOcjPGYcB+Q6wr00uk1GmKX3v3ZNCnj
 2Fc4I=; b=ZBUT+xBEPIHuw8jHImLNH+x52gankwE7MJd8sDFwnEoy45z1BwbhNh
 xKsOdQ1yD9u7q0d/6DIUtrg535wnOmT4Lvdd1apo2YuuhLLDVkYx1vSgNyoTE5fJ
 ofsW7j8uCMJyXK6Loz8rrLOzHyzxWsYiemruNwAl4gNUMe4M/NVtyIVhNAgsOfjy
 b/w/wzWa4VwoEUleGhkhNF3kRyKpQ3Usq/8Ca14buwUMr/k/0v+gPaqGXYzqUKuv
 KllGIGlPN88CAydfwqCLzM8aK7V+EiOvYiI4kF7OI9OB3TO949n6Hy8EMtjF8IqZ
 MBlpj07s0Rnbq4GNXj6M7/3IgLXdvpRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1b8nHfrBOcjPGYcB+
 Q6wr00uk1GmKX3v3ZNCnj2Fc4I=; b=EY31l7G2XfgL9rSC/gwvRf8zFgwtBT7xS
 zGIS7YVvo/KA/v9LCSJOIARDHfRqiRvn2gTz078tIpwk3oIxG21buWNUxNQmSUyy
 MyYKa/Xe0zh4/DCiQIRNMfBLOEXackhRaibWR2bFKht/sqIYkVYfZsf6JTqkc8aS
 N/+KxLe8dnTTbLIJQe4lQN4jxuybvA2M70S25Fv9b7VdN/aPfJftqSYQ4WVfyPqY
 0tbQrYevVZ6RBtubRdYtr3gnZBflyWFJSH5G+LkmECZ7pFmQ2xcqosvgp1dXRrwM
 GXM5n5s+pyNtUs5gG+ueV8296EmUoxyY6tuEcr0WZBCuK4oOvJTLg==
X-ME-Sender: <xms:rF4eYt_khXW9JUELKd3sbskivfb6p9VNYJ9HJTNdiVa20a5SzZwcHg>
 <xme:rF4eYhvpLP3jG67Y92AJSSlOEm5MH8cOme-q_WmBEiKHi2-d33bdpDbAgKuSlQzhv
 bEXTTYYFzUc5A>
X-ME-Received: <xmr:rF4eYrDa0WtfQIncLyLiGZ2_QzeJH36bSCyCi0g3L7auz9QrwNL4PuRbLUYhHGofRJvw4tCnLgWVuPYzt-8dyqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:rF4eYhep9_FqzdGryzLUlkyDm8oB4NZlyIpp5U2aPsiBO5Uc_pu1KA>
 <xmx:rF4eYiNt1Zd7p4zbskEHRd607PiISY-ihvHig6bYJF7awgzM4cA48A>
 <xmx:rF4eYjmGF931qz2wbkLW14iXG2GvWL_-CIczc4jJ1wtvDsjYWSRagQ>
 <xmx:rl4eYkl7_n3lofGsDcutmkSMBLsPYoIzfmJgc1TjOF9wAZv0ieQERQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 12:58:03 -0500 (EST)
Date: Tue, 1 Mar 2022 18:58:02 +0100
From: Greg KH <greg@kroah.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5eqmAv0P2nnSq0@kroah.com>
References: <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
 <Yh5ZmwiH5AxtQ69K@kroah.com>
 <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
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

On Tue, Mar 01, 2022 at 06:40:04PM +0100, Jakob Koschel wrote:
> 
> 
> > On 1. Mar 2022, at 18:36, Greg KH <greg@kroah.com> wrote:
> > 
> > On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> >> 
> >> 
> >>> On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >>> 
> >>> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> >>>> 
> >>>> The goal of this is to get compiler warnings right? This would indeed be great.
> >>> 
> >>> Yes, so I don't mind having a one-time patch that has been gathered
> >>> using some automated checker tool, but I don't think that works from a
> >>> long-term maintenance perspective.
> >>> 
> >>> So if we have the basic rule being "don't use the loop iterator after
> >>> the loop has finished, because it can cause all kinds of subtle
> >>> issues", then in _addition_ to fixing the existing code paths that
> >>> have this issue, I really would want to (a) get a compiler warning for
> >>> future cases and (b) make it not actually _work_ for future cases.
> >>> 
> >>> Because otherwise it will just happen again.
> >>> 
> >>>> Changing the list_for_each_entry() macro first will break all of those cases
> >>>> (e.g. the ones using 'list_entry_is_head()).
> >>> 
> >>> So I have no problems with breaking cases that we basically already
> >>> have a patch for due to  your automated tool. There were certainly
> >>> more than a handful, but it didn't look _too_ bad to just make the
> >>> rule be "don't use the iterator after the loop".
> >>> 
> >>> Of course, that's just based on that patch of yours. Maybe there are a
> >>> ton of other cases that your patch didn't change, because they didn't
> >>> match your trigger case, so I may just be overly optimistic here.
> >> 
> >> Based on the coccinelle script there are ~480 cases that need fixing
> >> in total. I'll now finish all of them and then split them by
> >> submodules as Greg suggested and repost a patch set per submodule.
> >> Sounds good?
> > 
> > Sounds good to me!
> > 
> > If you need help carving these up and maintaining them over time as
> > different subsystem maintainers accept/ignore them, just let me know.
> > Doing large patchsets like this can be tough without a lot of
> > experience.
> 
> Very much appreciated!
> 
> There will probably be some cases that do not match one of the pattern
> we already discussed and need separate attention.
> 
> I was planning to start with one subsystem and adjust the coming ones
> according to the feedback gather there instead of posting all of them
> in one go.

That seems wise.  Feel free to use USB as a testing ground for this if
you want to :)

thanks,

greg k-h
