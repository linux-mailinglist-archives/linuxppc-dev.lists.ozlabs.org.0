Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BA897A3B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 22:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=WbDgetig;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8xcG0jd1z3vZh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 07:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=WbDgetig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8xbX73VNz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 07:45:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7100612A4;
	Wed,  3 Apr 2024 20:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8F4C433F1;
	Wed,  3 Apr 2024 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1712177140;
	bh=yNRma02riMpShZw5OlGNXboXuC4yjz6G1J9H55luJl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WbDgetigVfP4aw5GQwkC4/+qzJgMfkCRZ/CwVfM+DoWhVsV2cSyKM+d0KjSYmohjG
	 D9MNWSGnvMyDqphojTexHK6yncBn+D75NAjadehGe185l4ywdlwBA4CRdqXEgUAQpQ
	 LFHfUu8b17Q+Go/GjBQs5pUYIY0N53InUiC/aUt8=
Date: Wed, 3 Apr 2024 13:45:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when
 badaccess
Message-Id: <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
In-Reply-To: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: x86@kernel.org, linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, surenb@google.com, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Apr 2024 16:37:58 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> After VMA lock-based page fault handling enabled, if bad access met
> under per-vma lock, it will fallback to mmap_lock-based handling,
> so it leads to unnessary mmap lock and vma find again. A test from
> lmbench shows 34% improve after this changes on arm64,
> 
>   lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198
> 
> Only build test on other archs except arm64.

Thanks.  So we now want a bunch of architectures to runtime test this.  Do
we have a selftest in place which will adequately do this?
