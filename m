Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EED7B146818
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 13:34:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483MD764QxzDqTl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 23:34:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483M7s0cgkzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 23:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XcDFF1F6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 483M7r0bhgz9sSH;
 Thu, 23 Jan 2020 23:31:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579782664;
 bh=vvHlt/x8yUKYf+nz2OV13dtkaSiK0JSgmAVt6B2ldwU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XcDFF1F6y3fTk8tq1K8XQWrclXCC3LBJX5o7RCzFiNdgBW2TQ0S3QmB9AqGLHxrk9
 2Mjirn0e1OnxQ5oedT0kG1SYJZFPYdacZ+mU4aUSTRZ7ULER+33hVi1FDJtisTetC0
 s8ix3OdHy+NqsDBBHVmqpZR+YphcDFOhfMy5xUR7Tn2x0cjHgrWbJicQyEKzSYKM68
 IW6GqA06/2gL7IrO6MWwCd/B9NVeCAWgmJnZfOZaEm1HK+sqo1LBQZQY8XNNGL8dky
 TVM9IaaQC1iIxowbHFjZdKrpwL297gUB5DF+isxN3rcEMAIkgADPk4M3Q1ZqGGnWED
 TvCrztQ+nOF/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2 6/6] powerpc: Implement user_access_begin and friends
In-Reply-To: <87iml2idi9.fsf@mpe.ellerman.id.au>
References: <12a4be679e43de1eca6e5e2173163f27e2f25236.1579715466.git.christophe.leroy@c-s.fr>
 <2a20d19776faba4d85dbe51ae00a5f6ac5ac0969.1579715466.git.christophe.leroy@c-s.fr>
 <87iml2idi9.fsf@mpe.ellerman.id.au>
Date: Thu, 23 Jan 2020 23:31:03 +1100
Message-ID: <87ftg6icc8.fsf@mpe.ellerman.id.au>
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Today, when a function like strncpy_from_user() is called,
>> the userspace access protection is de-activated and re-activated
>> for every word read.
>>
>> By implementing user_access_begin and friends, the protection
>> is de-activated at the beginning of the copy and re-activated at the
>> end.
>>
>> Implement user_access_begin(), user_access_end() and
>> unsafe_get_user(), unsafe_put_user() and unsafe_copy_to_user()
>>
>> For the time being, we keep user_access_save() and
>> user_access_restore() as nops.
>
> That means we will run with user access enabled in a few more places, but
> it's only used sparingly AFAICS:
>
>   kernel/trace/trace_branch.c:    unsigned long flags = user_access_save();
>   lib/ubsan.c:    unsigned long flags = user_access_save();
>   lib/ubsan.c:    unsigned long ua_flags = user_access_save();
>   mm/kasan/common.c:      unsigned long flags = user_access_save();
>
> And we don't have objtool checking that user access enablement isn't
> leaking in the first place, so I guess it's OK for us not to implement
> these to begin with?

It looks like we can implement them on on all three KUAP
implementations.

For radix and 8xx we just return/set the relevant SPR.

For book3s/32/kup.h I think we'd just need to add a KUAP_CURRENT case to
allow_user_access()?

cheers
