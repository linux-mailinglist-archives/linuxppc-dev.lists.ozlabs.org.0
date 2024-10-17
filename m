Return-Path: <linuxppc-dev+bounces-2361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807C29A30BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 00:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV2cy18fYz3bjq;
	Fri, 18 Oct 2024 09:31:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729204306;
	cv=none; b=eyrLBPZ3gJ/vqcwaRHbfuoKJ8pjXI3+68N+SBs0egOkAbtiZnln2i4AZa6Qxo1F+j/Z2RLuDIegyIEGEi+H41oTS54fKRNGZbIoJAuZB9y7QttqiNoXfh+SHulIIt1YVwN5YFAsqzC+hk+MVLKnGtxYM75KD3SKYF343ux22gFrGjiKfBXx0YOWk+fvaOIpJFtILhs4fjUQmNY+iWKs9t/BCz79i8m653f5karY6m8WRru8TcsWKIqGpJ6cS/k4B+PfyHvnV1rmCc3oeblsf1zAnaN7HJ7P99k45gvRIT4gvZadV6oGUjeZefoXqEjc2HMBeQr/G1qPboL9b6wb/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729204306; c=relaxed/relaxed;
	bh=uFDduaUkTGYB8Dm/y9D3gERrEjvA92Fs5P6zK7IVCnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Opf5O6LyjQqyZYG8vv/HlChjFeejriO5ju7ZkiZ64lBFLTRO3ZMGDqdl3GfJs1DNIylioENexlxo2HlX6jLeH/5wM9cs5Ln47I4uxLdJRjJqEnCtImGuv8f7Y9IFwRujAyGSXUvUWk1IlyjdKdiFLjNEYFnyqef+jzu4bG9d87Pgyt+zSGCCFwkDGvb9P1K3R8xnAi0Sdcr/972jB6Czc5pZu40Ye1OOpx4rcGDPH3bFplfkh+7J7up8r3Ii2QteU4tRXeOqBIc5C+7q5zipoy6JCpJ15mAiDaOlAZMNYUTHywqoyAdGHnB6m6726aGs9pnlO0nOEpCWW2r983tThQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=gL9vlKs1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=gL9vlKs1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV2cs1VWHz3bjL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 09:31:39 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-431481433bdso14803625e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729204292; x=1729809092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uFDduaUkTGYB8Dm/y9D3gERrEjvA92Fs5P6zK7IVCnY=;
        b=gL9vlKs1xNUulGEvoZn3vn4wnphSPy6x7DZozq4DhuB3OqiWLQCZBhaNff2mdx0zJn
         qgB22uisdqrcbIUYnBNMLfCy4DQfCM83dK6l3rZQHvRaDUwn/XTeNvQ7V6vUqi4g4Q/J
         oGkY2UAIe+JqkgAdYMRk08CXig7dwswsS1OX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729204292; x=1729809092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFDduaUkTGYB8Dm/y9D3gERrEjvA92Fs5P6zK7IVCnY=;
        b=lbTwynqvCfPvFRTxDbh0NEkEeIJEE0Zg7QVc6mQ1S3ohCcNjQNvxsZ0s5TRFLrjQYC
         SvpujeiEraOHjt9kfoaem824rIH4/j0er4D73YwJqxSES2Fyjw7HoDXixk0FtwPhVNis
         Jy7QwoSRpEcyMjWBICVcFHyazyucD9gWn8/WGC5rTnT51tJ3QxcoMIHex/4cl+KFl3l3
         HzH0ycx629JCdbmRqPqoCOkEZljDmWitnf4+gAXupD0hefNIyeA28wio7W61+fNJF8YV
         7ijdVHOiR3ruqUD3WCt8s01l916cJLdaeHdqTwccUEwUmJLpdPjvaSbXpWG8LSefLUiL
         7M5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUO3k+SEY8mR/Nn3yKcS2rtdCDmu6fYF3EinqpgrK1deLEX8uFkIL1Ex6EfEEW0IIX2ptlng6aCUQ0XuJA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3a9Q5/KpLJO75SNz/AEa5lfhdpiQw0TQBY3eZ0flJ1nidnHpa
	iEJVAerjo5L3OKDeyVeRLW6fYX3Vkdl6K3u56uTNKtAqj7gXV7ItGQ07Bfqc5eg=
X-Google-Smtp-Source: AGHT+IEWpmZzmAAhQsNyLwB2XNPbsmcVwy4QDrvhxip/eOhvzvKnna7h1vZFItW+z2qjc4PKCKmCtA==
X-Received: by 2002:a05:600c:3151:b0:431:5043:87c3 with SMTP id 5b1f17b1804b1-431616858fbmr1537815e9.22.1729204291925;
        Thu, 17 Oct 2024 15:31:31 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160696a27sm9198175e9.28.2024.10.17.15.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 15:31:31 -0700 (PDT)
Message-ID: <8baa42b8-2529-44d8-99e5-341132c09264@citrix.com>
Date: Thu, 17 Oct 2024 23:31:30 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] x86/uaccess: Avoid barrier_nospec()
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Mark Rutland <mark.rutland@arm.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
References: <cover.1729201904.git.jpoimboe@kernel.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cover.1729201904.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 17/10/2024 10:55 pm, Josh Poimboeuf wrote:
> At least for now, continue to assume mask_user_address() is safe on AMD
> when combined with STAC/CLAC -- as get_user(), put_user() and
> masked_user_access_begin() already do today.

Honestly, I find this a very worrying position to take.

It's one thing not to know there's a speculative security vulnerability
with how mask_user_address() is used.

It's totally another to say "lets pretend that it doesn't exist so we
can continue to make things faster".


Even if you can get Intel and AMD to agree that STAC/CLAC are really
LFENCEs (and I think you'll struggle), they'd only confer the safety you
want between a real conditional that excludes the non-canonical range,
and the pointer deference.

Any path that genuinely deferences a non-canonical pointer is not safe,
whatever serialisation you put in the way.  The attacker wins the moment
the load uop executes.

The final hunk of patch 1 is safe (iff STAC is given extra guarantees)
because it is between the conditional and the deference.  Patch 4 is not
safe (if the comment is correct) because it removes the conditional.


Or state that you intend to disregard this non-canoncal speculation
problem;  that's fine(ish) too, as long as it's done transparently.

~Andrew

