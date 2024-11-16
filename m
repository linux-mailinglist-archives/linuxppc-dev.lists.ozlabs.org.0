Return-Path: <linuxppc-dev+bounces-3340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4409D0162
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 00:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrV2X1j4Hz2yRZ;
	Sun, 17 Nov 2024 10:09:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731798564;
	cv=none; b=WPOM+YoiwFzBj3lVzxwO3W7GH7ewJQpNvRPgOX4gLh/H7v/8zG/rQAlMfKqqFZv8upHvCHfy36yFAsaThFUSoBckN4dkJm+C3f5TlH3SOGde5+K0NvMcPqj5YkSeGhW8PdAAsRQht9Xz6jx9U7sXabvU/yn4/CtTW2tsFRnIEGV/XIdJggZd90XiSrUnZzgw8v7GauBDhoW/3G8UUGGuhxAas7BgQXYGxn6TnhkG5ODks6Lk5WRlNiypqSvJ9l6hXJUN9Rb4QCxEjmrcAhuaxL7kMCgPxD7cnUqAVLjXqF3zPjrxaka10ri049kqsbU/hg7nkW9xm3d8XL5zSagFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731798564; c=relaxed/relaxed;
	bh=Td7vCBCvy5qltO0Crd/rzRURZj8FOyjMicysTjqR3jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzYuY9ajWrruxqt2jTvUXnBGZTMNQGWrBJAjfpvlttNRb61XKDeyjcG9R8w5Aj5RghH4CnHmmf7Pwe1yBxgFKNevOLlY20DtduPWbp/xWoSDD4iWmg8M2VbLri7n3Yt1BcBzNyZxV5kVVEWs+DL/j6HVbKzfDrO8FUzr/S7ZVTPuZDVhfxa+UbpmLk/RqcgX0D/HesRqT0qbcRpeLs4S6+ui31cDh2gWq69rFOmT+pSkMVMiQncaInaBuD4Jr1ckjUBk0Lb/wyZXtYtql4NmQnVM0+0nuxIes4Wt/6/tc1uRAhZydvwKaxXy/3+azlzZwi85+FuW5mbT0pAI0769GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=U5LqqZx9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=U5LqqZx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrV2V3xSdz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 10:09:20 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so520850766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1731798556; x=1732403356; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Td7vCBCvy5qltO0Crd/rzRURZj8FOyjMicysTjqR3jA=;
        b=U5LqqZx96/t5OSIFi6GbD7MwMHpQYazqN1v9pqMqXqthHntP/AEmtGKY9B3QbOzjv9
         aeHmOSDgtPqDb4tvPG8BihwyQ/JE3eN3WubjpfonAocHsXFq8bfxC7uRFNCtcief58eF
         pbcdYcP6c5D9lFA5oz4dN7mFrRCKPxJ34D8nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731798556; x=1732403356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td7vCBCvy5qltO0Crd/rzRURZj8FOyjMicysTjqR3jA=;
        b=gOZbdX6mIBoxVZC8k8bZy2+4uPqB8HCNBNY2U3lY4iK1C/+2QUim9MisZQEp8Fnnn/
         fqfro8UHhVB/di2tddTbeLbJKK32qK7I2bnfZxKvsLb6Dzq7ysMqgZaWrD3YBwqYURRx
         v1q7UbFB3ymZelPWbJkYmcPCEJafXMDvmwqUebGFTzsDDtgZ2382kP9UB1go95MT+iLt
         yQSbH+B1d/7ksZZORiE/Vesvuj3VjMcL6jjloprMMSW2LBW1aWZ97cBlG4y0/ZeVbc+S
         3hk0Gd4LosZt8p3D1KS98rJlWIVoOjrR2o8gPAWhnsFq/Q+fH73BEWw2i1km5ZoFJYw+
         rJcA==
X-Forwarded-Encrypted: i=1; AJvYcCVIRW+rK+2QJrNK5SzM0Z+mShDDu02oHVKeOxbJrkmQE+alPqVFdCVvwLAFCT+l0nXUBrv22BUXzxcI7WY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBRyuHAGrB7ujBqGuOX6H2pItFoakeFAIp2axv8vc7zYXx0LRO
	3UPgv9PmIqg8BEIUcF89SBHdKZWJZs/3folLl+4vSRmDiMi62QaJg1AwYSmotwUPAo7RkTp6Bjy
	e9Ds=
X-Google-Smtp-Source: AGHT+IHyoeFZC20n6/riGmvAqVR/x8Tj8CR0EWkVqPOpgJZHbHNulZVM8TJgT/UeR6qcmtXdo8ExeA==
X-Received: by 2002:a17:907:25c2:b0:a9a:e9c:1d8d with SMTP id a640c23a62f3a-aa483426398mr736372766b.17.1731798556283;
        Sat, 16 Nov 2024 15:09:16 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e045385sm353862066b.144.2024.11.16.15.09.15
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 15:09:15 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so520848366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 15:09:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6lx/+A8A4ejTDn0ubme6vE5hYxTx3HIlJnS9UHOGSov7P6GRAUPPvjh/KRvTxR5HdTfeM5paRThQgcB0=@lists.ozlabs.org
X-Received: by 2002:a17:907:1c29:b0:a9e:df65:3a81 with SMTP id
 a640c23a62f3a-aa483554f81mr518293666b.59.1731798555048; Sat, 16 Nov 2024
 15:09:15 -0800 (PST)
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
MIME-Version: 1.0
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <4055e18be7ff4f1f83fb9a4b6a8bc312@AcuMS.aculab.com>
In-Reply-To: <4055e18be7ff4f1f83fb9a4b6a8bc312@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Nov 2024 15:08:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=_RbcUfnjxL-X82wiCphU3_=d1qQ15JXy+49jmB6BVg@mail.gmail.com>
Message-ID: <CAHk-=wh=_RbcUfnjxL-X82wiCphU3_=d1qQ15JXy+49jmB6BVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: David Laight <David.Laight@aculab.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 16 Nov 2024 at 13:38, David Laight <David.Laight@aculab.com> wrote:
>
> If __get_user() is the same as get_user() [..]

No, the problem is that it's the same from a performance angle (and
now it's actually slower), but some hacky code paths depend on
__get_user() not checking the address.

They then use that to read from either user space _or_ kernel space.

Wrong? Yes. Architecture-specific? Yes. But it sadly happens.

             Linus

