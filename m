Return-Path: <linuxppc-dev+bounces-9679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2BAE6AAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 17:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRTGH2Yqtz2xlK;
	Wed, 25 Jun 2025 01:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750778551;
	cv=none; b=dis6LD2xZjZSBEmLYcfU7hN8/EyGM2mci1a48XBfjxhNiwdDTVfDdHzwDSexKOy3UAKufsWSh0NlIpUTntztSgXi0EM3kJIG0IYwzsONahzyGs34njCk8rOVCxgmpMnuP+eKmux5+AG5HSKBvwZ9h1PYstUbb18ZlEc5lslaKaFN+/blCLiexd58mx4bu4I6AEgY5K3PGqquidMym/Kzy0daI3SPYs/EkpwPyEA7qKLmmCWhiSG/7O0t64U2x15d1Jeo+JW/FY1zMnoC849DhIbBQZNrsK4Ceu3X+UF30GgEGNjy7XRup2BGIF55m70onPvqJ/3+weud0IHXG2D0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750778551; c=relaxed/relaxed;
	bh=eLkoFblRVcI4qlzicS3evY0eDoBrk4ZSgrPnvsJhZ+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3rYEfS3IxqUyOJvwZKq00KWLAYFe5lxg04ohAkGlBB0V/5ffYcmMeZbrTqAIkXSrwcoUlFI82s017I6tmh6UifG2Pt2eFlB0I78XWfAvN38tTPQKYDJ6AsRooXPfy/YSNYjO3f0437FjPtedhShrj81LjwxKXP80bxXl1jVN7JaiXpHSnS6wu8YtDmvBFUL8JO2FA5bXOsFhO6gjvDKrICJyDqMdSaFsYkm8TIVVlmNQdLPpv0z3ZwUbVzhyPUb4uot9QG41/ZVGqeGMap2WmyzmbC7CCnRZz0cSBb34JZIDbgpngWkvTiWJ0ESh+uygVykUR5sXBv9rbwg7G5yYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=R/efDUyY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=R/efDUyY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRTGF3zsQz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 01:22:28 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo10410551a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750778544; x=1751383344; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLkoFblRVcI4qlzicS3evY0eDoBrk4ZSgrPnvsJhZ+Q=;
        b=R/efDUyYGNYzmGNW3BsjEmsu11IzFX57Wa31rtG1188VuTKM+KGGaD2cIXCKVv706W
         Faio1Zg3NGbYgOYip3AGeNAuikDvv8r95gB2pdRttFCxYLlN9W0Zu7l2ZBhsKrztoBF9
         PrRTEtjGORVGGLpsE1+tn520xzn41k19fVH8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778544; x=1751383344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLkoFblRVcI4qlzicS3evY0eDoBrk4ZSgrPnvsJhZ+Q=;
        b=iB/BS91kqbXJI1vJUGgjFimgYrHqXwtEXJGBc6FphlSQ4KirY3OfgnlAtaCoIjJYu0
         DuYqHDAX9SGRs+EHc6zHMgO0me4XqxlK/Gd7iVRWc++XEg14E6mww3p8NaD7z0oDGdG3
         h1hQXW1a1qNELXtTnbPRA3XQtAyiEXduywxXPYtIhTxqeU9KxZtrLEEFKV862NYieK5A
         MovUEGCdSIswcuJ5Z8wdatvdwH9k8TD+rmzGGjeM/uJOtRb4aCb5ZhEQiqSZfjwJ3ws3
         HDbI+zo/ADc1qVjiRigpHBjzjBSoAcXb3KHtAL3H6fxx/m3xiNt3Ii2EK8rOL7SFTaT2
         Czcw==
X-Forwarded-Encrypted: i=1; AJvYcCWPSn9bdKohGpMyNVdF8LIcGvba66NonNfTcfr8n5+kYtm87n+5RwFbN8BHyypslcfSQJODek3jTl1q0JI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yww+zrVy+OVUnGpqHGJ9fNVMCtYTAmChhLoCydoIUbTS5Dd23G3
	BSo5jdlEuHz63GdOvAEm+MAj6biLVqr8WwrHClBhURc72uGE+X5CTdSj5ZpQVQ3w+Rao9PJoC/F
	2a2/uA6c=
