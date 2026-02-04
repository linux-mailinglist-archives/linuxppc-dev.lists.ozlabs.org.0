Return-Path: <linuxppc-dev+bounces-16585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAh5DoBLg2n4kwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:37:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC3E6858
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 14:37:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5hGd377Sz2xpk;
	Thu, 05 Feb 2026 00:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::34a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770212217;
	cv=none; b=Lh7VBxYto8+jMhNmFTTNEIXg3Iw0UPYOhqDMw/QvjnRROjfFctt2nthavyy5PXdm9HuecZKU/Zuu1z94YG8X9jwHgdmEClyJqja15u70tcbGTjQSm5YbIwR7eoOKCv/9+k5+O/5nLgnStQbQbdWbZa8lZRygnumVE1VrBeRLYxJdrJFfo3TNwWsk6fCfVBQ9saYrQjlPMjMlvLD96s3htY10zbktoAVyqY2mURBFAvOWaStcYmgeub8PjolJQPOsFs4IZVBo/nL0U8mqxM6cForVuw59JaynG8EU914x3ISqzt1n/B6m1/0EK65HrMa17fZivYTS7TbByZDi4DolfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770212217; c=relaxed/relaxed;
	bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=baqrSOwjykvN51Rn1aYlq7qTEOMfqfHZJH8eRLABICKUMARxi+G05cXIDD/8TB6HXjUos3riMkRayctnhSf4kNLxt5CYKD2cE20JH7j0VuEx5KzBWgSPzF6iKuY/O1u2pq7EWjDZ3Kkmq2pdDHc6nEjHlx3BOYUZhBPHP6sEGgmqRzb/7NGSrl2NuwZqInnpPrh0FuhVsEDWUNuQQmQzXu/A8a12eWhPWxXTe0GaNlsyLd8tJFr4DrTs0sziFCAut3L+X6uzZt6JttyP7xCY09ynpfpOljklU3xzylIIZ01AdSmH4w3FHnPx8Lpzyb4txIsKXwFPjVEg0PxOuOo0ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uAYMc8pV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3deudaqkkdgsjurlnahqupxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uAYMc8pV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--aliceryhl.bounces.google.com (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com; envelope-from=3deudaqkkdgsjurlnahqupxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--aliceryhl.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com [IPv6:2a00:1450:4864:20::34a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5hGc1SQjz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 00:36:55 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4801d21c280so5984975e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770212213; x=1770817013; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=uAYMc8pVmB3oiWgQVNXpjp34cbwv4uWmpM2zJb+pprt3GG8j3XTOfo2BLqOxdkCERy
         IhbyMBjjANmJajfrhjys1PprDes+/RT+OtH9V1x1dEGOun5ONyI1dw6lxSgVJvbIvHQq
         Quytc3mzhq2RAwLILZXFj3lnO55Tim4xFpAl8Nxx6HfpBcSNUBT7W6Q3KVSppT8F+JMr
         VMSxJ1p/o/Gk3IeNs66rhpfeoNeCVtJhRu/QuSivOAwNLt0zpsHnDlrlhXXS6A+LFdGx
         BhLMjb9wJJ+8GQri8btf9oJXIMLcLx2P+TGtuVmzdmBxnhJ2AzRcENSU+Ra8nSmYjmTF
         Bbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212213; x=1770817013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIR6EBMCAqXb340DYxL2KRHd/O9FP1A+6HPiKAJmpBg=;
        b=MDSp/86tUpyfHn1WZ4l/A8Uw09Q45JIs6vjtiNOCZoYriVn2yVerUfLTn2VwQB7ZuW
         Far53hPN7wHsmDfNYPYMrwpF335E2zOxYtvXHSjtRXaCnbT23GKpoWlKu8bdVsAiVhF9
         pmDX4Qan1/2a6AjlJx3w5+UhHwRlPKvSNNMGde827DBMh7W+nBc595dmcy1IBLCrUeaF
         dz3rkqqJvky7CGAiLtIABYqpXNDNZmTsDOwdYdkLXTMgVGoYxgDk69Sx3SEceGc44L5i
         Fy+70wRwc9VWibBt+rkwiw+0c6KRZAMGtmYxtt2TvA3DGv9sNJOdcMAvBJIEgbxadu4W
         KY4A==
X-Forwarded-Encrypted: i=1; AJvYcCXpKIO8ggkpCIdnC85Lpf7/ewICxZXDBbNzlEVMSD/v2EZXsvidw2isYHRkTOLX2qaOHleHHxU+5cwAqxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCiB773z7+MspCUpo4D1VoWDZ+Ri5XiStMLvILutUuqdRbt5ud
	BJQUHyAMeAYC44WqubEcpv5xymAFyCZhUq9IS0e7kk8FHOTDvp2l5MFgj2sqVC63fpe6c9FUFs4
	XSVWDX6bD+YYnCapj3g==
X-Received: from wmqu6.prod.google.com ([2002:a05:600c:19c6:b0:480:4a03:7b76])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c17:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-4830e930f73mr44864985e9.11.1770212212161;
 Wed, 04 Feb 2026 05:36:52 -0800 (PST)
Date: Wed, 4 Feb 2026 13:36:50 +0000
In-Reply-To: <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
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
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net> <aYNBtc2Jbtg9sLIE@google.com> <20260204130653.GH2995752@noisy.programming.kicks-ass.net>
Message-ID: <aYNLcqEo45oWpRYi@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Gary Guo <gary@garyguo.net>, Link Mauve <linkmauve@linkmauve.fr>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16585-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:gary@garyguo.net,m:linkmauve@linkmauve.fr,m:rust-for-linux@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[garyguo.net,linkmauve.fr,vger.kernel.org,kernel.org,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,akamai.com,goodmis.org,google.com,lists.ozlabs.org,lists.linux.dev,heyquark.com,gmx.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 17EC3E6858
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:06:53PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 12:55:17PM +0000, Alice Ryhl wrote:
> 
> > Is there any reason to not make it Rust-only but for all Rust code?
> > Making the / operator work seems like it would be a good idea.
> 
> Why would it be a good idea to have it work on non-native types in Rust?
> 
> The reason we don't have them in C is because non-native divisions are
> expensive and doing them should be a conscious choice. The very same
> argument should be true for Rust code too.

I suppose that's fair. Perhaps one way to go about it could be to create
a clippy lint for 64-bit divisions telling you to use an explicit
division method?

This way cases such as `core` that use division can still use the slash
operator because the lint is not enabled when building core. And normal
kernel code would be told to use the explicit method instead. Or kernel
code could explicitly choose to silence the lint on a specific method if
they want to perform a lot of divisions and know what they are doing.

Alice

