Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60086B5D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 18:22:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i5qlsW2f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlLkw4ZlGz3cZN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i5qlsW2f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlLkC0KpVz3cST
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 04:21:36 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e4e7e25945so3363936b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 09:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709140894; x=1709745694; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=i5qlsW2fhNcYDA933y9tYjHxlOMxabYaIoHErcKKx5BkJSczAg9lVz924HbKu2Pr2G
         /Ww6+m/nFG6CX9yRgbq4bAAsv2Z7zuJUA/bl3E2fum8Zle5U+YR+nUPwzBQx7ATEsFbu
         SPMuzivDgwQ3p02zvEG7CKLckV1tq0QNeKsoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709140894; x=1709745694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1bHapS5+5iN8in9GHCNPDr+SpYos985v6N2aaB8ggk=;
        b=oxDau9fmige04qyMXP/ngoNwtS0EcZjpGFDVc+0JkGWah7LBb6mUTTIBEm2KfsR+h8
         Xq0XDWgrdztFn9ml02hHhrYUPUuKadpEha6yq+mJjM0tLX+GArB7hZ2ImzJm26+bdudh
         6no2NFsDTSLqJnj8RfTKfmFVfbXUbi1YpRdxCuCnoMHFf3byaPwRHJBNgCWwwedZEeVo
         JWQfkwxzC8f8RGALBEhdwnjEG20EK8dpg4nmYLd6CMAMCOz/O4FVipM6VVDioOLiL4Ux
         Nm1X0FWDE6mQFzqNdrVM619UM8pjHi30hfXFYf6j2n1bcGUJw2BnxGkIvnlI2QAvhG6h
         wdnw==
X-Forwarded-Encrypted: i=1; AJvYcCXlEpLygOg9h1nTaME3X79K/Exsya/JTnJbUR8G8gAP1vUp9zmKuYSeAe5bqlIPCLC/6pKSmi3gtFwXxt0yPCYyzvFvCgdQwH2h0xYWRg==
X-Gm-Message-State: AOJu0Yxf3ZGNoOJ+G/Pjmd768NklPwWLONPy6eDfcc0MJ43GshBuYVtC
	bqolc6GYOvJ0CBvtvNEftUtaUD+oEgj+T8Xb8kYquhhjNZEfmlIM6fAQ3Sdvxg==
X-Google-Smtp-Source: AGHT+IFxqvM5hQDYAzOob05oGJvol0U6qboX77jQeHs6sC34fTUoZvoLbeslLh+rshINZpV8envxoA==
X-Received: by 2002:aa7:8650:0:b0:6e5:84f6:2a9e with SMTP id a16-20020aa78650000000b006e584f62a9emr91910pfo.31.1709140894116;
        Wed, 28 Feb 2024 09:21:34 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id it1-20020a056a00458100b006e583a649b4sm90257pfb.210.2024.02.28.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:21:33 -0800 (PST)
Date: Wed, 28 Feb 2024 09:21:33 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Message-ID: <202402280912.33AEE7A9CF@keescook>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
 <202402271004.7145FDB53F@keescook>
 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
 <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
 <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <def71a27-2d5f-40da-867e-979648afc4cf@csgroup.eu>
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
Cc: "luto@kernel.org" <luto@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug
 @rivosinc.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 28, 2024 at 01:22:09PM +0000, Christophe Leroy wrote:
> [...]
> My worry with initialisation at declaration is it often hides missing 
> assignments. Let's take following simple exemple:
> 
> char *colour(int num)
> {
> 	char *name;
> 
> 	if (num == 0) {
> 		name = "black";
> 	} else if (num == 1) {
> 		name = "white";
> 	} else if (num == 2) {
> 	} else {
> 		name = "no colour";
> 	}
> 
> 	return name;
> }
> 
> Here, GCC warns about a missing initialisation of variable 'name'.

Sometimes. :( We build with -Wno-maybe-uninitialized because GCC gets
this wrong too often. Also, like with large structs like this, all
uninit warnings get suppressed if anything takes it by reference. So, if
before your "return name" statement above, you had something like:

	do_something(&name);

it won't warn with any option enabled.

> But if I declare it as
> 
> 	char *name = "no colour";
> 
> Then GCC won't warn anymore that we are missing a value for when num is 2.
> 
> During my life I have so many times spent huge amount of time 
> investigating issues and bugs due to missing assignments that were going 
> undetected due to default initialisation at declaration.

I totally understand. If the "uninitialized" warnings were actually
reliable, I would agree. I look at it this way:

- initializations can be missed either in static initializers or via
  run time initializers. (So the risk of mistake here is matched --
  though I'd argue it's easier to *find* static initializers when adding
  new struct members.)
- uninitialized warnings are inconsistent (this becomes an unknown risk)
- when a run time initializer is missed, the contents are whatever was
  on the stack (high risk)
- what a static initializer is missed, the content is 0 (low risk)

I think unambiguous state (always 0) is significantly more important for
the safety of the system as a whole. Yes, individual cases maybe bad
("what uid should this be? root?!") but from a general memory safety
perspective the value doesn't become potentially influenced by order of
operations, leftover stack memory, etc.

I'd agree, lifting everything into a static initializer does seem
cleanest of all the choices.

-Kees

-- 
Kees Cook
