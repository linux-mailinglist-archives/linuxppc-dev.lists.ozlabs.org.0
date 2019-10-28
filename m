Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BEE6D67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 08:41:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471mqP0Fv4zDqc1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 18:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="A72Ecndl"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471mnH72RPzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 18:39:13 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id u9so1601491pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=W6KtXbeNB73L7K8HlIwOcgcuJ+P24gHi6K3WdunG+G4=;
 b=A72Ecndl1uDlUulcxZtsu13muErR/lU5GxMGHazyGJDJCYl+cgN1yTFGpnQzGc3R0F
 B/FLvXZQWadeofbZ8s52iQfdFNSfE6qYpH0D+mLFs2pTSZDRhHIlqrbiU8ILpQI83jCI
 KeS+8zZ1ooWV3mRoXdkA1MYHF9YYpcj6CaWCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=W6KtXbeNB73L7K8HlIwOcgcuJ+P24gHi6K3WdunG+G4=;
 b=loVnlp2npbS8alcH5O81jiV7RDHEfvhnrtg3lHfShmPiHchut/jwzqALZ6+E92WVI0
 vWE0I1oaVqQJt8U5f21GGOCiEiRw1xNF/RCv/QSaUCsylBE8s6FMgPRKU9dTlw0obNT5
 b8balrO2CPoyo7ipEAkLQVe6OFoCvzCDiguy3BNVY9M1oObNISJVr3M18NX68+Ikz9Ky
 etAYWgt60OLLwY1EGFJaDDMvFZGF6LXA1idRE9/mQ+pQ/SVoaIgOkBJEOiGCCGXFug7M
 XM2N+DM422/d1PlezLiNi0+cYNOZS57xrabi2T/cfxvF0twOaTCxBXOH0Gc85Npez384
 ACEg==
X-Gm-Message-State: APjAAAXrtE+b13cA1cNGA5SRemv72607g5lyynURSyNXDDY27KLEFvCR
 fqCjkoqIyZOzW10yEdEc9ykaAA==
X-Google-Smtp-Source: APXvYqyJgdsMELh5YzfO9lfXAMmWDjSS5OoSyz3S8TTPvQ3C5awf1OmXS2S6lTk7CB3OzUGg7Lpvjw==
X-Received: by 2002:a62:e312:: with SMTP id g18mr535124pfh.250.1572248349944; 
 Mon, 28 Oct 2019 00:39:09 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id 184sm10426925pfu.58.2019.10.28.00.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 00:39:09 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <95c87ba1-9c15-43fb-dba7-f3ecd01be8e0@virtuozzo.com>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
 <352cb4fa-2e57-7e3b-23af-898e113bbe22@virtuozzo.com>
 <87ftjvtoo7.fsf@dja-thinkpad.axtens.net>
 <8f573b40-3a5a-ed36-dffb-4a54faf3c4e1@virtuozzo.com>
 <20191016132233.GA46264@lakrids.cambridge.arm.com>
 <95c87ba1-9c15-43fb-dba7-f3ecd01be8e0@virtuozzo.com>
Date: Mon, 28 Oct 2019 18:39:04 +1100
Message-ID: <87blu18gkn.fsf@dja-thinkpad.axtens.net>
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
Cc: gor@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com,
 luto@kernel.org, linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Or let me put it this way. Let's assume that CPU0 accesses shadow and CPU1 did the memset() and installed pte.
> CPU0 may not observe memset() only if it dereferences completely random vmalloc addresses
> or it performs out-of-bounds access which crosses KASAN_SHADOW_SCALE*PAGE_SIZE boundary, i.e. access to shadow crosses page boundary.
> In both cases it will be hard to avoid crashes. OOB crossing the page boundary in vmalloc pretty much guarantees crash because of guard page,
> and derefencing random address isn't going to last for long.
>
> If CPU0 obtained pointer via vmalloc() call and it's doing out-of-bounds (within boundaries of the page) or use-after-free,
> than the spin_[un]lock(&init_mm.page_table_lock) should allow CPU0 to see the memset done by CPU1 without any additional barrier.


I have puzzled through the barrier stuff. Here's what I
have. Apologies for the length, and for any mistakes - I'm pretty new
to deep kernel memory model stuff!

One thing that I don't think we've considered so far is _un_poisioning:


|	ret = apply_to_page_range(&init_mm, shadow_start,
|				  shadow_end - shadow_start,
|				  kasan_populate_vmalloc_pte, NULL);
|	if (ret)
|		return ret;
|
|	kasan_unpoison_shadow(area->addr, requested_size);

That unpoisioning is going to write to the shadow via its virtual
address, loading translations into the TLB. So we cannot assume that
another CPU is doing the page table walk and loading the TLB entry for
the first time. We need to make sure that correctness does not depend
on that.

