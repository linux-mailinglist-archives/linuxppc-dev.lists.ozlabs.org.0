Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2411A7A7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:17:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491kyK4t6XzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:17:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YPCaSFzn; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491kvt6YJFzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:15:20 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id h69so3369255pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WHNX39DWF5Hlf3u8CwKDc+Fsn/bhcoFrdGg2YrrvOo0=;
 b=YPCaSFzn0oIdss6PgqWqExMDv2Ya4MqFKlIMtqX30ds70r7RnGgcscEiuorDHOmIxt
 bkg/vokkN/rRhBD6LJ9mw3mjhOahMg1Uwg9Qx2UNZFWTj0IMg9WnUDxB+ULJSCbA1ldn
 KSpVK42kxhB9z/aw0NH4UBeJI+KqGuxcHQoEPZCHcqOEDmAKdAwLZgWjuAma+5C/4TbG
 JmUnZp5MHDPoBd4ygsIhvDZ8ijEsX/e2wJi1VmDzroDN1oJ8TnkuqyUyr4ayZCZKIFK0
 GcKo9BxipK0dpFhF+pZwLrt75E6HD72Q17JUhc4ZADldaZQrqxB3dU1lD6phiCSp3nG2
 3WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WHNX39DWF5Hlf3u8CwKDc+Fsn/bhcoFrdGg2YrrvOo0=;
 b=kRnaEcbPkI8Lm4u1Ty2IVKKPUFYfkKFvFQ0OT0GrW+EpQ+2aC0jxWdjiTVKzcXtgfk
 xfVfE0lueapt87dL40JEYq2hNNJbW65eNj47/WxFLfTf3B2HhZCjvZnPAfSgXjt+IfJY
 rtMg3HRcZPdEiW4Q1o/+FEiKKKpjipf0TnCdXKI5p6lsexL402+Y895B2gd3YZ35h2zM
 ywCTk5SGoIg+r53h5yWyf/orqBfNHyDsVtx1PjM3vndOcju6j1zgO1eSoOs7ESm772OD
 7lNXkClCst7mfDIKkHDK4tHj9rsDZFUokkOLw5VGnHwLFkuNavY/wPEuVAIqqnfzXJtR
 pI0w==
X-Gm-Message-State: AGi0Puaq3LIFj/o0cJ98kyq9V40DsgmH8ZNaS9G0QmmWdffFn4uAa3Tt
 N0ZeFXYCBNg2JpM2LdAk6ko=
X-Google-Smtp-Source: APiQypIal3O38c4Mqwm4P9dpr8g1+GmgXzDHXceCqIscl9w/plzTRFxfjFtpP2vU89kIf2d05y9VAA==
X-Received: by 2002:a63:1820:: with SMTP id y32mr11205009pgl.182.1586866517492; 
 Tue, 14 Apr 2020 05:15:17 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id h11sm10999819pfn.125.2020.04.14.05.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:15:16 -0700 (PDT)
Date: Tue, 14 Apr 2020 22:13:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Christoph Hellwig <hch@infradead.org>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
 <20200414072316.GA5503@infradead.org>
In-Reply-To: <20200414072316.GA5503@infradead.org>
MIME-Version: 1.0
Message-Id: <1586864403.0qfilei2ft.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christoph Hellwig's message of April 14, 2020 5:23 pm:
> On Mon, Apr 13, 2020 at 10:53:03PM +1000, Nicholas Piggin wrote:
>> For platforms that define HAVE_ARCH_HUGE_VMAP and support PMD vmap mappi=
ngs,
>> have vmalloc attempt to allocate PMD-sized pages first, before falling b=
ack
>> to small pages. Allocations which use something other than PAGE_KERNEL
>> protections are not permitted to use huge pages yet, not all callers exp=
ect
>> this (e.g., module allocations vs strict module rwx).
>>=20
>> This gives a 6x reduction in dTLB misses for a `git diff` (of linux), fr=
om
>> 45600 to 6500 and a 2.2% reduction in cycles on a 2-node POWER9.
>>=20
>> This can result in more internal fragmentation and memory overhead for a
>> given allocation. It can also cause greater NUMA unbalance on hashdist
>> allocations.
>>=20
>> There may be other callers that expect small pages under vmalloc but use
>> PAGE_KERNEL, I'm not sure if it's feasible to catch them all. An
>> alternative would be a new function or flag which enables large mappings=
,
>> and use that in callers.
>=20
> Why do we even use vmalloc in this case rather than just doing a huge
> page allocation?

Which case? Usually the answer would be because you don't want to use
contiguous physical memory and/or you don't want to use the linear=20
mapping.

> What callers are you intersted in?

The dentry and inode caches for this test, obviously.

Lots of other things could possibly benefit though, other system=20
hashes like networking, but lot of other vmalloc callers that might
benefit right away, some others could use some work to batch up
allocation sizes to benefit.

Thanks,
Nick
