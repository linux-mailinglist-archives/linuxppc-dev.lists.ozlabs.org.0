Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9C28CB2AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 19:16:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tltR7SGT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkLYb6GBbz3gHm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tltR7SGT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkLXs0Cx5z3g11
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 03:10:19 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-34d8d11a523so2295692f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 10:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716311407; x=1716916207; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuK1GFvDv/XOLzeFBZqPy2BBKvmQtzuGFjz04oNkQG8=;
        b=tltR7SGT3RQjhv3k37viEOpP6G+cyVmsPw2BA5nqf1IZZ4SoKbGwwbOQiNuXLlbh75
         Uq+8ItmHOZpnS0OTDw0w2kDPXsXyIz+B6qcVd2EpQczyaxw7YeBUEOG66C3OEPGzjNAg
         0WTi19D5hd5LdKf2Kr+O54XEttONKwdQoG0W2AWZ4lgc2R4HNnEGkKtSUOfIsO13BCef
         rMfqWIczqEIrVk7mEe5DhBsX64x5qadhDqjMnvNbWvnxuzyPADlOgNwSOVhjDsLSSCnP
         /ZU6Ac9M1Rj8XxtsL72RoNu6p3BBJhfbFYEktC8iYohJIVIkLzckofx9MukgFwlaL3fQ
         9QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311407; x=1716916207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuK1GFvDv/XOLzeFBZqPy2BBKvmQtzuGFjz04oNkQG8=;
        b=Nqjsn/JUIbscQsSGUn6rjnLqweLNlZ7+w+7k+Mkkw0A163xkyRS3IKogdUnY5a9py6
         AmI6yoZ1X5qp1KPWlmtSywsPM3d3HWuI4Z+H7daPhm0hxkeR3ejeIcbSwpVsGJdWGStL
         RW44Y2apR9ClhUoVz1cJPl9p15L/HNpVDP4ZuYwnXMyJ0aFi+eIpKHaP/kyB3ihCkY+6
         T3mqtCeVmm1X/WKI1DcNcb9jlha0zxe9d3w5YiasbbvH0PHOL8dLllRs0Ntq0+MXhJCP
         WaPshfHU1d1ak7OriJX4N8bISypma77/tEgEEAidPdrsi65+TDMm/Id3/YS30y73/Z+N
         NVhQ==
X-Gm-Message-State: AOJu0YzxYkcLFx16SNNYkKQ7RHS00YZV+WSuKXU9D6N3mRP9E8r47hqA
	HbQXgCwiapfFzv/tni3tJutXDN/V+slTKsokX9DWzV+aCc0FS0dRoIiqrFK9xDsbq75f0CfY98c
	5ZgUJG1w5+VVnXQsrb7w29Fq6wbUoVtVJy0iI
X-Google-Smtp-Source: AGHT+IFxpMH1HCZGasabEUN+YSFCEKr/yIUVyx+8vhxEVNOIW/01AjQNJqwe0Xe0xifVDCfueONrimJvjZ29r+aHyxg=
X-Received: by 2002:a5d:6646:0:b0:34c:e2f:ceeb with SMTP id
 ffacd0b85a97d-3504a7364e2mr25555214f8f.17.1716311407039; Tue, 21 May 2024
 10:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240521123919.245886-1-mpe@ellerman.id.au>
In-Reply-To: <20240521123919.245886-1-mpe@ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 May 2024 10:09:51 -0700
Message-ID: <CAKwvOdm0_dAvQtuJXWfSCwh+2Jy=79DyjG+tKp9NGv9tunwj1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/uaccess: Fix build errors seen with GCC 14
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linkw@gcc.gnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2024 at 5:39=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Building ppc64le_defconfig with GCC 14 fails with assembler errors:
>
>     CC      fs/readdir.o
>   /tmp/ccdQn0mD.s: Assembler messages:
>   /tmp/ccdQn0mD.s:212: Error: operand out of domain (18 is not a multiple=
 of 4)
>   /tmp/ccdQn0mD.s:226: Error: operand out of domain (18 is not a multiple=
 of 4)
>   ... [6 lines]
>   /tmp/ccdQn0mD.s:1699: Error: operand out of domain (18 is not a multipl=
e of 4)
>
> A snippet of the asm shows:
>
>   # ../fs/readdir.c:210:         unsafe_copy_dirent_name(dirent->d_name, =
name, namlen, efault_end);
>          ld 9,0(29)       # MEM[(u64 *)name_38(D) + _88 * 1], MEM[(u64 *)=
name_38(D) + _88 * 1]
>   # 210 "../fs/readdir.c" 1
>          1:      std 9,18(8)     # put_user       # *__pus_addr_52, MEM[(=
u64 *)name_38(D) + _88 * 1]
>
> The 'std' instruction requires a 4-byte aligned displacement because
> it is a DS-form instruction, and as the assembler says, 18 is not a
> multiple of 4.
>
> The fix is to change the constraint on the memory operand to put_user(),
> from "m" which is a general memory reference to "YZ".
>
> The "Z" constraint is documented in the GCC manual PowerPC machine
> constraints, and specifies a "memory operand accessed with indexed or
> indirect addressing". "Y" is not documented in the manual but specifies
> a "memory operand for a DS-form instruction". Using both allows the
> compiler to generate a DS-form "std" or X-form "stdx" as appropriate.
>
> The change has to be conditional on CONFIG_PPC_KERNEL_PREFIXED because
> the "Y" constraint does not guarantee 4-byte alignment when prefixed
> instructions are enabled.
>
> Unfortunately clang doesn't support the "Y" constraint so that has to be
> behind an ifdef.

Filed: https://github.com/llvm/llvm-project/issues/92939

--=20
Thanks,
~Nick Desaulniers