We have 2x2 cases to consider:

{Access via fixed address, access via unknown address}
x
{Access within object - unpoisioned, access just beyond object but
within shadow - poisoned}

I think we can first drop all consideration of access via fixed
addresses. Such accesses will have to be synchronised via some
external mechanism, such as a flag, with appropriate
locking/barriers. Those barriers will order the rest of the memory
accesses within vmalloc(), and I considered speculative faults in my
other email.

That leaves just memory accesses via an unknown address. I'm imagining
the following two cases:

[Access of Unpoisoned Shadow - valid access]

CPU#0                                   CPU#1
-----                                   -----
WRITE_ONCE(p, vmalloc(100))             while (!(x = READ_ONCE(p))) ;
                                        x[99] = 1;

[Access of Poisoned Shadow - invalid read past the end]

CPU#0                                   CPU#1
-----                                   -----
WRITE_ONCE(p, vmalloc(100))             while (!(x = READ_ONCE(p))) ;
                                        x[100] = 1;


---------- Access to the unpoisioned region of shadow ----------

Expanding the CPU#0 side, let `a` be area->addr:

// kasan_populate_vmalloc_pte
...
STORE page+PAGE_SIZE-1, poison
// Mark's proposed smp_wmb() goes here
ACQUIRE page_table_lock
STORE ptep, pte
RELEASE page_table_lock
// return to kasan_populate_vmalloc
// call kasan_unpoison_shadow(a, 100)
STORE shadow(a), unpoison
...
STORE shadow(a+99), unpoison
// rest of vmalloc()
STORE p, a


CPU#1 looks like (removing the loop bit):

x = LOAD p
<data dependency>
shadow_x = LOAD *shadow(x+99)
// if shadow_x poisoned, report
STORE (x+99), 1

Putting the last few operations side-by-side:

CPU#0                                    CPU#1
 STORE shadow(a+99), unpoision           x = LOAD p
                                         <data dependency>
 STORE p, a                              shadow_x = LOAD shadow(x+99)


While there is a data dependency between x and shadow_x, there's no
barrier in kasan_populate_vmalloc() that forces the _un_poisoning to
be correctly ordered.

My worry would be that CPU#0 might commit the store to p before it
commits the store to the shadow. Then, even with the data dependency,
CPU#1 could observe store to shadow(a+99) after it executed the load
of shadow(x+99). This would lead CPU#1 to observe a false-positive
poison.

We need a write barrier, and Mark's proposed smp_wmb() is too early to
help here.

Now, there is an smp_wmb() in clear_vm_uninitialized_flag(), which is
called by __vmalloc_node_range between kasan_populate_vmalloc and the
end of the function. That makes things look like this:

  CPU#0                                   CPU#1
STORE shadow(a+99), unpoision           x = LOAD p
smp_wmb()                               <data dependency>
STORE p, a                              shadow_x = LOAD shadow(x+99)

memory-barriers.txt says that a data dependency and a write barrier
are sufficient to order this correctly.

Outside of __vmalloc_node_range(), the other times we call
kasan_populate_vmalloc() are:

 - get_vm_area() and friends. get_vm_area does not mapping any pages
   into the area returned. So the caller will have to do that, which
   will require taking the page table lock. A release should pair with
   a data dependency, making the unpoisoning visible.

 - The per_cpu allocator: again the caller has to map pages into the
   area returned - pcpu_map_pages calls map_kernel_range_noflush.

So, where the address is not known in advance, the unpoisioning does
need a barrier. However, we do hit one anyway before we return. We
should document that we're relying on the barrier in
clear_vm_uninitialized_flag() or barriers from other callers.

---------- Access to the poisioned region of shadow ----------

Now, what about the case that we do an overread that's still in the
shadow page?

CPU#0                                    CPU#1
 STORE page+100, poison
 ...
 # Mark's proposed smp_wmb()
 ACQUIRE page_table_lock
 STORE ptep, pte
 RELEASE page_table_lock
 ...
 STORE shadow(a+99), unpoision           x = LOAD p
 smp_wmb()                               <data dependency>
 STORE p, a                              shadow_x = LOAD shadow(x+100)


Here, because of both the release and the smp_wmb(), the store of the
poison will be safe. Because we're not expecting anything funky with
fixed addresses or other CPUs doing page-table walks, I still think we
don't need an extra barrier where Mark has proposed.

-------------------- Conclusion --------------------

I will send a v10 that:

 - drops the smp_wmb() for poisoning
 
 - adds a comment that explains that we're dependent on later barriers
   for _un_poisioning

I'd really like to get this into the coming merge window, if at all
possible.

Regards,
Daniel
