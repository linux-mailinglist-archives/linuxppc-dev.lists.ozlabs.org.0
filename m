Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921525B4FA8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 17:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQYcz1Sgdz3c69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 01:32:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oO8Niz22;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oO8Niz22;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQYcM025Nz2ywr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:31:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 955A3B80B1F
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 15:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0E8C4347C
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662910300;
	bh=f4ZjQtH1Kb0CE5y0VGooWc8Wwj1HiVheMrl2j8fAjUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oO8Niz22F7cR9uhxQCzGa6wr02G8Syb9kA9rA9StaItcNtzrQ9KWhSQ8TwS4hZED0
	 OtHWcXjICpsCtwg8J3ty45NOtRKK7bIvlpd6UBV1lHAMEsTBb8X8DY1qgRgf19tXxJ
	 rQLpRhCGTY7hVuFjg7TJq1pbZxVNEu1pFIDGR4MD7b6RmKxwsFzAaVX/a6bJ7q+NTb
	 kEWQK3ZtenVrQeqp0BibUa9OTFhI+w4AY4bz5NrPn5+KBiBsQNBDroF2HBOYqmah/G
	 aMFAGA2CW05mXcBKMndx6BdDZQiw4OJpw0hqWLDrFdQb/kD5iiuSUE4eCVaXr/Fe2W
	 kIvEc5J3Ay40Q==
Received: by mail-lf1-f49.google.com with SMTP id z25so10995198lfr.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 08:31:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo1se+cz4PYnNj3qxftaguIGk2A6c8do6ZgdUlPKiCCzdUkERL15
	kewPEqEzNuw7UtBgDoppzcQDtYcfJ1adr59vooU=
X-Google-Smtp-Source: AA6agR5hxuBvoUADUO4ivCFrh/xCsticI1ehP5Bn50QlfvL3G2hM+MkwsvALBS2FU8Qg9FovT9yybFEh1B7f+I9Z1fU=
X-Received: by 2002:ac2:4431:0:b0:497:aaf5:83eb with SMTP id
 w17-20020ac24431000000b00497aaf583ebmr6784950lfl.228.1662910298289; Sun, 11
 Sep 2022 08:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220909180704.jwwed4zhwvin7uyi@treble> <Yx3+GpHakZZYLM1N@hirez.programming.kicks-ass.net>
In-Reply-To: <Yx3+GpHakZZYLM1N@hirez.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 11 Sep 2022 16:31:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGKHJHHvKRvZgq6Dy5BaR4vMUx8QXaw4XAqOhHxE3sb3Q@mail.gmail.com>
Message-ID: <CAMj1kXGKHJHHvKRvZgq6Dy5BaR4vMUx8QXaw4XAqOhHxE3sb3Q@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org, Chen Zhongjin <chenzhongjin@huawei.com>, x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, linux-toolchains@vger.kernel.org, Indu Bhagat <indu.bhagat@oracle.com>, live-patching@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, "Jose E. Marchesi" <jemarch@gnu.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 11 Sept 2022 at 16:26, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Sep 09, 2022 at 11:07:04AM -0700, Josh Poimboeuf wrote:
> > Alternatives
> > ------------
> >
> > Another idea which has been floated in the past is for objtool to read
> > DWARF (or .eh_frame) to help it figure out the control flow.  That
> > hasn't been tried yet, but would be considerably more difficult and
> > fragile IMO.
>
> I though Ard played around with that a bit on ARM64. And yes, given that
> most toolchains consider DWARF itself best-effort, I'm not holding my
> breath there.
>

I have patches out that use unwind data to locate pointer auth
sign/authenticate instructions in the code, in order to patch them to
shadow call stack pushes and pops at runtime if pointer authentication
is not supported by the hardware. This has little to do with objtool
or reliable stack traces.

I still think DWARF could help to make objtool's job a bit easier, but
I don't think it will be of any use with jump tables or noreturn
functions in particular.
