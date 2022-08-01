Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0307586972
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 14:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxGw135Swz3053
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 22:02:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sCAF76C1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxGvR1nl6z2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 22:02:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sCAF76C1;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxGvL0zpbz4x1S;
	Mon,  1 Aug 2022 22:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659355326;
	bh=Vq9IA/cFesGB5Mx5eyRC2AhqzrsVyJfSsyWUHa5qg+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sCAF76C144IP1WmVfpfc5HyzOoPBq81zl/iqcJOzdHUDkWmiP42uwSWmr4bcbFLNB
	 WqRlWqo9ioHsmwEy/cma4AM54+79JmYSYs5de2zcbClAnZgbcDOkQnFNuk7RRR3imd
	 TkSWiq2b1Gl2SYqo4Bp2HWphJUxzfe2WLQ7YsfFOLyKoPe5D/n2YGLoF0qppLtnJXV
	 ZieIlRdjbPhIcMc3rkmX0Cs0FreJT5AeRje1njEAGRcfnD9WrBlHFHCw9Sl/wjZC+u
	 mItj323vIbkhx4zRjkmeUGGruD9YPimQcv/0rjClGYY1qqLSZ/uJnEvmaGTFd3hdD/
	 9BvqimsH/UhKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/64: poison __per_cpu_offset to catch
 use-before-init
In-Reply-To: <20220711030653.150950-2-npiggin@gmail.com>
References: <20220711030653.150950-1-npiggin@gmail.com>
 <20220711030653.150950-2-npiggin@gmail.com>
Date: Mon, 01 Aug 2022 22:02:03 +1000
Message-ID: <87bkt4b29w.fsf@mpe.ellerman.id.au>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> If the boot CPU tries to access per-cpu data of other CPUs before
> per cpu areas are set up, it will unexpectedly use offset 0.
>
> Try to catch such accesses by poisoning the __per_cpu_offset array.

I wasn't sure about this.

On bare metal it's just an instant checkstop which is very user hostile.

I worry it's just going to cause unusual configurations/options to crash
for folks, like eg. booting with page_poison=1 did a while back.

Can we put it behind a debug option? Maybe CONFIG_DEBUG_VM ?

cheers
