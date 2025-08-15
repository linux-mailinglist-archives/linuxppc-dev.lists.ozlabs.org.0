Return-Path: <linuxppc-dev+bounces-11063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD32B28297
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 17:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3QR74X6Qz3chF;
	Sat, 16 Aug 2025 01:05:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755270355;
	cv=none; b=bc53f5IxZvdR/QwpkwNf27tZrlTm16Q3h7Pyw5PTWCTz7ofV0Z92KzN4GRbFYVN4aB6KPRDViPGK5wjuIaXc2HGQ9iJhA9L9UaW7wq4Qo9Uf/3WTHmqZMiiC0GbK4ayV/rJl1OyjE+v45GnUndIxlU1omPHRHquiedcDZ53Tpa/zNm7kOjhIbB5DE1N++mwDkGV/wbQRlwy6A9yV9vPt3lj/riKl1Py/TckLB1sCFf5YM7d6YI6NiuSPEjsal8Zpj/UDNcnitFKvgonXf6lNQPeNVed/aoofeW/nT6OudJLNnwrYSI/c4PYXKvDW51/fgRt9XzH7yujvByYuVi8IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755270355; c=relaxed/relaxed;
	bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LYnZInHPloxHxE3+a9vMlbMEAYAFgPjdv9eGXf/dfkktuE+BPmVzJb3lekaw4rXH8+adNxfKUoLGtP4fTUV2bAXkFLD8kd5LSGa1sob4g5z9JkU+XjrdHV25ZXlAS5IMAtGsdkIP2BeeeoLRTx30c6KAHPqgh4mH6x5XqXspz4WsvQF/M06yDk//d8xeusKbZk1Cn+1A+QnUbzxV6dxPiK9CSbMS/0HPC8fKSoAkIMvfxPz17EizzPrvA0qVad9V+dRZQhBvvtMNBREeFoulrzN6C25u96W1aX1FPx3lwMAlxHS8d+0FI6K3t0dIuqskZc/I3eweF4knzuw7S3sPWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PZA0iC1T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=PZA0iC1T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3QR61yxgz3cgy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 01:05:52 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2e618a98so1632952b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 08:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=PZA0iC1Ttwgaxwv/bYc5QwcUFf9rGH8i7wclSeRqsILFiP4a3b7CmLS+lZRPQLqiiN
         M1mxCKRaoyJ1rZMpbOSneva7zuYh7JicTeWgGG/Il4uKDMUsP+N+gBpBPhdJ3iDll+HV
         xFBoYUusqHV17lvK/oQGPNN6VVdfrWis2WWiH0iTsXFvhHYXGsWoFAoTR49sFdRn7a4z
         oKMzxqFbaZFmSPTKGI+9JLVto5fDugRmgM7U+6qQ/HlqkXxHjRugjUE3gqAUQhjWF30F
         He1SU+UgHCDKj+cQzFvK54QeyL0dTDSglnapFNBNPV1WB57ql62LFd1hUKNMDoArCEBS
         i0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=DR8IcqnOaSMdeDVWHmy0ikF+3q/+soZxPUkL+A5p+25EpBBFEb/xUwrU+6A74MHFfV
         93/JhDxveSX9nDkPZnsEbi0UpmVkcLlpiNA8MsoZA0wcBXEssGWip+Dfj0xijFJVvrm4
         PSdpsoYhsTHD4gR5BCfuW0juRrNvUsX+jHJpEkB9UVlDREX5sxtGJdcBUdSnXWPPDROz
         sPJe5xxyd2FHZYXMjNewFtU6dgVlVs1QshytC+uaEyReSfE01JC35q1rsQOMC+U1yqtk
         is8dQUypU67+qcTb2fLR77ReT/mZC9Nxz1L0ndWA7fc4IWngUxyHSkD5eDVmZUeIbLVW
         f/VA==
X-Forwarded-Encrypted: i=1; AJvYcCXICZKeubI9NTnDF0NIEaV2jw1v1BMbEdCKHnj+P7TGRqwAFIojuwKlmLzPkFcXiNmF7YAWCmZH063ml3s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YweXh7nkC8Z0RnP/TvgEKfOdRmob8uIP2u203+7lgrKHccfesUW
	7gsuHt3Gw8hY0j+xAORZFpEHsL3UCXEnNGS8msdWaSLSwPX9jP6JP88hTR7fNnc3AFE=
X-Gm-Gg: ASbGncsBQeESR9e7M88PJnQfy4bLKyeysKcea4YZA8dZIv6mnGbogbXLokA2kUBsjpK
	cOf8MRHbAFEZem1phVuR55YqhKpa9fIJOTKHi2Vlip/9ORRkdZQWFN+Cu//UgHXAlDbnGVU8zbM
	cCZIQ1NwijnxUfxkd+04TyVbxunK/KoXxT2z0rLGoG7XIr17DQZ6I8kkk4/xbHQze3ITZFklMvv
	M7+5fW4HTPApCPVpaomsrpvwtz+31XjpmvGbuhCLI2eYGdit6R4FP/Nn/Or/o2vlxrAReng1YBv
	3I620LqC78Z26kELCbbcDPus/1NxBQUMCJ2azqAl2it07wMxaZ4eQ+rzEXY9c09xjVcc5LVhJhk
	yFMNa771wGqRx6NSWDfWTq3S6ip4qNVPcSFg=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject:     Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
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
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
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

On Mon, 11 Aug 2025 22:44:19 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> These constants are useful for cross-platform userspace, for example to
> process ELF files during kernel cross-compilation.
>
> Move them from the kernel-private architecture-specific header to the UAPI.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/include/uapi/asm/elf.h | 66 ---------------------------------------
>  include/uapi/linux/elf-r.h        | 66 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm going to assume you want to take these all together though some 
other tree, thanks!

