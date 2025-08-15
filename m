Return-Path: <linuxppc-dev+bounces-11065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0BB282A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 17:07:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3QT72Tbwz3chK;
	Sat, 16 Aug 2025 01:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755270459;
	cv=none; b=nFwYT4jNUJtz3fRfWs32hY/zh1M1hVo72In+PZtjFd3Vw9yVhVQox/RZR43ZA1bHXJpdUmq/UmTZHK/rFSpGD+3ZOYwa8O7EYszYm9A6PngX1JhSrzB0UIBqwhHWyK/0/ySKWSZDzW2e2/5f7Z9ejy6LsVzuR4WjiJzspbVonU9/tiqyvq8jZ5AbySLkHRDe5FMD7IpQW7CgZEGGQ0Rb8pp4X5hgVO5qvEhUe3TghQdBpIOlOld+TWF8FrE98C/wDslNq0ZdVGD68GDbWSbZtmshIOfkMacL6U7sm5GF4X5XMr5vdPjXdlnC0wUCbd4VrbNFR9e3MIndSa2aFAZm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755270459; c=relaxed/relaxed;
	bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=lv8VynjLTMwAurN/gImCchQ1MTZzZFMPEdOhPKAKaLlACpVyzL3ecGz0CLrvcw8ZugLksr5Fh5CP9j9bE1U7YMqwIWRQZPP521XvLVZsO8d3pg+QUycDFtCnyuKPcm2k7Sen0BXkXlhcb2Ak3x45aiI67RIkJ2FIa2fM28GiEI0ooYLlmk9ZxMOoo+SLnzj0fDGdtNKmc9kaZJVg4a6wnAET+ao1FQ7ub3FANlFnZYqGgqqVIvnSDQhqmG7vUXA7r38EJfF1wsG30Zx89DU/Mg0ngKPWr3uu/KIYBuwusmMtjDEaZcpS7FLYO0pgvpyTNYnb4u6q4R9wEbY6zXOTJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=H34PI8b1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=H34PI8b1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3QT262H7z3cgy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 01:07:34 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so2103560b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270452; x=1755875252; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=H34PI8b1p7T6bbDWDNm2YLVqQK4+uOM8nnIiUuzJTmvCiDeeBy8Xi8WOgA/AC2YxG+
         o17AC+ohjERp46JIYNyOeTKwNj/IB2lDuAmve0cSIXpDZtk5i7AJzRBNRQRgKhB0IoOc
         OKkgBn/6aizQi6uyxMN8glFKLq5J87thiUjqG+YHPLUYRiXoPHsT3vtfzRt5QTiZ9BHS
         U1KJbvXD0CHtbzMXe+9GwD+wgjiCD3wgRiqDUZez9cBDBbxCrEGW6W6Pb1Q3LKF1xHSE
         a2VfZbe1peQSQM7+KIyvpBxHtPdVo6EpPSyMuhFxxVIWThXRFD0jXAHWiU4ITnPcUsdP
         Mj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270452; x=1755875252;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHLPRMwsFUXklJ+HOrV/DsMAdiggx2WSG2UfKCJiulY=;
        b=MKWflUREDIu9mrttHd5T2Y6CmLd8q6b5y5SuvKHDbs2nwV1lgz7cAac6RE5JAZtqEe
         cxdLW3EqKW44ERzWH/DsdnObLicPupYeLnihg4zIQv756n+0k3ostl7iwKiiGWgcJr7c
         Iki4EybhBeQ3iBu2yPq1OyF58Nlo8xIrOGiWDZyX/YF+GGEhSzlX98eG84V/5BMbV4kM
         eMy9tzBlSZr3XNNy+vOKGAsbQN/O+jQSAXRH3IfYwD3i0m1tpJ/hQcOzEoVJHUNaDfSq
         I+0ku5X/Ra9cUD3dD9qMyWpxEO1rxYa+a2cVamAVOri8RLh3ONpgJIrCXJ0K8x+crakf
         GEiw==
X-Forwarded-Encrypted: i=1; AJvYcCWd7mEb7ZGG0gYw5xOU87NZLh1eZTQN1iKN6ZZYr1nS/NMpxUpq+UOfcuOwjHYvL6d7YprQLBT8VF+yAwM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1b0FM6KgMeaXH7wRlI1VOqdd+tTeYR0Sv73bpNRW+ByPZkHTy
	qS+I00ZtNfbTXnqt5amib/M5oQs1+QdLhjtalpjYuIbtEICiERzHTMFVvfzabvGzqHg=
X-Gm-Gg: ASbGnct0RaSGI254LnEb6H6GKlwiEJak0SPKhVR6DIhIcg4O8jVvDZ26Zf0QAz98VQE
	hcnt8mIta+rSzMGCnUNKDbneBXqbd+03Ux3XJDl8AGg2mgNbOaOensOzDFz5uqZOH3mSuGxWGj/
	JUaB7CCb5C61Q1/fDyBeVW7Yxm3AxuMB4fNV0/Hj7kZdZ1HIBe2st0uFZtnKtjApo65ihn6jXbW
	UL/LAa1R/HuUdTFKkROEuMGhg5B6NHGYmeRnqwlY9A0HZyEV+Cxp9jMMP9apJgoWmujA/dT4O/k
	1ql9oQqBtbWi4Jcx+rbzuThhEyLILoC8nTCHdX+oXCS87ZGMrArl1gCjjsSPjIzuqF9hUKo3WXn
	l4pio0MUvBnv83H4LX7CI+4n1Hh6GD52J6sQ=
X-Google-Smtp-Source: AGHT+IHmxnV+YR9cR/LeaPBJErhvHjNkppxMDemXEcOX3MCe4Sp9OWex1hLOxvkMk2wkz7dST8S4eg==
X-Received: by 2002:a05:6a00:4f96:b0:769:a6a2:fe1e with SMTP id d2e1a72fcca58-76e447e3389mr3104455b3a.11.1755270452302;
        Fri, 15 Aug 2025 08:07:32 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-76e4558bf19sm1309791b3a.99.2025.08.15.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:31 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:06:56 PDT (-0700)
Subject:     Re: [PATCH v4 17/24] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
In-Reply-To: <20250812-vdso-absolute-reloc-v4-17-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-540E0EE0-A9CF-4EE3-9E71-969B40D29C50@Palmers-Mini.rwc.dabbelt.com>
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
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 11 Aug 2025 22:44:30 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All vDSO objects need the same treatment.
> To make changes to both the list of objects and the list of removed flags
> easier, introduce a helper variable.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 9ebb5e590f93a3228c451dca58e6d5cfbbc03ff7..c19c3c76f7c9f6b2f7523a59269de3b683656323 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,9 +49,10 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_getrandom.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> -CFLAGS_REMOVE_hwprobe.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
> +CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)
>
>  # Force dependency
>  $(obj)/vdso.o: $(obj)/vdso.so

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming you want to take this with the others.

