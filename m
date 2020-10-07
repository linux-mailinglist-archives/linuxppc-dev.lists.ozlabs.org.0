Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A96285726
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:38:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5g5m6m2TzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkS35NtzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkR6NJRz9sTm; Wed,  7 Oct 2020 14:21:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200916030234.4110379-1-npiggin@gmail.com>
References: <20200916030234.4110379-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc: untangle cputable mce include
Message-Id: <160204082841.257875.1230697242563109012.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:19 +1100 (AEDT)
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

On Wed, 16 Sep 2020 13:02:33 +1000, Nicholas Piggin wrote:
> Having cputable.h include mce.h means it pulls in a bunch of low level
> headers (e.g., synch.h) which then can't use CPU_FTR_ definitions.

Applied to powerpc/next.

[1/2] powerpc: untangle cputable mce include
      https://git.kernel.org/powerpc/c/9983efa83b0a98da33807ccf5c047e204fdcac4c
[2/2] powerpc/64s: Add cp_abort after tlbiel to invalidate copy-buffer address
      https://git.kernel.org/powerpc/c/05504b42562066ae27ce3e7dcec37f81dea476cb

cheers
