Return-Path: <linuxppc-dev+bounces-2164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE699B7E7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 03:21:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XR2dH1fV2z2yN8;
	Sun, 13 Oct 2024 12:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728782499;
	cv=none; b=jDIjhtzYxzb3eMaQ6iZ6dlJwY6p8L2gP3zYO0i2UzDTKExYO5V1mjrkQ7etqHWKG2KI2+2XYSwit9lIBoEsVirDjWwgY+Nz1033DpEoe7jeSU7Qb0wrgebJ4RyluYCvEoB92vrO43Ze+na9ACgYKje2SkX+AGlHW4jb9Pk4SVHoX8YtRrSXXrwJb2HysGNv6D2ZxnDpfxvY3PKadZ/rvf66/zaX+ls2HGJVnlkqs0YIvDZAWuT40wbWytBxO8nGgSWw/0aNoiAYJ5uiIsLvt3vYIsU1ZOtYcesCtW4p0ewNbNGUJO6KMDF29k7lujBCg1pxUCAPZqgCiMvM2jn5VIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728782499; c=relaxed/relaxed;
	bh=kw27pG0qhDRFAn8wT02De9U3ycZc/4OQqPSJ5WxfGxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efCWtrgdIPtcsIN0mRjCVSfp7oKxbUfPEk+IyJGa1z/4yhxqMABcCh6Dmo0fVpy6eNoh2fw4LVgtovrmPCeike2oxcM3E6XdQT78ZKAsj1ke1GDyWyHyXWjGMlGlSm4wSILGD4bruOVXWKLi0BKAB/Yfhq0ILk6jAFYVv1srGNKO3wnG++yOWsu2hQl0dY4K3Q1uYGo9pwsIVS362eWk0k0M0acWp2QC/uc3eiTYwKN82uoSQjlUEkdOO68xK5lKZ0L27+R6EJyhHQCxQaxwtS3e4dQWcdx4Ld9oqyu4GowUPDcI2m/LPkAhGTH1w/4njQ0tcq1+zNTcSV9AKd8bRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TejEIrc+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TejEIrc+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XR2dF4p03z2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 12:21:36 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a99f646ff1bso86638266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728782492; x=1729387292; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kw27pG0qhDRFAn8wT02De9U3ycZc/4OQqPSJ5WxfGxU=;
        b=TejEIrc+HcMrTnCYiYuPHGDtZjp9Ca688zulTrbydqvBL+Hry1HXtOHpuO3VzyvfUE
         H/yei2gjCUluVhz/OR6TjtDCDFWoxOg2RdfNaC6TAcy68wqsol5TlYUO1sQ9535/GN6Z
         ioLI1NFxpMjsL1UygF6s8qEVZFNzc4LL2pzgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728782492; x=1729387292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kw27pG0qhDRFAn8wT02De9U3ycZc/4OQqPSJ5WxfGxU=;
        b=K1Wx7P4VfLRkJ0yxKlz1tiCAsrIvwN+wc07Ab0jxjWdGkcusOMNVUUdX0Rn+g14xSy
         2V1dHi4p23Sanjkz4GyRQRW9ALP8/FIMmKGuMqGb4CLJDCNFXksjpoY5dFdgQ9FMx4SR
         ycTs8xwATdE00ZaLfyXmHdrriPGsWLXTXMawEWNhj2Fw4+bvQfeiRsLV6wjCBdM3rZc5
         bHgyJiastaaQ8T30jf7j0bhP9IwUGgFCr/7HXr5KCALsznfITc1JpLNy1P1t8rkyXaTh
         9ShzRjWuVLcboRdZ+AGOXvrGXUBvfkLczFRsMqoij7ZrTrmMcUWsg2B0St+12Kb6DXLz
         vnvw==
X-Forwarded-Encrypted: i=1; AJvYcCUbcHaSQTgwgpWtEWUtfvQA4JCS3r1YCEQdN9mCcXOwbpek+wGNu57kdOXbNuK3j6oLs39KWsXrSHQDg5s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrErK1PqZ1OppJC4Z7WLjLliObDWN8tp5r6JAhM6JqZ1kJD88S
	qoyx4jg6XnAy3bsMb+ZnFOp6ZH4jteItMJqwqN/k22ho58QYW7Hy0vMlcL4aruthGOTDGDodreV
	r6O+CCg==
X-Google-Smtp-Source: AGHT+IEHbkOzxMtEmDWu3XL4WLerj1yfFt79yfcdlfgFDfYVxIEktR7wI7l320emC0FPy+68zAQWlA==
X-Received: by 2002:a17:907:1b94:b0:a99:daca:bed8 with SMTP id a640c23a62f3a-a99dada043cmr289293966b.44.1728782492533;
        Sat, 12 Oct 2024 18:21:32 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99fbfc9aebsm55697066b.156.2024.10.12.18.21.29
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 18:21:30 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c973697b52so57636a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 18:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEP6thCCvna+VGKGaHQ7L71vMal+WSgqpaLjadOoKGfMQx6PYOq4TfoBmzWbPsUNV6oEFfeszVeo5WReo=@lists.ozlabs.org
X-Received: by 2002:a17:907:7da5:b0:a99:5110:7a4d with SMTP id
 a640c23a62f3a-a99b95fb3admr514715066b.61.1728782489324; Sat, 12 Oct 2024
 18:21:29 -0700 (PDT)
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
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
In-Reply-To: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Oct 2024 18:21:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
Message-ID: <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 12 Oct 2024 at 17:53, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So no, the address masking can not depend on things like
> __VIRTUAL_MASK_SHIFT, it would need to at least take LAM into account
> too. Not that I know if there are any CPU's out there that actually
> have LAM enabled.

Lunar Lake and Arrow Lake, apparently.

One thing that may make this all moot is that the value loaded from a
possible non-canonical range won't actually be used until after we've
done a "CLAC".

And at least judging by the performance of STAC/CLAC on my machines,
those instructions will likely have stopped any speculation cold.

So maybe the "what is the actual cycle latency of detecting the
faulting instruction" really is the core question here.

               Linus

