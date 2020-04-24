Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DC1B6BE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 05:25:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497fh16N4pzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 13:25:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497fdS3V0JzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 13:23:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DMkHr9Ib; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 497fdQ6pKKz9sRN;
 Fri, 24 Apr 2020 13:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587698604;
 bh=yAIc2uyPXVcFRboAmVKyaSV3odWtXIhpZa+qqsow4dA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DMkHr9Ib5eFf1mzjIT4DzxDSLbh72Pn7BbspM1HinsZ2dwkB1bHihTX/atx1lPDR7
 L/DO8BCuJk/xhYEpHMGj0VfHgShVz+asYSha7A6fbfJyBx+79gmUGf9DpBQvv/xhJG
 Sppljqu27EM7c9vuIOg3W5lWL1GZTdDW49hfAsMfsmFrmn1Ine+aWf0PqDiVEUkgX4
 J84RwLxbd4OkPPp22INlAbVYpjhTHe1NGzB3TOrR+6hKihlWqa+37o7JeEUdxCsgFV
 AyAnOZRee+MlzV13oOX2NUsxhfZkDw+f+uPd1UEI1U3nCO6HL7ysy+4CLA4+lVnFSi
 HoFd8CYzwUmNQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] lib/mpi: Fix building for powerpc with clang
In-Reply-To: <20200423163602.GA18872@ubuntu-s3-xlarge-x86>
References: <20200413195041.24064-1-natechancellor@gmail.com>
 <20200414135731.GA8766@gondor.apana.org.au>
 <20200423163602.GA18872@ubuntu-s3-xlarge-x86>
Date: Fri, 24 Apr 2020 13:23:37 +1000
Message-ID: <87eesdh8hy.fsf@mpe.ellerman.id.au>
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <natechancellor@gmail.com> writes:
> On Tue, Apr 14, 2020 at 11:57:31PM +1000, Herbert Xu wrote:
>> On Mon, Apr 13, 2020 at 12:50:42PM -0700, Nathan Chancellor wrote:
>> > 0day reports over and over on an powerpc randconfig with clang:
>> > 
>> > lib/mpi/generic_mpih-mul1.c:37:13: error: invalid use of a cast in a
>> > inline asm context requiring an l-value: remove the cast or build with
>> > -fheinous-gnu-extensions
>> > 
>> > Remove the superfluous casts, which have been done previously for x86
>> > and arm32 in commit dea632cadd12 ("lib/mpi: fix build with clang") and
>> > commit 7b7c1df2883d ("lib/mpi/longlong.h: fix building with 32-bit
>> > x86").
>> > 
>> > Reported-by: kbuild test robot <lkp@intel.com>
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/991
>> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> 
>> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
>> -- 
>> Email: Herbert Xu <herbert@gondor.apana.org.au>
>> Home Page: http://gondor.apana.org.au/~herbert/
>> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>
> Might be better for you to take this instead. 0day just tripped over
> this again.

Sorry I missed the ack. Will pick it up today.

cheers
