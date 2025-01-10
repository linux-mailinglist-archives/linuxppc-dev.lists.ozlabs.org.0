Return-Path: <linuxppc-dev+bounces-5038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4CA09F1B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 01:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVJt956rhz3cmg;
	Sat, 11 Jan 2025 11:14:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736534488;
	cv=none; b=KvvlYZBjNrY6kE6IHYfDn0oakmZtS+ikTUZwm/4y2dDRYbK9xKZZHmfKuk0C8PBRd1414k1/YsQduBKGbmCi10Cep7tadh7/ijcdX15vpGMufQE10zFA2RsSXrmEUkP/ucx6RuDc4ZXRl+L3zdizaF+qAdoSGa/hr+FpsV/aeGxs2ZXPGUT+y4qhJwbP3Z4TC4Y1Onn18MiqN6lGuTAzzvtjKt2VlwT96ZZ2y//Ouv2uRlIBGvIQLGl8iB1z4PPomVTpaLYgW7mXgCboSi2Bkdd4ER8iVagmfEKycobNxVlPrwGwcTRffcbQzuwIQJHELVGAUM79O+5NePr8XE+RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736534488; c=relaxed/relaxed;
	bh=HFKS9He99X0lK3xnnbI99ZyULyVP6qmX2/a79HHV3Mw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z1a1eW6VQu2GfJAH0e+xCPQ16i9+wfMdLqRFARB12hjfWCxnsHOrdpQ/tV5202S3uClTqy2WC9eGW0ummncaDBsASDT9Lp4ifSqQ2BIX6io13uhFg0sWQvzxaw1TZbp1aj4lkuU5U1YnOGS8z11lGSo9bHdNSSn3BY/S+8/nddCCwuHbC3NFd4MAHperBLJJG5w3C39HuHT+wCP3T8QVZrSNwa1AxMvTQKO+bhqVBAlKs2/+YDnorCm1Cbn9EnnFosNE6oBg05z+080imwwXXeEiH1VBUykvruR8FyHmdPne3U6+6ATORaU53f0CavTd9Z3wMT/ja6/UcumllAYIug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d/sded7C; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=31gmbzwgkdo8artbdresxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=d/sded7C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=31gmbzwgkdo8artbdresxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV9Tz070Jz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 05:41:27 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43621907030so19341085e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 10:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736534484; x=1737139284; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HFKS9He99X0lK3xnnbI99ZyULyVP6qmX2/a79HHV3Mw=;
        b=d/sded7CZ8/j9mba3WQxo6yI2Na/9fGGl3pwZPLd+B4AlgCrqNRsiVowUIGTOePP/K
         8keAAHiKTfm/JQysbGnsM4jOQMZ5n+GPpk87lC9efiwDZAbfuJD/9SPQge4ROF770Aj6
         Ljj6UfSZLzVNWvKnRFdZNtXiLlUKxNV046AUGuuBymjZ75aK8jF6UMDSIYzkrVXoisc4
         tUWkuDlVqy0WaUydJ7v8XQsIx+dJ8E6+2ac1hpiiHPanyG0lGbycNcnSs6HUsmQvOmFf
         6NwtvHPfiEU8eIrbmfVmhd3l40RO5JxGTlf9PzJMWrTskHsL4jlhadF71KRxhBLggTlG
         2Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736534484; x=1737139284;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFKS9He99X0lK3xnnbI99ZyULyVP6qmX2/a79HHV3Mw=;
        b=WtXYIEI8fOKtIivt0gzwS6c5KDFvsNrFh0sgQB7IJrxkKe1zc4CPV930KP4/84z63p
         6xGW7Xmww2fIhnUg+EULIdp4tgDNWpdjv2MZqFWGaPSszx3Pvy9xEI/v71Yr0B+bqumM
         qYByaKsTt7fmQHiySLBybRIt6Gq3Y7X3eyKadfRCrVLKOM16JAOBfxBdXxfkwRnDZIXt
         UbOHiCGjAnZ/Sk7iDpOWUmh9Q/UFO6NNakWiaBTfFmeby6lyN6qWUvJiJMIY50uZLixf
         rPNf9phBXrfEBz4UDhK/X+uTIYWoNntRPxNYrpmmS5iFF75IRqNK5lbRYRJsUxq1DfpS
         0BPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkxr++M1rRVwaziM2Ui425/hfgTxi2bwNLYGZ0uRSZZGEKFyCnazsn/yuUttVz6NT0vgY/4k6a9Mxe5Js=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsXa3z55bnacalMgZ/p7Pqg83lvCqOc2ROEebmWjyZ/Vv6aayZ
	m2ALRr7/xNo9hoXp+Um4o0DYjN3MMDj+fMvcanwTgaK+07Dx+cHYgbVwdhMApwAM0Hdw2Amgq6v
	1STZEkn0KWA==
