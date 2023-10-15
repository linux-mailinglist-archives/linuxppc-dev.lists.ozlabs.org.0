Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3647C988D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:04:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sDuOhglI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bT150tYz3cGw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sDuOhglI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRC6MtGz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364199;
	bh=Xywli/LLxATt1O56BUYkhx2IGYH2bax1grDbXN8Buis=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sDuOhglIKCdliRZ0/i8KqEi7rn3qNl+rXH6Mp2V9SMyf4iBHENwSIq1yvPlM1JVqK
	 DIg/BAChEgmcGyuPmeD8N8zWcT7CIP/wOVZg/DNy/LzgxfcY7h7Gm/0F+as8NWSzsq
	 pqHfvQWeEEt6Gc+HC6WxCCdiVd+3P5ayvIRf2SOZOi7qzWziVyV7o6CNMKaGY+dG6w
	 mp1y8EIF3SKVdqN2pCsKB2x8IW/MxY5ho4XbO2uK7indpFxsQKrvKsbPsSxpYBGPlL
	 ps0oGYQ3nHY9Y1vBDXtgY5FOOLRlMH6M8PLfXUfNCNJbc037yfzLPGqZoV3Y0ECKuP
	 6kKd0P2wkNjTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRC4lP5z4wcZ;
	Sun, 15 Oct 2023 21:03:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20230929172337.7906-1-atrajeev@linux.vnet.ibm.com>
References: <20230929172337.7906-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/platforms/pseries: Fix STK_PARAM access in the hcall tracing code
Message-Id: <169736402374.957740.1615846713594615509.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: maddy@linux.ibm.com, kjain@linux.ibm.com, Naveen N Rao <naveen@kernel.org>, stable@vger.kernel.org, linux-perf-users@vger.kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 Sep 2023 22:53:36 +0530, Athira Rajeev wrote:
> In powerpc pseries system, below behaviour is observed while
> enabling tracing on hcall:
> 	# cd /sys/kernel/debug/tracing/
> 	# cat events/powerpc/hcall_exit/enable
> 	0
> 	# echo 1 > events/powerpc/hcall_exit/enable
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/platforms/pseries: Fix STK_PARAM access in the hcall tracing code
      https://git.kernel.org/powerpc/c/3b678768c0458e6d8d45fadf61423e44effed4cb
[2/2] powerpc/platforms/pseries: Remove unused r0 in the hcall tracing code
      https://git.kernel.org/powerpc/c/dfb5f8cbd5992d5769edfd3e059fad9e0b8bdafb

cheers
