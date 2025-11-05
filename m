Return-Path: <linuxppc-dev+bounces-13797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94340C35C9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 14:16:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1m713j9Qz3bt1;
	Thu,  6 Nov 2025 00:16:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762348589;
	cv=none; b=Cgenp4zH4Mqvx4hrv3KXKlEJ4troWLU4Q8TOBtp213hOCP6SgYA4SY414dfVm8/05vuCXgs1HSGj/NNekEOI0VqYLqiwY0WboBC+ZybSfP9ZKUi5el+gidIZyRi77xz2VNNx0eESAunLjU5DDtbLbYPVMfagh9KowkUPS/2atcSB9Sd/ffhDkAElxgG6D4N7C1rsHJzD3nqPMKmtR0YWg9G4vZflrW4R6wcUukk1S/BexucNQGH9Ns+jQkT0pnFZWbayk7W4tpzDd2MnIKyE+K+g2P0AoL84BjjjzwhQef6SjEXLs7rpEmeWD6lGXCP77+ps6O7tpggsifxps+ykPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762348589; c=relaxed/relaxed;
	bh=+ouVtuTIKii7y0Bm+84FshZp2YdlyYBJAL8lq4Poc/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDm83TIsSSkBHIzpcWPhKSToudN/3/iskwOZAKBh1+mFFgO9glJ4rlcVgbF4bEkwdoqW782HMt7I6Q64yvVm8uf7BIzESYnb6ZL41zEszjIVj6zSNF3noF/JLXBYpvYbLBm+/wAAeGRvicw3xZlyBwLArPay9YjdpUvZEeqI8zKm1UzuEu3RUwOPFg1u8gB+L1SJ2LXrdp/L64uRXLW/MWJodEyrcacLYiadzGGBPLgIB+1goANKPDPyj7/tccNxpE5JO2fJXMTALW7+u32CwDOvAyUXa188CUjTo6PaWV94N5+FV27WW2yCSxB+geZryuHi7c50QnUkYvgAwZbVEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnQMpaiu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnQMpaiu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1m703q0Wz3bfM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 00:16:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90D20408E8;
	Wed,  5 Nov 2025 13:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C33C4CEF8;
	Wed,  5 Nov 2025 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762348586;
	bh=OBvixuYbeAnNVseOEocUtnf2AaLDAy6Mj92/tM/4EB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnQMpaiuAolZlRt+GOgY8wQUOoEAqEsvvBhNHFfabs3tgQdd/42dJ4BLpf02azCs7
	 9f5LkQUq4/5I3J7xDoN9f2Nx12Ii26kGmzAPhXZW/DkyiUxqK/+qYDcLH0dpCdJpmY
	 I8bq0drnEp7lJ+2zecFyc266utJI7C9jUyFuiMrtFTL+vFSpS7KNPsYvVYBWs4X+93
	 JUVuXLg8R3tAigRVRdNoNIG0ah53puDwO3NtTUAHN+zuI28jyIbNTi77g/EJ7W3ive
	 Tobez7A38LaBkvBroJdXPCHcMoub+yGyJRZsEjNuf6bMVUL1xt7dr+leLrQHcqjThU
	 RYeTZ6wKB6HKA==
Date: Wed, 5 Nov 2025 14:16:18 +0100
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
Message-ID: <20251105-sohlen-fenster-e7c5af1204c4@brauner>
References: <20251028004614.393374-23-viro@zeniv.linux.org.uk>
 <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV>
 <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
 <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
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
In-Reply-To: <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 08:09:03AM -0500, James Bottomley wrote:
> On Wed, 2025-11-05 at 12:47 +0100, Christian Brauner wrote:
> > On Thu, Oct 30, 2025 at 02:35:51PM +0100, Ard Biesheuvel wrote:
> [...]
> > > commit 0e4f9483959b785f65a36120bb0e4cf1407e492c
> > > Author: Christian Brauner <brauner@kernel.org>
> > > Date:   Mon Mar 31 14:42:12 2025 +0200
> > > 
> > >     efivarfs: support freeze/thaw
> > > 
> > > actually broke James's implementation of the post-resume sync with
> > > the underlying variable store.
> > > 
> > > So I wonder what the point is of all this complexity if it does not
> > > work for the use case where it is the most important, i.e., resume
> > > from hibernation, where the system goes through an ordinary cold
> > > boot and so the EFI variable store may have gotten out of sync with
> > > the hibernated kernel's view of it.
> > > 
> > > If no freeze/thaw support in the suspend/resume path is
> > > forthcoming, would it be better to just revert that change? That
> > > would badly conflict with your changes, though, so I'd like to
> > > resolve this before 
> > > going further down this path.
> > 
> > So first of all, this works. I've tested it extensively. If it
> > doesn't work there's a regression.
> 
> I haven't yet got around to finding the test image I used for this, but
> I'll try to do that and get a test running this week.
> 
> > And suspend/resume works just fine with freeze/thaw. See commit
> > eacfbf74196f ("power: freeze filesystems during suspend/resume")
> > which implements exactly that.
> > 
> > The reason this didn't work for you is very likely:
> > 
> > cat /sys/power/freeze_filesystems
> > 0
> > 
> > which you must set to 1.
> 
> Actually, no, that's not correct.  The efivarfs freeze/thaw logic must
> run unconditionally regardless of this setting to fix the systemd bug,
> so all the variable resyncing is done in the thaw call, which isn't
> conditioned on the above (or at least it shouldn't be).

It is conditioned on the above currently but we can certainly fix it
easily to not be.

