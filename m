Return-Path: <linuxppc-dev+bounces-16637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIyUG8kJhWmj7gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 22:21:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF3F793A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 22:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6VWm4F3lz2xNT;
	Fri, 06 Feb 2026 08:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:e0a:1040:9780:49:5ff:fe41:d261"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770326468;
	cv=none; b=XtO9Q/CuMD14OXRZ9INc8OughoAh+XWbq4hEBPAvOn0fIQLrWyx9/lqDW1ASNRwzXBk79Zk/GgNIred8F7kWR94fy101SYGM6Y9sldA7FknmmsnitlE8/xXaHTIudI6HOsY0R6kYtBvJITuzk/kzA+LsS1sMmnlKtFbkJAuaqki6WwBQ/VYlLyv3jjzSQMBXMVDPQgGtr3TU+0AGTx/tHPdMOFO0YQrRu/hr6DeKbbkNXJeaNDjrsPiLNnPJlUa+3iPXIeamNpKVwbhdOO/nDWX5BRjLCaCgxBzM+9+vD2C7d9N6d/dic7behiOov1/rxGdrj7D3Jqzdpo9L4cdAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770326468; c=relaxed/relaxed;
	bh=+maSr6t9X0huLqfMIpthVCeAr6qnqyICEdUEnSrtpM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EeTDZCvfJrWMND+EJnTF6TihJnmxt3USiI0rqohjQ/lu+pfulAGDCXUVgSUyyxqgogbHLZ4R9Q4+3y/L3u0TVnUvOblMENNQMQmB/PGJBCTwiKFBg2w2yPUBir0FQSXIn+29Vbp16pFLe/vVYz2/j7UdDgdtOeam5OOUbny/gCK8ClXbvlxzOFuyomA8XM+4lojrigQJlts88uWC7sbDOOsvyf4DD1u+nKmbz10YzuGLyE2PBDQV5P2YkxuaMNcsxoX++8RJIc4Lb36qDoAqWefRRpFRT5q3aXKm2h8wIQl/36/+SHHWEkeJxNxNtSZkXRzfWPpEFo+4pH2fF0VqXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=2a01:e0a:1040:9780:49:5ff:fe41:d261; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:1040:9780:49:5ff:fe41:d261; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 152134 seconds by postgrey-1.37 at boromir; Fri, 06 Feb 2026 08:21:06 AEDT
Received: from luna.linkmauve.fr (unknown [IPv6:2a01:e0a:1040:9780:49:5ff:fe41:d261])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6VWk50PNz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 08:21:06 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 5C640F439CC; Thu, 05 Feb 2026 22:20:56 +0100 (CET)
Date: Thu, 5 Feb 2026 22:20:56 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>,
	rust-for-linux@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
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
Subject: Re: [PATCH v2 1/4] rust: io: Add big-endian read and write functions
Message-ID: <aYUJuF8bI7mwD4ON@luna>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-2-linkmauve@linkmauve.fr>
 <DG6A0WRA0JZC.SPDT9WEXF92K@kernel.org>
 <EC479D9E-ADBF-461C-BEA6-06EA2D4FD8A6@collabora.com>
 <DG74LUHX3NPX.3BLARQEIFG1DD@garyguo.net>
 <D6227AA2-A727-4F29-B7CD-BE0AAB0A13F1@collabora.com>
 <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
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
In-Reply-To: <DG79GRI3NOLS.3ASMS9RJ80IXM@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr
X-Spam-Status: No, score=1.3 required=3.0 tests=RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
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
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16637-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[collabora.com,garyguo.net,linkmauve.fr,vger.kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,protonmail.com,google.com,umich.edu,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,heyquark.com,gmx.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9BBF3F793A
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 08:05:08PM +0100, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 6:28 PM CET, Daniel Almeida wrote:
> >> On 5 Feb 2026, at 12:16, Gary Guo <gary@garyguo.net> wrote:
> >> I think we should have everything default to little endian, and have wrapper
> >> types that do big endian which require expicit construction, similar to
> >> RelaxedMmio in Alex's series.
> >
> > Ah yes, the RelaxedMmio pattern is definitely a good one. I agree that we
> > should head in this direction.
> 
> I strongly disagree.
> 
> This is a great pattern for relaxed ordering because:
> 
>   (1) We need both strict and relaxed ordering.
> 
>   (2) Relaxed ordering is rare, hence it doesn't hurt to write e.g.
> 
> 	io.relaxed().write()
> 
>   (3) If you by accident just write
> 
> 	io.write()
> 
>       i.e. forget to call relaxed() it s not a bug, nothing bad happens.
> 
> Whereas for endianness it is a bad pattern because:
> 
>   (1) Devices are either little-endian or big-endian. Hence, having to write
> 
> 	io.big_endian().write()
> 
>       is excessive, we always want big-endian for a big-endian device.
> 
>   (2) It is error prone, if you forget to call big_endian() first, it is a bug.
> 
>   (3) It is unergonomic in combination with relaxed ordering.
> 
> 	io.big_endian().relaxed().write()
> 
>       (Does the other way around work as well? :)
> 
> It makes much more sense to define once when we request the I/O memory whether
> the device is litte-endian or big-endian.
> 
> This could be done with different request functions, a const generic or a
> function argument, but it should be done at request time.

Could this ever be done in the device tree?  I understand this would
mean having to change all drivers and all device trees that do big
endian, but it seems to be the natural location for this information.  I
have no idea how to structure that though.

-- 
Link Mauve

