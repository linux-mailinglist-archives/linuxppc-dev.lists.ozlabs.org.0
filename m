Return-Path: <linuxppc-dev+bounces-13251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3881C04660
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 07:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctBNW5JCBz3bfQ;
	Fri, 24 Oct 2025 16:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761283915;
	cv=none; b=mknvmLKGyJt9A3yNte1L4tR3KTcfLGEnc8ogGlA+MVgYY/D6JyrnDLPL5DoF75ThvrsR8yPjZQwCyWr04pDiKjNIncjIlIQueaRSc/LFU6lz06X8cAqyQLqB14TnhbZSE3Vz9FV2oAEm42P/xAT1dN4z/oAJyB+gdAd0h12Gg+8GQlHoi5LgjvIL8o9tY/F1k0MwfkB3Twd97oi5niJSV07rMjRO+QdskCUzHej46Wo18xAOjgXmaFCgi+O/USfnwd2JbU5Yh/jiBc+WnFBZZgadIuOnFgcAZZM0s2ZFKw+KW/64oUrwzELyXKRzHQoVrKwuEH/+Q6yLURnwx9OxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761283915; c=relaxed/relaxed;
	bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzsaNDK099fSu6fP8RgIbEmOB9hOq+66dvEacvfXJHHf2N2jIchEO3joZH3UU62SS3JEUTUN76/EpfTw95/ZzVs0R2I3P/Z3WQ587excvVg3hrbzv4Uv3BUaZgPCCKOAwhmSLdlpp6kX/GHlgTuVWtUSrG5jAWuJrcRZpAD/AoHr/5chsSA00H+5EIQfOehCPql8EP0rq4vSOS6z+5EDN6Ff5EHOM/hQW0YHzg+hwSncPVp18/JxeLGrNa6cTkPU1dFo80jdvWlz8umMuSAwRvDO3Is1fDchvwEhsLXpu+h/1JePiqBiQiNzrDvdCQ9wf080e+A+HyQAnHgf7Ug3FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oGxiQinc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=kuniyu@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oGxiQinc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=kuniyu@google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctBNW04Cgz2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 16:31:54 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b6ceba7c97eso1510186a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 22:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761283913; x=1761888713; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=oGxiQinc0DRVw+S5Cj77HCpoZD89L30MfZI+pNQW0voiOPXTBkZw16g8PU1WV0sE40
         qJ7qjAJ0Ep7e57ZQCLfNoKKmfkKI9xHy7HQCqZwaV9jmFdjnPooSW2FrtBlFpbgmbm2U
         dleCpRNXyzxoJfPEzW9CEfTn5XtEluXwTEFKkmPAP2aBeG/9f1STmJLJsXwZzsUR2KDQ
         o3spgW12BgXkCETWyJiJUlzkW+xexpGge9PHBDheQwtrnMjawi0CJVa39nLjuXFSzL8V
         fug/HXYTArCQPL8aCKSl2UIu0favozSgNpVpyAooY5ILQGFt790EQO7MJCvpKPYIeaFk
         pYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283913; x=1761888713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=RmhPtOt0ICZdeyUGhhwJ5Yr7a+h8V8yyU3yvX7Gd+9di3+pZEgllhTFScercx3uYqz
         iNpBxoXatIC1HJvwq9RB6WtHl7PSi3nm8J0cxqCF7kGJHHyikkJj5sVeGoHNQdmReJxj
         /ecwWbAbB9jdxmkZZT3yTg1GvhEqHHMaKctnYq2glnV0AxoteUJ33QQo6mC+COpaKaUR
         8wuiDKeeobS1OdWdEDTmEZoJz1o0+Svm3+hV96PKFC97pHF1iaUAt+RdlqFY1nrxPr5R
         IG48YpnegO/+Xyeivx2IG1eTd/NgbHwjmbBUe8F1NUslC6nYsSS1K1bI+u9y9V69fTU1
         kStw==
X-Forwarded-Encrypted: i=1; AJvYcCX9xLybT4h5lYU4D2KfnxnIveqogVCXJlW9oJCLhn/quR8p5jAX/0/wEo5oNlsvtYFUuZHbmSTzocYz/VA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOGoVtlhDai4Gr+aer3Jp6wjjytFoCEikqIdIhMVaZDANJiLTo
	SIZSDZ3vHD223Z7ffSFToJLGVmiNjFYc3CEw/Ha8CilcoWuzVEuMsAEgBRteRfOcCEammAo6OEr
	4tTlnBtclcGTl+scT8jFK9rTDxFWyv2qJdwRJ22Tg
X-Gm-Gg: ASbGncuCNlPm8GsbYONINMxk6wn+NRjAUKa/RAvdubmA278Lz6naJt5mRH9VPPOsZp/
	BqchGA85o+z2v+uquw2IuD2ZT1F9SAqm1DCNeWASh0+HGv63BSPdE0Q/y6LTGbhhmrlcg1hYrO6
	SiK4CNc7+msXH/dUV8DbjmeLjjKMacNUJWPwQNtdczU9XWjkoJI36GcINK7qUjfwnuG7brHDUKV
	Je4Vg6qMoZN2k9XsNwwoPPSzVyBpdW+HL19oaigxNQNx1W1VUmohL95yiH1jO9zhRzcIeRJNozI
	ptwEM1rhV94nEh28Lyy1gZhJRA==
X-Google-Smtp-Source: AGHT+IF/VvU9VCEldtU8TlKdOOJKqinHd6plYVfP7jz1N/U0hWCfgU1KoVW9GCuTIIpcsB4YHkE/z7uj+DsUXzYb81k=
X-Received: by 2002:a17:902:f542:b0:24f:dbe7:73a2 with SMTP id
 d9443c01a7336-290ca121a7bmr368072235ad.31.1761283912454; Thu, 23 Oct 2025
 22:31:52 -0700 (PDT)
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
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
 <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com> <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <20251023092910.2ed9cf15@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 23 Oct 2025 22:31:41 -0700
X-Gm-Features: AS18NWAlIGQJ_wV8neCVFWBA2cf-w_Bdy_0uat0cNCw22R5tVWCPnuP-0EplywA
Message-ID: <CAAVpQUC=KH8iFOdMZfnuXdEMuCYuEgFxNvU93zgFNiGSU_tMLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 1:29=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 22 Oct 2025 19:37:27 -1000
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wro=
te:
> > >
> > > unsafe_put_user() can be used to save a stac/clac pair, but
> > > masked_user_access_begin() or user_access_begin() introduces
> > > an unnecessary address masking or access_ok().
> > >
> > > Add a low-level helper for such a use case.
> >
> > I really suspect that you cannot actually measure the cost of the
> > extra masking, and would be much happier if you just used a regular
> > "user_access_begin()" (perhaps the "user_write_access_begin()"
> > variant).
>
> Or wait for scoped_user_write_access() to get committed and then use that=
.

IIUC, scoped_user_write_access() is simply inlined to
masked_user_access_begin() or user_access_begin(), and this
is the case where I saw no improvement or even worse performance.

>
>         David
>
> >
> > The masking is very cheap - literally just a couple of ALU
> > instructions. And unless you can actually measure some real advantage
> > of avoiding it, let's not add another helper to this area.

Yes, it's only 3 instructions on x86_64, but by saving them
I saw better performance constantly.  Please see the numbers here.
https://lore.kernel.org/lkml/20251024051653.66329-1-kuniyu@google.com/


> >
> > We spent a fair amount of time undoing years of "__get_user()" and
> > "__put_user()" cases that didn't actually help, and sometimes only
> > made it hard to see where the actual user pointer validation was done.
> >
> >                Linus
> >
>

