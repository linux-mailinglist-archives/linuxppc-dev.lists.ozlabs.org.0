Return-Path: <linuxppc-dev+bounces-11064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B2B282A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 17:07:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3QT41QHTz3chX;
	Sat, 16 Aug 2025 01:07:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755270456;
	cv=none; b=DbufcYTMONTzaqKpA7/b/vhdMRoe5pi6JcNCgSzO7w5S5hVVH2YJg8cUwCk5sVsz+W5Nec91XgwKM3557Wo7gAfCwOSywJr/hV3okpioW0XDQ9Nl+1JgIIdNyddIHVXkiXpfJL25cn3dWIzK+/+qzz7VH3q/P3xD+rB7VaoM463C1hAQevv4jRTMNZG9QTPeZnyR69DmEh37PhQo3Yfm5XB7sk8X6E7QTLwABw8hRpOAg7fcdsQXXpn3v649H8dh+YFqfKcEKcpq5ns2yNrFkTAlYSzA85+uYFocsOr5KLY+KGFsSMXlzxID7h/X4Be7PP1Nbq8H4u7j0z5LVFlRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755270456; c=relaxed/relaxed;
	bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Aikwu7n24jCXrSOB/lwlTUBefaDXUBdw4AKTMYp0Yuh/j85menoTv2uECU9rcBt8dFNRz8/HKCEwMqTLvNb1D9+q3Z9mmdjaYRX0dGqs7aKrBqWwq0wh5HeLo1CmYLzHR+MrqXZ44oRD85IQAX5BUsVFvutph9FyYxb2hN5sIE2GD1ZP20DZEcZu7I/ZPdIurNZWojSCoRKBn0O6Arg8UxgR7MzzPzK1I2zhImjxQFtrtco48tVr+2iHDNqmYWFxSG7IG09nilYDvweumtoKkRxwSTgm+q+vlceg3wYUiNvhV10XGQGRqsMRxSHTmaBHGaNsVLyiENybnrIdf6ZakA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bhUUy9DE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bhUUy9DE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3QT34Hvbz3chK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 01:07:35 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e2e614b84so2125196b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270454; x=1755875254; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=bhUUy9DEJxkZtYxF+JFiNTHBcMpJ+jrVHQAQCb994g0Zk4PUehwZUgt9dqtwPEkJVM
         JyFHRC/5h97oPXxl6BdppC0ylI/4ac7v3yjXERLWZAKPGSFwBra6NRN1pGQAK0K2jk3y
         spj+7ir3hpjRuo+Dn4UaCeSvd3CRFvJJ3tgP5A/cGcMNZcBnY+izRT2FsnWcQVNd+IJl
         RPWmuMhExcZD/dLCfXw8s2jNrBEDMhPo5/JDYiajPJKLB06Aq3dYpiT/JZfBdJyvo1cz
         PXOfduz4d/kTfLsgjqZ1qw30NnKFCJwnuATIdajQYISeLfRyiSOzC//HMtnVEAMc4V4c
         FiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270454; x=1755875254;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=AAr/SAuMWGY9pWoJ2JQ7sHaDiNok3OH6gKb6PB1sh8xpWnJelqwo2DWyA+MOgoM3AT
         EcdGCTu90TuEBGB1pNun2hOQfkX4JIPPg4ZioMQ6OAj1Vx7aa39B/hDZ4DzDsjOVrUI3
         z5fptaSlAxxyLUdAHTby+dFty56PyDbw6oqENLadqd7sKPvjjJym2CripmcYxPYdQeqZ
         1CrDwPhkd2Jv9pIMvPTIyY4uBDqc1K0/BP6zRupyu+9M8B0tAM7CkRjisl+7nFyio+Zv
         8kAfixrK5nm6cBZDRkPtbe5qdBGX8Xq97LTk5zy67FAZpSphc7Shog6HQMtysSZ1lU2w
         UaBw==
X-Forwarded-Encrypted: i=1; AJvYcCXYt+2CBBSbFbbCN7rY+uq37W5mD/z5NFtQWv/3W3vGteIGP7On13s5ensnIrAlOwX6PdRGo0CnD4P1kdE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgsGlG158TetsGM+7V/aYq7mX+j4hPhMgmRTaqPXqXa+gq0wTe
	3lu/whC2KSrVSRyU8vWLycjRWGqVFHO0kONkCT3lqYBLdookBOJRRSs8K2wqaEWR5TY=
X-Gm-Gg: ASbGncsHSlgQNUrvSoay4+MMzNADMSBuo0V+gEYu49tbl4TogEpopf0BEig4kslFl3U
	8KIdJf3oobAN2T35i8vmO7e9I5qW/kQQ8dQFlnDgtH1vgvPVcRskd3NmGbJFOyEQ1yxftMBwbht
	TB3zHHYQpx39KwboX+7p49b/ISBgTldGssRfMWQHwyq2OEUWZon6LCmMrB/5d5G9KyerqMLDV8q
	SFxbmtGOIKBfENOtQCW6z4j2SmXRbUzxTIlEj+YFlbjlZx7PxgbeIqcGDl736IMqw2glwjMrbnd
	BtBTlGrAfQ9rZuF5i3yTMY5uRMS36LADZVO7zKVSctZdaoVvtcthuve8E5D4HQWS8rY4xKvNP8k
	Jugak9phSHCoIfd1NXke1mvy25YJrmkyJo9Q=
X-Google-Smtp-Source: AGHT+IGQbGMaqUCBVjgHpE03NJ6lUtJGuN0cfMPLFV18k27l43zYHixLrnt22lRnZXhrjts5z9io5w==
X-Received: by 2002:a05:6a20:1611:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-240d3039205mr3462386637.45.1755270453673;
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5e58d0sm1499710a12.23.2025.08.15.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:07:29 PDT (-0700)
Subject:     Re: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
In-Reply-To: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
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
Message-ID: <mhng-146EE95D-951E-41BB-898C-033437B27EA3@Palmers-Mini.rwc.dabbelt.com>
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

On Mon, 11 Aug 2025 22:44:31 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
>
> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
>
> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming this goes with the others.  Thanks!

