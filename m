Return-Path: <linuxppc-dev+bounces-10442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD11B152EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 20:39:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bs3z70r8Jz2yfH;
	Wed, 30 Jul 2025 04:39:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753814355;
	cv=none; b=DkL2Ay4QSwgllOUtsQfVL4eYoKXTjgLZ2ocxmsmi2ByXJ3H89rCWMU774YcH1j1h1y4gItKXhUiQNAzKufQiwiYb6rSsgNJ/TXgwWAyRSdwdqC2yPxUnDXgsd5C7MnYJjCjeWCh9JPooqcXT2a7SR/Mrs3UVxUbsgdGRO/Mdjge4T2pYYdAICOi9xtbVFOpq4ufitUILvZ6cakiz24LUQUXF4NPXAE6l6dsvyVdGqRy5cUlLbJzeB+BW3EQm2K5jPxB6fulPq/IaDAtqUWnyAkzdyK9xrmbxKIR77t2PPOhgqqZmQit/TjK21MtOXc7wrEjlfOZvE7tfsvdSf+V1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753814355; c=relaxed/relaxed;
	bh=GYRfCV3hbQi5DsgzlDild2w/1OeWF4e+oM87WSvfwwM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etQbNVs9zrF90adgz3Gtu8lm90uDb7k0ls9vb+dIXrLI32V6NubO828rin1jOe5wOv8wxBII1OWMTk/NzWInOxFtmnNkWlOULbJOo/kAUafybi8mz4Tp8Lp8Jg7hiKBloXRti+y8AqH2bLaj16VskmC52tPxfwrNdAIObXYX3hfCu3Cxg/K/n0RLhiAKJCBsGR/sbEcVI9V4nxb2Lt2ImMy0W4pEl2ZIQGhMEPXvTyIP3uWx+MVqUryaMqqeyYzB1w8sYYzF5lTksYkeHOU7ni6Hms3gDNbZJ9S+30KW9eNEL4LjadkrxBuAl2Ypl1D44MwsblSchAxytIRiKNaAyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4uOMDn2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4uOMDn2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bs3z53DZvz2ySr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 04:39:12 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3321296ad03so14875401fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753814347; x=1754419147; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYRfCV3hbQi5DsgzlDild2w/1OeWF4e+oM87WSvfwwM=;
        b=G4uOMDn2wWDafMClR3h6YDk3qbavxBl8SZXZkQr63joQd5Y5k2oqrtqXwRLe0dZPXJ
         FGjZ4G7QZz0zTuBhWj62qBkjKXX5dURaQo0apcAAYXf0kANvtLaM/FE1ptoOXIqRaFSt
         3e4EMdpL8clGlCosGwPkFY11gyehJ88LAGqyJCI34afiWDmUI+YhQ0+e3E4uXbsoJPY8
         P7JE7hjaeCm1nKErGB4/HdsR6hmbpVPdAD5v/3twzOuVXpwi7xer9nQ+BgQieEvS3FKi
         P6yHVEzuYZJp1V79wDrFGSAqBoLswBTqbmCPkWNHARboT2XkymHXaZN2myU42coaT4i9
         lE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753814347; x=1754419147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYRfCV3hbQi5DsgzlDild2w/1OeWF4e+oM87WSvfwwM=;
        b=V8oyJFcIbWVY0urnjXZ871GNAcbVcX9Xu2FakqMUq36+gNTN1SvRQ7lQNfRyurEEeL
         65lIGCZiz0903f9JiIQBxKb4b+HcT6s1qP04lWYBRUx9pyplu+GNtBK6+sIJbaftbglF
         ehEpuoBPeayAkqJOhv3evqLyjrYKc5wmxjGUBJUbpqjH8nyCxdwitA0v86lq83w93+xS
         JsSFZ0YK5QY0+blV0MTFzzvkhs7gSE8J9nFonz6fhyhIG0J0rqGQIqXz4Lg9x7e/O5tk
         mk0D+yFLo8pQpEtjmkK5H6T5KeDhrd8WRaLKD+4baKWYGiWW5jahvrU0BOwaitw/SX0B
         2EFg==
