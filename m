Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F946400A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 07:51:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNk9s4Vzfz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 17:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=coT1wWQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNk8w0R6Vz3bXF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 17:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=coT1wWQg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNk8s65cJz4x1V;
	Fri,  2 Dec 2022 17:50:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669963821;
	bh=MBDH4Ufi070Dq6cJndjxe4ZAHQPT69+GIqsE04X9J3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=coT1wWQgbczpMVfatyjtNPBZWxZI0dL8yTg8THtGs4YDzzpX+og2pqPbokN/9tojM
	 WreO6ImyTTr3BoTnM+Y+ivhNwA1TEHpL92OxjygXj4vXpa1FnrNMeFu7PnKi1sKahM
	 fWdEm4M8uLz2TaDWQWMtpOUvz2D4Oienf905Gs7Lko72OYc5LgRAqzX9KW7P7SI/0p
	 3/SGzsk+jNKP3UB5NTs3CbdJsBSzEdzIdq6GEDDR9jRRgpmDpYV8jRSVVX001N+nG8
	 PyqiUofykccD8TSsZg5t5ADLLuD8H5PMWETuGBBdAvfVo1WfGnGiHMudR92NIYRlpO
	 55Rsx7JE4hXCg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next] BUILD REGRESSION
 3604661f206238a0295df53e38b7986a91c00cc4
In-Reply-To: <63895102.kcGIRx6yG2wDv9HT%lkp@intel.com>
References: <63895102.kcGIRx6yG2wDv9HT%lkp@intel.com>
Date: Fri, 02 Dec 2022 17:50:16 +1100
Message-ID: <87r0xi1eqf.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> branch HEAD: 3604661f206238a0295df53e38b7986a91c00cc4  Merge branch 'topic/qspinlock' into next
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202212020435.DR1CHxrP-lkp@intel.com
>
> Error/Warning: (recently discovered and may have been fixed)
>
> lockdep.c:(.text.lockdep_register_key+0x174): undefined reference to `queued_spin_lock_slowpath'
> rtas.c:(.text.lock_rtas+0xc0): undefined reference to `queued_spin_lock_slowpath'
> rtas.c:(.text.rtas_give_timebase+0xd0): undefined reference to `queued_spin_lock_slowpath'
> rtas.c:(.text.rtas_take_timebase+0xc4): undefined reference to `queued_spin_lock_slowpath'
> traps.c:(.text.oops_begin+0x10c): undefined reference to `queued_spin_lock_slowpath'
>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> `-- powerpc-allmodconfig
>     |-- lockdep.c:(.text.lockdep_register_key):undefined-reference-to-queued_spin_lock_slowpath
>     |-- rtas.c:(.text.lock_rtas):undefined-reference-to-queued_spin_lock_slowpath
>     |-- rtas.c:(.text.rtas_give_timebase):undefined-reference-to-queued_spin_lock_slowpath
>     |-- rtas.c:(.text.rtas_take_timebase):undefined-reference-to-queued_spin_lock_slowpath
>     `-- traps.c:(.text.oops_begin):undefined-reference-to-queued_spin_lock_slowpath

That's a 32-bit allmodconfig, which is not obvious.

Nick sent me a hunk to fix this but I didn't squash it in, will fix.

cheers
