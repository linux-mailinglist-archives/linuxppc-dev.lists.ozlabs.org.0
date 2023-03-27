Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F7C6CAA97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 18:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pldbg6s6rz3f6r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 03:30:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N37FXh2b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N37FXh2b;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PldZj3bfxz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 03:30:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A9AF6CE18B2;
	Mon, 27 Mar 2023 16:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E01C433EF;
	Mon, 27 Mar 2023 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679934601;
	bh=z8Axy2jhFhvVh2ZiGMT1gqklNpyGzWm7cQGzH79T/pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N37FXh2bg8zB5q2/YscYnl0ciPlS+M31qRFBW2Bed7S5crJMhAPZdRcpHFaFXxQvF
	 EurYSxT/i5zJwLxjWK0ubb9/SCBBJF3nsX3mvRJFuS5S8JzRJUtKNENud6OpToEjjz
	 tr/KDT50zcawFxqemU1PHFEbzLFWTNAnq/L5b71/5w58UHTw3FjjJhVhm0163wtRA5
	 tIIoTYXNDdJkE1Gp1jsnzuTvs0BOjT+8ld4xRhZTY0a5jmd+Ffvz2JnEmwM3x853Qp
	 0lWuw76mTn3laFa4nHOvjXywXRRtsuhyu96BA7CpLMAH7dqy7b03nw7iqHrByv+g8s
	 srrBxqIrnlRQA==
From: Will Deacon <will@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Ingo Molnar <mingo@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 0/3] COVER: Remove memcpy_page_flushcache()
Date: Mon, 27 Mar 2023 17:29:52 +0100
Message-Id: <167993078034.2286694.14271528066937024301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
References: <20221230-kmap-x86-v1-0-15f1ecccab50@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-team@android.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Mar 2023 16:20:53 -0700, Ira Weiny wrote:
> Commit 21b56c847753 ("iov_iter: get rid of separate bvec and xarray
> callbacks") removed the calls to memcpy_page_flushcache().
> 
> kmap_atomic() is deprecated and used in the x86 version of
> memcpy_page_flushcache().
> 
> Remove the unnecessary memcpy_page_flushcache() call from all arch's.
> 
> [...]

Applied arm64 patch to arm64 (for-next/mm), thanks!

[3/3] arm: uaccess: Remove memcpy_page_flushcache()
      https://git.kernel.org/arm64/c/7cae569e6209

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
