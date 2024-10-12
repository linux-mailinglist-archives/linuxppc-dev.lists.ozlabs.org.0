Return-Path: <linuxppc-dev+bounces-2158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A495199B602
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 17:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQp8S3gdbz2yVT;
	Sun, 13 Oct 2024 02:59:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728748760;
	cv=none; b=EwyoMzt5j8RqqGMMoCfU5zo4pPb0KXDgqTiYE2XMXJ++4zyneWzJeLtcf1GLfOuq9KVSMRwiVHt6WfN0F3IH/i69y8DBSw495RPMLAod2Wpc7eGzk0aMlcOR2Hdr0IJXaDMt7n2qtPW8GCeTkNNmzqd7yY5AMSBLz/+EWxdFuQv8kgxWYV4fLUNZh4s+m//yT//SvwxP7rrPhhfg09zyBW4wtl7J+7Cc4F4X60ZYM3wgK1YvPFyTkfHzZX53JR6iYJAP+879KzFgUmFW1gfJTM59wEfINGNRLwRD4gfpDJCJYBoLa0xyg+12Kd3BS5FnbVNkA0JHha8wYnGOkVtPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728748760; c=relaxed/relaxed;
	bh=PYXv8kz78D5y9K9/7GFg7krL6juPgfqF4V4vA8M6Mys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OopX5gZlumCa/BQrPtG4Gw8EHranCtSQVC9gfa+wuY0M7pDGVcDnQsZT+sovaYQlCIAsU8n/vhbwQSxQ6xNfnFIT3QLCAlzni6ZIug3TiXgm6ASAubpWku4ZK+Nq5gB5pk/zRNztSq3VSN4sPbzVgilkLvnpH+Lxx3CvhhsfIR47s80gqWMeRpPFKy0TIc9Eks1AEVeX0AHHqbZ9f2qHOWCv/QkQw/qBgVqNdd5tah2iWDSGJ2Q2Rs2cVmaKnureWQp4EGHq9Mr48scd5nQZWs8Z/maYqsTdxyWk/JPda8idfwIgTbItPA1SSNL3fCN7ZEqchjpiCamsk6+NH0hqGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gvjo6hST; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=gvjo6hST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQp8Q5X2Kz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 02:59:17 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a99422c796eso493481166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728748754; x=1729353554; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PYXv8kz78D5y9K9/7GFg7krL6juPgfqF4V4vA8M6Mys=;
        b=gvjo6hSTFcFG9uqxIMAXHBRYLh1JGsi2uy4f5LOSRWepIwjDIgaaCypUz9ScVAMmIM
         ufCMJezmSLSoz8Ul3Imy4Rf15+UtHq+0LlORRayHK3OWKQYaFTKgowU4/F+RXjkGTOlU
         zHNROH2FzhSwxCADHBSkExnd/h8rBtgjF5HcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728748754; x=1729353554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYXv8kz78D5y9K9/7GFg7krL6juPgfqF4V4vA8M6Mys=;
        b=jDiX4ozrVM8ad2xayzIvgtzsDanJEr8VEE/JVByd8PFL+Vn5xuPZplHtXpGdEIzJgT
         Er6oEaIxws+IxBmgxwHzArmq+yazfBO61JnKCnOOGRVcFDaluomPLG51t12OcpO97TYm
         hR0vDsk5ltTmkrxwbihWVIfhjv9yveBNdp7hH6eOZBYA4/2pGaFT8LvEUqz6tCT/vg/y
         oOlH75DPE+v2B2jI4nkdSUyHgMY36t29MLcZXO1Q2JQUr2tfDeNX9FVAg/yu81/2CqS4
         yjOjNI4rMsiiEf4kAENhAfIQB5xD2dOxY2E9AfaM71OPRgnsuZBfkyRuOcRBOQiaz1BJ
         8uxg==
X-Forwarded-Encrypted: i=1; AJvYcCUqV32myFf5ljITIMNlCpkj4Zlbt4oYzrdPRGceepj8lViNGg2w/dOweO0mV4rQGJoFPZLvKtv2/gI7kCY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydCjbaXE53RIv1MrwNeq+qinT7M9Ciw58DA5z+ntdwX6mcUiQ1
	UDyofjKMZkibNYdW4Y9M26D74F3ZJaMpbYtsZZoM/lDAIP08rJRw+yJ45W5T9QIcsBtpI+Mnmim
	PBL4=
X-Google-Smtp-Source: AGHT+IHnI5EdyxQ9LSf11CqT36/LSYD/+HZZ6PMuGUmsGN/5SziJDq6TBlj4Geb0AiCPcV/yAlHbTw==
X-Received: by 2002:a17:907:94ca:b0:a99:6036:8d9 with SMTP id a640c23a62f3a-a99b937a5a4mr612035666b.15.1728748753582;
        Sat, 12 Oct 2024 08:59:13 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f2458bsm339499066b.52.2024.10.12.08.59.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:59:12 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso3885483a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 08:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBHeu9kbWTf5u5FxEmanj8qjBlSIuqRoo17aU4y6cgPKtyCpqbiAn5mSj/fJ057O3V8H1K0VoKSmq+Bo8=@lists.ozlabs.org
X-Received: by 2002:a17:907:97d3:b0:a99:36e8:c353 with SMTP id
 a640c23a62f3a-a99b95f3d86mr565494466b.56.1728748752296; Sat, 12 Oct 2024
 08:59:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <20241012140923.kl2evqb6aue2pzfs@treble>
 <20241012142107.GBZwqF01t-TX1J786b@fat_crate.local>
In-Reply-To: <20241012142107.GBZwqF01t-TX1J786b@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Oct 2024 08:58:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6yNsFN5oiQv5JGarQo_0OCFOj6xTwOXc0m4i6XZWHjA@mail.gmail.com>
Message-ID: <CAHk-=wh6yNsFN5oiQv5JGarQo_0OCFOj6xTwOXc0m4i6XZWHjA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Borislav Petkov <bp@alien8.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 12 Oct 2024 at 07:21, Borislav Petkov <bp@alien8.de> wrote:
>
>     Commit
>
>       2865baf54077 ("x86: support user address masking instead of non-speculative conditional")

No.

Thos started long before. Again, see commit b19b74bc99b1 ("x86/mm:
Rework address range check in get_user() and put_user()") and the code
it generates.

get_user() results in a plain calls to __get_user_X, where X is the
size. No barriers. And __get_user_X() does that exact same thing.

And no, your suggested patch looks very suspicious:

  +#define mask_user_address(x) ((typeof(x)) \
  +                       ((long)(x) | ((long)(x) << (63 -
__VIRTUAL_MASK_SHIFT) >> 63)))

that does no masking at all on a kernel address, so you can feed it
random kernel addresses and it will just access them,

                  Linus

