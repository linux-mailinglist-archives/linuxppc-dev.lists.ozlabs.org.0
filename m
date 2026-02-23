Return-Path: <linuxppc-dev+bounces-17018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDSlIcu6m2nl5QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 03:26:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5F171640
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 03:26:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fK4V00yHBz3bTf;
	Mon, 23 Feb 2026 13:26:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771813576;
	cv=none; b=I0/3ZUjwAJrisejIyCRYTJcceaygjCLkXUqhJd7YyNa1ZcTWDxHZwhFeGH0CuaZfyLPs3hvsEuVhldCdRCLo39yZoEcQO0Zdc+EaS+bfX4sgG9fJypGeE58hNtCxHWB+k0v1dq2XyZ8J3aqLaG0UeHY7a8YDV+2lqTWUEKu77c9urp9Fr7Tys80SHJxPyrnPCWh/4yDgD0XTRvFgMzkslAkj8Zy16Eb/a10EMezTw6m9XOtOdgK043RE33rJYOBQbZWYga6b4JVO22uXcAB7IaUs9DXeQs+seiRMgy33185n0/CC3d5sL5a7SH1JzGISriw2kF9z4J8nDOWZYZaWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771813576; c=relaxed/relaxed;
	bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omGlOiSu6bhkF4tbwwBssFdIy6nRiO/82Xr/D9M4DNiFlfpNdMwRfyH9tpzKDMKsE4UjkzYAGkpFq8cXlFUl/wiXQKlnR/KYuhmrIglxqZeWFikudlgXyceIV+w/v0wqR9OxzY2DK2v6OuiMtXMt8svpC7SBbpTgMyGHM+TWF52MyGlPmauhK2f7d7oAROoORJMoHC54APox7CO0mAtLu2l335UAmCK25q8TQf0DqyZ46VWUTP6ukPH583nsew8u1/POabwkLu/vJHnxy6yypYHTrIPFOmbDgPxAx9Ce3e1Sj5GXx+IZG/ItneeMyJYgzN8iX+7uRt67Bup4ydH2+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LMHRwD77; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LMHRwD77;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK4Tz30K8z2xSG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:26:15 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-824484dba4dso2731580b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 18:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771813573; x=1772418373; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=LMHRwD777uH8Q+Uisv3GIRV5NNK69CBR2RVp6+amCbFkEnuz1hsBx2HFXmLT+dNeZJ
         xeO/przcPDYzUgj7cV5I/gqq4fPrHYq+klB1MbNNdq842CRF+tSJWmfHUqPhPLQeKbaE
         Jw2JfcEw7oLSFL7K4KB3pzw985vwuoiEIj3rjbs9Tvq4LY0W+2NIcQapO74bDvwsd4nV
         /CemK2IuQ1YuEntiTebhFGbwhKjE1PHdRzBAQVSs5VXkR7l9pvtekunqT/3K3WxBdwZ0
         iT0vJbPXxzrd37HOOIgTFrDX8tbm4bQCSiEx7l67NevjGLeIyOAH6+qcMiTmfoTA4U7i
         wrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771813573; x=1772418373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoSianPV+m24sY+kS7ttUM3HGhiAlDaIi5Lhm7XMZI4=;
        b=Nt1NiCPWtIdWtiJUqWyzTum7VyLKK1BsxiI7YgiLP3A66Nix5rBleuz8lfNbRofJBz
         x7Bguo6s2/hI3Lmgav42iFSCaJusNlDHH//y0CiLIGu+Yn26AL/4uWNOQpHm1dj0Q6NW
         t3XmTI6i2HkGlTFWJbQPknaL3f8OpCUJWek1T1scr+PBxnf9PHjPvPY6zjUgrmqJM07d
         1kSY5TGHAMKihOPMlU0jixOja6xtCldRgTkgfzlmZ5c1HlyfqU1sFulL5Bv6uIA0L/iB
         Cxwse0CDmcFbOhKJdYA6/hL/uTW/iJIFVJ7RYqyGabmvtk48f6Hzt4f6s3psoQjb6Ku3
         EuxA==
X-Forwarded-Encrypted: i=1; AJvYcCV2LfIwhnZv3Oli5pika09+Zo44EjbnOUZgVLoHCW/HDtHvQxYi5LzWtTSRGk9JfAyTr3pYvCvVu/0fTTc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6ubBLZPyG1tzfe8/yuKWVNpnwwjluJmQIQSiiSOQpSlQCWRTl
	bw2nsmXJKRSoFMzLb6KrIZBflmkrTBcxgDJ8heL5lzUjZjqAZ0FTVL28
X-Gm-Gg: AZuq6aKd5zR9um1WbRBKOFhGZXKESKB7opvTSJGGZ+uDrF0j8l2kIm0FvCyb40kiIYp
	fVw7Y6EFx10NSUq2Se9QiPbDLgcXzKOo8vznR58FeuYo4F/Hzi0iJY0zKtzNDV95wptGZTjxhca
	NIHTmd32KoijEqmZm5NXbeQzpqJ2iQHZ7ewOKi0DcVq8bEt1ZPnzFoEC0yqirrzZ8THKX9Ywgox
	JF9/39WJ2lonEZqlw3nIIFYTIA0+rfni10f9UR29SRM224VfmWZbbn5sKZuB+MxvBD94JNRft6e
	wGy5zTfhgEL6AHtmMkTjDx6GVcrw2lO7ds012d2rdJhqnj7OHX7t2I04GxyxRr+kFsrp2hkKvpZ
	g/mvW+A5DbCMK+rG/o1WQI6XftLrzzN+6WfiirfOJUwRxmasqBEuBx56X54PT7+p9HaGw2U1aR4
	cxfgHxlL2TNUqpI2HAWnCaLj8qsiNui8L8ZKriiOtHpG3yYqJws/f7vx9oC3GQakw9gy8AEA==
X-Received: by 2002:a05:6a00:3696:b0:824:a635:4181 with SMTP id d2e1a72fcca58-826da8ee305mr6643441b3a.15.1771813573069;
        Sun, 22 Feb 2026 18:26:13 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.163.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bc6e8sm5846159b3a.49.2026.02.22.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:26:12 -0800 (PST)
Date: Mon, 23 Feb 2026 07:56:02 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:linkmauve@linkmauve.fr,m:aliceryhl@google.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:miguelojedasandonis@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-17018-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,linkmauve.fr:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9BD5F171640
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> On Sun, Feb 22, 2026 at 8:07 PM Link Mauve <linkmauve@linkmauve.fr> wrote:
> >
> > Should we come back to describing the target like I did in my first
> > patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> > is there a better third solution I’m not thinking of?
> 
> We are trying to stop using the custom target specs, so we should ask
> upstream to give you a built-in target you can use (or equivalently, a
> flag to do what you need, but I think the idea is to not have such a
> flag).
> 
> i.e. even if you used the custom target JSON, we would still need to
> ask, since the goal is to remove that script entirely.
> 
> Thanks!
> 
> Cheers,
> Miguel

Sorry for the spam, my earlier message got rejected.

I think, disabling altivec, fpu and vsx with compiler flag will work.

What are your opinion on this?

Regards,
Mukesh

