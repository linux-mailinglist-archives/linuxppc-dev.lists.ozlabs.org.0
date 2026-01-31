Return-Path: <linuxppc-dev+bounces-16473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPjHLZRJfWlZRQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 01:15:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE2BF8BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 01:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2tgN2KLLz30Lw;
	Sat, 31 Jan 2026 11:15:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769818512;
	cv=none; b=S7Lxx8Y8jxA5KTxZOSbdjNBn/eIlNC3sNFGVG2XwjFljqEDVEU4h7+sZDOhH1DedXBu1bvAIifHeBVscdD2L7c4q+bDEJWLEhGVu+Gmdv8429pIJAlbbVHsbeTRtjEn6ykxecCFizWkOpiaJ9xZiN93NA6tq9w5hkeGir1kxqM9NtbWUt3dwKC/NypMh9vQJ6XKC4aVdB+EXnxcmSBjyZTR4hLoR5Y81I5ENvgNPjU8cLXEJyvBZwCdwXpRF07RYoP3DOwOORwCZRWtLNVpeOst1cG88O9+JFNjafPJPartwoDalJ64TAq1obXWWYjW1cI7//c3CaXfTAGBun9OhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769818512; c=relaxed/relaxed;
	bh=qV4mmOV+uOXX/Y9XduJfQAli873FtpKVEKD92eDGYCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtzzQAVrDgdInGM39vY1WH2eAtsL7iU3VqdGhpBEkrrBNWHQTyM0pAULGfCuiNHgXx3GgDrT1eEBoFE4VGjnm1u+8YY95nSjDxYn6M5b46iZl5K3XU1TnwRPqqFNyJxrj37I/zy5w/jxUrqXu5L16Zo0x7oSiFmG3ca/xsq0IgjxgxMYRS9MuTpMSjOfC8bCJRvDTUnwvbaWnn2sI0nOUUy+Uz+J6yN4VgV28Rs+oOOaN4FVvEn1VK7qULnAOEDJD0WXFPnN1mp9wtAkyWlQoV/qGtnrbGGr1dmUVYZLyLnOxANOTOEJMjEVIoqHTLJ1KkFg0emIqTrCdbEtG16oOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NxhZX323; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NxhZX323;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2tgL3FBXz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 11:15:09 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b883c8dfb00so635900066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769818506; x=1770423306; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qV4mmOV+uOXX/Y9XduJfQAli873FtpKVEKD92eDGYCM=;
        b=NxhZX323J+245bJjQ50rWYihA2tM0yju2MLfM0W/Sx+rEekMWooWy8EcUndgCILaoT
         ne9ImhZvBd6qYqKeJjz/Chv1iZEOcNTy2CgYIikZjwMVtdOceOhiI7dsRyARwj4JfhF3
         k8ZTJOXtOZOeoOq2Qhi1jsntEmYfGuIh2HCn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818506; x=1770423306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV4mmOV+uOXX/Y9XduJfQAli873FtpKVEKD92eDGYCM=;
        b=X1H5RcxsDJFnAtJTjRb9DEEmygEp/vN4P/34Smr6p02PI6k2fWdlBsI/4J3m1dqXEY
         tRaQ3l+oNhLS68wlGh1i6mio/fFlkUIsnv8osVc8BQX8EVilsS+z/DsFnNsXMrNMUV1o
         b0AHdlX0UTSwNScQO/EZP/1HigrIcBHiPqOojxpItTbTB2/hiIS3pBcfKZKLwbkAu4jD
         5+p73CC351n46C5kUQq3tsOO9SLHtOxYzB+gej6KvW3x4H1otbc0Wh1Glr4yffFwuVsU
         J6xv+b0dPIDroPgJqWFXKNFInJgXpcz0VHcBVFNoMUKmbRXBHb6eFx04tn/9NJxkG0a/
         8GTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXONpf/8/VcppsbVK7lKWhvYHR5w5ZlGK3bXbQlE4wSHxFvorGYpdbG/WDJwviXCNKKJ5thJs/YtFgV6Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgAISMdyzbXAyIgLzPkojctvlCbrd1WSszIH+Cmp7lowqrOe6H
	UCrUIPBqBGRrFJM0/6t7wzDBQxXc3xsheOtfzPKo1GtieTUO6ZJTcrpOCky8E8rkAFWZSHEUwqv
	Cd6CSIho=
X-Gm-Gg: AZuq6aLZ9/MHG3yAm/tZV+0P+wh5Omoj1FfwaCHmBSOpuEb4GlV3J5Dgje9pRuUhuw1
	UR+LMpwbtuwNi9HbTNrEjbxWXBtoimmjrC6UkdVSKfheg0Qi+VLRZgNQBqvYsL0Ak54wI7rBzYp
	fVX7qPnUK+9xUzG54G7ZldNRotqrBIVbiZ37EzH6voPKGxgwiSjutFSfGKTkF49ICveeyoD/BdE
	sZ6zC/ubbjssO4f7MTh+yIJZpnbyZwPZ8P3aDesNqm9NqzPqOLxHSI3CWD1QKqIAWwLrHrzvgZ3
	48YOChS4l9FjmRcyCZ9/NHuxhilVvgzZQXlxQTpm1GsOynmlu4QggviQmoaTUObLrLqnlHh8TSq
	llmTYw+vTXZDcvr3+1Ox1JjYVlT4eXLVveIuWhzpRfyw7vt89bFgaexMEa0POwjM9pi07bMXqIc
	AS64YRigKuqO/SFSSdU38+rRovCzeA65LJVGkUXOq0ONAMGDPJ1aONczSRfWU7
X-Received: by 2002:a17:907:3f0e:b0:b87:7419:d3a8 with SMTP id a640c23a62f3a-b8dff667665mr273280566b.34.1769818505884;
        Fri, 30 Jan 2026 16:15:05 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbef85401sm504664966b.1.2026.01.30.16.15.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:15:04 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65807298140so4433071a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:15:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMwOV5V2h5NyCLMHfTq8k1N6DcYZ2OsdS0cckfxD2IL8TXlUK1dnbFgrrCpnQ8j1KA+FO29xCGb/Tt6Xc=@lists.ozlabs.org
X-Received: by 2002:a05:6402:1d54:b0:64b:4f44:60ef with SMTP id
 4fb4d7f45d1cf-658de593957mr2779765a12.27.1769818504441; Fri, 30 Jan 2026
 16:15:04 -0800 (PST)
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
References: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV>
In-Reply-To: <20260130235743.GW3183987@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jan 2026 16:14:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
X-Gm-Features: AZwV_QjK3epqif7-e_sBGUc-n0f418Z3nV80PkvQC8yX5DIdQ4ynfWKt9EE0KMI
Message-ID: <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Samuel Wu <wusamuel@google.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16473-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.org.uk:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: 3DAE2BF8BC
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 15:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> So we have something that does O_NDELAY opens of ep0 *and* does not retry on
> EAGAIN?
>
> How lovely...

Actually, I think that is pretty normal behavior.

Generally, O_NDELAY and friends should *NOT* turn locks into trylocks
- because user space has no sane way to deal with kernel lock issues,
and user space simply shouldn't care.

So O_NDELAY should be about avoiding IO, not about avoiding perfectly
normal locks.

Of course, that horrendous driver locking is broken, since it holds
the lock over IO, so that driver basically conflates IO and locking,
and that's arguably the fundamental problem here.

But I suspect that for this case, we should just pass in zero to
ffs_mutex_lock() on open, and say that the O_NONBLOCK flag is purely
about the subsequent IO, not about the open() itself.

That is, after all, how the driver used to work.

                Linus