X-Google-Smtp-Source: AGHT+IHb2tLJeEj/nhEIcvCueP11HP0tzz903p60s9RvGJF27LFwQlQKr5YD0ey6aPDR1IvAD0AJ740K8RZlJQ==
X-Received: from wmbbh20.prod.google.com ([2002:a05:600c:3d14:b0:434:fd4d:ffad])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3c85:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-436e2679a7cmr125832515e9.5.1736534484149;
 Fri, 10 Jan 2025 10:41:24 -0800 (PST)
Date: Fri, 10 Jan 2025 18:40:43 +0000
In-Reply-To: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
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
Mime-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250110-asi-rfc-v2-v2-17-8419288bc805@google.com>
Subject: [PATCH RFC v2 17/29] mm: asi: Map vmalloc/vmap data as nonsensitive
From: Brendan Jackman <jackmanb@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

We add new VM flags for sensitive and global-nonsensitive, parallel to
the corresponding GFP flags.

__get_vm_area_node and friends will default to creating
global-nonsensitive VM areas, and vmap then calls asi_map as necessary.

__vmalloc_node_range has additional logic to check and set defaults for
the sensitivity of the underlying page allocation. It does this via an
initial __set_asi_flags call - note that it then calls
__get_vm_area_node which also calls __set_asi_flags. This second call
is a NOP.

By default, we mark the underlying page allocation as sensitive, even
if the VM area is global-nonsensitive. This is just an optimization to
avoid unnecessary asi_map etc, since presumably most code has no reason
to access vmalloc'd data through the direct map.

There are some details of the GFP-flag/VM-flag interaction that are not
really obvious, for example: what should happen when callers of
__vmalloc explicitly set GFP sensitivity flags? (That function has no VM
flags argument). For the moment let's just not block on that and focus
on adding the infrastructure, though.

At the moment, the high-level vmalloc APIs doesn't actually provide a
way to configure sensitivity, this commit just adds the infrastructure.
We'll have to decide how to expose this to allocation sites as we
implement more denylist logic. vmap does already allow configuring vm
flags.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 mm/vmalloc.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 8d260f2174fe664b54dcda054cb9759ae282bf03..00745edf0b2c5f4c769a46bdcf0872223de5299d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3210,6 +3210,7 @@ struct vm_struct *remove_vm_area(const void *addr)
 {
 	struct vmap_area *va;
 	struct vm_struct *vm;
+	unsigned long vm_addr;
 
 	might_sleep();
 
@@ -3221,6 +3222,7 @@ struct vm_struct *remove_vm_area(const void *addr)
 	if (!va || !va->vm)
 		return NULL;
 	vm = va->vm;
+	vm_addr = (unsigned long) READ_ONCE(vm->addr);
 
 	debug_check_no_locks_freed(vm->addr, get_vm_area_size(vm));
 	debug_check_no_obj_freed(vm->addr, get_vm_area_size(vm));
@@ -3352,6 +3354,7 @@ void vfree(const void *addr)
 				addr);
 		return;
 	}
+	asi_unmap(ASI_GLOBAL_NONSENSITIVE, vm->addr, get_vm_area_size(vm));
 
 	if (unlikely(vm->flags & VM_FLUSH_RESET_PERMS))
 		vm_reset_perms(vm);
@@ -3397,6 +3400,7 @@ void vunmap(const void *addr)
 				addr);
 		return;
 	}
+	asi_unmap(ASI_GLOBAL_NONSENSITIVE, vm->addr, get_vm_area_size(vm));
 	kfree(vm);
 }
 EXPORT_SYMBOL(vunmap);
@@ -3445,16 +3449,21 @@ void *vmap(struct page **pages, unsigned int count,
 
 	addr = (unsigned long)area->addr;
 	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
-		vunmap(area->addr);
-		return NULL;
-	}
+				pages, PAGE_SHIFT) < 0)
+		goto err;
+
+	if (asi_map(ASI_GLOBAL_NONSENSITIVE, area->addr,
+		    get_vm_area_size(area)))
+		goto err; /* The necessary asi_unmap() is in vunmap. */
 
 	if (flags & VM_MAP_PUT_PAGES) {
 		area->pages = pages;
 		area->nr_pages = count;
 	}
 	return area->addr;
+err:
+	vunmap(area->addr);
+	return NULL;
 }
 EXPORT_SYMBOL(vmap);
 
@@ -3711,6 +3720,10 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 		goto fail;
 	}
 
+	if (asi_map(ASI_GLOBAL_NONSENSITIVE, area->addr,
+		    get_vm_area_size(area)))
+		goto fail; /* The necessary asi_unmap() is in vfree. */
+
 	return area->addr;
 
 fail:

-- 
2.47.1.613.gc27f4b7a9f-goog


