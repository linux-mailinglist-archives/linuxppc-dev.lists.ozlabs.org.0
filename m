Return-Path: <linuxppc-dev+bounces-3514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0E9D6715
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 02:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwFCG6N27z2y8k;
	Sat, 23 Nov 2024 12:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732326298;
	cv=none; b=lkVoWp6NrkAfOLgvXixS9/7fIiOhkQJcmBG59EkOpKVo2dx/hD80izY2Veu8DbEDemDJLq0bnV1x+NFNQuPZrBOwPTF1Ek+/SC5KOeiFbZ/0+Avk2/OffenasEm/w701/a9DTot1LrBMlhVt+98MqNOYEJjsH+L6R3DzdSryI2Ul69wZHetOODh2xAlf9sNStQyF1gSHgrDNbKaMuCcZ0OCILoaOXqHhoYS7hugMRnEwf6FBHZYOoRuchtHy5YBmIsXMbG93cyhY6VB5i/HaPFjXh+53uKcpeHjOunD9KxSAQvWHqR9mc9WqzpbgtVN/Arhd78ksKO3Dixe6kXL1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732326298; c=relaxed/relaxed;
	bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBaFwMdJNni/uYwqh97aSDezMC40u1G4hGgWZ6uY3P8ZFo3BxCwmZnfRKOZQipm2IYU2oCkGQb1Apv34hDCxqb4dOFP0Pf7Df+icVLrGqNiX0lBTosoGhk9Epelou68J4kxo8iUJPhA9Q7xzdC5H1FvrQ96OFCY8jUoJ2CRqoyMj/VHpjOLTbQx0i29oBIUtP2Xv8gztj0X5WwYsYIrvdIhSgB/I59drMun0IzEF823BBW5I+wp060WkCeYBSLXCHBu/t7+vHNPevVW3ALGYoP/DD3J/pHvpollyZhTA5sb6b1bgADSQ4px9Nh4ZevseR6QtJ7AkqUk9cA8wnh9/ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bwppp0uO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bwppp0uO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwFCF2CP3z2xqc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 12:44:56 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso1766a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 17:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732326289; x=1732931089; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=bwppp0uOncoYkrb0QXsunu5cYS5rGqXUa1Oc8T3Su+XG39KDoQa5gGr4SqX3BQBDE5
         F8t8CRyYGu82KMyCTmYHBOaNS8wSiKBJ5ZbuMiT2d7JF2XciRk/yFyIR6ibxLCyXNRDX
         IcqZx2iE7NBxz8W69Lead2Bg0tVBXGzORuOrPONy90664/fZtrJCgzVttaNps96LEsbo
         A47dPW5YpznwvFp45e0ss8xkJkHjIQ3SnQtqa6wR23T3LKIGYLj2j04xnNLp59daqt/g
         EuT1roKx8v2bDIQewTzY6lx9X6IJKgpOukUkmXtDVEbDCfMrZd8E8ctMv8qtuL9f4aPF
         vikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732326289; x=1732931089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3VAkynSndmVHDi0F0L9SQm1sisxlAWh9z4fRkq2KhY=;
        b=c1wFgR0lacnh79XrlBMRLGUfFavq71hTEr65iXiMGeaM3mQR7xU/2M6aiPcSa7xyuA
         4wgScvsKLxJsGauy096N2TuccKhanFFXvQ8XmmVHagEatFCUGEH1XzQAqjKYAQWZ/mzw
         xgr3gzOtsqxVr3EdF5EYTvdqzzS1PcJRqb1x8/NL4nt/czgetb0r8LPpvIIwIQrGIM6b
         krI26E2aO6/NTrbhwICFrPhTaceMpiLl3nXbVkTZP7BgFGrYBJJ4B1YX+6i5rrFdUL9A
         qMkdPniozal2OFPedEkSThAgib+hM1fDDS0A5ROoyqDiWF0fkZ3tHdu7xrK67BI1kNBQ
         dNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy6LhLWuMr+wc3kuPl/sHhPLx37nXi3i/UBqin1UD6YQik3bs2DwWy+1qaYSC1v7S9NlvXzNjBJnDiDZE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yze3TXqn1yGlwKwBX8DWY6MK/Ki/E87Sl7hfCtEXnN4gQDlcBBy
	7XthW8dxm71p2+f8AogQVwWa4XNhS8NpDc59/kUYJMoKB8zLc32cCCcI5/3M2r4vOmdFWwNaKfC
	DWXwoRreUsOE/QNl0Xmk0BqsYefKqIBKbmWov
X-Gm-Gg: ASbGncuDSZBWyYt5WedE0LwnjrilyuhM0S9cjdEx7cKr+BSzp7vlX7H2LlfjBbheA4E
	ANfRC1hGvFeVTTeoKCnlHPjIrpWz0MHHtS/U+WgzS+hPC/jE/puB2FRTZ9cSwSgaC
X-Google-Smtp-Source: AGHT+IGL77AC2bNXg1gDSicOAbEhb3ZzKW1ZO63HPbNunVMxHMFLSIMrlQMvQthUYrEvM5iHSpLMrwWh4Y5yA5ldlD0=
X-Received: by 2002:aa7:c249:0:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5d035db0d11mr37256a12.2.1732326289218; Fri, 22 Nov 2024
 17:44:49 -0800 (PST)
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
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
 <20241123-extended-modversions-v9-3-bc0403f054bf@google.com> <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
In-Reply-To: <eac20e8d-d08c-4be7-a34f-b511798f0a57@infradead.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 22 Nov 2024 17:44:37 -0800
Message-ID: <CAGSQo02-o_T7LY4Ld3EyQRyWcuryzw1YSnt=fi6CBiN4NAmYDw@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] modules: Allow extended modversions without basic MODVERSIONS
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> >       depends on !COMPILE_TEST
> > +     selects BASIC_MODVERSIONS
>
> tested?  'selects' is not valid.
>

Apologies. Tested before making BASIC_MODVERSIONS default. I've fixed
this locally, and will re-test with the whole stack before resending.

