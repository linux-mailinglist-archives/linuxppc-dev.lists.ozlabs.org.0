Return-Path: <linuxppc-dev+bounces-17547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KzJJUbIpWnEFgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:26:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 832251DDC58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPm7Q4h4gz3bn7;
	Tue, 03 Mar 2026 04:26:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772472386;
	cv=none; b=RUCdvUfZkce3kUjhvYdkP1DNO2nH8YQBl6jXZwqwyx75HD0YzL1R1HZwAyDpX2d/x4XSLvJ5m2vaW2hwy/APNIjrOJ18GtvflR09qK58sY0NoEBY3Y5lBdLJASCyB8orb8hPssr/5qjVMTsZg5NHbGUa9Vx/TXzzlvqJDKxi0KZLVKMeEfj9xhoae2ppaXbNjjs3loh+qAntyblDwM+tysEde5F2iSIRpzoiGU5H/mk3kV8bFUOTLOARS58FO+vNRVNPt4753jCmdaaAvcPh6v1A9p40YBPltveAgNJoNpUISITZViXz3OyEzdHk8nIr6eK8c8AuS9rWNtiqbCqWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772472386; c=relaxed/relaxed;
	bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2soZ01TON3hfI/jS1mpdF9o/fvRExWwb0vgIjoGlM36B+6NFK4qPtmu1A/Fj5L1hVsVC254bGGkQ1XWTDnbQXYD0jd4HfqGlDQHCcsQl47/wHHTe3T4mgE9Gx77RRx/F85eHRbEcxVT8rV1e333G0BOha71Z18PPkxkIpDiddTaDY7aqoTsJSnI1qhL0hOIa35Lw3qD0j8xoqnvUY8w+zcy2x+Q4pSybpf2iekROelG3hzPd2CDdHA0MrNi0+vPjOLZ8kEADgW+/IYehXUnOZILjiPXWWDsK1sDE/2DxlCAqlZDvzp0JwvxXj+NTsy3YiykRP3RvOka5LVRnFxfKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SFrR/2md; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SFrR/2md;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPm7N68Hmz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 04:26:24 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so562500766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772472380; x=1773077180; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=SFrR/2mdBZGVU1Zcr+RwFvCJGMPDdVvIqFa6geyR0cO86Tpr95EZDIRYKltinEFTWO
         BhHNWvI+rAs/WXPxk91xGIL189H3mFU0+4kGCtbjTQnqq3RGJauDRSExT6VqEFt0ePZp
         fG1b+J7swHYhtk2j4iqcv8e74R4Fc8QOran54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772472380; x=1773077180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbIkpYLS9gbJFch6OaF8nYKkHDJKdsVHvQjZGTHSn/8=;
        b=Gsz+daiGrXxb8tNhuEuD96rv3yTlQuyGV4SWJ1pKPEVvCwX3sADnasHcrdqB2D6WCD
         rk8f2/n2PSOUtM8bdNBmU0f8IhgURhViev2iJIOoK7NgKBBqNmk1vw1KIBzqtUQaTUnh
         TCbbO3Ld4TN1L+77D7x74anWW1QcJjsmeP7ldta5fL85xTI6L1JLPhBzXEgh376eKeD9
         9UtnB4gpWN6W+Ta/AqVMDoBiFJcLtWqC+u3GZ+01Kvuq5baHKqxMABdbLdWwIgZJ6XQY
         bHIZFNTc49atdhaOVXx8Wt3kEOYLhvbfU4zti3yw52qH4RHdHy+XwtXqEFxN/ieZSv0x
         C1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXnW0FxoWQNqnh7BAN/uoVjv6bt948tnpSC7mv+I4glLx1DFYsfyM2qY6u/hSqHSNL6vbkieXYpX3qthdk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyGvzZSPqeZbsErhMPQeEQVXis6b9H3XCauWOTfpvMIHixeXYw
	7KSx4nrIkTOeyjBCR5/Lmpu72Fj4Lpeg1t+pOIGhhoB7svdQ7SmTRNPo5Z7lpHZFp/coqm6wFrs
	y+SYmJmYrEA==
