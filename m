Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5751D13F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 15:05:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MZfh1w7fzDqlS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:05:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MZ9H1TRczDqgr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 22:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49MZ9H06myz9sSw; Wed, 13 May 2020 22:43:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200407041245.600651-1-npiggin@gmail.com>
References: <20200407041245.600651-1-npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/uaccess: evaluate macro arguments once,
 before user access is allowed
Message-Id: <158937375751.3526905.576258587093400946.b4-ty@ellerman.id.au>
Date: Wed, 13 May 2020 22:43:46 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 7 Apr 2020 14:12:45 +1000, Nicholas Piggin wrote:
> get/put_user can be called with nontrivial arguments. fs/proc/page.c
> has a good example:
> 
>     if (put_user(stable_page_flags(ppage), out)) {
> 
> stable_page_flags is quite a lot of code, including spin locks in the
> page allocator.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/uaccess: Evaluate macro arguments once, before user access is allowed
      https://git.kernel.org/powerpc/c/d02f6b7dab8228487268298ea1f21081c0b4b3eb

cheers
