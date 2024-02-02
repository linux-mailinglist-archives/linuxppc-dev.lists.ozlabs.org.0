Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DD847391
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 16:43:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xUyX0uRz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRKmZ70Shz3cLV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 02:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xUyX0uRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRKlm57vNz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 02:42:26 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a271a28aeb4so331195066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Feb 2024 07:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706888540; x=1707493340; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=xUyX0uRzxwRnh7H9TiplXnNAWkmw5jFjvTQnhfhZOBY2NGIC0sBVc27Iu4znppeqXJ
         lE/e3u5oHFzsKBrGF/ONVdy3xSBwvcD8ExLNMU3AGSYo5PzW7KLb7YC1PbM9U+wc1Ztz
         8f6agTgB/+5Jul0KuG66scRbW2Ooa7c0w70DszzwPzjs4PXrEEGcSC2XzznGKc5Tx5cX
         r+SLk3iG+ikzG1ccEeHuEVxOv2ZCdhvIiuCjC/5S6+3ob8n1dgZVQ+QgYS9vzKitoll5
         UbaFad0UWtmmEWBH/ZtMvzOa88D4ooVW7V/RyMz0uj/ZIsdNkHCwihXXCoR2gxfkcDQM
         lP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888540; x=1707493340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kogXmKbjRAlSmOtOOnfMNwgduTqXGjDmhtreItP19dw=;
        b=ickpnb2/AeZUM1vQhcl0FYH4S45bK9QovrlP9ZnHnajln87B5jLV0MEziir/zQ8BMJ
         aXhIAiuJPSjY3EZ4gZJR7llMkYLipTFhiTqAXcbuN0dca/x9oB23d1ckuQ8o9WazbNFD
         RlDIpOl4q4X14eCiZgvq5LetZuJUjJeR7uaknYM5DnldAa6QyM/GPqzdw5YdCCMfXPW+
         qOEfbL8azacLruC5/HibdpBM8ru86pIPJdL5HgrDgCw5JnlPdVrqzIsfYGXs1IVu36gI
         bdh537ZjE19d4P/wx3n+iEzg8maZM7s0DqpqlvFMKskZIb/tcxMJMNEBiz/2TbFFboOO
         kUzg==
X-Gm-Message-State: AOJu0Yx4Op/5iX3dSJFq/4+V/yR7tFiXgKtZnBqAQpsGBLD/BKilZwlU
	7SKBalG4OtlaI/nMwHpJDkL2sBhvE44NJFHcVQ/mrPC7ynnB2S/TET/Rydii9zLYqPuQAsWsCv7
	u+5oPC5jCchxc1kUWvnhz5Cfd/ygWmFh+SZofHQ==
X-Google-Smtp-Source: AGHT+IH/zecNEC28nmVGlGmSbLynz6gk5o5sKPfDBpuJdaR6b+rS66s9/R0EOFKWMVOPLIAlSXsBwV7AsTvhcGsm6n0=
X-Received: by 2002:a17:906:538f:b0:a31:8ca6:dbb0 with SMTP id
 g15-20020a170906538f00b00a318ca6dbb0mr1676412ejo.16.1706888540289; Fri, 02
 Feb 2024 07:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com> <Zbuy1E7mz9Oui1Dl@andrea>
In-Reply-To: <Zbuy1E7mz9Oui1Dl@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 2 Feb 2024 16:42:09 +0100
Message-ID: <CAHVXubgw0PEZMhFmjA0cAFQ2+_JOYjVfk41qRC9TFdSJtej++w@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive sfence.vma
 for new userspace mappings with Svvptc
To: Andrea Parri <parri.andrea@gmail.com>
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrea,

On Thu, Feb 1, 2024 at 4:03=E2=80=AFPM Andrea Parri <parri.andrea@gmail.com=
> wrote:
>
> On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> > The preventive sfence.vma were emitted because new mappings must be mad=
e
> > visible to the page table walker but Svvptc guarantees that xRET act as
> > a fence, so no need to sfence.vma for the uarchs that implement this
> > extension.
>
> AFAIU, your first submission shows that you don't need that xRET property=
.
> Similarly for other archs.  What was rationale behind this Svvptc change?

Actually, the ARC has just changed its mind and removed this new
behaviour from the Svvptc extension, so we will take some gratuitous
page faults (but that should be outliners), which makes riscv similar
to x86 and arm64.

>
>
> > This allows to drastically reduce the number of sfence.vma emitted:
> >
> > * Ubuntu boot to login:
> > Before: ~630k sfence.vma
> > After:  ~200k sfence.vma
> >
> > * ltp - mmapstress01
> > Before: ~45k
> > After:  ~6.3k
> >
> > * lmbench - lat_pagefault
> > Before: ~665k
> > After:   832 (!)
> >
> > * lmbench - lat_mmap
> > Before: ~546k
> > After:   718 (!)
>
> This Svvptc seems to move/add the "burden" of the synchronization to xRET=
:
> Perhaps integrate the above counts w/ the perf gains in the cover letter?

Yes, I'll copy that to the cover letter.

Thanks for your interest!

Alex

>
>   Andrea
