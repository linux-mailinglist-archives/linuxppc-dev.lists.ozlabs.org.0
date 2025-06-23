Return-Path: <linuxppc-dev+bounces-9667-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E1AE57F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 01:24:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bR40G1SWtz2yf3;
	Tue, 24 Jun 2025 09:23:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750721038;
	cv=none; b=O/f4fkCaWK0ScPEvT2Rs9kFIM96vrCeu/eKrEizRVWv4aprfdvWska7QwWeD5PVWRsPapNIDuuLKdLcoHSydlAtLLDgrkgOXoK/+9At4HDqVyVSNGtOmcgsmZMAu6GKR+wT+wl2+0R6uR/940Pemz7XJUbLwTLERcI4PL7WkCnPegDPVQAnOf7W9Q2q619Y4G3N7cUxKW+45QSeP9CUMfaRsih6kDGMstLcJ0wySYSYPJeOq+83UbHm+DRoJVbyhcxPBjBJ5KL6FR9JQQFewmgxLN2+wbsG0tHWE2A2VHRq2dDpGlCYsyhACWIFPYFwsg/ezVIXYCZdQVxsNaWSAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750721038; c=relaxed/relaxed;
	bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=FiZvzNYan/v8lGbEXqpZ14AbYrn1o2z0YNgHcCJoK9XLl5VeZQ31GQekY63Uw7o5rfKsWQV7E7fxnPUgT4HFtNCw0du9YQfYB6LVMUGcfH42UU7e+MLfLPKbeWCOJ4OrR7c08ZKtv+M21SxMA5mR/iTk5nnyUjgsvB3VijYOaNj4v0z/BDrIcXK8KqqktNVVOwG6EkiFAzqzy8OXjjQ9/ivJkOGRDYrduzPyhar6LDoe+DQ7u1vsvnQfpOJzCbBSH5nJ6HDpkgs2TLMwnrv1aV0pPoRVWEqJeiUiMYhyWx/E8OBHV4o4shg5WMMS9Dz4tMBKczzQOnmArPATweFqAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=h3MsH5x+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=h3MsH5x+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bR40D6pfgz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 09:23:55 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-749068b9b63so2496168b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 16:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750721033; x=1751325833; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=h3MsH5x+8StLeRD5VBQZ76mWSWnbomkT1E1YL1Ud7UAeEws8pwfyNlqs6S1DhU7eLQ
         oJjNEcxtiw77XVJvKCCEMeefHNDkRtNgSmeuuiM4CaRkZKUcMu94oXBD+zpImQCHSfTW
         LeJW62AnbXOEqdPix+nZbNknIuO8Zhl2YRbKXJTkuU+scldltNlSk6r/kNV2Mc+NX9Ux
         k5mbdDG823T2mZ4t9nOS5VTBSOJkFwhpjr13wAHacs/FSErIZL15/F4dD4V0EqsiARYa
         lqSznA3g+kBbsiJv0XJZOyHeEPXAMPsj1qiIuCxsQPKdlYhFZWCtG3TR2BdxdgyLDKKw
         sZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721033; x=1751325833;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgHNU976VfrOwOD3ulvb2vI7O/PDlbsrK2gzKqrmtPs=;
        b=P7sjPXyNCoFhjES1zfq3IOFUS7LR+/uCwJyXfqYSUwk9QqyrtnAJnawGxTLONT8vF2
         Mound8NobDmgsqwRfi/+KZ4H4gSj35oWHVci25019DDmViwhUOJBxtLToDmB8rIKfbEV
         L5TqUDLrK0uIcOCM7ZLxsQLw4oY0DpVhNUwQhvV5RQ7yWkiB/6v8aimHGbpu2yhcbM8K
         2dH7w2tKtbxUbiGvUQnrGDnm9+fiiWRNN6fF8QCSDrKtkHIClljdPJxqB4hq/JlriDs6
         dx9QWOdAfM2oJcCEoNruknHmdjOXBVsFB94kONA9wEbykZZ8SHini3+tiRcJR1YYfi66
         zzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc+XlG5Zjz7jTzJl96KVmNatn3gnm8KqljQCg0JWDCYp5IClmRNrTBDhVNnaGYTm7Vilv4lnZ9OWU4E3E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzZczKDqGob+4Z+9xhV9b9g8LersdqC364qqq1aZpicV5EBT9Y
	aWGiel0L3h3ytbG56yPAf6dQEK1b7DX/Yaa8X3onJAoxBeCqZDgO6qwJageTKlES1rM=
X-Gm-Gg: ASbGncv8LMY0082aTeigrb6IzSL0B4PP7aa1NBgdhFRBr9+YONBwbn2/qxmkVtkoQaM
	3rVONWJmNuLFr/9Hdbbhmkb7SfJX8RbanALcuyuWfvSrRAjudd5ie1CrESnRdIz5fhH5BORa7A1
	/ZxBlmZ8T7uJo+STpLLMQgAJJTHfz0rEkfCLkx4Orz8+iz/buacZs+alGrndLiy1YiGjErSLSCP
	kAv8cOMESoddUwSsN1e/AGlyZmbVzhcNpy/d3II4mTiGQdEP3Q84PhzzUtQpi2ixTCwusYiJT6b
	q5xwFvVsAueP9LhcJ9eEOniQqNjOurFyEtqU3KMeiNgeqwfe7kUokIMp8+ca
X-Google-Smtp-Source: AGHT+IGv2SJju6xgRevma8Cx/i6GeIJiS1WAChIRaAqec6j+z8o+1u/uy+Lb1YfHwJThHoUvyYrxYQ==
X-Received: by 2002:a05:6a00:3cd4:b0:748:e38d:fecc with SMTP id d2e1a72fcca58-7490d71c76amr16954440b3a.22.1750721033150;
        Mon, 23 Jun 2025 16:23:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749b5e211d1sm243166b3a.44.2025.06.23.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:23:52 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:23:50 PDT (-0700)
Subject:     Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
In-Reply-To: <20250619191908.134235-6-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Jason@zx2c4.com,
  Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  sparclinux@vger.kernel.org, x86@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
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

On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
>
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
>
> This is just a preparatory commit, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later commits will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/lib/Makefile                                         | 1 -
>  lib/crypto/Kconfig                                              | 2 +-
>  lib/crypto/Makefile                                             | 1 +
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
>  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
>  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
>  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
>  9 files changed, 2 insertions(+), 2 deletions(-)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
>  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

I'm assuming you want to keep these all together.

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!

