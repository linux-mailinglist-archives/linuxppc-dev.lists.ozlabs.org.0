Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7923AC003
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 02:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5fWb0zMVz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 10:12:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oSpSYvWF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oSpSYvWF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5fW80ybHz2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 10:12:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD2F610CA;
 Fri, 18 Jun 2021 00:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623975136;
 bh=NIkBnZc2GHohfpXgF10FM3cZz9pBdstBWE9sKMqAMu8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oSpSYvWFKgBFEmjj8o4qaE7vn+cDY9bhzewS9dKRZoiijkKB/+Yqur25dKFc91Vis
 ZIPJrkANH3XOikALMkUnqGw2NMPt+2syBcTxRTm5Ev0FPDGtcWXmgcUpH0vvkHEkHG
 eUQLxuoMVV4FDkRNZtCVHL97C/k/qdnN3cp8bPWJY+iKrsdKwIYHjOzT4a9IqX+lyj
 i1+y1Xo6wBY0AAm1bUVFS8enJ0mzJMsXotkTh2iJ+ORWNNUbZnA4HZP4xG4dZqoay8
 o8Bg5Bxd9kWW/TTPnGN7ihP827CtnDc1xghkjSy+TcwjGKxWA/F7/Q+8IdiRR0jt77
 rJUiaJF3kPs9g==
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <26196903-4aee-33c4-bed8-8bf8c7b46793@kernel.org>
Date: Thu, 17 Jun 2021 17:12:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <827549827.10547.1623941277868.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/21 7:47 AM, Mathieu Desnoyers wrote:

> Please change back this #ifndef / #else / #endif within function for
> 
> if (!IS_ENABLED(CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE)) {
>   ...
> } else {
>   ...
> }
> 
> I don't think mixing up preprocessor and code logic makes it more readable.

I agree, but I don't know how to make the result work well.
membarrier_sync_core_before_usermode() isn't defined in the !IS_ENABLED
case, so either I need to fake up a definition or use #ifdef.

If I faked up a definition, I would want to assert, at build time, that
it isn't called.  I don't think we can do:

static void membarrier_sync_core_before_usermode()
{
    BUILD_BUG_IF_REACHABLE();
}

