Return-Path: <linuxppc-dev+bounces-13538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E353C1CAEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 19:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZxT1JRCz2yrm;
	Thu, 30 Oct 2025 05:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761761325;
	cv=none; b=dLUWQVjSVlT3pXsS22/m6ihm9AL/N1kMqIAuF+uEQ/LeCWC6kI9MSMKIzTHoTWCZ5b4K6i28LYTE0/92SgKMa6CwyqntV8YoWBtP0sIugGIl4/hb9u9t65dZ6W9XBt9tC/wST6VCMmZl9/sD3L3rbxA9YLMiPL4Z5CPRuQDJE7obItSTbB2qha3KB05H+Ej/Qx1NZpz8gL1RTwJQsBJeOetWqnuYNokI8wJL4G76m4UnWKFGvFxO9Y4CtUpmQe60Wd+ROZEJm4kDEd1M5/F+E7KKw2IN0+IPeaIc3MvzSzOyW9NwOz8Mrm46C+AbSVNasUwcQRX+bDkZx3GOiPHLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761761325; c=relaxed/relaxed;
	bh=IRO5/rJhd7y6qAbtBBfOnyjO73djps2jbwQIhCfiClo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSFsZ8b4TeYdv8bTIzGzTm6bZlGjLe9niJz2GLJ0dpfunht+6o+Pm8ooxXR7FOd0MHWv14WcJWbXwo9K6lzk5lp42EjpoM48gTHDaWK7/eYYd5TGjBAaIcw7Xo+C4Ktpc8tK+AjOn1my16cmhmlpwNwsrdA6cfVAqfOSuQcBF8mY5S4QrUu4NL55Zjr9XTPKLfRUSFUwRs8N3ILHtBNCcUZTtyd2p+IVX3lNeRYyEdUy645htdfzUyRBelY9EVHEwwHlm/YAOHEFO5siCIrojxzj7GT7y2tkoXAFGb5clAL0h7DZ0c0hD1UdgPekamMUF8ufts05qdIaQWhURUVuuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qstw6GBW; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=qstw6GBW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZxS228Vz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 05:08:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IRO5/rJhd7y6qAbtBBfOnyjO73djps2jbwQIhCfiClo=; b=qstw6GBW0gz7l6/NIZ98+H0BuC
	LPcTpqbv6qZwuSaVXzFp5+8p3uItulr9RO1wyw6k1QzQVAfHUp/CtKNeZtDmZSm+sgFarRadUCpBK
	QZrzf7l+w0/cYrUWCRtQcOPwVpTXfR6WfE4DMsjuxuOQV+z0xqou2NBsCOGqqoMuLcuomyEM5NJXa
	RJQMFf1J+khB5G8o/qb4hoF8XxOYm1SETmvEkodR0rT9kGWkPtyAGI//REIRqkdUm4sCbPWkkDpIi
	qeQgTiYS1sVVgCHccSx1/k4oTcfdfgLL7bzYX5FyStzF5GG23KhpEBcGZmGVQXrQATbM/9H02+9/9
	Dy4tNtaQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAb5-0000000DNn5-15k7;
	Wed, 29 Oct 2025 18:08:35 +0000
Date: Wed, 29 Oct 2025 18:08:35 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251029180835.GT2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk>
 <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 10:34:51PM +0100, Ard Biesheuvel wrote:

> I'll let James respond to the specifics of your suggestion, but I'll
> just note that this code has a rather convoluted history, as we used
> to have two separate pseudo-filesystem drivers, up until a few years
> ago: the sysfs based 'efivars' and this efivarfs driver. Given that
> modifications in one needed to be visible in the other, they shared a
> linked list that shadowed the state of the underlying variable store.
> 'efivars' was removed years ago, but it was only recently that James
> replaced the linked list in this driver with the dentry cache as the
> shadow mechanism.

Hmm...  Another question about that code: is efivar_get_variable()
safe outside of efivar_lock()?

