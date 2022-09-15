Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D214B5B9697
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 10:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSrSz1m1Gz3c65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 18:48:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AaYWHotk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=AaYWHotk;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSrSH29cTz30Dp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 18:47:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ivQ/eNxqEghjLz7rraJxCT2L5vao4XynCLSzvaLXpmQ=; b=AaYWHotkjSaBPPaDMgKlOP0sp2
	4WoMIWcg2PRmd499ZOSulGJU2/YqW9WK5yskc8Fp3dF6h0rApS22AkYrNsPLKnjxBpmSKhAmw/GvV
	SLDooue6nA3ZPzjl/NmBqFcg3VhJopSpsio0BqirDsuQda7KKG+g4ha5WfObKQ1Bczbe+VaOgqp3D
	KD0sX5hw7trhBFVQNceUF62xl/pAOB6AQ3rtJgvpHauySZUM8pJDpHw9JbABUs9xsk97ZJHRcjHru
	H2wmb1hKmnl15Wfetkb+BkoskakzoCKDB982K4R78EBUD1oUP2wSfnuL0SYCCEwyObsL1nAN/mx4p
	mG5RPjeg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkWY-000w90-8S; Thu, 15 Sep 2022 08:47:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 26C6530010B;
	Thu, 15 Sep 2022 10:47:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 04DBC201ABB97; Thu, 15 Sep 2022 10:47:01 +0200 (CEST)
Date: Thu, 15 Sep 2022 10:47:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [RFC] Objtool toolchain proposal:
 -fannotate-{jump-table,noreturn}
Message-ID: <YyLmhUxTUaNzaieC@hirez.programming.kicks-ass.net>
References: <20220909180704.jwwed4zhwvin7uyi@treble>
 <Yx8PcldkdOLN8eaw@nazgul.tnic>
 <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de>
 <6a61aa57-141f-039c-5a2d-b2d79fecb8c2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a61aa57-141f-039c-5a2d-b2d79fecb8c2@huawei.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 15, 2022 at 10:56:58AM +0800, Chen Zhongjin wrote:

> We have found some anonymous information on x86 in .rodata.

Well yes, but that's still a bunch of heuristics on our side.

> I'm not sure if those are *all* of Josh wanted on x86, however for arm64 we
> did not found that in the same section so it is a problem on arm64 now.

Nick found Bolt managed the ARM64 jumptables:

  https://github.com/llvm/llvm-project/blob/main/bolt/lib/Target/AArch64/AArch64MCPlusBuilder.cpp#L484

But that does look like a less than ideal solution too.

> Does the compiler will emit these for all arches? At lease I tried and
> didn't find anything meaningful (maybe I omitted it).

That's the question; can we get the compiler to help us here in a well
defined manner.
