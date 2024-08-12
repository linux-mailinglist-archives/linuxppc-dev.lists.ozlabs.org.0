Return-Path: <linuxppc-dev+bounces-18-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD694ECD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 14:23:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjDF16blRz2xlF;
	Mon, 12 Aug 2024 22:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjCmh2mR1z2xXV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 22:01:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjCmg4pGcz4xCV;
	Mon, 12 Aug 2024 22:01:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: dennis@kernel.org, tj@kernel.org, cl@linux.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240807025604.2817577-1-ruanjinjie@huawei.com>
References: <20240807025604.2817577-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next v2] powerpc: Remove useless config comment in asm/percpu.h
Message-Id: <172346406507.772934.17084991880915030609.b4-ty@ellerman.id.au>
Date: Mon, 12 Aug 2024 22:01:05 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 07 Aug 2024 10:56:04 +0800, Jinjie Ruan wrote:
> commit 0db880fc865f ("powerpc: Avoid nmi_enter/nmi_exit in real mode
> interrupt.") has a config comment typo, and the #if/#else/#endif section
> is small and doesn't nest additional #ifdefs so the comment is useless
> and should be removed completely.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Remove useless config comment in asm/percpu.h
      https://git.kernel.org/powerpc/c/fa740ca82277b476a49fee83c6fdb023656ef779

cheers

