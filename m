Return-Path: <linuxppc-dev+bounces-2160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F999B66D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 19:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQrV5340dz2yfm;
	Sun, 13 Oct 2024 04:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728755085;
	cv=none; b=chh3cS4BVLEdmxQpfDCMtYl3XRkddHqnsz0Ira/6I9wr7jWC7QYXjErS2Cgad97yVHgW4pWDuygzEjssWFfTclONdxztz0Ap9hlgGa0WdafToLv4qFfzT8bfKvKT1nnrMZ1OfKVENanL2wsu9wrm1CPhaSctYhgiBp8a0bE2eQiEIHpg/EHXacUbYDYl1ggav/fDBMl3W6TIg6SpwsoCUg5jNfCD/z0HuDULkY5vIJYutQ6Q2GynqxBXY/xb87zo0U5aabVbjjLbIJvIgb/HzUDS1hnrVSrKMq44JUHr3zAFWVWa3v5s5UPQWRyX69ohIF4+ScwwcQuX8s6P1RW/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728755085; c=relaxed/relaxed;
	bh=25gqzX5hBjTaiaIXpJ95pdYdZufrL7FjbwWqGnimT6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nE2m4gJGKNvP6WPoX0ddRAiZQDH6dQE4A/up3hGfad2NX9u9Qe5rc6HJDoW9nld65AZmT/MyqYm//or6b1XTHjtT1QuyV6LIaqA2FPWotZS5fnRG6JraP7ecH5ugwWqzBkS8dJLdZ5gPz/tPjkpcY9MGjVvfvax3d653RVSXf471wIiIt2dwcT2T1yf8118+Cu8Nfjj15ch4d7eG5lNX3NGHhnU8IFc3/gHgAKRM3UkdcGEQJidjHHs11UXp7XKzwvJXYPDOteQ/wvZNbJMN+WNaozx4P7H/NMzV5v5jIBen/evycF07PhpQLBB31hk0qvdsTwBp/SeUIqCr0uhe+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YG5lQ+q3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YG5lQ+q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQrV32jc9z2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 04:44:41 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a99ebb390a5so110319166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728755077; x=1729359877; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=25gqzX5hBjTaiaIXpJ95pdYdZufrL7FjbwWqGnimT6o=;
        b=YG5lQ+q3yRbHvSkBBHz2wQk3TodFRUyk6eg/205tl6VEu+ik77fNVCFoN7LHDHSpwe
         jJIq9YxVpqBdSPMqff57jXRdLAlCU1qtJjBBHUqW1KjNDORVu6bNHX1andW0KPGXXOn+
         Zwa53vUpH4/mOBEJsbSAe3BzuhKo9c20HOVsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728755077; x=1729359877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25gqzX5hBjTaiaIXpJ95pdYdZufrL7FjbwWqGnimT6o=;
        b=O+Mhgw2PFi5i7pSA47eX9i+WgMyxlWMc6p+bR0dSItfVAevr13bHbPff/tBGQIk4Qx
         aSW/GaL1GEkE0fJ6B9yujlVeVobEd4+3EtJTpj14cTAUTllK/8Vh0VSvLL/BJ6W3C/zn
         tLAY60ZdWNaUBvm3uBWpmyoHhBoRQYjyCX5aGx3ZbupazJPXSSzOi4K7fUc3YdMQgavm
         imOiCH6OgLmVhSTB5THmfEb7DVU43GP1zvNAyoekIUQWhl/gaj9wFyITockrep1pjwdO
         NGoVQrUJo9IUNte7VaEgHqQechfAT4I0uljfN9XDCf7DsbzVQ5wTBFckYXk4K/Tb2ST5
         xWxg==
X-Forwarded-Encrypted: i=1; AJvYcCVxeYdggB1DQIVFCX2iS8i8aVzhchu6gGR1ai5Ml3Bn+nMdhUngROnwRFNIYksAlm9DhoO4qjvrijryncw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzcptVyLIvBWdEduvXFbSDdeaKYDRcOThxHCWe+qP6rGS1yLlc5
	gn71Px1lWG4IIYT/D2X4PFat42kdex9sN5gh3WtyPR9mhbzQbCPDJLj90frNuG95vujndr/h2Ms
	6iMg=
X-Google-Smtp-Source: AGHT+IEMA78VwSzUPbjSxF2ddDNqQrbFkSqtGy7eu1WSCG+HFwxVgQJFsjs1Oqu6tp3kmhj+6GO4BA==
X-Received: by 2002:a17:906:4919:b0:a99:ef65:50e with SMTP id a640c23a62f3a-a99ef651155mr154293466b.11.1728755077063;
        Sat, 12 Oct 2024 10:44:37 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f24596sm345911766b.48.2024.10.12.10.44.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 10:44:36 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99b1f43aceso373170266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 10:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4tHI+Dlhl7SyTMiR8rgbRlXKRC9ZFgLeE9unHrv/nQtaOiddtBJyGEShMc7Mx0ItqH62o8ili3vTtD68=@lists.ozlabs.org
X-Received: by 2002:a17:907:a0c8:b0:a99:6071:688f with SMTP id
 a640c23a62f3a-a99a10ed865mr1076215166b.13.1728755074715; Sat, 12 Oct 2024
 10:44:34 -0700 (PDT)
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
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
In-Reply-To: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Oct 2024 10:44:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
Message-ID: <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
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

On Sat, 12 Oct 2024 at 10:23, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
> This logic is asymmetric.
>
> For an address in the upper half (canonical or non-canonical), it ORs
> with -1 and fully replaces the prior address.

Right. The point is that non-canonical addresses will fault, and
kernel addresses are guaranteed to fault.

And the assumption was that any fault will be sufficient to hide the
result, because otherwise you have meltdown all over again.

> When userspace passes in a non-canonical pointer in the low half of the
> address space but with bit 47 set, it will be considered a high-half
> pointer when sent for TLB lookup, and the pagetables say it's a
> supervisor mapping, so the memory access will be permitted to go ahead
> speculatively.  Only later does the pipeline realise the address was
> non-canonical and raise #GP.
>
> This lets userspace directly target and load anything cacheable in the
> kernel mappings.  It's not as easy to exploit as Meltdown on Intel, but
> it known behaviour, and been the subject of academic work for 4 years.

It sure was never talked about in kernel circles. I checked my email
archives, and neither

   CVE-2020-12965

nor that

    https://www.amd.com/en/resources/product-security/bulletin/amd-sb-1010.html

is anywhere in my emails, nor does lore.kernel.org find them anywhere either.

Anyway, what's the speculation window size like?

               Linus

