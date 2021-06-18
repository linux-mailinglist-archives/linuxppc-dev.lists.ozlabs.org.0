Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312BE3AC259
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mFG5qHTz3gJP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:30:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4R2dYVz3c6N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:03 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4Q0RS0z9shn; Fri, 18 Jun 2021 14:23:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1622746428.git.geoff@infradead.org>
References: <cover.1622746428.git.geoff@infradead.org>
Subject: Re: [PATCH v2 0/3] DMA fixes for PS3 device drivers
Message-Id: <162398828712.1363949.1881698849429388448.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:27 +1000
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
Cc: Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 03 Jun 2021 19:16:56 +0000, Geoff Levand wrote:
> This is a set of patches that fix various DMA related problems in the PS3
> device drivers, and add better error checking and improved message logging.
> 
> Changes from V1:
>   Split the V1 series into two, one series with powerpc changes, and one series
>   with gelic network driver changes.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
      https://git.kernel.org/powerpc/c/6caebff168235b6102e5dc57cb95a2374301720a
[2/3] powerpc/ps3: Warn on PS3 device errors
      https://git.kernel.org/powerpc/c/472b440fd26822c645befe459172dafdc2d225de
[3/3] powerpc/ps3: Add dma_mask to ps3_dma_region
      https://git.kernel.org/powerpc/c/9733862e50fdba55e7f1554e4286fcc5302ff28e

cheers
