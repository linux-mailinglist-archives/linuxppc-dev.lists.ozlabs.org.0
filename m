Return-Path: <linuxppc-dev+bounces-5083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB4A0A507
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 18:17:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVlZs1Mmfz2xk1;
	Sun, 12 Jan 2025 04:17:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736615861;
	cv=none; b=nCNge2jfYrX5DcfP33LdTORNmYviVVDSfWvPPQdZgLhw2bYkjUQZFg4BM/7184mjHal5BPhp850dDijPElww/9yKyavYmTYdKLTUb1pSa5gMHIa9tQUTh+GfPl67jsbnj8mgH4WEye85Nj7bYy7mH06fxfkUV8WXI5rMM0FjNUSyVMb69TAaP0DJr3c+Wqd25m2wPXfGzDLjkPcFLsKjoXAMSb7TFCFOSfXV1ghDPEYCYQsvemQzkOGq/YyFy55S3r9pi+gfEP6LwIfQAtaw3W1deO+lL29/YhDl+PBaEUirBk9Uk2h3iLveoEQXG5XOkWPN4SWZN+bSKMmw46BqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736615861; c=relaxed/relaxed;
	bh=mv5nPDuSkLgLboAUc81Li6u8jhY2AQ/d+h/O/Cu28pg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=exxLtZWQibVtJAaVSeWq3vrC9C2G7FR3SEBysGwwFWiwF/nWfe1sfbU7dTd+OlTU8ioP8Uzes7ixsH0cUlAFtJpmsl3PAyecZiyFIY8DCNSN/7tkzRVcUlKwj17FTP2x1y0ohJokJwSWWLnQhQ4COo0AdiruSJ9Rf7T+/iH7YSGCPa3aRGtuzZBYgEx3V0vlYms+C/S1tIAPHZQbmzLJRXNZeb4PJdVYChmjhwfanjU/qoBs3tAIgefDgP6BebnNAdYfFwUfPmqwLdiG9CkDtATuOvQJ9Uz0GI6+KEY1I2FvAbASntXM13E5kNmxgtY2Pkrg8/ML76ki933GMCAhEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PdoQ2pAO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PdoQ2pAO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVlZr1GXxz2xDl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 04:17:39 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216728b1836so51218175ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 09:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736615856; x=1737220656; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mv5nPDuSkLgLboAUc81Li6u8jhY2AQ/d+h/O/Cu28pg=;
        b=PdoQ2pAOS2moXEk17PRp7nw74uMtDPqh7wOL7VOybYAmu1uwYyc/5bwXSE1g5ROy7i
         K+CSEEDYeM6tAMMV3mt4wZ8ZEXqhtywr9f1KeTWMOiFuzmEwuKms4AgqouPTToLcPuf7
         VR13F+MrH9KmcpdVZS0ctVWaBKux3zsxTkmqAHMnDGOeVWKoiFOh9C05VXtbLalLrESA
         dnXBnazpXN8y8yKzRDPakZJEMfL/vKS+1Ow7ALJEnrN4kKgDIh/GY3l/XRjFnnp64qja
         ale6uavkcrdi54FJW0dbUwxA230kKINdQSXRuXmYix+la0rfAJvyac+f/FxwiUCyXces
         y0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736615856; x=1737220656;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mv5nPDuSkLgLboAUc81Li6u8jhY2AQ/d+h/O/Cu28pg=;
        b=HAsKywg0bMdw2/TOPa85fWbwBFs4CdeRrs4+xjRMovcvKpTvFo8jxSi31Tl939ZArQ
         ZIyP9o7MGRowvo/Laec8U48gT+4RMsIArKdhuN2sYPexCEjFDZwpsKH66xaiwtNsQAU0
         eSd4em1ag/dJKKm/9l4OyfloiCcYZlKz0xWw0P0hF/HlSIh0aFHZtwUktX+b8MIBRynZ
         UZdeXWlPIdDiTJ+1SJnH4zCgXWNJ6lnRwQrHp1tVzJJPiEcCjvf/txFSzikHDdYnB8LR
         2LPqA4eNAoxdpS9jt8pGHzDvzAUTRlsnl4sCeB7f3mw02/zOfqVQmF+pDjpvoHtAC8fs
         x+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX410Ahxs6ZAdGbOUzc55oH0+Dya+57baVq+PAq/Zw9bnVCTzmy2jJAgbonqE4mEK4YjmQkXE3n/2C7I5Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKcVxKc8ncLm+Ug60vaxW7etssNjoa52kmR2x8TQaLwZL0IMxg
	DbbWDKR8fk4KUDf5PQ9a1F2zFn+yyK0L6zKhUwnzEswvseiCdhl2
X-Gm-Gg: ASbGnct68O/HFlioKVniEXhWObXPglrajpoDDYwYG9KUfR88B6LJmTadpnxS+adUqgE
	x8+a+qyt61lmvFaYEhmqrXiAWJ2ECa+sCNpEh014SI0zByny3O112AkuyS+e3y/Ipsq90emcFhA
	BzCQrQMeZ/J3zzwusLzivMJ1fbJozdR4vEiTZXNeEcyHUSOykJqM9HqYx+pyA4c/98gT07mGpM4
	aBk49y4th5s8pK4LskojbNH2ZH4d8UTo4dP25WSjHceGwGS
X-Google-Smtp-Source: AGHT+IFmH5kLnKiwygZLtZII1Q5Ns974ni/++S7l2rNvfuzSQsaymXo7+MIjEk/3NegBZ2X7p0HvIg==
X-Received: by 2002:a17:902:e542:b0:215:b468:1a33 with SMTP id d9443c01a7336-21a83f43c52mr252689035ad.4.1736615855805;
        Sat, 11 Jan 2025 09:17:35 -0800 (PST)
Received: from dw-tp ([171.76.81.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22f6d1sm29719875ad.202.2025.01.11.09.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 09:17:35 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc: Remove unused function icp_native_cause_ipi_rm()
In-Reply-To: <20250101134251.436679-1-gautam@linux.ibm.com>
Date: Sat, 11 Jan 2025 22:44:03 +0530
Message-ID: <87msfxuvc4.fsf@gmail.com>
References: <20250101134251.436679-1-gautam@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Gautam Menghani <gautam@linux.ibm.com> writes:

> Remove icp_native_cause_ipi_rm() as it has no callers since
> commit 53af3ba2e819("KVM: PPC: Book3S HV: Allow guest exit path to have
> MMU on")
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/xics.h       |  1 -
>  arch/powerpc/sysdev/xics/icp-native.c | 21 ---------------------
>  2 files changed, 22 deletions(-)

Indeed there are no callers left of this function. Great catch!

Looks good to me. Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

