Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A532128E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:30:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wP1V4N4tzDqWC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKM6RNszDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKK1Yp3z9sPG; Fri,  3 May 2019 16:59:16 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e1619e89c96c596d72e66f15a0794f5001c8576e
X-Patchwork-Hint: ignore
In-Reply-To: <20190403004926.6702-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: config: skiroot: Add (back) MLX5 ethernet support
Message-Id: <44wNKK1Yp3z9sPG@ozlabs.org>
Date: Fri,  3 May 2019 16:59:16 +1000 (AEST)
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
Cc: Carol L Soto <clsoto@us.ibm.com>, Stewart Smith <stewart@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-04-03 at 00:49:26 UTC, Joel Stanley wrote:
> It turns out that some defconfig changes and kernel config option
> changes meant we accidentally dropped Ethernet support for Mellanox CLX5
> cards.
> 
> Reported-by: Carol L Soto <clsoto@us.ibm.com>
> Suggested-by: Carol L Soto <clsoto@us.ibm.com>
> Signed-off-by: Stewart Smith <stewart@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e1619e89c96c596d72e66f15a0794f50

cheers
