Return-Path: <linuxppc-dev+bounces-631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A4961D34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 05:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtr8l1sB5z2yVF;
	Wed, 28 Aug 2024 13:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724817159;
	cv=none; b=bfNjeK458JmtX5SAspG6iN+us6rvYnbYy+FEEhz+ITF2rBqgn+tgAf1RXYroCB27m4bRQX/NqTuk7TbXoRitdni260u79GG4nHWVDOoo/3P45l7dEn0GmyXMsCB43qXbiynbJNmKvL+zBiU2YnDGUJHxH3EvmEwfUoDFXW8KlUWCVXe5jdE2ueSknS7WMd8MBV5xyEntHLncEzrea0K+CgF0rY2CujOLmqu6a270operYm279cHHW9usSnUmIPOOpuF5+o2eufbzy6yEQz3FW+JI1+gD/S3mx4NZXyKsAqTmCPNL9Vz9CO5zyKyqJQOs/AJBS/dn7R+kac/NWCZk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724817159; c=relaxed/relaxed;
	bh=/coqd0kyu+RMCNpqcNa+zY0sEmKMxLb/nShBI2s8tWw=;
	h=DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type; b=OEvw52IZYKGPHhdUxn7V1eLF7/6A9bd9neStH2VaWnc8J2qii8fzKQ6luvd8UP/CBHU4+2m9Kr8ORBCVdJw42Ecug32L4jarhdHNcQD8jlHNEvlxgQ6ETyrcqfoAmFHOwUypTYTKJGgqs16tntPAaYj94feOddhcBRvwk3WZ9wIjxJeCLdG7ksuWyiT/jty7opckHSKZjUn8yVsbYB2do/Wym7SPIBXPi+tXKqmIOmSqb596IiGZmo7x/8bKRvQeCVqafCJJgFzOWF6e4aPlkpN5Ktc1K7diCSO8hmFMl9i+k/a4rOgd4JVVHGLgoN2aStBDo8RGKMdv4RTLrghuTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K/hp7qWV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K/hp7qWV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtr8j5YnLz2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 13:52:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724817155;
	bh=/coqd0kyu+RMCNpqcNa+zY0sEmKMxLb/nShBI2s8tWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K/hp7qWVj7zmla6BZonpnHCqTjnE2DuKbPZcKVCX3wgfCCeQiJvOQL80cfrSqO5+h
	 hx4pBnZ8BcOIPMz3Paz734Wmp4nzEYqc4qnEwfZB4r1mFnNy0XVG7FfTHp4VPTiepT
	 Av8Q0KPwp4raRpMrUGc55EYYj2+Dj98Qllp7DXgUcT8hUpG6v6WWd4AXdXy9WSjxiV
	 TCyBw/DcpS0d18qABDaFLCSEAYqAy/bsi2rS7BsJOlELHLIRCvmD849HF8AfkvWZhA
	 ZcLksUcuzlQyvucucCMe3uJ5eB3M31IiUgb4X9gvGCQDxicW7vRcS7cGQQZ5i7En4f
	 bXu2gCj/CdNuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtr8f4hX6z4wd0;
	Wed, 28 Aug 2024 13:52:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>, Geetika Moolchandani
 <geetika@linux.ibm.com>, Vaishnavi Bhat <vaish123@in.ibm.com>, Jijo
 Varghese <vargjijo@in.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/qspinlock: Fix deadlock in MCS queue
In-Reply-To: <20240826081251.744325-1-nysal@linux.ibm.com>
References: <20240826081251.744325-1-nysal@linux.ibm.com>
Date: Wed, 28 Aug 2024 13:52:33 +1000
Message-ID: <871q29fgn2.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

"Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> If an interrupt occurs in queued_spin_lock_slowpath() after we increment
> qnodesp->count and before node->lock is initialized, another CPU might
> see stale lock values in get_tail_qnode(). If the stale lock value happens
> to match the lock on that CPU, then we write to the "next" pointer of
> the wrong qnode. This causes a deadlock as the former CPU, once it becomes
> the head of the MCS queue, will spin indefinitely until it's "next" pointer
> is set by its successor in the queue. This results in lockups similar to
> the following.
...
>
> Thanks to Saket Kumar Bhaskar for help with recreating the issue
>
> Fixes: 84990b169557 ("powerpc/qspinlock: add mcs queueing for contended waiters")
> Cc: stable@vger.kernel.org # v6.2+
> Reported-by: Geetika Moolchandani <geetika@linux.ibm.com>
> Reported-by: Vaishnavi Bhat <vaish123@in.ibm.com>
> Reported-by: Jijo Varghese <vargjijo@in.ibm.com>
 
Do we have links for any of these reports?

cheers

