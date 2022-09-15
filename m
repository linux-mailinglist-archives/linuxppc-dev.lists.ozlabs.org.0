Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6935B9B47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSxp46c25z3c1W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 22:48:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HO72o+PF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSxnV2mT8z2y8L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 22:47:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HO72o+PF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MSxnM4j1Sz4xD1;
	Thu, 15 Sep 2022 22:47:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663246071;
	bh=Zc+raPxO9bIbJKBvS9NH+Oyi2qM2Dy+v7tM7QZ3cX8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HO72o+PFgjyUTReReymlieH95hoa4Rd5tJDg7xIJl3CQmhf/IIGLnDN2w7wrqNL2K
	 UIf2Je2Rl6pD+nOfnM2gXuxUqhXu5UUgtLDZvJvdRptMAukg5tyD1011l2fwKvdCxQ
	 I6pAcfThW0A+emBm4ey8cW4hhEhwDOwaf5qBCmoeVvI5sar8oxRYW2VKdm5qc8ck9n
	 X2D8UA9wV8Ly4GBQho8MwQ4iHEzHGPPFXvfVHnRug4feYh7pHMZ7fIr2bAjWU8uZCg
	 2TQ858eslIMdY6MClphwsC60K/XKXRsaMO14DHtxHiLAisojeTCplvRSWcYhjD0Bnv
	 +q/gwA1PBXquQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only
 sections
In-Reply-To: <20220914154746.1122482-3-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-3-npiggin@gmail.com>
Date: Thu, 15 Sep 2022 22:47:50 +1000
Message-ID: <877d24n6rt.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> powerpc has a number of read-only sections and tables that are put
> after RO_DATA(). Move the __end_rodata symbol to cover these as well.
>
> Setting memory to read-only at boot is done using __init_begin,
> change that that to use __end_rodata.

Did you just do that because it seems logical?

Because it does seem logical, but it leaves a RWX region in the gap
between __end_rodata and __init_begin, which is bad.

This is the current behaviour, on radix:

---[ Start of kernel VM ]---
0xc000000000000000-0xc000000001ffffff  0x0000000000000000        32M         r      X   pte  valid  present        dirty  accessed
0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M         r  w       pte  valid  present        dirty  accessed

And with your change:

---[ Start of kernel VM ]---
0xc000000000000000-0xc0000000013fffff  0x0000000000000000        20M         r      X   pte  valid  present        dirty  accessed
0xc000000001400000-0xc000000001ffffff  0x0000000001400000        12M         r  w   X   pte  valid  present        dirty  accessed
0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M         r  w       pte  valid  present        dirty  accessed


On radix the 16M alignment is larger than we need, but we need to chose
a value at build time that works for radix and hash.

We could make the code smarter on radix, to mark those pages in between
__end_rodata and __init_begin as RW_ and use them for data. But that
would be a more involved change.

I think if we just drop the changes to the C files this patch is OK to
go in.

cheers
