Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F853A9BC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 15:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4m0r6228z3byZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 23:16:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iq21nY+l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iq21nY+l; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4m0P3p1Yz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 23:16:05 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G4m0M4MNVz9sXN; Wed, 16 Jun 2021 23:16:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4m0M1jzkz9sXG;
 Wed, 16 Jun 2021 23:16:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623849363;
 bh=3b52rQs0fiBVy4a26RpNkv6YV/hurzJhrdxYv1c4/6k=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=iq21nY+lQMFhkeZlLVcdkpzP+Yb9FgVTMV87TumgIrCyPeFf2ELbuhH9h3J9+i7E5
 V7YYlS+juZv4HNdb3qAr4uhgJ7vi624vrErZtrz+9eFIBY1lxH098pl/MhIUrW1Awx
 nCSZcXbw1HZFlbh6vLW9f5oYvBen84wfxerThLwsU+Ze8xNS6f92kh/wRItFDr0K5Q
 z1uHiz5oXG6L2Q6qGjem+UKNMqczSc4SGhZCSaCvFzKmLklnjG5J2Qxd1E2jhyPJoe
 RAcofqqje+ytQKW7XCuo1wUPfPCqAy9Hg203t7G1UTJumx0F/41Wxbq9vLdZglWviy
 jxmNzXYv85Pwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org, Paul
 Mackerras <paulus@ozlabs.org>
Subject: Re: [PATCH 07/11] powerpc: Add support for microwatt's hardware
 random number generator
In-Reply-To: <1623720368.eqmkro3mgw.astroid@bobo.none>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMff6iLDiCbFQmrW@thinks.paulus.ozlabs.org>
 <1623720368.eqmkro3mgw.astroid@bobo.none>
Date: Wed, 16 Jun 2021 23:16:02 +1000
Message-ID: <87bl86rlv1.fsf@mpe.ellerman.id.au>
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
> Excerpts from Paul Mackerras's message of June 15, 2021 9:02 am:
>> This is accessed using the DARN instruction and should probably be
>> done more generically.
>> 
>> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
>> ---
>>  arch/powerpc/include/asm/archrandom.h     | 12 +++++-
>>  arch/powerpc/platforms/microwatt/Kconfig  |  1 +
>>  arch/powerpc/platforms/microwatt/Makefile |  2 +-
>>  arch/powerpc/platforms/microwatt/rng.c    | 48 +++++++++++++++++++++++
>>  4 files changed, 61 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/microwatt/rng.c
>> 
>> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
>> index 9a53e29680f4..e8ae0f7740f9 100644
>> --- a/arch/powerpc/include/asm/archrandom.h
>> +++ b/arch/powerpc/include/asm/archrandom.h
>> @@ -8,12 +8,22 @@
>>  
>>  static inline bool __must_check arch_get_random_long(unsigned long *v)
>>  {
>> +	if (ppc_md.get_random_seed)
>> +		return ppc_md.get_random_seed(v);
>> +
>>  	return false;
>>  }
>>  
>>  static inline bool __must_check arch_get_random_int(unsigned int *v)
>>  {
>> -	return false;
>> +	unsigned long val;
>> +	bool rc;
>> +
>> +	rc = arch_get_random_long(&val);
>> +	if (rc)
>> +		*v = val;
>> +
>> +	return rc;
>>  }
>>  
>
> I would be happier if you didn't change this (or at least put it in its 
> own patch explaining why it's not going to slow down other platforms).

It would essentially be a revert of 01c9348c7620 ("powerpc: Use hardware
RNG for arch_get_random_seed_* not arch_get_random_*")

Which would be ironic :)

cheers
