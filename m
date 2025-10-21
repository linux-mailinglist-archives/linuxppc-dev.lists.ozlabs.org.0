Return-Path: <linuxppc-dev+bounces-13124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6835BF7D95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 19:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crfDr3fvgz3bcf;
	Wed, 22 Oct 2025 04:19:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761067196;
	cv=none; b=ERZ2cl+rmFXpJl6C9oeHHOSXfVvLhQFWG57ZP7qZChKJgC5WsdOeFMqUwGDMeQHVigLvSQ0tdyQ1IZG6WlJVpSt7FJn8H+n5p7co+MbO/UYxn5/plyGGnxdKImubZv4k3v6twp6k1zS/nz8agelaIf1Z69Bck5u6dPmCHRdwroeG2jpy2EWPe+61RCo+jRYpxH0Wt2L/yT8myBCYgdSVHqp9ejRCqCwsRg8TT4MwWz28KT2wITl3NjR32xTWlIVLHtzvPVFA6WTgHBpGLJygE5Cv/MP7ZLeW6+6FDH7qWJViB4C+u0j7waAmIkm3ar/fZaouaSwiXgj6TDTiDv/PhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761067196; c=relaxed/relaxed;
	bh=GiBz0AD+U5higfP54JTIWbURN7LMLdXTQYQaOgJ+Bl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiftpxhcGA1z/atpAs4ZDzdDtd+RjVmvJQI9UrbFhBRbgTIUCrjtN0uA1lIa1NkvVNYHezD+lFoa8cwa1aSKJUl7icfhGViUZj1JYOPKBHV7P4Q2zj/YEdZ6AAG+nkfiZ3gShVrOFsE968e0HPL/rd53nf17gu3IpnHjZyEJrpUVYxXE0ijJH6jDVKTons1htiaXYIeuBeF7i3Z2a1Mh1u8mi9JNB0gD9mAEo6lQu39v5NPijlHuxycecOeG1PJSnhJQIoL/SIlXaym2eqiAq/31adp0arO/PIi/V/ubNoFbr9KUJU9PcZ+R733nnFoe1EqK1qdKyuadtYb3KnMlig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sH0HieRS; dkim-atps=neutral; spf=temperror (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.helo=casper.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=sH0HieRS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.helo=casper.infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crfDf63x2z2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 04:19:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GiBz0AD+U5higfP54JTIWbURN7LMLdXTQYQaOgJ+Bl0=; b=sH0HieRSdZyPzGqjC4vCbXfpKm
	yJYGFutbqau5ccJh8yltYVSlMxcWDKcGbOGU4jJV41RHFabFrviYfBHkfbfgHkEhT65jW/+WtN/BL
	/JZBkhTiW1CQiN61+JYIPfkeX6l7+16NHnxi9t5Stb5JTGZE+MLm2+Spsne7Sf5XZhUrTnDMLwfSB
	ubssjtmD6B6nzIu2WKaMg7Ara+KYNFOyr8oi0Rk2NLElQQamfPbvsKOYiPJIpjTB+WhyawvIwepF1
	MyB4q32gQfgNBHsGLOaN8szWOf/1dB+Wy+JdaoUCsRYypGjKRUX6jnpoN3m9m1Qod3sGovfmn720/
	OZ4MifGg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBG0e-0000000DsZ0-2xKs;
	Tue, 21 Oct 2025 17:18:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F40E13031AF; Tue, 21 Oct 2025 16:44:35 +0200 (CEST)
Date: Tue, 21 Oct 2025 16:44:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251021144435.GG4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
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
In-Reply-To: <877bwoz5sp.ffs@tglx>
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 04:29:58PM +0200, Thomas Gleixner wrote:

> So simply naming it scoped_user_$MODE_access() is probably the least
> confusing of all.

Yeah, that makes sense.

