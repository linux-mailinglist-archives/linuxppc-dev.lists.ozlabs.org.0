Return-Path: <linuxppc-dev+bounces-13801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B1BC35E7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 14:46:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1mnR0HmKz3bmk;
	Thu,  6 Nov 2025 00:46:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762350378;
	cv=none; b=G7lVTfXNbN5Vy59YbMmAz5bjD3o2OaRNA74rn/UklQcA/N+bPXGiJTbmU7VTErg/YvVvHUhdE9hA1ND1ZTqdSkEEbrQBJ2KxQrBtR6AOcAgYjdBYNNkYVQ4rH5txhxoZiEYwn1FhN6Jn348AuZ8sTvJtpffnnq9tiMAkNiorpZ/D39AgAZPvbSPf81AWjHqMc+D5oMRugsx+A+LDsegRUmMur/ANcgJmityl2Z2aL/n6uuBpEqPn0fA+s+Qq7ddP7i3TN8E26NJo2+TCJpDeOmw2uxHNDhXJhINGch2rr3mhJ8WvDpcrNBnEUcuvxrQq9wlYLzTfr373qES/YGWZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762350378; c=relaxed/relaxed;
	bh=QEmg21q/bTDjej8FQo7XnPxvi2Y0z8JlB/H39ewNpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI7y1ahEjFXBJj2d+G5gIc+vxS1E2gIgUDb57Us/AxVKmOtvWPfe7Xtlo6DyTz4f9IbibWK/vF3Fy2oEWr64DscuW1JOnNo5IUGUkIJ9lQPWXK7T90xlDf/BGpMtmpye6mL9viII1wq+mKhvK7es3JvfQ/kPSGdfXxcSFz+nBy+Dw+L0oQtwviThTA+0fQCeNFBv9s5o9u4ZrNGW/MfaA2jkOrnkaoLhMSQI3yjsUfUl7/ylBos/dD6rSA/d7U/HoqsajzpTyE5P6SYYnQZVdiBED8z1lS7pUD7TkCI/aWILUJqDVQTrOsP4wH/DK/xWeyDmqnD9clze6lqsP/N3lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ShpmD5CE; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ShpmD5CE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1mnQ19Cjz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 00:46:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC5C860206;
	Wed,  5 Nov 2025 13:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88442C4CEF8;
	Wed,  5 Nov 2025 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762350375;
	bh=PBw6f127nni3oALBZyW0JgdvwP5qSqzJy9SAmndAriA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShpmD5CEr+JOX/hdyLmwbKn+7N/84QMIjLE9j2cZcrRvpVVQ75tjvns2y5AtNRjNB
	 Yz/cddtecY9g6c5niROEmlZIGG5XZUkdnkP1ukuBnc6gReYjrQWthxBdx6AWzSPCto
	 H5T2MJQ6JwDB5soUuJR37OivkZPbAKj+jm3MbBvvRUCLje5nBaF8qyof8/avmrOrQo
	 AetMggcJiBTqXIIqRYQO2peEzYuk6WbKzeJQmuHBsuyC0xrt8ateYNVpRjsDJ2WscG
	 uhaFUjmftREcVGApZjqCE58fnFSyfg3U6HCIwJGFbq7P1TvBbf4A89/uShbWcEdej8
	 m/GMvmV69qEFQ==
Date: Wed, 5 Nov 2025 14:46:08 +0100
From: Christian Brauner <brauner@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net, 
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, borntraeger@linux.ibm.com, 
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251105-ausfiel-klopapier-599213591ad2@brauner>
References: <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV>
 <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
 <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
 <20251105-sohlen-fenster-e7c5af1204c4@brauner>
 <305ff01c159993d8124ae3125f7dacf6b61fa933.camel@HansenPartnership.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <305ff01c159993d8124ae3125f7dacf6b61fa933.camel@HansenPartnership.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 08:33:10AM -0500, James Bottomley wrote:
> On Wed, 2025-11-05 at 14:16 +0100, Christian Brauner wrote:
> > On Wed, Nov 05, 2025 at 08:09:03AM -0500, James Bottomley wrote:
> > > On Wed, 2025-11-05 at 12:47 +0100, Christian Brauner wrote:
> [...]
> > > > And suspend/resume works just fine with freeze/thaw. See commit
> > > > eacfbf74196f ("power: freeze filesystems during suspend/resume")
> > > > which implements exactly that.
> > > > 
> > > > The reason this didn't work for you is very likely:
> > > > 
> > > > cat /sys/power/freeze_filesystems
> > > > 0
> > > > 
> > > > which you must set to 1.
> > > 
> > > Actually, no, that's not correct.  The efivarfs freeze/thaw logic
> > > must run unconditionally regardless of this setting to fix the
> > > systemd bug, so all the variable resyncing is done in the thaw
> > > call, which isn't conditioned on the above (or at least it
> > > shouldn't be).
> > 
> > It is conditioned on the above currently but we can certainly fix it
> > easily to not be.
> 
> It still seems to be unconditional in upstream 6.18-rc4
> kernel/power/hibernate.c with only freeze being conditioned on the

I'm honestly not sure how efivarfs would be frozen if
filesystems_freeze() isn't called... Maybe I missed that memo though.
In any case I just sent you...

> setting of the filesystem_freeze variable but I haven't checked -next.
> 
> However, if there's anything in the works to change that we would need
> an exception for efivarfs, please ... we can't have a bug fix
> conditioned on a user setting.

... a patch in another mail.

Sorry in case I misunderstood that you _always_ wanted that sync
regardless of userspace enabling it.

