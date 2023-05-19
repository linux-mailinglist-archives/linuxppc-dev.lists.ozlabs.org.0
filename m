Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E795708F3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMw5K2vXFz3fNh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:15:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RQrmE5/7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMw4R0RC6z30hh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:14:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RQrmE5/7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QMw4M0Km2z4x2j;
	Fri, 19 May 2023 15:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684473251;
	bh=XtmiIOF/NA3HEuw+9jphgAkHCsadnEGKvOejGiS/vBI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RQrmE5/7IQ9bHGm6Pg5nzKRS/MrnD7O62plkaE4ISC71znarStIv1c+rqH2eD21Ay
	 BoSVycIDYj6++q91gMxaMW8tzGjKmn+SvAyr1OTzL/FcJ36O6uFSlSjO6ZPcwy46CK
	 V9IseUAeKcQzyanwocprzA2s51mzkrUD5ABcIT8OciKKvQNnsEU880OUUzVK34Htru
	 u6aYBYybBkBP3b7teFgYlIwGLVHKsTDk0UBcHC5zheI0DFrGgbp8BVZ6lqSWQUnKpR
	 MaQvJ7GxK0lGxJqjJszIHK7PI7DUNxOXr5WfircZfyz086GeBt2U1zKAGDhFX3U5YY
	 JKj3OO3SKnwhA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, David Laight
 <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
In-Reply-To: <20230517152028.86b6d2d5afa4541b4269131b@linux-foundation.org>
References: <20230505035127.195387-1-mpe@ellerman.id.au>
 <826f836f41db41eeb0fc32061994ac39@AcuMS.aculab.com>
 <20230517152028.86b6d2d5afa4541b4269131b@linux-foundation.org>
Date: Fri, 19 May 2023 15:14:06 +1000
Message-ID: <87o7mgzyw1.fsf@mail.lhotse>
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
Cc: "zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>, "elver@google.com" <elver@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "glider@google.com" <glider@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:
> On Fri, 5 May 2023 16:02:17 +0000 David Laight <David.Laight@ACULAB.COM> wrote:
>
>> From: Michael Ellerman
>> > Sent: 05 May 2023 04:51
>> > 
>> > Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
>> > __kfence_alloc() and __kfence_free()"), kfence reports failures in
>> > random places at boot on big endian machines.
>> > 
>> > The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
>> > address of each byte in its value, so it needs to be byte swapped on big
>> > endian machines.
>> > 
>> > The compiler is smart enough to do the le64_to_cpu() at compile time, so
>> > there is no runtime overhead.
>> > 
>> > Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of __kfence_alloc() and __kfence_free()")
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> > ---
>> >  mm/kfence/kfence.h | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
>> > index 2aafc46a4aaf..392fb273e7bd 100644
>> > --- a/mm/kfence/kfence.h
>> > +++ b/mm/kfence/kfence.h
>> > @@ -29,7 +29,7 @@
>> >   * canary of every 8 bytes is the same. 64-bit memory can be filled and checked
>> >   * at a time instead of byte by byte to improve performance.
>> >   */
>> > -#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(0x0706050403020100))
>> > +#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(le64_to_cpu(0x0706050403020100)))
>> 
>> What at the (u64) casts for?
>> The constants should probably have a ul (or ull) suffix.
>> 
>
> I tried that, didn't fix the sparse warnings described at
> https://lkml.kernel.org/r/202305132244.DwzBUcUd-lkp@intel.com.
>
> Michael, have you looked into this?

I haven't sorry, been chasing other bugs.

> I'll merge it upstream - I guess we can live with the warnings for a while.

Thanks, yeah spurious WARNs are more of a pain than some sparse warnings.

Maybe using le64_to_cpu() is too fancy, could just do it with an ifdef? eg.

diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
index 392fb273e7bd..510355a5382b 100644
--- a/mm/kfence/kfence.h
+++ b/mm/kfence/kfence.h
@@ -29,7 +29,11 @@
  * canary of every 8 bytes is the same. 64-bit memory can be filled and checked
  * at a time instead of byte by byte to improve performance.
  */
-#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(le64_to_cpu(0x0706050403020100)))
+#ifdef __LITTLE_ENDIAN__
+#define KFENCE_CANARY_PATTERN_U64 (0xaaaaaaaaaaaaaaaaULL ^ 0x0706050403020100ULL)
+#else
+#define KFENCE_CANARY_PATTERN_U64 (0xaaaaaaaaaaaaaaaaULL ^ 0x0001020304050607ULL)
+#endif
 
 /* Maximum stack depth for reports. */
 #define KFENCE_STACK_DEPTH 64


cheers
