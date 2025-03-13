Return-Path: <linuxppc-dev+bounces-7021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E56A604A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 23:48:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDN1v0kgyz3c78;
	Fri, 14 Mar 2025 09:48:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741906083;
	cv=none; b=XDeyz+fRRk7uJ3NwbCMuW7qd51SdehGkAdihWLlq89E51M1yiEQ+wWV48k5Hc9db5o2puCWzOVKk7Xxo76sDfMMYNHo3T1ZCuJKa80i9kmBMbAKHPz7RG3Xtdqj3e8/nofD3bCq1FMAVlvNpoTOpw72HthGZTBvi3j3M0dL9tRbLvoJrcC6W5dJepF0D+PfPlnbE7ozSO4ef/AzGGFCXXKbETKboOMxPPGAHESLTmDZTzZDNWQ9F8bycO70bI8od81Hpsxf3MeMSaJLG2cqtIBeMYyiB+ej2sXL+dVbSRa7/8dyG2JQgtLQ/laYXsIIe/f0KslRxltuehY3C0KM/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741906083; c=relaxed/relaxed;
	bh=2mHnQJZqSGXTSdxM5qZXT0n+IAt644NCHUff5TeofaQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cOCr3Gnr6TW0GH3Z8GVZA3MhiQ7sFoOly0n+FuwO8y5/+TJSCIzA8ehvjxNQMFsvqn4hT1C0v9E+1Sej9c/dMRD6e9TOiSI1xcRgiPHI3MJwODo8lVhTX30GyzgK6j3Fwek9u2OcI1rElf0VPF42x/mRsYadU6NhdSUI+uUAeyufA+4KtndM6yhPeskQZ74fVFbuOUA2sOKsXHuBWvA4MgEE65XRBXYe+6KNYCgLHbBwwWIP53TJJKTQ3AwIx9ZdwRJzXGNgLUyUfRhvIcez20pLu57TuhuFLWve9szycw6JrCzPWFy0XHd2IynKgyf2mJy1aR0IsbLr9VSc906kMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=D07nQ1Lp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=D07nQ1Lp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDN1t2jC6z3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 09:48:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CAB1BA41973;
	Thu, 13 Mar 2025 22:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A29C4CEE5;
	Thu, 13 Mar 2025 22:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741906078;
	bh=1vuD3j168L/LkXuHpAQRHWAckhTjhOgcAOnJeSUpGFw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D07nQ1LpbLt/bMF9YjXcH2ajIgpv+FXAmqxwUrPU4z2wNpnjcwJnLB4gSGcaqzJJp
	 9N2HwfmnWhFKhSPXWoZ57u+AZFJ8GMdd4Y7qOx1PGShKUGhHbJPTjEpkA+/oHpFOV8
	 LPI7ztHnZrekAlZwU1tYLP/cFn74Pwe2Qn4FtXZc=
Date: Thu, 13 Mar 2025 15:47:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 pasha.tatashin@soleen.com, maddy@linux.ibm.com, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sweettea-kernel@dorminy.me
Subject: Re: [PATCH v13 00/11] Support page table check on PowerPC
Message-Id: <20250313154757.79dc20b347a0bee16f4fbd10@linux-foundation.org>
In-Reply-To: <006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
	<006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 13 Mar 2025 13:54:39 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Wed, 2025-02-12 at 03:13 +1100, Andrew Donnellan wrote:
> > Support page table check on all PowerPC platforms. This works by
> > serialising assignments, reassignments and clears of page table
> > entries at each level in order to ensure that anonymous mappings
> > have at most one writable consumer, and likewise that file-backed
> > mappings are not simultaneously also anonymous mappings.
> > 
> > In order to support this infrastructure, a number of stubs must be
> > defined for all powerpc platforms. Additionally, seperate
> > set_pte_at()
> > and set_pte_at_unchecked(), to allow for internal, uninstrumented
> > mappings.
> 
> Talking to Maddy about this off-list - given that this series touches
> on generic code and several architectures, would it be best to take it
> through the mm tree rather than powerpc?

Sure, I can do that.

Are the rest of the ppc team OK with these changes?  I'm not seeing
much acking from the usual suspects?

