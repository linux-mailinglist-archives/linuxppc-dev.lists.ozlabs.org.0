Return-Path: <linuxppc-dev+bounces-16615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Cv6JLKRhGk43gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 13:48:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B9F2CB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 13:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6H8X61Hrz2yFb;
	Thu, 05 Feb 2026 23:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770295724;
	cv=none; b=BjyMGABRf6oyZW3mYkOXpfuYBDjiA8guIKOssNY2gaPvAC5Plhza3wu6mP1S2btkBF8enKkpKwWIJ6l4t64OpxTBBzohKkeQpd0/rgVFIuzx6xBX4T9FnIi0tX0jwjtL5MFKGnuFLbOIAhLcv2KiCRNuZZ7eCy0sJvg2Lv1LfoThEiXilOYRH9dr5YCdKEOtGOn5BjmR1sFdYqYbQCuk6lj+b1VGcFtCqNp9jQ9NhaWGEaNlXbctiL701HAYkyH3R0I7XX/xxf56XrK3x8XexA9w/7EaVMGw5p52hLW8eHJlwbeTja2UBCrJJPDI23HzQtRjjfXhEsOOoM0JQlqu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770295724; c=relaxed/relaxed;
	bh=g0LaQspl9srLk8Lur3rWa+c8LeH6NGZNqUB1Y1GusZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEHlfywnQKffAxSeW3+7Np6wHe68rXk+eUnzNCzFhlETJiqVnWYi7ypm7oR+6itf8w/qLTFasvdmDT0+tfJMJclcQjxOGT0n5PzLSf+zAtd/gizW0N8XXdQ2FKV4ESv7Agg9Xb909vEpZQl887f3xeucN0Y9jX1khm8oDDdw5o5u+xhezGhmO6V4t9IFL3DfPstouKCE0rh/I+nY+zT8DtfoS09auqxJ/iyp5FYkO4kVp3enQAfqxxgAurw47eTEc8jd21HNHjTCAsD4nq3uTgR/ikp5NhV4h5W4sC5dC58SyjfgiLnQJ/kqvN+JNqa2K6KfN7AoBW0WLTJslqDRMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6H8V4vz0z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 23:48:41 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D0AB5F43B46; Thu, 05 Feb 2026 13:48:32 +0100 (CET)
Date: Thu, 5 Feb 2026 13:48:32 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>, rust-for-linux@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 2/4] rust: nvmem: Add an abstraction for nvmem
 providers
Message-ID: <aYSRoIvhx5FAygDe@luna>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-3-linkmauve@linkmauve.fr>
 <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org>
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
In-Reply-To: <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16615-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 805B9F2CB6
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:22:16PM +0100, Danilo Krummrich wrote:
> On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
> > +impl Device {
> > +    /// Register a managed nvmem provider on the given device.
> > +    pub fn nvmem_register<T>(&self, mut config: NvmemConfig<T>, priv_: &T::Priv)
> > +    where
> > +        T: NvmemProvider + Default,
> > +    {
> > +        // FIXME: The last cast to mut indicates some unsoundness here.
> > +        config.inner.priv_ = core::ptr::from_ref(priv_).cast::<c_void>().cast_mut();
> > +        config.inner.dev = self.as_raw();
> > +        config.inner.reg_read = Some(NvmemConfig::<T>::reg_read);
> > +        config.inner.reg_write = Some(NvmemConfig::<T>::reg_write);
> > +        // SAFETY: Both self and config can’t be null here, and should have the correct type.
> > +        unsafe { bindings::devm_nvmem_register(self.as_raw(), &config.inner) };
> > +    }
> > +}
> 
> This should not be a method on the generic device type. Typically we use a
> Registration struct for this, i.e. this would become
> nvmem::Registration::register().

Should I also switch to the nvmem_register()/nvmem_unregister() API
instead of the devm_nvmem_register() API, so that the unregister can
happen in the Drop impl instead of being managed by the kernel?

-- 
Link Mauve

