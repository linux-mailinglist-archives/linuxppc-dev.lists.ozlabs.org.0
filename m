Return-Path: <linuxppc-dev+bounces-6494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B362A45B6E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 11:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2r2J2s8Kz30W1;
	Wed, 26 Feb 2025 21:15:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740564920;
	cv=none; b=N0KIpH6UhNJJhcas/8aVdQDMb9kdGTl9bKR9J/EvsBPX0dCyy6ZUf+b7mqHNBBxIrEXGJwCPU9ar/MZDnpQPrs0NdrHk2xPqOsvs87CPSPl78IqEGH6rSzCzJl2h/AOXCHoaYOCZaDrTU4F54+vLu8gIL21gykCV/Lw/f3DlhG/WfxjTboR5TmAsjngOtyFlo7zW6B7AeKeZpIQVCyurw3t6FCbZf5meAI+to9l5Zq/31InpZn6FMdh7OzfnV+vrWxLrHLV4Z3tey2CHFIae7VVJGcQRp/JXks98PRLRqf8fBAmwpGUZP21jAVLByPDxON6K6AogsaYpO14iVcLsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740564920; c=relaxed/relaxed;
	bh=3MVpIWlVP4LUlyOlJvD8fkfJgxbO3epYN/LpGvKk6ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PphbvL1Gdri3O5m4iSfwS38n146TmzCC/kda9W180bOBRwgD/Pu4Pefz4ThQyWQjScBKZnGLupikB09QAT+GUcdBcj6fZeWymAOFuV40dc3fjBqpw4Rqv+tVJ4E5hKFnuw1cXtRCtsySKhUNWLSoRmwnqAxJrNFHLsiTUVJseXbK2TpuAtq1IRY7Yt/frEdlVrVzxKFmp/WTwHKevfW+v8UhmXilPhQTQ7XmhD7yNMm+lgEokyrkmiNx01Opc9h3ttrNd5owOXlpMdz1AvjWNM6eMfx07n8jwQFhsiw9fVMcgwd1ys3YJ1NDUJBRXHSUj+0Z2WurJPqPaSaslSSgFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MwyunGtJ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r/YExrf3; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MwyunGtJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r/YExrf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z2r2H0Hpcz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 21:15:18 +1100 (AEDT)
Date: Wed, 26 Feb 2025 11:15:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740564911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MVpIWlVP4LUlyOlJvD8fkfJgxbO3epYN/LpGvKk6ss=;
	b=MwyunGtJvojTScCpLwMD4KKFfj3on6OBGZ869NwjluSTeOqDXbAS5+8+D23GF/Gdq9v3qG
	yakT8xYABGtvLh8nEspKTwaPswzYOcwYMNirCfLBJISvDJR96mKLlWobjGTUn/muw3QikO
	PS5Mt7NqFcUQCoaIZq4DkfDdgVGgSx1/OhyAbzWi3V8beO/XV7iOupoN5WAwOts5y1mu5t
	HkdQqpmSxHEM9/vbaWFceU0Rfite8LqCSD3F633v15kZlaEUYUP5WqMjx7IWlugSt56tf8
	8tA0+H8zmeVZtjpt71UxSaHD9bw6iUvIVMJIBf+ghVIGkB5Ya6FaxQpFMx4vsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740564911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MVpIWlVP4LUlyOlJvD8fkfJgxbO3epYN/LpGvKk6ss=;
	b=r/YExrf3pYyrwyEyG2J/TjI1y19YOlLdoGPmng0Ox1yUycYXAw3e4nuKIwCV4Ivimb6PDi
	eMDaSzzSlKDhanDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Don't use %pK through printk
Message-ID: <20250226105757-e935ee3e-f70d-4e0e-83bb-61307722a186@linutronix.de>
References: <20250217-restricted-pointers-powerpc-v1-1-32c6bff63c9a@linutronix.de>
 <ffd5dd44-babc-480a-b1bc-61bd7ff1e920@csgroup.eu>
 <alpine.DEB.2.21.2502241840360.65342@angie.orcam.me.uk>
 <20250225091250-eac544ad-4e5b-47f7-83fc-5212c720483a@linutronix.de>
 <alpine.DEB.2.21.2502251654370.65342@angie.orcam.me.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2502251654370.65342@angie.orcam.me.uk>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025 at 05:32:12PM +0000, Maciej W. Rozycki wrote:
> On Tue, 25 Feb 2025, Thomas Weißschuh wrote:
> 
> > > was suddenly lost from the kernel log, the access to which unprivileged 
> > > users can be denied if so desired according to the site policy.  Whereas 
> > > running the kernel such as to have all output from plain `%p' exposed just 
> > > to cope with this proposed change, now that seems like a security risk.
> > 
> > Your point makes sense.
> > *But* the addresses in your example are already hashed,
> > as indicated by the all-zero upper 32 bits.
> 
>  Darn it!

Agreed.

> > By default, when kptr_restrict is set to 0, %pK behaves the same as %p.
> > The same happened for a bunch of other architectures and nobody seems
> > to have noticed in the past.
> > The symbol-relative pointers or pointer formats designed for backtraces,
> > as notes by Christophe, seem to be enough.
> 
>  I do hope so.

As mentioned before, personally I am fine with using %px here.
The values are in the register dumps anyways and security sensitive deployments
will panic on WARN(), making the information disclosure useless.

> > But personally I'm also fine with using %px, as my goal is to remove the
> > error-prone and confusing %pK.
> 
>  It's clear that `%pK' was meant to restrict access to /proc files and the 
> like that may be accessible by unprivileged users:

Then let's stop abusing it. For something that is clear, it is
misunderstood very often.

> "
> kptr_restrict
> =============
> 
> This toggle indicates whether restrictions are placed on
> exposing kernel addresses via ``/proc`` and other interfaces.
> "
> 
> and not the kernel log, the information in which may come from rare events 
> that are difficult to trigger and hard to recover via other means.  Sigh. 
> Once you've got access to the kernel log, you may as well wipe the system 
> or do any other harm you might like.

As I understand it, both the security and printk maintainers don't want the
kernel log in general to be security sensitive and restricted.
My goal here is not to push site-specific policy into the kernel but make life
easier for kernel developers by removing the confusing and error-prone %pK
altogether.
Security is only one aspect.


Thomas