X-Forwarded-Encrypted: i=1; AJvYcCWumGVmXeBQTVSkyHDyJmIJ19MfMhp8ck9e1WZ3t6HYdmYVzGW4TQpHtzQZBF7yFnaR8yEm97j/1fLioCI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzEcJkbrG0NRc5nl8YtipbWNSfpK4Zlbs7SubMPS93HBpo6mpF
	+w11Jn7Rj/GOyMwPpF+6P6pxQzTOco8h+o8XQQJagQJOKfBjb+iUg007
X-Gm-Gg: ASbGncvebfbWyKp3fXG3+SAHfBxQjWw5huiZP1tkJNLGONOUajdyhenzAjkFMaXrS0D
	eWhf9J8b+zbh0Y6tG78oyfRKwx8C7zv1e1GrshdjBmYMn3SEjKmYcqPknaDMcRYzHpDv6b/CY8b
	ofOuvLGKXGtPq+RR9ZMaedYoPqgVoaSCIO9l2RyS4B0w9ImpH0b2Htl+Nz/40PSOu4aMVPr2trA
	5pQsy5vrBpR+PCxCAzDW9ONmTgZ3pqRpDSKGjluLW3hukh1cBOirpt7kVabzpNFvXJWxfHvaq+H
	eAlNqiJJEHQ93KOQiLPQkX/ySKiFrSb8EGwTN3ay+6J32N4iA3pAZNdjW1bI+2ZW
X-Google-Smtp-Source: AGHT+IF9yvJyPiTzwXfrNX8PT/G9myfdCCK3lbY+TklU3bxii0UFYjkiLDeONxAItTuHZBzIFqK+RA==
X-Received: by 2002:a05:6512:3414:b0:553:241d:4e77 with SMTP id 2adb3069b0e04-55b7c011afdmr184040e87.22.1753814346295;
        Tue, 29 Jul 2025 11:39:06 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332219ce7aesm832441fa.34.2025.07.29.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 11:39:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 29 Jul 2025 20:39:01 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <aIkVRTouPqhcxOes@pc636>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 29, 2025 at 06:25:39AM +0100, Lorenzo Stoakes wrote:
> Andrew - FYI there's nothing to worry about here, the type remains
> precisely the same, and I'll send a patch to fix this trivial issue so when
> later this type changes vmalloc will be uaffected.
> 
> On Tue, Jul 29, 2025 at 09:15:51AM +0900, Harry Yoo wrote:
> > [Adding Uladzislau to Cc]
> 
> Ulad - could we PLEASE get rid of 'vm_flags' in vmalloc? It's the precise
> same name and (currently) type as vma->vm_flags and is already the source
> of confusion.
> 
You mean all "vm_flags" variable names? "vm_struct" has flags as a
member. So you want:

urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
29:                          pgprot_t pgprot, unsigned long vm_flags)
39:             vm_flags |= VM_DEFER_KMEMLEAK;
41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
45:                              pgprot, vm_flags, NUMA_NO_NODE,
51:                                      pgprot, vm_flags, NUMA_NO_NODE,
85:                          pgprot_t pgprot, unsigned long vm_flags)
259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/vmalloc.c
3853: * @vm_flags:                additional vm area flags (e.g. %VM_NO_GUARD)
3875:                   pgprot_t prot, unsigned long vm_flags, int node,
3894:   if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
3912:                             VM_UNINITIALIZED | vm_flags, start, end, node,
3977:   if (!(vm_flags & VM_DEFER_KMEMLEAK))
4621:   vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags mm/execmem.c
29:                          pgprot_t pgprot, unsigned long vm_flags)
39:             vm_flags |= VM_DEFER_KMEMLEAK;
41:     if (vm_flags & VM_ALLOW_HUGE_VMAP)
45:                              pgprot, vm_flags, NUMA_NO_NODE,
51:                                      pgprot, vm_flags, NUMA_NO_NODE,
85:                          pgprot_t pgprot, unsigned long vm_flags)
259:    unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
266:    p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
376:    unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
385:            p = execmem_vmalloc(range, size, pgprot, vm_flags);
urezki@pc638:~/data/backup/coding/linux-not-broken.git$ grep -rn vm_flags ./include/linux/vmalloc.h
172:                    pgprot_t prot, unsigned long vm_flags, int node,
urezki@pc638:~/data/backup/coding/linux-not-broken.git$

to rename all those "vm_flags" to something, for example, like "flags"?

Thanks!

--
Uladzislau Rezki

