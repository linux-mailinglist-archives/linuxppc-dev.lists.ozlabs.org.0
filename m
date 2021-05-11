Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E904A379C4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfLVC01Fvz308l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 11:50:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HjbE8xHK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HjbE8xHK; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfLTj5krMz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 11:50:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfLTf71vzz9sWq;
 Tue, 11 May 2021 11:50:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620697815;
 bh=6Tbo2+XuK01CmUlRQdE2eT23+kAa6cyfz+ps43fG7SA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HjbE8xHKcqqTsWtctdsK21GDasEq9DlzCCvR44yW6x3Uhjgzq9FTTmRiXjGU8iN9r
 SIYgNfKRu6xpvlTsluzqwq4BD3X0ZoJ3FwEIo+CE8YUYsFVcrwWzuowawT3SqhwHI5
 R4Nu9PHRpoc1zJPNijiKIcF24Q8BPIvP8xhqvFGjaxtkpyHzhn7+k4Pp35N4/LBoCy
 u9IMde+S7uwk9JlTt/LvKZaO0m/2+7MYswus8hiv8qAG+NhZdxTSgb6Jgdcx6v2alp
 3X81B6Ez3v4fBCAQWPJceoMk7fLH9I5r2kzAaZ9A1p+fEE3wcY1s8Dpzj+b3oBJBbN
 hw4Eke7P0568w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Haren Myneni <haren@linux.ibm.com>,
 herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V3 02/16] powerpc/vas: Move VAS API to common book3s
 platform
In-Reply-To: <1620623481.kmr54zmxzv.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <163867b893124434dfe3e13c6ba2f081c309e96f.camel@linux.ibm.com>
 <1620623481.kmr54zmxzv.astroid@bobo.none>
Date: Tue, 11 May 2021 11:50:11 +1000
Message-ID: <87pmxyxcmk.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Haren Myneni's message of April 18, 2021 7:02 am:
>> 
>> Using the same /dev/crypto/nx-gzip interface for both powerNV and
>> pseries.
>
> The pseries NX driver will use the powernv VAS API ?
>
>> So this patch creates platforms/book3s/ and moves VAS API
>> to that directory. The actual functionality is not changed.
>> 
>> Common interface functions such as open, window open ioctl, mmap
>> and close are moved to arch/powerpc/platforms/book3s/vas-api.c
>> Added hooks to call platform specific code, but the underline
>> powerNV code in these functions is not changed.
>
> Even so, could you do one patch that just moves, and another that
> adds the ops struct?
>
>> 
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/vas.h                | 22 ++++++-
>>  arch/powerpc/platforms/Kconfig                |  1 +
>>  arch/powerpc/platforms/Makefile               |  1 +
>>  arch/powerpc/platforms/book3s/Kconfig         | 15 +++++
>>  arch/powerpc/platforms/book3s/Makefile        |  2 +
>
> The usual place for these would be arch/powerpc/sysdev/vas. E.g., see
> arch/powerpc/sysdev/xive.

You're right that is the usual place, but is it a good place? :)

Using platforms/book3s was my suggestion:

  https://lore.kernel.org/linuxppc-dev/87k0p6s5lo.fsf@mpe.ellerman.id.au/


But I don't feel that strongly about it, maybe just dumping things in
sysdev is easier.

cheers
