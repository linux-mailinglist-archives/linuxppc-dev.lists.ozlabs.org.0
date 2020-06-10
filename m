Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9ED1F5E1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 00:07:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49j1M16SmDzDqkG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 08:07:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=forissier.org
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=jerome@forissier.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=forissier.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=forissier-org.20150623.gappssmtp.com
 header.i=@forissier-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aIOxarc2; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hpmX6WPkzDql5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 00:10:32 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id c3so2421409wru.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jDzQUCHqj4/VutT+HVFOwWkG8Uh4SllFoScBijUwQp0=;
 b=aIOxarc2FNcSmm/L8rU4tA90jHE+cz4t9kk7bpZtiaGSujg0xmMgMJBZOQOguIVse8
 5fwf59eWAX8VwcxLit4Fiq6/co0RMaLEiXbf3/NvfevHt89V9LKT8u2SMBaYKtT5zBDL
 ZenLzM2vCz5r2XgLVdx/jkzX5ZknqsPoX3IlA2uJ5B4spdDuXITgb18a8C7ewM0ZRAbt
 m2zCqTzHJR9g3c5U7LHRv2zpL+1wnCjZdNKuD8y2FDudOyomowKr6nPxnnq5m01ca4if
 lI8oqCmNOqsLrmEl58ICFzqmIxxePikNpipEUkrjd8S1lfZNAdFA57eAjun2I4cL63aE
 O8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jDzQUCHqj4/VutT+HVFOwWkG8Uh4SllFoScBijUwQp0=;
 b=bcehUqwEV0RPjr9gHC8WGMguIDhBuz9I+zF6gjK1ybHRMTGZhVWZjnoxQ1FVFk+vCZ
 RnMiPtnyOi5y8vhk6P82lT9ahdi+mDRJGcm6KYezycurIf+HtbkAIQMW+PZAfNl0EluD
 5UeFJ2VN1WFgedgGn4ZG/LXEozc765oEOL/D5op9M6wwU1GIN4ktoe2ZRmDTGDDo7Dbk
 /SLUdypQG2ZJyfURmBfIUu4RtQoVlSSw7ywuKp03RzB/G2O27fenLhxJrPXzWa5DI2LQ
 uPZUKj1HFPKUFptB5KrZ/IUqfhQhHjZvPaq6/y66gXYzhcJeBmp7ya5ASv43CTl+g6ki
 01OA==
X-Gm-Message-State: AOAM532fCqZz48/8XbYhZqlZPRA43GUYicbYlpbJRtM3iw3RWhnQeejf
 cj41bDSBAtG3eXVlUpmq5eyi5g==
X-Google-Smtp-Source: ABdhPJxATs3KuDuMWEAjMghq03E7YQc+yJOkKpJRvtozd+hszZ6Zi3/yMlvy5TQf/Hwpj1yxDx4NdQ==
X-Received: by 2002:a5d:6cc1:: with SMTP id c1mr4135678wrc.144.1591798227154; 
 Wed, 10 Jun 2020 07:10:27 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:3cb:7bb0:c9f2:94f0:24f6:185d?
 ([2a01:e0a:3cb:7bb0:c9f2:94f0:24f6:185d])
 by smtp.gmail.com with ESMTPSA id b185sm7446792wmd.3.2020.06.10.07.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 07:10:26 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] riscv: Introduce CONFIG_RELOCATABLE
To: Alexandre Ghiti <alex@ghiti.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
References: <20200607075949.665-1-alex@ghiti.fr>
 <20200607075949.665-3-alex@ghiti.fr>
From: Jerome Forissier <jerome@forissier.org>
Message-ID: <b588dd9e-dff8-3458-0c7d-149e3990bca7@forissier.org>
Date: Wed, 10 Jun 2020 16:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607075949.665-3-alex@ghiti.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 11 Jun 2020 08:06:02 +1000
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
Cc: Anup Patel <anup@brainfault.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/7/20 9:59 AM, Alexandre Ghiti wrote:
[...]

> +config RELOCATABLE
> +	bool
> +	depends on MMU
> +	help
> +          This builds a kernel as a Position Independent Executable (PIE),
> +          which retains all relocation metadata required to relocate the
> +          kernel binary at runtime to a different virtual address than the
> +          address it was linked at.
> +          Since RISCV uses the RELA relocation format, this requires a
> +          relocation pass at runtime even if the kernel is loaded at the
> +          same address it was linked at.

Is this true? I thought that the GNU linker would write the "proper"
values by default, contrary to the LLVM linker (ld.lld) which would need
a special flag: --apply-dynamic-relocs (by default the relocated places
are set to zero). At least, it is my experience with Aarch64 on a
different project. So, sorry if I'm talking nonsense here -- I have not
looked at the details.

-- 
Jerome
