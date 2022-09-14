Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF675B7DD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 02:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS14n42gVz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 10:12:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AeeDYlyn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AeeDYlyn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS14B6qWSz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 10:12:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8163B81196;
	Wed, 14 Sep 2022 00:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647DEC433D6;
	Wed, 14 Sep 2022 00:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663114342;
	bh=PkSh2//wMMp1MucFJs9CmlOv4o1oTLiq6JeiANe5BEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeeDYlynyt1LJBaJ00Iv8XZJT10JWjMT0mMUqrTKdFOuLS6T/Q+8fpljbd1GOBeaM
	 svEGoLsrMaa0ItXAYwG0HoHZwQ7vSF6x5IzXZrpvqEuL7knNH7XINDQov0BAn42rd0
	 BSqGyhaU7mwqMx7slEz1YhuLCGA5XCpyfFzzkERDDIbTmX7CeojbnJna9/sFXzg4vX
	 tw09jGuizzgFnYcTuWVnb1jpaOVYWBQZWowJbVldBmU6Kd0qTbeTRQw3YKPS9SX8Rh
	 7qcnz0bxNiF9EpzRaINR/0rVnn3ph7Lvuk6h5wZumNm6w85W4RaEWu4NpWL9nwUhTO
	 3dcW/kYdRPmFw==
Date: Wed, 14 Sep 2022 01:12:05 +0100
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Indu Bhagat <indu.bhagat@oracle.com>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Message-ID: <20220914001205.ygvmwya5wcawcodj@treble>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <9f01a8b9-9ec6-6759-ba14-ee529a5b973a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9f01a8b9-9ec6-6759-ba14-ee529a5b973a@oracle.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 13, 2022 at 03:51:44PM -0700, Indu Bhagat wrote:
> Curious to know what all features of objtool rely on the need to reverse
> engineer the control flow graph. Is it a larger set or it is only for ORC
> generation ?

Objtool features which rely on the CFG:

- Frame pointer rule validation (when using
  CONFIG_UNWINDER_FRAME_POINTER)

- ORC metadata generation

- Intel SMAP rule validation - ensures EFLAGS #AC is only set during
  usercopy

- "noinstr" rule validation - ensures no instrumentation/tracing
  functions are called in certain critical sections

-- 
Josh
