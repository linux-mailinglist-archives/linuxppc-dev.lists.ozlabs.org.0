Return-Path: <linuxppc-dev+bounces-2692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A473C9B56ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 00:29:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdRKq25Mlz2yLB;
	Wed, 30 Oct 2024 10:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730244559;
	cv=none; b=BWhFk1JgfUGLQUpy/AdmAMvoT6EpJbgHgFhUhqwpob4+yxn8TDqmliA7BBdEAWtqWySHgyCDPQPdfuf0Sfjz+CNBb3yyVDwURDmQLSP7Sy6jORx86LFi4qwYqkcq9ofmjtO5YlKJ7QDCSUDGZkCCQWbKTMQtKICrgoQ0Dcl9wC8u/9gUjpIQcwNsHxijJeUX4pjNlxcZO2ukpe+qk/gfkqTSLh/eyFp06WvAPlQVwDmlc6aQLUYQhjf+mJn6VjTgrcOQpJcM183IR4bxe0V9YwmLshlOi8Hw4kpc5XC3M/sDJsRNi3hluMgV+wibwhkapWHyCaj/z7QF9EOzSREAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730244559; c=relaxed/relaxed;
	bh=KNeYgmMAGPIyHDJl3QbZDwIGpEYDsMZZ+DjYHgkmPyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E/qnNV/AhuNFJ89zCrhL3d2zSzcGCsXPjRzOFyLvLxhjDDcwyOSkfunqAkF9+Ug3FezWDC5OAVW3gnwwC3Kc4riud4/SMW0dFMILZi0pKVDMY391Ele34wcs/LEBzxNLkxL5FpHx8jZEEam7A4heAYmElt79yuN+XCv1rneVjK6b2+nkqVa26VEhS/bjN60BF8VFKUElmJ+DUMh5pmvkAwKnLZ3aF9SUoWGXYZo9szBANMEzfAanaimCNOTN3aTC+MPOq7+9Mt415qW//Kdj053nfqStbtuF/qrAzBdlWINjIHdblFGN5mhfTRyieosBgRwLXcROcaJqG0l8yRVi0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ernYnpst; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ernYnpst;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdRKp26Vbz2xHx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 10:29:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730244554;
	bh=KNeYgmMAGPIyHDJl3QbZDwIGpEYDsMZZ+DjYHgkmPyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ernYnpstgOY9FLJSuqniQzAK5V9UK8eyHKkWmNM4PA0t1dXeQPGjlTfwrDZyFezT6
	 iWLk7Uzn33TOfEKmxjdQLqISv24MCjpXIGy2CpU1pth39D9hnEAzGOR1gAdsl6rP/K
	 zfVpxz5QZOskQls+r7skNA9V5l4p2Gv5wBp0mvqWANGsMluS/LAP5XojKbgbXF4aOb
	 Q3amzWjyJMHnLbjz0bxLDWaNzBwtFXJifVzYyo8thrdKZoeWAumsu4z0RGhHObz615
	 M+KLPFUVKK99SbzPqtWEQ96785m4MMf33J465wGEiVwzPkpht0lGYnXXrop/PAJYlC
	 BlDqr1AK0lwvQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdRKc4hCzz4wbR;
	Wed, 30 Oct 2024 10:29:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Vlastimil Babka <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@Oracle.com>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
In-Reply-To: <20241029055133.121418-1-nysal@linux.ibm.com>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
Date: Wed, 30 Oct 2024 10:29:09 +1100
Message-ID: <87ed3yebei.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> is not selected, sync_core_before_usermode() is a no-op.
> In membarrier_mm_sync_core_before_usermode() the compiler does not
> eliminate redundant branches and load of mm->membarrier_state
> for this case as the atomic_read() cannot be optimized away.
>
> Here's a snippet of the code generated for finish_task_switch() on powerpc
> prior to this change:
>
> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
> .......
> 1b78c8:   cmpdi   cr7,r26,0
> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
> 1b78d0:   ld      r9,2312(r13)    # current
> 1b78d4:   ld      r9,1888(r9)     # current->mm
> 1b78d8:   cmpd    cr7,r26,r9
> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
> 1b78e0:   hwsync
> 1b78e4:   cmplwi  cr7,r27,128
> .......
> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

