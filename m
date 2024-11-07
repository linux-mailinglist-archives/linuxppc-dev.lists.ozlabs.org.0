Return-Path: <linuxppc-dev+bounces-2978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 758559C03EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:27:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkftj2TfRz2xy6;
	Thu,  7 Nov 2024 22:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730978845;
	cv=none; b=mH9tuDiUMtXCF99Yv5tD+rXHzqvLb4P7iTelgaykfUkMZ0DzIUR7k/YZGGuMcYGiBi0eXga6Yr0hOHELVmfdiVl0XxB0C4UuAaoIvlfvIxq3CcEk06P7kIAZ75x5KCnCdcha/t7QiUgIuzJibg1oLzUAtvHmrDlZWF3SdcJnUO5hCa3B2BeaBeCQKPhsQYsX1CbaoD9/g0BUrIbeuCLVC2fIaw2Rpn4/1y5MbplOsACILqsBOcA44RiECqc/ZtPPoLvyhRXkdceiCrRx8L4u3BSqm4QmxkQxJkV0sbW021i9sNe7T7qqBMUx5KHKz8DtqFDN/dv7NVqknlapNTomxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730978845; c=relaxed/relaxed;
	bh=EGWEtzyJ3mpnGrJvn7StfDxulLgKk/n+RAvps6Y02c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGS7DIlVdBy3gMzLpXwXZx9k94JpwwkbJFhmloGaoaDrDrdYQlphMSyIrLGChBd43yqfMNp1hwuIKf1Hy2BhFXpI8Zm2d44xGc72kkjAviy+gQMgAkJMx4n+NvXaUDtffGx3QXjNZLQLv30qIfzPZbp+7xFCjI+zb8xTiTENN8WTcJMvT45xg9IyxWpebf17yc0wk6+WfcNAXClyPNt/lWNA5kJGY33JQM47nVGBrReticfbHgUY8rhf4JtszIzX9Nd/sXF2BPI7suwGv8YNJQUFRj5R//NoIcXVGJxxxSLg/jwLnn9zIkpKaSSFxYngomyQTmxrpTYytlI1nA5+6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UAau52Nw; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UAau52Nw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkfth2t19z2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:27:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5AA95A43BB6;
	Thu,  7 Nov 2024 11:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D3BC4CED0;
	Thu,  7 Nov 2024 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730978840;
	bh=7gqbQk8bplGmcvfUPSUYFL1na1ktG3G6Z6rLbPzXwNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAau52Nwe+uRAGcTn3tag5sZ2IjE2Y+7UqVk5YyUwm2HNDwzSKSk/xybWw6oJs1xH
	 aw6tom+24uo5mAYQR5DzWVwT2yW34ukMfw+9AHsd7P2SLJTQAZSYi9tAAit/WRZGxa
	 QmzVc4YoqXwop7JFKLxOht5phOc/6HTbt1uqpCR90f+huMY/5DXKA9mgk6zHUcuK6S
	 VEVz9HkKvEsADS/IQb1wRyV1rcj/Zm9/g6PlsD3SyjwlbH8DY8Xwhe8rksxoG65u9E
	 CHsWN3QDdzsjCbbirD9NkeAngtYhhQuh+bBBSwr2WLO75iChdkRMddYYodWx5tzFED
	 BR8m340iXt1qA==
Date: Thu, 7 Nov 2024 11:27:11 +0000
From: Will Deacon <will@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v6 1/5] arm: perf: Drop unused functions
Message-ID: <20241107112710.GC15424@willie-the-truck>
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-2-coltonlewis@google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105195603.2317483-2-coltonlewis@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Nov 05, 2024 at 07:55:58PM +0000, Colton Lewis wrote:
> For arm's implementation, perf_instruction_pointer() and
> perf_misc_flags() are equivalent to the generic versions in
> include/linux/perf_event.h so arch/arm doesn't need to provide its
> own versions. Drop them here.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm/include/asm/perf_event.h |  7 -------
>  arch/arm/kernel/perf_callchain.c  | 17 -----------------
>  2 files changed, 24 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

