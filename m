Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E2389F01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 09:37:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm1md3QDMz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E2NI0V8g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=E2NI0V8g; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm1m835mPz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 17:37:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fm1m53cSsz9sTD;
 Thu, 20 May 2021 17:37:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621496246;
 bh=YNXG/fdEW6nOHmkEz2qCjN8pOuAjRqPCQKPeccBNqi0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=E2NI0V8gMrs+8omD0srVpFZyvRCj0GIp2sLRuLZWAyDWo0my2IIWqmITIQVq3fQ62
 VMg03LiTgDTQRxDMOvP1QNks5ahwUfv2UskTcqFutkHQAfHl64sKmq2OGrBeq95aiK
 Bm5pWR6uSSu+VWe3P3FCDMsAzRkNy/67oxdzkoVeN8ngQb0Gt7hLrF2tdOtT2lpcRZ
 T7XMkJ07GHIwLr6xNdQa04xT8VtMR/mZs3V4iog8qHkR6ZQY3LykPey6viZfHARDUE
 xlaRLTKKw2vGHZgKvlPXZg8DEFRWkuM0kovL8NlLiAr4kMo9t5KvEyPjk8YLdeECOg
 ky02tUlUBIiOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines
 to take a page walk cache flush argument
In-Reply-To: <20210519120306.GD10366@gate.crashing.org>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <20210519004514.GC10366@gate.crashing.org>
 <20210519120306.GD10366@gate.crashing.org>
Date: Thu, 20 May 2021 17:37:20 +1000
Message-ID: <87y2c9j1ov.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Tue, May 18, 2021 at 07:45:14PM -0500, Segher Boessenkool wrote:
>> On Wed, May 19, 2021 at 10:26:22AM +1000, Michael Ellerman wrote:
>> > Guenter Roeck <linux@roeck-us.net> writes:
>> > > Ah, sorry. I wasn't aware that the following is valid C code
>> > >
>> > > void f1()
>> > > {
>> > >      return f2();
>> > >      ^^^^^^
>> > > }
>> > >
>> > > as long as f2() is void as well. Confusing, but we live and learn.
>> > 
>> > It might be valid, but it's still bad IMHO.
>> > 
>> > It's confusing to readers, and serves no useful purpose.
>> 
>> And it actually explicitly is undefined behaviour in C90 already
>> (3.6.6.4 in C90, 6.8.6.4 in C99 and later).

We use gnu89, which presumably does not make it UB.

> ... but there is a GCC extension that allows this by default:
> <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wreturn-type>
>   For C only, warn about a 'return' statement with an expression in a
>   function whose return type is 'void', unless the expression type is
>   also 'void'.  As a GNU extension, the latter case is accepted
>   without a warning unless '-Wpedantic' is used.

There's no chance we'll ever enable -Wpedantic, so I guess it's allowed
for practical purposes. I guess clang must accept it too or we'd be
seeing warnings from it.

cheers
