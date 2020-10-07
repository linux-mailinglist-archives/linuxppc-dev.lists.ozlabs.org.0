Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 381702856B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 04:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5drd24W3zDqDy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 13:41:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5dpm1SFczDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 13:40:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZuLcsFkT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5dpl50DNz9sSG;
 Wed,  7 Oct 2020 13:39:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602038399;
 bh=9/8ZpPAufnoZvpigaDUm8QlFsugRCHAfF/9+qSrtSfE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZuLcsFkTAGc0adCAL2ANwr7Q6cy4hj+L6Jq/zRWPzUcbWNUsRQMTO0dT1kB5hkSaA
 34qvy7NPTXhPh/eXE0rSDnBmA5pbfyuPBPWTSFrQNDTg1KGsWX4H+iW/oJ2jExsfiX
 t7Pk/kvXdxZ+Rl+dPiE5SFxedlSly/44f9TNQ6eNnOmdXNUrFPWruWO2szhhBtXaZC
 +l2ZBb3krLp0VHKwmxtoAp7uxa3GGsj/RNuzgMyL/LpTsJw+b8huaZPluN6mo3pY+Y
 YiPA9+yYQpaenPoMFruLMIFYMB6GNoKzc3zz/GRhHe/XiGep2g4rVas8clddzYqsVa
 mJxw0kbWjodTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: Fixes tag needs some work in the powerpc tree
In-Reply-To: <20201007000544.48aabc91@canb.auug.org.au>
References: <20201007000544.48aabc91@canb.auug.org.au>
Date: Wed, 07 Oct 2020 13:39:56 +1100
Message-ID: <87h7r63gjn.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> In commit
>
>   3b6c3adbb2fa ("powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints")
>
> Fixes tag
>
>   Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>
> Since Michael doesn't generally rebase his tree, this is more to be
> remebered for next time.

Yeah, if it was the wrong SHA I would rebase, but not just for a short
SHA.

You can avoid this in future by doing:

$ git config --add core.abbrev 12
$ git config --add pretty.fixes 'Fixes: %h ("%s")'
$ git config --add alias.showfix 'log -1 --format=fixes'

Then you can do:

$ git showfix 7ffd948
Fixes: 7ffd948fae4c ("powerpc/perf: factor out power8 pmu functions")


cheers
