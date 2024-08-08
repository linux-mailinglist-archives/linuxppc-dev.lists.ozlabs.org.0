Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91494B569
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:22:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OgUzrAZP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfXQh4QzSz3dJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 13:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OgUzrAZP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfXPx47tnz3cWd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 13:21:23 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a7ab76558a9so73015666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 20:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1723087280; x=1723692080; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bEY+KUHesW6wFlestGyrYRGy6nQn6hbsGHFH7Mo5eLw=;
        b=OgUzrAZPJCHOntJE+VIcuGYdmWnU5aEHlMdzgYn0Fp0w1PUkcIc9+MeGFL3QPwnlyd
         2RVDGYH474vOn7Zk6PzZP5uwNnO4ZFx26OuYjxOl4+KqTpjHhym5eEXXk19UHh+/Y8ft
         xbxGdZnDVEL9jyj4aqFjzXAHvv5vka5Ow30vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723087280; x=1723692080;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bEY+KUHesW6wFlestGyrYRGy6nQn6hbsGHFH7Mo5eLw=;
        b=wOXUZoHGTDuwaTODXTybn04V0AXO+BRKY7ip02WCkjUFHVNimTbUhLPVcNd2SrAHOv
         N7H2LnrVLh8EBeIZryEyF34GqUhsWRRYRIxEMCO9nGdFcrmZRwEA1qJBjrs3Vm8xMAfO
         ZkqHAh9ySoaHheejWAd0rpxCLGEbW460fY1GtqBeH9YRmw41YttWVPW3ZkQZnH1Grypw
         edzOjWREgQfMN0XOVVFbsFbujN+m0PU9UZOtb9KXSDdWhYEaXPFQIfA8/sGOeW1s4xIi
         WiaN/T5jiIxYlQwRz1JJu7lHqtHTsnT4xfxgPVaIrayGMC4yXs7oi4fUweEcSCzJ+CS9
         zdzA==
X-Forwarded-Encrypted: i=1; AJvYcCV7jc6Onx9JU+662B9UD9lA3WxEsnpDQA4eE6mrXvV92ABju989J1EqpEuz/gmP99q3saX591vDsT+MSAYo/fRvnZvXIiyKXNW/pIQBMQ==
X-Gm-Message-State: AOJu0YwnqvCe0AxaGvkS+mjkm5iWm67bacsecjwdi8sWRtAGpuniGsO0
	G+LvLEDOB7ImS0EfZT797aywBQSCa8mhr/bulDeeMOsVjlGsEWWplMQ7w2T5FzvlqhBvBV3qn3v
	5tY5+Fw==
X-Google-Smtp-Source: AGHT+IFdIwUeq2uZMpL7yHd6NN4TS+RjgUkwa2RhjkhxERfAPeds3IpFkDwLwahYycfDR2eJ/MRBxA==
X-Received: by 2002:a17:907:7e84:b0:a7a:b18a:6c with SMTP id a640c23a62f3a-a8091f19b40mr30724966b.16.1723087279482;
        Wed, 07 Aug 2024 20:21:19 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c614ecsm691509466b.93.2024.08.07.20.21.18
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 20:21:18 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7ab76558a9so73012966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 20:21:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX05zvOeQr96VXiioqVuPlg7nkb+VTmnm9S1q0MlfPeDZrka8xtOWEG7ka/GP27YLtzpqaR9+6uWEg2luAUqTDM3epXbRQ3P0siqZpH6g==
X-Received: by 2002:a17:907:7e84:b0:a7a:b18a:6c with SMTP id
 a640c23a62f3a-a8091f19b40mr30722666b.16.1723087278507; Wed, 07 Aug 2024
 20:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124103.85644-1-mpe@ellerman.id.au> <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com> <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
In-Reply-To: <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Aug 2024 20:21:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
Message-ID: <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jeff Xu <jeffxu@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>
> Okay, I'm going to try one more time here.  You are suggesting to have a
> conf flag to leave the vdso pointer unchanged when it is unmapped.
> Having the close behind the conf option will not prevent it from being
> unmapped or mapped over, so what you are suggesting is have a
> configuration option that leaves a pointer, mm->context.vdso, to be
> unsafe if it is unmapped if you disable checkpoint restore.

We definitely do not want that kind of complexity. It makes the kernel
just more complicated to have to deal with both cases.

That said, I don't love how special powerpc is here.

What we could do is to is

 - stop calling these things "special mappings", and just admit that
it's for different vdso mappings and nothing else (for some odd reason
arm and nios2 calls it a "kuser helper" rather than vdso, but it's the
exact same thing)

 - don't do this whole indirect function pointer thing with mremap and
close at all, and just do this all unapologetically and for all
architectures in the generic VM layer together with "if (vma->vm_start
== mm->context.vdso)" etc.

that would get rid of the conceptual complexity of having different
architectures doing different things (and the unnecessary overhead of
having an indirect function pointer that just points to one single
thing).

But I think the current "clean up the existing mess" is probably the
less invasive one over "make the existing mess be explicitly about
vdso and avoid unnecessary per-architecture differences".

If people want to, we can do the unification (and stop pretending the
"special mappings" could be something else) later.

         Linus
