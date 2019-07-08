Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE6618FA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:41:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hp8W67THzDqLL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnfy3jRVzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnfv38ZKz9sP2; Mon,  8 Jul 2019 11:19:35 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7505a13f85bdcb8713551a067dfc92ac3c7ba902
In-Reply-To: <20190604054257.30703-1-anton@ozlabs.org>
To: Anton Blanchard <anton@ozlabs.org>, paulus@samba.org, npiggin@gmail.com,
 aneesh.kumar@linux.vnet.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/configs: Disable latencytop
Message-Id: <45hnfv38ZKz9sP2@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:35 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-04 at 05:42:57 UTC, Anton Blanchard wrote:
> latencytop adds almost 4kB to each and every task struct and as such
> it doesn't deserve to be in our defconfigs.
> 
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7505a13f85bdcb8713551a067dfc92ac3c7ba902

cheers
