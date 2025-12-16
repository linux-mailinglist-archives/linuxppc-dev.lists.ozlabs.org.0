Return-Path: <linuxppc-dev+bounces-14792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB62CC192A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 09:31:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVqrj14tnz2yDk;
	Tue, 16 Dec 2025 19:31:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765873860;
	cv=none; b=FloZFu515nVKH5+rgWjzX7W0XLmV8x/sH2iYf7Ey4KqrXECNcJnRVF31Vh2TiVT8kNjUAd81AiRTBrVR/uxvN7hGT73VATVPY6z4W2L+pInnB94DqvS35nodqAKG/Wnda0kOfnW002q4yA+4Jekmt6wtpevgZzHVDt/5HhW96sEgqIylEKasNzb245CRgNnpIg4/whcZPweaLGqpFCE0SwdqSTjhLBJJTmPaS2FKZK2flbfWCl8zbdZKY2lCDsqXFdRCQCjWTStPlGsDWj7NODwLL/N2zVv1KPI4qlYpwtbHFAqENKsCFTm5bETpXLWVIf+QbtGWvAg0HBsVcXakYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765873860; c=relaxed/relaxed;
	bh=qVHcaWvZPRVPjqanJCMnEXhG7It7GiDNl8ZTQsUcn6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZzt0PF3AqrEu0A1LOtiSXZldOpVfIG6BEiQAsh7MVeku+34Hvmj+n3WuPxyqFAtfyUzXbI6zF8EVkHOOUy+XLeul2NKrblciTrxL9QpQ+g462GL+8HGLogn7eq43xxsrELmMw5PF4/NJldkev4gCzdx6IvXZ37AIIGKmKQPbXes5zv3cxXUmyGYQksZteh+aBETca+euanovUH8uIoOgkUwoHlPb4R2zc+V0KQObFoXfE+a9lff/0oTBACaiEQol+xWWc6f5oK2oP54Q+eRPdVRWqarHwxDa0jyPu/nnCQ2g1dieUeuVqAmidK4RZy5NSD6nG2JOjfIr/M+Hpg4Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R46judFn; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R46judFn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVqrh16Sqz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 19:31:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3311D43B58
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 08:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D26C19422
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765873858;
	bh=rdAB3rTsM2kPBbfJpGSxoybGGY6bsi0WVH/CDiWPH48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R46judFncVma2UFkYNjNbr5TdEW5KwY37YfDgTTMBud2rQmcJUAnmBnMrDf1is8DC
	 YT+TBjs7FKekCEF8JOh9ldb5XizTh/Tj/w9kwNdx5zUs1WdQZ+BExOLO79AssVyF51
	 ZPBMNIh0rsAt9wmBuHIn/81Yuk4D+z//KNCdxmOw7rd/oEoENSJCBpvEKa68Nh7FJJ
	 1ZZYbmAt/IClCuefumIVBl6tRsiIZBXzWi1PyJJwNttKROJkSk3+9BLLgDLBbJVa7O
	 hMPoh+ejhyJzBuvUcsz2E2Tt89BPr8TmCttIy5UOPOFiSPkyKk3DQX5T61SCdhvi6F
	 s2EPkv/G0k1Fg==
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so628275a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 00:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa/DfHeJtFXV5IXT/TDbs4HYgiqIH5+kXzlwK2qaECr20sajZBZ4FQgVnEbFHPoxq4IZxrGl2mJSypigQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyRiO2U70DIL/y/GOSAB/rI8bqTF9Omf+4Np9YTYb0H1E/jkNU
	Hi1Q7xX5vJx1UG0LGKLlYXkeylqA93/RuN7XhLaCuoQnsAx1XXIq+/VEPgmYseKQZId5WNMFjfw
	okf70hY6e1gXxyBgQjqhqUXH6ySBdzLw=
X-Google-Smtp-Source: AGHT+IEZiIoxZ4ahkNk0/4l0GnF/w4QftZY+MiBqqc58ZUWKxJID5qTsh8sHraWFLh9as/x1Z9qBIWeJzeWk9xWW63w=
X-Received: by 2002:a17:90b:35c8:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-34abd6cc48fmr9458424a91.5.1765873857654; Tue, 16 Dec 2025
 00:30:57 -0800 (PST)
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
References: <20251215163520.1144179-1-ryan.roberts@arm.com>
 <20251215163520.1144179-4-ryan.roberts@arm.com> <202512160024.B688A8D0@keescook>
In-Reply-To: <202512160024.B688A8D0@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 09:30:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
X-Gm-Features: AQt7F2qEPqn2Fyl42wG6ot8Vul4tzgiSNEtR5kH_hcxqBXNDjzmNBXOTKIXUk1o
Message-ID: <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across arches
To: Kees Cook <kees@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 16 Dec 2025 at 09:27, Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Dec 15, 2025 at 04:35:17PM +0000, Ryan Roberts wrote:
> > [...]
> > @@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >  #define KSTACK_OFFSET_MAX(x) ((x) & 0b1111111100)
> >  #endif
> >
> > +DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
> > +
> > +static __always_inline u32 get_kstack_offset(void)
> > +{
> > +     struct rnd_state *state;
> > +     u32 rnd;
> > +
> > +     state = &get_cpu_var(kstack_rnd_state);
> > +     rnd = prandom_u32_state(state);
> > +     put_cpu_var(kstack_rnd_state);
> > +
> > +     return rnd;
> > +}
> > [...]
> > -static inline void random_kstack_task_init(struct task_struct *tsk)
> > +static int random_kstack_init(void)
> >  {
> > -     tsk->kstack_offset = 0;
> > +     prandom_seed_full_state(&kstack_rnd_state);
> > +     return 0;
> >  }
> > +
> > +late_initcall(random_kstack_init);
>
> Doesn't this need to be run for every CPU? (And how does hotplug work
> for such things?) And doesn't it need a get_cpu_var?
>


 prandom_seed_full_state() takes a 'struct rnd_state __percpu
*pcpu_state', and performs the initialization for all possible CPUs.

