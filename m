Return-Path: <linuxppc-dev+bounces-17511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPPYIJJnpWkeAAYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:33:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922411D6962
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPZzL6Cthz3bW7;
	Mon, 02 Mar 2026 21:33:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772447630;
	cv=none; b=kISwYzuJT4D3ge8TA7w4XY9THTAF53/IoomTLbkLIEiO3scwJDibHak+mMWWknCqsccyCmWZIwd2vE0gEiZag8o4hYqf08eYO+lg8O7PL9QqhSuliUmiPs1cMDeftv9mi0ll00iqFPaPWKOQe23cjuIyOAoau9R7NqfMzkn3Dnc4f/GHjLe19Y/IhYhqOb2qizinv/jvJaMQiVsw0MYejXIam/zaXWiWEklW25Dy22NbuxN9P1hTexsQM5gol0g4eJCCZaOX07AeiPcFhKbzAQwUQflHsqxxbi4HpceKH6vQPRX7zD8tDFsEwDxveeeWnwnDD2lP0pipwUjQbqoApw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772447630; c=relaxed/relaxed;
	bh=EnMgJMcaQgCDj7i00Uawlj/G1rJtXPwe1sCLwvhoFHI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gkWG84c3KWvwfB+/zh43ATfGFPMtc2MKbz2owvOta9QvrbEQtwjlGBhG32eJcYTzUuRww0eUA5mUgc3eJOQwy6idzWR2S8zpE+yYYVUA0vSlahXwm4+gSAnFnT+rgeCkqoVOn9XRu5j1VdfeTgWuqqfCUd5CYAPaXNUz62V08lEcgkD8UHOPgMZUDcoxBUI48NUpwTtrsY2e6yk+tnc6TeullBFeqjLnPVu2ToyrCkWpNgSWLU4WB0SLUvgWq4wpAD1vqxjdMo2lzSYeYstU1ZtG3sJiMbl166c0u6U8qTBEFYszjQxQau6jmKkJ4B21RI3GuLY9175xgeCQIOm38g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=beZEtrSc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3iwelaqkkdeiepmgiv2lpksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=beZEtrSc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3iwelaqkkdeiepmgiv2lpksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPZzK5SRnz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 21:33:49 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48378c4a79fso36135675e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 02:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772447626; x=1773052426; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnMgJMcaQgCDj7i00Uawlj/G1rJtXPwe1sCLwvhoFHI=;
        b=beZEtrSc3j8uDa2QX7+B7taeSf3XYNt8Ie3DXxLj2Gp6TRgoc4FqTDb+ShQ/eFs4E/
         DbSdp/Rmi/JSiyRsVu3Ko/gVEf2MG0O+67sHfmM7MbkP3olR8J8ggQ4a8bPNvwGiRRYT
         6auHBbr3ijI17a3YRCD+p1nnCBY7bVxB9ejq7+0U7G0qQPPChj1b8aFAe2xcLx0/QFxk
         r/KPrnUKUTktEfMPrpM01Jm5yZdy7xLOkgLkocx2faINY+K8xI1zZxOsyr0KeD9+SSXs
         /F3B3fjZhVUlsrbAVbJGJXDv17ZUoqcsSmWuow24lMYkfETtqJt0Kqx8pFq4CPPyL0ya
         wixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447626; x=1773052426;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnMgJMcaQgCDj7i00Uawlj/G1rJtXPwe1sCLwvhoFHI=;
        b=iQ1EGFdfCKET92Lvc6723Ep9CIMEn/XXWxgE1Th4XteDVhD8nHfNnyNO5EFEbcPTd0
         xStFAMsRK/Pa7gyJjqgOAh3d8AEx9jmFnxVsIh05DjXiCYc86Su3JoTrZNAg+YIoXHoJ
         8vJOZac6ejlEzQFCd0eC/st+uj2xCwLGRc34k62ngCJGuxK3vF6kgTqtlf+gQTxw5GH1
         A5EvyMbMLLMBnd46RaIQPSBedqfwBMIGMzhFQRLvehadX4gtO0u3Du5EG7Wsgv1rhmdv
         WJzAuAcVc3rE9yx8IRqd6tnMgseOI69miLIEYrDCaGwz2Eb3+1d5+vGaBIzEpcdp+4/5
         KKNA==
X-Forwarded-Encrypted: i=1; AJvYcCVvbVrhCw6L8TYMSbTVk/3Z/UYwgV3FqKTNW0GYkm3oCkNrHzVzkIbkaRwqXIos8dMOoSLz14o7G/6DImk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbWNJ9eF7XW3FbX8vh8Ujr8dZsFQyM8xQJApZuwayXdlDZ9JsB
	PbWAS8GtBJfU+LnS8Axi7fpc3XV8MkGi7kz327ikKg/teqMc+pHxrVHXaUndTcGgnOZFDeGrf9q
	76PM3YRalbiXRsuJkAA==
X-Received: from wmdd1.prod.google.com ([2002:a05:600c:a201:b0:480:3227:a124])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6383:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-483c9bdb683mr186031315e9.32.1772447625915;
 Mon, 02 Mar 2026 02:33:45 -0800 (PST)
Date: Mon, 2 Mar 2026 10:33:45 +0000
In-Reply-To: <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
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
Message-ID: <aaVnifbdxKhBddQp@google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,kernel.org,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-17511-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.ca,m:leon@kernel.org,m:
 dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[73];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 922411D6962
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:27:40AM +0100, David Hildenbrand (Arm) wrote:
> On 3/2/26 11:01, Alice Ryhl wrote:
> > On Mon, Mar 02, 2026 at 09:18:45AM +0100, David Hildenbrand (Arm) wrote:
> >> On 2/28/26 13:38, Alice Ryhl wrote:
> >>>
> >>>
> >>> Please run rustfmt on Rust changes. Here, rustfmt leads to this being
> >>> formatted on a single line:
> >>
> >> Having to run tooling I don't even have installed when removing a single
> >> function parameter; did not expect that :)
> > 
> > Well, rustfmt comes with the compiler, and it would be ideal to build
> > test changes before sending them :)
> 
> At least on Ubuntu on my notebook where I do most of the coding+patch
> submissions it's a separate package?
> 
> I do all my builds on a different (more powerful) machine where the
> whole rust machinery's in place. Further, build bots that run on my
> private branches did not report any issues.

There are some build bots that check for rustfmt, though not all of
them.

> > But no worries, I took care of testing it. Thanks for taking the time to
> > update the Rust code as well.
> 
> I just did an allyesconfig and it does not report any warnings.
> 
> So apparently, rustfmt problems not result in the compiler complaining?
> 
> Or something else is off here that rust/kernel/mm/virt.rs won't get
> compiled on my machine, even with allyesconfig. I can definitely see
> some RUSTC stuff happening in the logs, like
> 
> 	RUSTC L rust/kernel.o
> 
> Thanks for the review and for pointing out rustfmt!

Similar to kerneldoc and other similar targets, formatting isn't checked
in the normal build, but make can be invoked on the rustfmtcheck target
to check it.

Alice

