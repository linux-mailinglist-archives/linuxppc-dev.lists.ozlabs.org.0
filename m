Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0001B2AA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:05:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4966M06Q6MzDqVW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 01:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49656j49pRzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 00:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49656d3Gtdz9sSt; Wed, 22 Apr 2020 00:09:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a8c0c69b5e95e8f155480d5203a7bafb8024fd93
In-Reply-To: <1587114029.2275.1103.camel@hbabu-laptop>
To: Haren Myneni <haren@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v6 1/9] powerpc/vas: Initialize window attributes for GZIP
 coprocessor type
Message-Id: <49656d3Gtdz9sSt@ozlabs.org>
Date: Wed, 22 Apr 2020 00:09:44 +1000 (AEST)
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-17 at 09:00:29 UTC, Haren Myneni wrote:
> 
> Initialize send and receive window attributes for GZIP high and
> normal priority types.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a8c0c69b5e95e8f155480d5203a7bafb8024fd93

cheers
