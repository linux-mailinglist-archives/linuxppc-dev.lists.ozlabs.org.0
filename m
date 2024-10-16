Return-Path: <linuxppc-dev+bounces-2332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE849A15D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 00:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTQkh5bBXz301w;
	Thu, 17 Oct 2024 09:34:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729118076;
	cv=none; b=BsWjM4kBgpMqSiPROe/iXPnd0Ct2vdK3qgfypHHn+I9LZK/g9qmODyeK1pRO5d8MJHvWvBI/zxGyht8Cdzc3gRwutNaSd07KMJIm44TxqKyEkVR9T5aTN1GwZmAkDOIKE7XGx9IsUw8UGmZPIv8Zs6Vy2srausgQ/KTdlkxuH1vMlqu9J3s5pWq9zq2f6CYpIfc/QgTV4r6K9NPVHXNBWpi0amMprJAhSfVJquyezZQGXPoKcBWeBWv/hlui3q2UBy4MLe2JI6cBNDyitXuq/wvBuhap67UwHtMwwdHPyx65JqUyqYWqT0Ha3jYAhbENponrJAjfwnUsiJd7kZaqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729118076; c=relaxed/relaxed;
	bh=BSfTu0xXagbzDTjnYntynnJQdRLNmw1kAFARZuiBlt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJkgQYQ/0Vo8j4zWOjXy229UaTwBXDE8d3nS6jsVETxitQnvLgxFCo9XO7pcBEoYtCj1zdaal6Vt0ITTDGO/2hwOEgCwy+vp64ZVh4aXrfNN9wJoM4FBeYNJuEkpBW2NQKp1rpPBPdSpgj89LeCJnaC5lh+OsI2ZUi/38PnrX1Z0iltiFoo/v4lrPtTMgwT1cYs+IkQy41MXreSVPmqxgNfjIUf4+awd4HNUR1CwKE3KqXj+06LuIoMHf1dovFCL0Sw7sl1nT/Baf2Vb739yxFkdbJLXykgtuudfpzxJY6yvHW4/uEWpCSd9dvV7DiwxJvMNyEOPqklzNsYTe4j4fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Go4DHoA8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Go4DHoA8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTQkg3Mvpz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 09:34:34 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539fe76e802so422855e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 15:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729118070; x=1729722870; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSfTu0xXagbzDTjnYntynnJQdRLNmw1kAFARZuiBlt4=;
        b=Go4DHoA8sDwGPL0TGrepvjTuMZZl4xkKxrPaj/fzR4dykE3+be3qJZqhcUoEsARr8e
         pA6MSI3hzYJgu6rwBj8RyIMoE7XoGN6X7scIHTv7IFPOmCNZxih+MQhF+ikR9QL+SX+X
         2pQ6X4qRvPeD98bBPKgeeDgYIkcej9Vh5WVDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729118070; x=1729722870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSfTu0xXagbzDTjnYntynnJQdRLNmw1kAFARZuiBlt4=;
        b=uY01pZWpGO0E8omlU5jJaRIKjK83XCb940RNaqTSC0TnlAouipZGoTt99f45SvAIq6
         kNredLEmcEFeYz0cGsqVBvcskiGzmuBd8mCS9blS66mgjVWwC3z6hJf9np2c4yVbLik3
         cKguczVAsyS4B0aMY3hEYw6iEcfBjO7YvcEoOzsWxnDkWjZcaHdVRSqW0VhU0Sx47sN1
         dayK9Qc9SaElY5vhGcH2CelkSHgk+bVFKXKIs/sU9u15gCiIw2BRFxddr0cYhyBXOxHp
         inqkBAbuXmAImDAOxrAc82mwepq17V1XVBZ4v6eFgOO65EyflnEMZspBSBo7lzP6FYb/
         2mRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtJR22Dl30DMppKMgBAKLH+4ib3XExaI0vJa2D2QxK64ZU9BP4LW6Z3M050kwuso+DxNC7VKuUUymKlvM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWVzKRaeHcQtR/Eqal5TMw7WXYGxY4JJx0oTazQM0ui7kLe2iW
	CP8Y+B9rjopiT662LpeSn+8jP1LfaEfxHNFRlMIAiuQ6V217Eu/GRdSgpXIDRdAxUszvwoZi7wR
	DeUJcSQ==
X-Google-Smtp-Source: AGHT+IEYZOQEbBnlisK87t95n3MkBVoMZDC+GOcGCa/YCz72zh7/0oqN1n/KaGoSkQUr6dvT/bWCeQ==
X-Received: by 2002:a05:6512:e9d:b0:535:6aa9:9855 with SMTP id 2adb3069b0e04-539e54051famr9097216e87.0.1729118069990;
        Wed, 16 Oct 2024 15:34:29 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a29844fd2sm223225666b.183.2024.10.16.15.34.28
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 15:34:29 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0f198d38so47627266b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 15:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPBJVK79j4rMaX3dmhZcVx32M11fIdKTMjtYd231ZJcD3Wk1bLoM9NGgM/8ztD8jdWX+YcqGm7ME3MBtw=@lists.ozlabs.org
X-Received: by 2002:a17:907:7ea0:b0:a77:c95e:9b1c with SMTP id
 a640c23a62f3a-a99e3b700b8mr1639872866b.27.1729118068029; Wed, 16 Oct 2024
 15:34:28 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com>
 <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
 <CAHk-=wiVE1QCwnP98Hw0GfjrEKiZsvsaqgzC02zJj-BYp4-khg@mail.gmail.com>
 <81444391-9e59-4744-bbf0-2220a3042da6@citrix.com> <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
In-Reply-To: <p6jzuqlphu5va5rroybfmofxaxcveyj6mc724xunzdm6ocwk23@jv7bemzdczg2>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Oct 2024 15:34:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
Message-ID: <CAHk-=wh-PjG_cF7ujBFmG7G6qGL3hzC-6ged+mbSECkp72wHVw@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
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

On Wed, 16 Oct 2024 at 15:13, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> It is worse than that. If we get LAM_SUP enabled (there's KASAN patchset
> in works) this check will allow arbitrary kernel addresses.

Ugh. I haven't seen the LAM_SUP patches.

But yeah, I assume any LAM_SUP model would basically then make the GP
fault due to non-canonical addresses go away.

          Linus

