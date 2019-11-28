Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC710C352
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 06:01:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NlpS6Jk9zDqyq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 16:01:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NlmJ08DpzDqxd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 15:59:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ssvgjrk/"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47NlmG4J8Vz9sPK;
 Thu, 28 Nov 2019 15:59:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574917151;
 bh=UoM1p2I0xAHcGr6mKwAQtqM+WSIgrcRigkz6MWIzVVU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ssvgjrk/BnOGo2u2AxzaIu+BZcSJTJ9zlWYiOKL8ssK/CWox8pOXKYQEIK3vOTEdz
 j+T42QQAWRRTtA/ROsQVAGUYyI7d3IjKrJslmlk9o3AwBoE7X/OOonjdTwNG2AcqsV
 MQXpIthMYrBlJpAr08gDsfsjDYtVza+yZPCwTbv9Kad7pMWeQdgEadhgnEj6wTVEJv
 h0zKnBKXmvtKeyD+tg3AYu0i7B0kXMza7RQ62CYkqi8CnFpQdTQ2L6PWsN0Dhfo4kK
 vhVujwN8yD5cRQ75YsN7RtQwk3gJTHK1FbMVmcU0VZWL99ZmPX9RKmgvX7AvW10W/w
 h2jwGUfD5xHVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v5 0/3] LLVM/Clang fixes for a few defconfigs
In-Reply-To: <CAKwvOd=3Ok8A8V30fccK5UzWFZ7zwG_zvGQV44S2BK4o2akbgw@mail.gmail.com>
References: <20191014025101.18567-1-natechancellor@gmail.com>
 <20191119045712.39633-1-natechancellor@gmail.com>
 <CAKwvOd=3Ok8A8V30fccK5UzWFZ7zwG_zvGQV44S2BK4o2akbgw@mail.gmail.com>
Date: Thu, 28 Nov 2019 15:59:07 +1100
Message-ID: <87v9r4zjdw.fsf@mpe.ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Desaulniers <ndesaulniers@google.com> writes:
> Hi Michael,
> Do you have feedback for Nathan? Rebasing these patches is becoming a
> nuisance for our CI, and we would like to keep building PPC w/ Clang.

Sorry just lost in the flood of patches.

Merged now.

cheers

> On Mon, Nov 18, 2019 at 8:57 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
>>
>> Hi all,
>>
>> This series includes a set of fixes for LLVM/Clang when building
>> a few defconfigs (powernv, ppc44x, and pseries are the ones that our
>> CI configuration tests [1]). The first patch fixes pseries_defconfig,
>> which has never worked in mainline. The second and third patches fixes
>> issues with all of these configs due to internal changes to LLVM, which
>> point out issues with the kernel.
>>
>> These have been broken since July/August, it would be nice to get these
>> reviewed and applied. Please let me know what I can do to get these
>> applied soon so we can stop applying them out of tree.
>>
>> [1]: https://github.com/ClangBuiltLinux/continuous-integration
>>
>> Previous versions:
>>
>> v3: https://lore.kernel.org/lkml/20190911182049.77853-1-natechancellor@gmail.com/
>>
>> v4: https://lore.kernel.org/lkml/20191014025101.18567-1-natechancellor@gmail.com/
>>
>> Cheers,
>> Nathan
>>
>>
>
>
> -- 
> Thanks,
> ~Nick Desaulniers