X-Gm-Gg: ATEYQzxPpiIzB4OJoRteMa7JdXt2VAAxTrrfIjdJvTvU9V4Tmy19PfYQHMRvOFG1jKN
	Scs0VvxnLieiyHqicGesrSZ/UJ2x1/uub7+9qHKcDYIR0XIgHPZI47ANubXNLKHlTzQJ9FuybUe
	E+GLNe3B+IqZzlZ5jbN0xMP810JjvhE8EZkzndkDWXjo2AWFVR0o85GnvL1G8pCZ8o1Lppz85g0
	DZEx8lBaA97WocYwbufUVWW1W9Zlyj2DPM6gXaFE/E1qoZbk9eIxxcYV+56TIgbcVsu2h37kEFO
	Y39UM6iRSnsFnjGGkonfloU0UNeZha/kGljizB8H1QRVD3AiM9P5CT5f+aezy0ktJc+95Ch8FxB
	KQ2jLvCA+RhYU9qkHw7J9VPM38cnlyj7S4ykRb6ouiciLLKE+bpkWACJ60npQodWjQ0KV3IDqAp
	Jn9KZZztHei68zcfu2BjxRvzeDdaSPhFZF0eNjP/FW2T0jEisR9VENcARfbfnBu5urq5LMNr6E
X-Received: by 2002:a17:907:3e0e:b0:b93:7255:2da with SMTP id a640c23a62f3a-b937659feb6mr866904766b.55.1772472380015;
        Mon, 02 Mar 2026 09:26:20 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51843sm510951466b.16.2026.03.02.09.26.19
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:26:19 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8f992167dcso488488466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 09:26:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVRXEFdgvtKiARgNh3FnQib+6HKLEXP2xrsQegN9aZJeH0YeywRN42cOjxTzhoBwAzUVbxYPPfp1J7jms=@lists.ozlabs.org
X-Received: by 2002:a17:907:25c2:b0:b8e:7dcb:7f1b with SMTP id
 a640c23a62f3a-b93763af8f8mr867609766b.21.1772471885098; Mon, 02 Mar 2026
 09:18:05 -0800 (PST)
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
References: <20260302132755.1475451-1-david.laight.linux@gmail.com> <20260302132755.1475451-5-david.laight.linux@gmail.com>
In-Reply-To: <20260302132755.1475451-5-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Mar 2026 09:17:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
X-Gm-Features: AaiRm52ly83FU0bUfVtu2Rv39h3JOZJTzcdxMzg3AYFviKySZcFGK5yhPqg6aWc
Message-ID: <CAHk-=whaR_ujJvWGTe_fZxg_d2YSORZWnXwHLa5Gao+x136pYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] uaccess: Disable -Wshadow in __scoped_user_access()
To: david.laight.linux@gmail.com
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>, 
	Julia Lawall <Julia.Lawall@inria.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 832251DDC58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:chleroy@kernel.org,m:dvhart@infradead.org,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-17547-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,stgolabs.net,suse.cz,inria.fr,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,gmail.com,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux-foundation.org:dkim]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 at 05:28, <david.laight.linux@gmail.com> wrote:
>
> From: David Laight <david.laight.linux@gmail.com>
>
> -Wshadow is enabled by W=2 builds and __scoped_user_access() quite
> deliberately creates a 'const' shadow of the 'user' address that
> references a 'guard page' when the application passes a kernel pointer.

This is too ugly to live.

There is no way that we should make an already unreadable macro even
worse just because somebody - incorrectly - thinks that W=2 matters.

No - what matters a whole lot more is keeping the kernel sources
readable (well, at least as readable as is possible).

Because W=2 is one of those "you get what you deserve" things.

             Linus

