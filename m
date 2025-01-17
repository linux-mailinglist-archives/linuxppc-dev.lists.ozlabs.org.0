Return-Path: <linuxppc-dev+bounces-5367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B984FA15618
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 18:56:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZS9L3xy6z2xjv;
	Sat, 18 Jan 2025 04:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737136614;
	cv=none; b=S23MkaRRWE+2YNYITIqAtflJ0v7/ySgPlUjS2DFKHVK3uJdZS8ZaYBopNu3gHJi1Fu6dTj+YXMOBbzxyJ5v64SOTYJ0IdgRePneAjEmrrQUI1ef8cTZGtlemg8zumNBx8j4wVOWKJ2e3CAUQ7MRkcUkIQekRaMrrA9CF3OJZMI4tl8ujE/yUl2Zr6CDQOi/4QRk5lshd9Lzjz4T3aFS+qiMCWArJ53L0Eo76jNNn3MlSGi9cdhMI78kqk9x9ttMFm4kgJbq6XnIFBM9Fj45oiH1g61+Wj5iV4bcL1XBIZs6xs64f23Ny4FP7iUB87tcipFFbVMrA+qWS7WLd8KFPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737136614; c=relaxed/relaxed;
	bh=tsjjDJxWaJsd0OvBus7L8yyAXdH0FpzGcbp3StxWR7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAfg58dOaGP44fYJXUolX2g0vhskoSSGCShUdp7Kt1YgcxJ7aEYvyHTlnMHm6oKYMQOVV1FLsz0AFF6ZQhsfoYs1R12aHK64y5mCwzsTTYNVgM5hdnZXZj3omdb26a38kSWY6TU0ohVDb08VljcKSn5+7jiZRTS3+G8m/NGhNxIN4IJXxh9mQtfnQ58cufDk04Tx8A7YaluQ5Rh4n+UlgB6El8gmTmjr2ve0kmJDZEBq5D7C7Nm250pC7NxAf3DEEn/nv8VYaE8dMb0YWwYfyaL08XQ1gQhSyl9XI7A/kp/jWe1HhqjLDgREXVnSXupjsAUneC/NfOQvnNsrIXYCog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QdVr2uWT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QdVr2uWT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZS9K5QdDz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 04:56:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05D7C5C631C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EAFC4CEE5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136610;
	bh=W20FKPQLpsgn7tuGcr40gcGgekycwwtMobddZh1YGAU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QdVr2uWTsl4QrI1i0QVrO84D+0XhWqtkk+8crShCJcINVUUJAowrDgsWQjPA3b8Fi
	 qTwDRsqXYekV6JJUsp10jKpzfmLhFaKunSKRTqmrJNkLoru2t+sZuFT9+lT8R8bImk
	 FD8NTxYn++gXA57emUIIoCUUNF4fBZ+x7S3ZkkV4gQj8xJ4DePwhizVMnUr8RkZJrV
	 g8e/7qXBCUxn5lLDVv/FICLz2L/N5ij2O2t7DXxmQmoboGB/Z9viDeaBtlj9hWqMxQ
	 i4tzRiJGNwbJDEl80IOQaBjrnSuakq+zpUNclcOMj3a2/OzMqEFQdw33qdc9vPVqhs
	 laCw6Q0j4Wcwg==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3eb7ecc3c54so1480216b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 09:56:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW08uZRR6OJIUbYbVClEtWPCyft9/1dZh+AVRAt7jOX31cVM5m0+fMNE0MZ7UU+84uaaSonZVvzu5RS/7A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwFeVtycvCmNzxXrkA/ATh9smaWSe91QO+NS/jLaw1aP04WWH1
	NjX2/d56tvT4ySpJ7R17dQ1N12VvjnMPGPSiVD+55C0zoomKxEv7m1MMs5X2csya9JP/TVMrYfL
	clqnvDp14Ul2v8cippo9zZOPBdxg=
X-Google-Smtp-Source: AGHT+IEHpotjJYMGNiG1GyFY4aE5frwe0D6oI/88O3Q7jH39v93JVarforfyHexdeJUmwEy5xzz0cvKmTBtmEH+SSV4=
X-Received: by 2002:a05:6808:2f1b:b0:3e7:b2b4:ee7a with SMTP id
 5614622812f47-3f19fd30482mr2969328b6e.26.1737136609745; Fri, 17 Jan 2025
 09:56:49 -0800 (PST)
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
MIME-Version: 1.0
References: <20250114190600.846651-1-krzysztof.kozlowski@linaro.org> <20250115071251.ww6z2h2oj2v56sbw@vireshk-i7>
In-Reply-To: <20250115071251.ww6z2h2oj2v56sbw@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 Jan 2025 18:56:38 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gbS0xHiK1zHbyvBFTQdkCvUPZWg_jOwf00cYnc4qZY+A@mail.gmail.com>
X-Gm-Features: AbW1kvaqwd8w6CX_qL8qN73sPwqvxoUBDj6KpQAgT9NoTcKXu3LbXufqha0NiVk
Message-ID: <CAJZ5v0gbS0xHiK1zHbyvBFTQdkCvUPZWg_jOwf00cYnc4qZY+A@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: Use str_enable_disable-like helpers
To: Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 8:12=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 14-01-25, 20:06, Krzysztof Kozlowski wrote:
> > Replace ternary (condition ? "enable" : "disable") syntax with helpers
> > from string_choices.h because:
> > 1. Simple function call with one argument is easier to read.  Ternary
> >    operator has three arguments and with wrapping might lead to quite
> >    long code.
> > 2. Is slightly shorter thus also easier to read.
> > 3. It brings uniformity in the text - same string.
> > 4. Allows deduping by the linker, which results in a smaller binary
> >    file.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 6.14 material, thanks!

