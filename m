Return-Path: <linuxppc-dev+bounces-2969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148809C004D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHR0TtPz3blT;
	Thu,  7 Nov 2024 19:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969107;
	cv=none; b=KFB6i1lxvsjzQoMkI0iNAt5TWyxYhNugnwZJRNOf6qZ6k8oaykHHWqniaSj4oqlv+dMZC0Bw67pZalXINBzo5sBjtAV6/7HlrBO7SX/uonVNCowWEbEtY5C2o826jKIb52bE+pDlxxP/BVcnHr5Zbega9324EP+0pA4jH7B9BuWHlG65/6siBuyOmjDnfdeO0GJHUfTGjOnu8keD/8ueH4mPzTwacpxsqPphiCY6EJ4HGHuTSfkE3gnE0M6eRnQJ3l6je5RdQOG441jGDY+a4PbVddi2ZCF5vqexQLJWIEt3bUuh5n0lJ+ZMo/FfWzvv1ZuwPIvbcyqDMSSY0WN5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969107; c=relaxed/relaxed;
	bh=WMyBavOsB1vyHHQFOuRy967yIlTqEEkAgUL/cePEBWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ijbsr90oX53eF3rOnpzm60/Ow9/mtg66r/VWu5KwMt+rW5tSrS7EV0YX+SlwpyZAgO1ThBsyvD/6z9ks8c4kmsAeXQTVKXKwLlaQ6MoyX0NV1+BdLHg0IxjrRvjCfBPjB4soLz7YKnOO4r6YhB/PvUgjcgXXy5BBO0q+D7gBxRIRdzrnzGiAGW96qMOIl+/YmcOQ47PDvjXz9QRmd4PGvxO007tLJvaTRA5XzEhIJh33gx+CS2AUNPe8V8uNsywEaGDBSb8ay02JMcQhjdRPCH483aUNFVG9y5+1wBrG7jhw8B0Iu5PJPKHM0xNXV6LzOtcqbWHKuA39/ENyxnOA0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kX4qxduv; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kX4qxduv;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHQ4Wd0z3bmH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969104;
	bh=WMyBavOsB1vyHHQFOuRy967yIlTqEEkAgUL/cePEBWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kX4qxduvkMx+ddJt2Hh/5SP/EPrFmi9O11yxW+tGM2U0l32mPnQIUVgE5ZdWyx1BD
	 H9FPDtLosWrxFPtO3zta5el1A0XMr/b2ln+T8yLLyogbF9KtbS5oS1V+eyupcA7/5U
	 DawML6hqLBnuYSMiRw3tJvxnDixLCdXRp2dKG1FqBsuOMbAvFfdJfNhb3Vu+F2LcsA
	 /6hOU75SqX0dN0g5J498wYmbHE9X2/xG1HoaRzbuF7vTu3AlCYPBO1afQU+qsHckjt
	 hYnVhuMjm3SZYxvg1yNQ8a28kggvgG7oqqK/qNEM4oBLQcHlXGi56+i0LFKxXC4KL2
	 mxdeqnH6RrLGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHN18gZz4xGC;
	Thu,  7 Nov 2024 19:45:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
In-Reply-To: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
References: <a2afc3d6481a87a305e89cfc4a3f3d2a0b8ceab3.1729146153.git.ritesh.list@gmail.com>
Subject: Re: [PATCH v4 1/3] powerpc/fadump: Refactor and prepare fadump_cma_init for late init
Message-Id: <173096894636.18315.15962335864180582252.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 18 Oct 2024 21:47:55 +0530, Ritesh Harjani (IBM) wrote:
> We anyway don't use any return values from fadump_cma_init(). Since
> fadump_reserve_mem() from where fadump_cma_init() gets called today,
> already has the required checks.
> This patch makes this function return type as void. Let's also handle
> extra cases like return if fadump_supported is false or dump_active, so
> that in later patches we can call fadump_cma_init() separately from
> setup_arch().
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/fadump: Refactor and prepare fadump_cma_init for late init
      https://git.kernel.org/powerpc/c/adfaec30ffaceecd565e06adae367aa944acc3c9
[2/3] powerpc/fadump: Reserve page-aligned boot_memory_size during fadump_reserve_mem
      https://git.kernel.org/powerpc/c/6faeac507beb2935d9171a01c3877b0505689c58
[3/3] powerpc/fadump: Move fadump_cma_init to setup_arch() after initmem_init()
      https://git.kernel.org/powerpc/c/05b94cae1c47f94588c3e7096963c1007c4d9c1d

cheers

