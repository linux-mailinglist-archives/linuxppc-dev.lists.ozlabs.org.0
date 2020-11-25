Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B92C36D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 03:49:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cglhn6wC5zDqZm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cglfw1gSQzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 13:47:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L8Tfofay; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cglfv1DY7z9sSs;
 Wed, 25 Nov 2020 13:47:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606272455;
 bh=BiqObHiACRupyi7IpqkvSTHcKnK1tO8o+JWyAxdrA/Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L8Tfofay4SCOhM5MvmVz43GD93Wfj85EL2PHJkr+oApfr6ns+iYBG4lyW3tqbRVOt
 cp70ORWxuDaEfuH1jnTCk3nAyMc+jJCle9j3H2xWmqH50jW5E+EoB5btJZug2Qx5JZ
 NrrJq6N/9TpMZMTkEIm5xPGKv7f7TD88MjRXoYpDmmjHaV0r2XXa2tFakP02whYwGC
 3BGYUK/hZgvfppdTXGXXEFGJTG7fmV0ZILqkefMmfCOBI41lQ9yEqortBRwzGzpDbz
 VAYlQZm4zKzytWP4FwYu9wusVbmKsAgbgPssh4CPe92DyV5As9/YosBP318MYULNvT
 Sx44pADewOefQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure in Linus' tree
In-Reply-To: <87h7pfhac3.fsf@dja-thinkpad.axtens.net>
References: <20201123184016.693fe464@canb.auug.org.au>
 <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
 <87h7pfhac3.fsf@dja-thinkpad.axtens.net>
Date: Wed, 25 Nov 2020 13:47:31 +1100
Message-ID: <87r1oiywxo.fsf@mpe.ellerman.id.au>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Thanks sfr and mpe.
>
>> Applied to powerpc/fixes.
>>
>> [1/1] powerpc/64s: Fix allnoconfig build since uaccess flush
>>       https://git.kernel.org/powerpc/c/b6b79dd53082db11070b4368d85dd6699ff0b063
>
> We also needed a similar fix for stable, which has also been applied.
>
> I guess I should build some sort of build process that tests a whole
> range of configs. I did test a few but clearly not enough. Is there a
> known list that I should be using? Something from kisskb?

It's basically unsolvable in general. I guess allnoconfig is a good one
to build, although by default that gets you a 32-bit config.

I'll send a patch to add ppc64le_allnoconfig.

cheers