X-Gm-Gg: ASbGnctcn3ZAGNw1A4yBwW7VmsZogTnrDMhyKf9XjlFFPccfdJlI1UAylAXy2Rd/OIy
	9qtWhIHRVA0inuT2DKg5XrTByADapRn4aTf7IOfUgc4G8UVvYjpgXTvIdxtmYm7u4cRwLb7U02X
	d8gKO06XcsN3QuUfkDOnHHSu0ScPc69kqmd3PGi7D+2HXXDPdiT5pKu2bzyYS6Uf17JcB0zKPK7
	HFFenm9YIbzhwS24KL7vk/A1TkQbt+dUklBmipHNM1UkA+PGW7gamuOUz1pfZLoJXDOd6feXlCi
	lUXAcINyW4tOgPGZcdpH4VhMDtCYHcw+Iw/z+0oDkC6MYAZL7CFQnsXfG2HzI2k9Ya0Hk254Qfv
	QW9c92H6fVpazMTCS/WkfNFkOZfVC+jtR5lg1
X-Google-Smtp-Source: AGHT+IEUe+lLli+l2TFfeREQLBXx66KF0/muhyCMGM/D86KDeyS7c0TsHzFtuW2I7A45Ir4gmiIDbA==
X-Received: by 2002:a17:907:6095:b0:ad8:a329:b4a9 with SMTP id a640c23a62f3a-ae057abdf77mr1764958766b.25.1750778544107;
        Tue, 24 Jun 2025 08:22:24 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b9fsm884599066b.161.2025.06.24.08.22.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:22:23 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8573414a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 08:22:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd6A7aI+CKJsMxF1MwbIb98a6cG57JgN0tvXYIZu0nhTOsW5GDq/lI7g1M9toAPprJQ78SkE+4tj0qHNI=@lists.ozlabs.org
X-Received: by 2002:a05:6402:4308:b0:608:330a:9f67 with SMTP id
 4fb4d7f45d1cf-60a1d1a2ecamr15042057a12.32.1750778131214; Tue, 24 Jun 2025
 08:15:31 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
 <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com> <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
In-Reply-To: <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Jun 2025 08:15:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+zcmrHM5ryM=_71vEwjaRjwRHVgFu8WRG5xsgu3ku+A@mail.gmail.com>
X-Gm-Features: Ac12FXyiIOMeVWX36Mt87GnZfIOR3ssqbql1oPQlXRyO409zF_tN4rQRqufbqcw
Message-ID: <CAHk-=wh+zcmrHM5ryM=_71vEwjaRjwRHVgFu8WRG5xsgu3ku+A@mail.gmail.com>
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to copy_from_user_iter()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 23 Jun 2025 at 22:49, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> >
> > (Although I also suspect that when we added ITER_UBUF we might have
> > created cases where those user addresses aren't checked at iter
> > creation time any more).
> >
>
> Let's take the follow path as an exemple:
>
> snd_pcm_ioctl(SNDRV_PCM_IOCTL_WRITEI_FRAMES)
>    snd_pcm_common_ioctl()
>      snd_pcm_xferi_frames_ioctl()
>        snd_pcm_lib_write()
>          __snd_pcm_lib_xfer()
>            default_write_copy()
>              copy_from_iter()
>                _copy_from_iter()
>                  __copy_from_iter()
>                    iterate_and_advance()
>                      iterate_and_advance2()
>                        iterate_iovec()
>                          copy_from_user_iter()
>
> As far as I can see, none of those functions check the accessibility of
> the iovec. Am I missing something ?

So we still to do this checking at creation time (see import_iovec ->
__import_iovec, and import_ubuf).

In the path you give as an example, the check happens at that
"do_transfer()" stage when it does

        err = import_ubuf(type, (__force void __user *)data, bytes, &iter);

but yeah, it's very non-obvious (see __snd_pcm_lib_xfer(), which calls
writer() which is either interleaved_copy() or noninterleaved_copy(),
and then they do that do_transfer() thing which does that
import_ubuf() thing.

So *because* you were supposed to have checked your iov_iters
beforehand, the actual iter code itself at some point just used
__copy_to_user() directly with no checking at all.

And that all was really *much* too subtle, and Al fixed this a few
years ago (see commit 09fc68dc66f7: "iov_iter: saner checks on
copyin/copyout")

                  Linus

