Return-Path: <linuxppc-dev+bounces-17543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHWHB8CvpWkhEgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 16:41:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438F1DC0C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 16:41:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPjph5mdHz3bn4;
	Tue, 03 Mar 2026 02:41:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772466108;
	cv=none; b=h6nO/eqRsddYiUOdywpAn1X4J8D1jbuUE9i5qNoMvhFa+M0GQ6OFDCGhYkY5ldHgZwcvcKPnzUoRph5u73QTaJrcjIi//+gXL4qkGzE/ZXkItYsw7NNGE0UwfQ0lrddfmyC/PLF/H3PAvIBp2/hRys+UWqY9u51UpoFfzjySkAi/K4XTqndNWtxVtYlAIX1kaLS32GPlA1Db5FER4LyDa8MZBNXJte9Fv5szvBMQMnhlW8Jsv47nj8QRxKsfnRzzEBqR8o14mI8O0rr1bL4bt2KvIpdjFOXnrR/9hVLwJUOvogRNZzj5CIhNuJ5DLoxZGVIMbZe8urQr+oqNqjAQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772466108; c=relaxed/relaxed;
	bh=fvJ4Pj0Wo9ryI9xJ6mJ9OBJG9CVcmeBhutvadxQnZZs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m5ZL2lFz+yUBQOxt1MCBNpSFq6b5Vk93j+lCwyS+GnsMgSj8NINO3hUIQpEsieAke5VNmG29e29piSvWrdAJ9nFS00Yef/7mDIexhjJ3ea45UCfQREB6EQbmSxtpgLrC3uFOfUCP7rPbaVBSEUb5QkJSgJELprdxVJaQBBzIPGrCBOLyO0DIhOLeQF2AvgL0G+JQ+FL7q774BDpJwwbfaMkh+MumvUlvBU4iQmTBXBD57trlj/IMYqli0x8njBKGsTLsgivIHRpJrX50BIkMFlDrxi2zqEIStBNpZHtulibZFzsiKo0XTowb+ZpPm73vxKqrJXVtCEUwe9xWZUrrnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TK/Twncz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3tq-laqkkdaebmjdfszimhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TK/Twncz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3tq-laqkkdaebmjdfszimhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPjpg0XF3z3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 02:41:46 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso58425235e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772466104; x=1773070904; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvJ4Pj0Wo9ryI9xJ6mJ9OBJG9CVcmeBhutvadxQnZZs=;
        b=TK/TwncztJpDQkfAZOTLG4cnGFN1LJCasx8IcmzxYS0+EgQYgy73KBzi5ODnAZnFXU
         gTJXCTOyM9Gwu2ELr1NIa0zrho8Xxq7oT2FSeUP6yTgKB2PVWbyRIAP7SoFn5ZVIMq1i
         Rr7xFxWW2b6d55R0AnRNb7dmxRddmxaQqNqe/Vw3LXp4Qp4AJUczm+uty07PAFGqp/wW
         gNbxzwDfWdxGZOuIHOTRTfpDJPioNqXkeGLxgOOrSfVjT1vobTANjOjB+he0BhT8enG9
         2r8VV7ygOrNrOq/T5e4JxxNkbRp54aLUTcasii+rJFC8NHy6KhTB+9uYC8BVdFVn7cGp
         AUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466104; x=1773070904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvJ4Pj0Wo9ryI9xJ6mJ9OBJG9CVcmeBhutvadxQnZZs=;
        b=PAiWfhm4nTU2FDRYnUmSoJSkCJfXfeKC1R2WXf5wIEe/Ee46NxFhEy/oWq7XNOnSMe
         J6szamTAfvwXLFwngwwgcCwzt9+tzP5aCTWVkJ0eVEYEE61NDkRgjxYEOQvdYdUdiNc5
         J2oN0wLSMVsJQOsNmEVcDkrH9qdfJtJpqIpghBIwONPBeJpLZC1zTEMS/zFWK8Cqim2p
         EL2OE6C5aWThtEXxKvrq558PU0M/HGvZsdDVrTmSXpiES9ED93g30o12SR7ZMlcSUnKS
         zzuGIajhZSxOeFqiGUMyMelIC05weljvhY13V/m1Y6atwWC/iP+aKzDSevLaIC/dr4/m
         dOuw==
X-Forwarded-Encrypted: i=1; AJvYcCX4VJNTYEeQpAfPjjoi2UcverTotLeG01BZTRx984/Xr5P/G5VrPM7zLM/KTR/u6ILM2J6aPrTVHS83Bt0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YycQJCU0vC3CD5tAotfLiyVgtIA8WLkM/3eFNcSQ6iCvv5xoGRU
	4rXoAUImwvNhjmvEbJAHxGU8UjiE6AM0N5FHo8588122AIi//OimXhzN3Zd1H5syWy5ebqXOzYP
	NAiNHWNa8O3EvfqAhzg==
X-Received: from wmby19.prod.google.com ([2002:a05:600c:c053:b0:480:690c:88de])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b18:b0:483:7432:a761 with SMTP id 5b1f17b1804b1-483c9bc558bmr213622465e9.24.1772466102970;
 Mon, 02 Mar 2026 07:41:42 -0800 (PST)
Date: Mon, 2 Mar 2026 15:41:42 +0000
In-Reply-To: <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
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
References: <20260227200848.114019-1-david@kernel.org> <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com> <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
 <aaVf5gv4XjV6Ddt-@google.com> <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
 <aaVnifbdxKhBddQp@google.com> <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
Message-ID: <aaWvtn48X8UizaaN@google.com>
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from zap_page_range_single()
From: Alice Ryhl <aliceryhl@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	"linux-mm @ kvack . org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3438F1DC0C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-17543-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.ca,m:leon@kernel.org,m:
 dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[73];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:01:44PM +0100, David Hildenbrand (Arm) wrote:
> On 3/2/26 11:33, Alice Ryhl wrote:
> > On Mon, Mar 02, 2026 at 11:27:40AM +0100, David Hildenbrand (Arm) wrote:
> >> On 3/2/26 11:01, Alice Ryhl wrote:
> >>>
> >>> Well, rustfmt comes with the compiler, and it would be ideal to build
> >>> test changes before sending them :)
> >>
> >> At least on Ubuntu on my notebook where I do most of the coding+patch
> >> submissions it's a separate package?
> >>
> >> I do all my builds on a different (more powerful) machine where the
> >> whole rust machinery's in place. Further, build bots that run on my
> >> private branches did not report any issues.
> > 
> > There are some build bots that check for rustfmt, though not all of
> > them.
> > 
> >>> But no worries, I took care of testing it. Thanks for taking the time to
> >>> update the Rust code as well.
> >>
> >> I just did an allyesconfig and it does not report any warnings.
> >>
> >> So apparently, rustfmt problems not result in the compiler complaining?
> >>
> >> Or something else is off here that rust/kernel/mm/virt.rs won't get
> >> compiled on my machine, even with allyesconfig. I can definitely see
> >> some RUSTC stuff happening in the logs, like
> >>
> >> 	RUSTC L rust/kernel.o
> >>
> >> Thanks for the review and for pointing out rustfmt!
> > 
> > Similar to kerneldoc and other similar targets, formatting isn't checked
> > in the normal build, but make can be invoked on the rustfmtcheck target
> > to check it.
> 
> Thanks adding that to my cross-compile chain.

Awesome, thanks!

It's not relevant in this patch, but another thing that may be useful is
to add CLIPPY=1 to the make invocation when building normally. This
causes additional warnings to be checked using a tool called clippy.

Alice

