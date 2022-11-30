Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED063D252
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:45:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ8C6d34z3ghM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtc3McBz3f9V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtc2BYMz4xZg;
	Wed, 30 Nov 2022 20:34:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221006105653.115829-1-npiggin@gmail.com>
References: <20221006105653.115829-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: remove the last remnants of cputime_t
Message-Id: <166980024581.3017288.18071933598504987111.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:05 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Oct 2022 20:56:53 +1000, Nicholas Piggin wrote:
> cputime_t was a core kernel type, removed by commits
> ed5c8c854f2b..b672592f0221. As explained in commit b672592f0221
> ("sched/cputime: Remove generic asm headers"), the final cleanup
> is for the arch to provide cputime_to_nsec[s](). Commit ade7667a981b
> ("powerpc: Add cputime_to_nsecs()") did that, but justdidn't remove
> the then-unused cputime_to_usecs(), cputime_t type, and associated
> remnants.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: remove the last remnants of cputime_t
      https://git.kernel.org/powerpc/c/f985adaf2ff934ec869b32ca1f7f97e2825e3a49

cheers
