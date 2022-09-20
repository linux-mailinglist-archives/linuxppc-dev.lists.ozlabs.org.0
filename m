Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD195BEB59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:50:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX6wx3lwJz3c65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FbjFfJIq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FbjFfJIq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX6wH3Gdwz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 02:49:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E87F462B3E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 16:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B32AC433B5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663692586;
	bh=vmyvq1aUOmre0E18ZlTOn9QV1cEhyDcjVLUmO5iK2lI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FbjFfJIq2m+Nxif0jMsvbr+hIADfvpyb6qNxQyAL08pZxUZKDCbA79J+mtyY5g/L0
	 t1SqU6AVg158djYCu+OA6imNwsP5D2zDP8o003yhguUxX6U27NuGHF8HifmAqWAEWV
	 WGXjT/bFl0zznSVGUFuCFsWx94Vt2ETGBFw6dN1x2aMh28I1Fb/NafyKdlmFeLSgum
	 kJI805UmX5jj/hOjpnzuqJM0dg1Z5KUdcNnqiAQJ41gYMI/uv9j3U21bEr9W/wY6Qq
	 Xcs98+Qndy5g/1+UNaHl/qGv2oou1rP9wL4xFBg0RusYn2XdCXXKa2kmK4BRbD4rY5
	 En9G5F62vNbFQ==
Received: by mail-lj1-f170.google.com with SMTP id q17so3698779lji.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 09:49:46 -0700 (PDT)
X-Gm-Message-State: ACrzQf1nigpnH7cbK6k4Gm7h5HGd0USz28DF929j4DWBCXFEkMX5FS1H
	tzRQ8SE2yToIRmS2PvI4aIf3bGbONcqJeIFAVrk=
X-Google-Smtp-Source: AMsMyM5uPplRBbNk8KwaMSLyjriPjQasS2fkIsUEtjL7XSBKzzbCRhdfBYv0bnsu6GsemWK7B38+lm296jjp7PBFcjA=
X-Received: by 2002:a2e:9115:0:b0:26a:c086:5138 with SMTP id
 m21-20020a2e9115000000b0026ac0865138mr6796874ljg.189.1663692584393; Tue, 20
 Sep 2022 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220909180704.jwwed4zhwvin7uyi@treble> <Yx8PcldkdOLN8eaw@nazgul.tnic>
 <alpine.LSU.2.20.2209121200120.8265@wotan.suse.de> <6a61aa57-141f-039c-5a2d-b2d79fecb8c2@huawei.com>
 <YyLmhUxTUaNzaieC@hirez.programming.kicks-ass.net>
In-Reply-To: <YyLmhUxTUaNzaieC@hirez.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 20 Sep 2022 18:49:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGa7D6TLOQruYF+0czWwxcRxN7k1rWTrhB2xnjTQ32c9Q@mail.gmail.com>
Message-ID: <CAMj1kXGa7D6TLOQruYF+0czWwxcRxN7k1rWTrhB2xnjTQ32c9Q@mail.gmail.com>
Subject: Re: [RFC] Objtool toolchain proposal: -fannotate-{jump-table,noreturn}
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, Will Deacon <will@kernel.org>, Michael Matz <matz@suse.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Sept 2022 at 10:47, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Sep 15, 2022 at 10:56:58AM +0800, Chen Zhongjin wrote:
>
> > We have found some anonymous information on x86 in .rodata.
>
> Well yes, but that's still a bunch of heuristics on our side.
>
> > I'm not sure if those are *all* of Josh wanted on x86, however for arm64 we
> > did not found that in the same section so it is a problem on arm64 now.
>
> Nick found Bolt managed the ARM64 jumptables:
>
>   https://github.com/llvm/llvm-project/blob/main/bolt/lib/Target/AArch64/AArch64MCPlusBuilder.cpp#L484
>
> But that does look like a less than ideal solution too.
>
> > Does the compiler will emit these for all arches? At lease I tried and
> > didn't find anything meaningful (maybe I omitted it).
>
> That's the question; can we get the compiler to help us here in a well
> defined manner.

Do BTI landing pads help at all here? I.e., I assume that objtool just
treats any indirect call as a dangling edge in the control flow graph,
and the problem is identifying the valid targets. In the BTI case,
those will all start with a 'BTI J' instruction.
