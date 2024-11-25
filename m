Return-Path: <linuxppc-dev+bounces-3551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1E9D8804
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 15:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxp5v2Kq2z2yXs;
	Tue, 26 Nov 2024 01:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732545043;
	cv=none; b=azAxovRO1bthFwzKw9ryDSgHdpuTiXIDF3ir4bCXJEcJo8i8ypBMMCv0xZWz9s1ZDb7cMfKN8EtIU8gRmZ0KE9Z7fjLOczjIFlJZsCwCNaio7qrXse0lazO6zvBfNC6a9NbXeA8wTwOxTVqYdeQKv3TtqlBt7t8TSUUHq5Gv/1JrCAYpl8nRGLh6TmlxHWLld/uwfARc2SRXlynSN1U+PczSrDz3H5SqNLoa1Tz0jl4nqEo5vD6E8Pszk3CIpwWfO6tuNv5ScRbCYbEoxKXBEsS30BR5Y+YPecWE7oUA3Bw6EEzZX6xGmx8DQN3hfvp6vEef7B/cil+yXfmzLa6liA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732545043; c=relaxed/relaxed;
	bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYwOVXoWZ20D/RHdjX6mhqmrffS93BY4sMhPLJ/sZnGiuU1xlpSGec6+PSm58dp7tnGbqLJRFvy1xiOkCR7TDrvRTwK4KS/q1c6Kdmfv5r8T+kXAcjCZOX1l/xzn9qiAWDWT3sOsb2qol3r912W9wfuksSIDnZwHK8YzpkTnBxfDzVsvmOm4g9VqzRsz3XN4iFdxTEXd8ErVpoAPe/XSWGOodk4HU8FOdoxt7+QqIiIN/4o5+HhbZ+PU84jhV3IO0P93IWQ2pc0lfU9bTBBjHjBncicL5pURB9KKR5ONLjasTpORN00EzTYh6+XklMbK4RnaV8TBfBaotha73sr5ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PC/cmUMW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PC/cmUMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxp5r6jbNz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 01:30:40 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so10565a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 06:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732545032; x=1733149832; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=PC/cmUMWU5dKyy1atf46zhmU+8b6YOVVCOcgrYbLOdqQlX/LAc77cSPpjBV1gZx1pg
         dXzwkeOHSooFwjuBTFsl75lOr7aw1FQL/viCgga3VLxtSYGsIutxOg3xeEP11+FLd1sG
         hO6lTgHaTNqpxL4ztjjzTFkK1rRJmr6GvSYLlSNbqnvyPwyb4Mcjb6bFfWXIEu3Ru0Sd
         NjkJfyPO61d7E+QzKuT8gyHJXvwKac/rexy+RSdyFIEbtPj1fXIr/DPoHuwYWGWKc45L
         /4QG0N92Liaqo9e4et8LAN/8TDjvcBm0+SaRIuzYYEgJlwJu9thBVPB6QHrPqTsmScXN
         tqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545032; x=1733149832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=DC/6FiFlEfiVNlNWKuQOeHh3om1HUOMX9GsHN/u1TtXoRbeVCGgB9GkCA6zHQbBTHN
         m+0CVKRX5OYMGjyLiJnO1ODObHFGwlLfAiGpxwAeYmxBpiUlnQDKC7Mz2ZCL7fI1WzBU
         PU270rco6fOkY28whqJSWlfkTKd7vA07KZQSZkefF7V4iJBew16PO05NtRc9Uv96r+Gs
         STARF99L8qO0VfUsUKrpUhmQW7QNDmUH1QdJvL+vYvSuNq1gPYdthhDECqJl1HJ2fI/t
         IlEoYumI4BQTvdo5jlf+ljWCOqmZ4QsN9KkHMaBUONSVjm8cHMy1modjjHldFLO1Ke+U
         DbJA==
X-Forwarded-Encrypted: i=1; AJvYcCWQghbMX9YY6TsJZ/o6uOEUISMj8ifG2gQS5ktcCyWQyGkQhyg+0YgLI9qN62lV0rFR4/sJLwKxAY3chjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yywcl90oR9kU2jEKNip1Ib3KKtUCsG9nG0H//+GX8iyVHH8CMW+
	Lhim7ri+rVliqAblmBQ3lGm+G01b8mqpjv72QrM4g3/lQa7KELr/22LXxkxTT/ljsNDD4axtryC
	a21TD219NdxuIXVx8znRo/Lz4ovn/wWfp7naN
X-Gm-Gg: ASbGncvYjEnAK1j5aff11bvFUEhEpJF+/weoHYk0B4Ewff7cEsxFgLMeIXu4f5p9g0N
	JAAql6gx9U52oDg5CXYMKsNp4yiGJvQdwnAwk2XY+zM27xqLclrpZmhNPRCSKAb2i
X-Google-Smtp-Source: AGHT+IFWKEzbGpUOrfyOjGRqTC5/oGFC/C8dANhbCDJLguS07R1QYiU2nCXA2rPbI2+60Dcss+8N/xSO3iPMdyVL4co=
X-Received: by 2002:a05:6402:d48:b0:5d0:28dc:b2cd with SMTP id
 4fb4d7f45d1cf-5d037fffe79mr164939a12.1.1732545031685; Mon, 25 Nov 2024
 06:30:31 -0800 (PST)
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
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com> <87mshntv10.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mshntv10.fsf@mpe.ellerman.id.au>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 25 Nov 2024 06:30:20 -0800
Message-ID: <CAGSQo02PiWgAVR2x38JxQgCQr5UVHyn+S7+TQ9oto-hTSh32tQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
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

>
> I already acked version 8, which AFAICS is identical to this version
> (for this patch at least).
>
> Not sure if you dropped my ack on purpose, but here have another one :)
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers

It was not removed intentionally, thanks for the re-ack :)

