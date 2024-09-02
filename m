Return-Path: <linuxppc-dev+bounces-897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CE0968F13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 23:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyLnq0Kn1z2y69;
	Tue,  3 Sep 2024 07:03:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725311007;
	cv=none; b=bzUoBnLu8BnIy/NxZVZGM29I5DLcowVxt8AkPgWVWkNQN0tyZByzfJCGwDRFkxGt+YfAfiLQAy7wXIuj1vzVeHed0ixTJR61X2euN6Ct9La4dP1dCM9NmoIHjcdP15tPnkXu1QBnIgUc0EyBYu/ZUbm/ntdqn6bOb2Ijb5kvZROpybsRmPML21YORUy4zmcxbItKUjJBlUtl3RKHDwGMmt1b3vfmPOqlkz7kxCxCl6DLQGNtZSJMgVcbXxnI1BZtyRfUCgYVSgHVBts+g3AV+ZBgNRHlnPPVOuNq2BapnB+CdIwwta+T7Vw4SdrklX5bxXw2DErGNLgIZOm/709NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725311007; c=relaxed/relaxed;
	bh=po+MmfD4nq5cLkClRRslOxFglpMwsYkFajj19L5Hzi0=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=mUuTPTOfJM77nsYI2KSjUJhuSGwtBps5RDXcGVR6GNEFtePnHCFKp78Ap45+SIsMS8CHfJz2mfGirK3feC0Nui4VEUPHYPvpjRm5IZQ1NXP17ZlpKvb+0M8fqggLikX5G4dhzQ/e5nUZTnOms3kkLCsxryo2PwO4Afb0U2qIZDscYhh4gUitjWY2BPsd1cxp2+IBeVTW/lgv+LEb5k9Sh9rQhB94tS7J01Dun8NwR8KRyMNsVK0yJu6nAVJCG3cgs1rHRwoN/Ef4RnaTuS5nlRm5aoP/VOFXzW6hb50bXdMrcEQZpB3/Myo0lOd0iiLSaOddOVYpJm0LXKTTkrINaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HI3E8Nkc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HI3E8Nkc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyLnp1vxRz2y3Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 07:03:24 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so65917551fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2024 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1725310996; x=1725915796; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=po+MmfD4nq5cLkClRRslOxFglpMwsYkFajj19L5Hzi0=;
        b=HI3E8NkcNjsWOToTJzeGVEM/VyU8fIlkMLOf4ivw6/O5moS2Yb7LXUtBWn3WVcqYTH
         eA7s/cvP5TzXZo7oZ/yaoyCXXP5pQnTllXd1crKUMLdfJAGU4VSVs3eqAfR2VDds65IA
         8RhmNlecRU/F0kKicwjw9qwO+nIoM0o4r5lRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725310996; x=1725915796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po+MmfD4nq5cLkClRRslOxFglpMwsYkFajj19L5Hzi0=;
        b=bHvQC9oN6alFnQK2loI54YPGj5/xK4XqbncWpR+d0n/d/a8pWN69UOaKYidXqN9ksA
         gEaaNkCgDct07QGXzXtFomhvDvof1dQeuRouw3Gq+LPc/OMGINe7FnuD7l+2IAye9BUV
         vGZpSga8dpW4CabdJo7OQO8LTr3GVgYzrqAB4Ngu8wGQJKLDIQ0URgrt3FauuGUIfUsT
         F8zt6P1VJHdCYd0EQ36AxE9vHboUvQxxqPYACbQLxaYAHPS+FHUuonynUwbiPr749M0w
         ihqdyCTMmOPoEVwg32YEmxWgUmN3QHYd3uqeYzXv2wHt241Z3LRRbPhsCkdd9XRnV129
         UKRA==
X-Forwarded-Encrypted: i=1; AJvYcCXDa59dGghRz2dXtdzROw3HE1Po6Bu5AMVyAR5w8o3hrcO8NT0x7EXWR3Vdiyri5HyTqf2y8jthE+QDPXY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlHt1+k+Rf4imV8NDk4o2uH7RG2SRYWMLBuGvIQnpVn5xIdtYZ
	813lGl9hNoVnnmhytT8ebPX4O7dvSDmlaRbfydN9/T2/SJ+20xDAk7tDBwrKJWNT5qp7dpuwmbS
	kgZzF+g==
X-Google-Smtp-Source: AGHT+IHgqqUz5xZJt/TusyOjlay9ovRf/4pxR0pb0zz6XpqayD7xb1flvRTQ34rH0lDDw9f5QpaIYQ==
X-Received: by 2002:a05:651c:19a3:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f6105c49a9mr132610961fa.7.1725310995051;
        Mon, 02 Sep 2024 14:03:15 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891daebcsm612424066b.170.2024.09.02.14.03.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 14:03:13 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86b64ebd8aso281368566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2024 14:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdMk6uWsih2s6cEQzcozEP4NSvDZ6Vn9knviFA8uiBZwXFbv6l1dtei8+oUzGQNbrNxGqYb2vULNVRk80=@lists.ozlabs.org
X-Received: by 2002:a05:6402:34d6:b0:5c2:5d34:a45a with SMTP id
 4fb4d7f45d1cf-5c25d34a63fmr2793579a12.2.1725310993097; Mon, 02 Sep 2024
 14:03:13 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <yt9dy149vprr.fsf@linux.ibm.com> <20240902134953.e834bc2e57d36b1d3b1397e4@linux-foundation.org>
In-Reply-To: <20240902134953.e834bc2e57d36b1d3b1397e4@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Sep 2024 14:02:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjD0XLhkzou89J-TK=L6B88pFoNYxN1uTWRQB3U5Czywg@mail.gmail.com>
Message-ID: <CAHk-=wjD0XLhkzou89J-TK=L6B88pFoNYxN1uTWRQB3U5Czywg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sven Schnelle <svens@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-s390@vger.kernel.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Sept 2024 at 13:49, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> uprobe_clear_state() is a pretty simple low-level thing.  Side-effects
> seem unlikely?

I think uprobe_clear_state() should be removed from fork.c entirely,
made 'static', and then we'd have

        area->xol_mapping.close = uprobe_clear_state;

in __create_xol_area() instead (ok, the arguments change, instead of
looking up "mm->uprobes_state.xol_area", it would get it as the vma
argument)

That's how it should always have been, except we didn't have a close() function.

Hmm?

            Linus

