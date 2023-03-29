Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643456CD955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 14:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmm3C2BYQz3f5Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 23:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQL+68HV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmm2P16G6z3cLC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 23:24:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQL+68HV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pmm2N17r2z4x7x;
	Wed, 29 Mar 2023 23:24:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680092668;
	bh=Z+hrXiJ2cNlBmfdmmROKJdBUr7noF3o6UBJE5Zse75Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oQL+68HVSewYXO8Akb+fstLv5B3IplNs/mtpgtglt/cBMIMlNiUtHNNGU7h2oLkLQ
	 paLTR0HdkUwlMXqcT+qslXPdM25Ea3csCTxy4N5x6JdMZlX+sQf7HL2B0t2xrRD7Ud
	 ATj2DZPuybl0dq0tiiIhmB/Xt0+QXTyF7k8o4p4dynM4OIMmyIZKb4A7kMgyfSQYkn
	 r9ZuvTXTpI2NrIvrSDnUJ4oZkXPds9797kV4vnbxNlILyPM0NRqheLd5bneltZnwfL
	 FZmkww+fCEqiR33Qsk3YGNHl61Vt7oy4bGik4jb29+3T6RNr/UWM9gUnrShE3J6w36
	 GZ0YRAGREGwiw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 5/8] powerpc/rtas: rename va_rtas_call_unlocked() to
 va_rtas_call()
In-Reply-To: <20230220-rtas-queue-for-6-4-v1-5-010e4416f13f@linux.ibm.com>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-5-010e4416f13f@linux.ibm.com>
Date: Wed, 29 Mar 2023 23:24:27 +1100
Message-ID: <87wn2zbv9g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> The function name va_rtas_call_unlocked() is confusing: it may be
> called with or without rtas_lock held. Rename it to va_rtas_call().

I'm not sure about this one.

The "unlocked" is meant to convey that it doesn't do any locking. The
caller has to be OK with that, or do its own locking.

Andrew is right that the common naming pattern is foo() that takes the
lock and __foo() that doesn't - but I agree that's not very pretty.

Can we just leave it as-is?

cheers
