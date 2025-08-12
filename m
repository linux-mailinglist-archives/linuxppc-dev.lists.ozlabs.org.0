Return-Path: <linuxppc-dev+bounces-10858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22DB2254C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 13:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1THr2cxbz3dS9;
	Tue, 12 Aug 2025 21:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754996872;
	cv=none; b=RAMX8pCLshwJ2+JNuikb79Zyw2TssH7K6QHLwmXwSpla412/6EyxdzKLpc+qv612DjeQrjzrnM8Pnpxr5zW7R/91UMfwBGnb115wmA7xnC4A6ZHNX6HVmcwLc2zirabWg6vxU1xjdAtEo4sOr2nOEEX73ttzi+xNzLFyqbnx1fumKrpPLn3vAGNZXGNYdb3qcENfiXst7V/VZVe6XgL14MsxWD8Vw4bOrlFBd4OIUcSIeqAdB0zzUOeWMpdLuv4Ip95YdoysYz4TqESAE/A2ba2cXctVYS96qUdGQJN8Qi3KMVij9j7fv3buHQrMeuj6q/QZkg557T7xGFnBuCCOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754996872; c=relaxed/relaxed;
	bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Und4XCQFFgUZTkN0uZ96REjTyf84Cq9Os2l9ge7mS6byItfoO+G65eZfebS0nMuHgQ7nsfha4ze5K+GU5k9alAlzB/GJOzkNSLX90RJOQnxZ8KSqKEAo1STKvrfx4bvKpaSHHQtKjUwiGwVTAh8HlpJd/Wu2glYuVEF23CX/eTMHsb6jnI59nJovK5bZg8CmjiMikCxoAsiQbRrKLdGptjivBPvx83vZ1aVatFRaMGmyQYp/KsoxykUJSSJHv0lEh0WA6R5xRoXL4k5tavgZgmJCsaQk78kFcy29rcK+UtFzp3aj0XHhtgA2Coka4+aUYjmnm2hHwudUhQbf9tloGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0CuXm+5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q0CuXm+5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1THp6Qr5z3dRr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 21:07:50 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-24286ed4505so10303625ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 04:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754996867; x=1755601667; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=Q0CuXm+50XG9T0Kup1xoGQ1ruPlYLKdP4eHTZLqXYHJMgPqYnOvn+Xg2nBmPMrdJZG
         n27iBLErXCZVIjpkQKVGgFo1ulwRNoZZI9JDuU0KAfQN7Q0n0zDDsCtTASYRjWF2jV/G
         9jy/UFm4a8xnMLUVKTeWNK7rtk9xP3RvOaEZXGRthuOjqtVfpsDvy+rnQRPW+Qnd3c6W
         AA4K/VjnUGQXwT4wUUlixnLjYZgYlWbbKAe0wun2ESULcJnpH++XilJuyw1lZLanj27y
         3JHMD0WUe3Na2blbIpklYFPExR13+vROLA6903eJMCNzc+YWUXiSEG49cJQYhRTSaVYU
         eH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996867; x=1755601667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM1oIijYsTieBVXwDdbk88e2RvtyWnf8BqoF2nILFwk=;
        b=XJZwPuA1qhidOVF2l6Y8I6uvyAgwuZH/nw8cWV2rMaADxj2OiNNMAqRNwNAcwLQckk
         2lvfzI9Jv2tb2q0VqsWR0NWFmdCmecBuEXl9Pz1T7KhgZaNOqqTh3aDtSAiufbdUJtvY
         AxYrlWPLA1FXENWirAtd44IzO0RtdOwnwDJAmTFaQBxs4vd3qdyb0VUzNqSHY3z/NVhz
         Es0pcx1M7tmc09U5DKzR1Yz1UrHU5BWq5Jg97urqupB2OZFePXjgC8kJwv1DVD2w56Vi
         RK25c9yJ9ZY1p8xz95vaA8+mZofoIpP1ymgKJgm7rF+Zv6iQCQ/fqRiIoLv8fZAkzjRC
         bihA==
X-Forwarded-Encrypted: i=1; AJvYcCWhQfbO9sK7dLnjN7WZtxxZX8hn6WCLyK3YHRq6LNO1gxiaKfjuQvuDVSNdH4PpJDvt1S1jfoWuUNlAb1M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWvg5Q36c+4g34diPpmhSrsMQGtADMIdq/f4RFqa/jdE4sUdJy
	LlvpKsb0Bz90Usil91GfaCSzY/Dni0/m+vOA/Tf7l47LYaDQPD27Ygd3oKzB2o01zIWdTQ0lGWz
	+U7MIyRv1boDvT5E3Y9tqKc2lqE6gptk=
X-Gm-Gg: ASbGncuSRfZwXevZROnjqQQIeZfmJ+0yzRYQwXH4x1P+y0DirdSZXfyg7Zur+yJqYd1
	e1HXVUtNW68Q6bBxzNznq43syod2hscoDxR9y5eXql/uVCBfaRQ5wOwz6cJIgy6JczD+ODlsFo8
	UB6BN4mJG/Unqn1OvVqqdzU0MUuZehY3viuXdNmaLrHOY6Hbj1yGh9DZASvn6dFHE4gbIcIf12c
	J6ZGr/ck017CvJB8hI=
X-Google-Smtp-Source: AGHT+IGLTgav5Ly0pJQ7DxONlyuqSGpB75/R07ZLvB4KvAdVZt2KEevtP/u+Z9PPdrxzblYTwfgzUXYmCR2PQbfj+a0=
X-Received: by 2002:a17:903:1a70:b0:240:5c13:979a with SMTP id
 d9443c01a7336-24306da5537mr4831165ad.9.1754996867136; Tue, 12 Aug 2025
 04:07:47 -0700 (PDT)
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
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 13:07:34 +0200
X-Gm-Features: Ac12FXz75fv-5GwEH7lTNJ0yhooMj6nwQ9IaaKPBS7pSI2ZcZDdB8Ex-5Z7LxRg
Message-ID: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 12, 2025 at 7:44=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Kbuild and Rust folks: This contains custom definitions of hostprog
> bindgen and rust library commands.
> These are currently only defined inside the subsystem directory.
> Let me know if they should go into scripts/Makefile.host.

Glad to see more Rust host progs :)

Keeping them local may be a bit easier initially to land, I guess
(e.g. no docs), and then we can generalize when needed later.

By the way, for consistency with elsewhere, probably we want
`HOSTRUSTLIB` -> `HOSTRUSTC L`. Though I am thinking to remove the `L`
anyway since eventually a lot of code will be "lib".

Cheers,
Miguel

