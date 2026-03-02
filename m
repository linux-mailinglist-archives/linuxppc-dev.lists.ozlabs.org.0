Return-Path: <linuxppc-dev+bounces-17553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI80C20dpmmeKQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 00:29:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FA1E6A93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 00:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPwBc060Cz3bn7;
	Tue, 03 Mar 2026 10:29:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772494183;
	cv=none; b=npwtZehNvRtw0r1JRuOMC051XeVFNuoOd+PTcME3h97n0+eFJOuHbCu/QCAwFER3I7g65qkN48I8qNs954fuT2xAIvV07vkpZXQRWmEZFZDw0HwQEdT0qIPwPNyTn+f3S1w9wdILSIjEPYTWKlzZdRovnCvuxgOrqFuEopOFSQ5CVJGnm7f+Kq0fX8pzy1N+vFZ+C0eSLn3DZWbYxM7dpGu4dlqb7LaJTjEDcK6S4jPFEpIXKoHG6Xu7wcwoKUzIrVp6El+eaOqh94DWKweUolVKp4OpPs8Gb8TFstlzoShW0oTMJZJ1400YpDtgDtLRAmjj2PxM07eG38JUzcGJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772494183; c=relaxed/relaxed;
	bh=PH6stFB2Nx/ECXz2prAUsaDuxA0K8V3rfmFNdCvYncM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NZfut6d5Si6QwKNHRIJ1amdzVFBeDy2AOq1ROiPMrGHBuCw9FnJ1pcmHMGEfrQZNjwx5RU7Siv73pZQBji45jB+psWP30TZPSfGD5+I6IovgPD9TlcTQ2LCcTRX7GAY4UWaBYQgQ1GUGPAYb3zf0PWVbqIZG1gI5RyduiLR8sUrRz8OpldIz3tQGMQE9Ya2EB2d6VDsDkWdK/DRepJjFnTO1PvDT9TP7/ygTZViifjTRBUB2tLY8leqZTWc/AlJrFvdX/euxCOWzXCFjVRUvM1l9dnNqT1m9mRtyMtUdrFKs5iBZNItx6MvqYxFZ3scAz3bNWJQvq784uHuKzOJ6bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=TSxh7FtX; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=TSxh7FtX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPwBZ6nwzz3blq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 10:29:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E62141AB1;
	Mon,  2 Mar 2026 23:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67948C2BC86;
	Mon,  2 Mar 2026 23:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1772494178;
	bh=cGbDhS0SYNM7ywiKo18nxPHughICS0VYorf2j+DgiJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TSxh7FtXeAjmq+kHAoxRq7blbJce7OjcAyo5efUABhyEIDg5ECsbidW5Mcj6tsYRQ
	 DzsG6rRpbWkeoTG5vogARAaO0jUDloWcC8I+5NMkdmsuNVjw9kdp+VtHQVYC7rwOhD
	 vT8qcareSz2ZYaJdXKgw++Ul/6kRr6+5kG6+y49U=
Date: Mon, 2 Mar 2026 15:29:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, "linux-mm @ kvack . org"
 <linux-mm@kvack.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
 <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Rientjes
 <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Alice Ryhl
 <aliceryhl@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev?=
 =?ISO-8859-1?Q?=E5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas
 <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Dimitri
 Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Eric Dumazet <edumazet@google.com>, Neal
 Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 00/16] mm: cleanups around unmapping / zapping
Message-Id: <20260302152934.eba1cfede1c9b8cebdf45b09@linux-foundation.org>
In-Reply-To: <20260227200848.114019-1-david@kernel.org>
References: <20260227200848.114019-1-david@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 392FA1E6A93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17553-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:aliceryhl@google.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.ca,m:leon@kernel.org,m:dimit
 ri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[73];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 21:08:31 +0100 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> A bunch of cleanups around unmapping and zapping. Mostly simplifications,
> code movements, documentation and renaming of zapping functions.

Thanks, I added this (and the below) to mm.git

I suppressed the dded-to-mm emails to protect the innocent.

--- a/rust/kernel/mm/virt.rs~mm-memory-remove-zap_details-parameter-from-zap_page_range_single-fix
+++ a/rust/kernel/mm/virt.rs
@@ -123,9 +123,7 @@ impl VmaRef {
         // SAFETY: By the type invariants, the caller has read access to this VMA, which is
         // sufficient for this method call. This method has no requirements on the vma flags. The
         // address range is checked to be within the vma.
-        unsafe {
-            bindings::zap_page_range_single(self.as_ptr(), address, size)
-        };
+        unsafe { bindings::zap_page_range_single(self.as_ptr(), address, size) };
     }
 
     /// If the [`VM_MIXEDMAP`] flag is set, returns a [`VmaMixedMap`] to this VMA, otherwise
_


