Return-Path: <linuxppc-dev+bounces-17819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHljEuvRqmn3XQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 14:08:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E93221646
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 14:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS6DQ3Vjkz3bnJ;
	Sat, 07 Mar 2026 00:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772802534;
	cv=none; b=Rj/hIFa3QjfNMOboGTTGmAFrA0VCiFOoDvIEDQuNyX9D92jRR0uLDiis6BoVhlY2a9AfUkMnXfV26gy9O5lFvzEILfAc1ee8ZoWVrxB64Fc2UxdjRt0PHNhrNzkvC5HD/LVy+bX2IlYoAoTZmLxawW0Te/VZDa1xdl66PUA6BVCp0+H9E76domVBBJTs1Wz935jQ2Pj0ALBAQh31caC7P4q6bVAt3L6HZPtb5vGNc7iay/8nB3kkMpYZ2FDwJIZRgWYk3ooEI2UWsw0SStTJNzMSU/wv6pcrxDDEPdCCO3ew18UC4g6VQqCeZMTa1llXtr9hBVVDRb+XD+0v8l1++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772802534; c=relaxed/relaxed;
	bh=u1rHxfLLP4YKNg1WjBlVzgw1fLtfT2Y/arepS+6+PYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5xq51XmjqtXICECsEk62tNIg3G7Jw8VyBHwrXGvzG28/yH5rjH5Thvpgmh+iWcYx6H78FfbrNEMPKpgVfE1jcx1Spb0sdrVY6NZ/HE7jkg9FKe/UlIoBS2QLZ0QvojR2gfzVk5quRvHRhy8dulaixCEWRTnv5XDAdwdCrR+HHJw5diKuJ7hwBKi4zkfBHkTroNUd1PvrTRbZOlnRQyjuV70te/WrSi0SdMCuvAXIFoS2L73xzuy2a1DZWidA6/MN4b843sw+TDMWdTH+YPrgbI4yaRVnBCbNlGeNs2i6O9I/8kdmcGHOSZBBM41HVOMAN2YfA6SotzlKJ+q4rFDig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EebIOyn1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1XTZ5fbt; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EebIOyn1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1XTZ5fbt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS6DN3gX8z2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 00:08:52 +1100 (AEDT)
Date: Fri, 6 Mar 2026 14:08:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772802522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1rHxfLLP4YKNg1WjBlVzgw1fLtfT2Y/arepS+6+PYM=;
	b=EebIOyn1GAkztXhhb/xOs7a50yTpFmXp1eD4k+lUvkDCKBPOfjcZoid4acV7G2wCcI6U/V
	FGYlHmTgtqYBOcT5LOUcDj48GKf1xI9dsZbtHFMVDfMD8QKWZnfBhAfIsC0er950JLst3G
	6JCXw0rW8FCEIqQ4EdRofZoi+7PToRjpFsfZWgq6KSWgxM5VzOzxkvFDckuV9HuDXNJY9w
	dJkHqusUNd2P6UJhs66+UdaGK3zu2qm9NzQTl7UvcHcis/8MEhXrw7hgxaVE4raAHdHgtw
	D5zt0ivPKP6gya6n3/1XNG1t57ugX6PbBXVeZtmUSg9pkp+kzgOb6KN8X6tx8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772802522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1rHxfLLP4YKNg1WjBlVzgw1fLtfT2Y/arepS+6+PYM=;
	b=1XTZ5fbtGTrjwv0i4R2ZCuY19THERe245goUh2z2oB9xbmf1QhzB2aBzdWp3Iq8hSDD9kc
	a+BxNXuHRPasJ4BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
	David Laight <david.laight.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Sun Jian <sun.jian.kdev@gmail.com>, kernel test robot <lkp@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 0/5] vDSO: Use 32-bit CHECKFLAGS for compat vDSO
Message-ID: <20260306115350-ef265661-6d6b-4043-9bd0-8e6b437d0d67@linutronix.de>
References: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
 <96cdd223-5139-4535-b82d-831dac472cc3@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96cdd223-5139-4535-b82d-831dac472cc3@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E9E93221646
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17819-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org,intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:sun.jian.kdev@gmail.com,m:lkp@intel.com,m:dan.carpenter@linaro.org,m:davidlaightlinux@gmail.com,m:sunjiankdev@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 11:43:24AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 02/03/2026 ‡ 08:58, Thomas Weiﬂschuh a Ècrit†:
> > When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
> > are used. These are combined with the 32-bit CFLAGS. This confuses
> > sparse, producing false-positive warnings or potentially missing
> > real issues.
> > 
> > Manually override the CHECKFLAGS for the compat vDSO with the correct
> > 32-bit configuration.
> > 
> > Not all architectures are supported, as many do not use sparse for their
> > (compat) vDSO. These can be enabled later.
> > 
> > Also add some checks to bitsperlong.h to detect such issues earlier.
> > 
> > Based on tip/timers/vdso.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Changes in v2:
> > - Simplify __BITS_PER_LONG consistency checks
> > - Fix an inconsistency in the powerpc audit code
> 
> The powerpc audit code should be replaced by generic
> AUDIT_ARCH_COMPAT_GENERIC, as there is no difference between them
> apparently.

Agreed.

> A tentative was made in the past but was declined by audit maintainers
> because we were not able to test it allthought the failure was the same
> before and after the patch, see
> https://github.com/linuxppc/issues/issues/412

On v7.0-rc1 the test failure of filter_exclude/test is gone.
It also keeps working when applying your patch. Some other tests are
broken, but it looks that is due to missing dependencies on Debian.
So maybe it is time to resubmit your patch.

In any case, I don't really want to entangle my series with the switch
to AUDIT_ARCH_COMPAT_GENERIC. My proposed cleanup does not make the code
worse and if both patches are applied the conflict will be trivial to
resolve.


Thomas

