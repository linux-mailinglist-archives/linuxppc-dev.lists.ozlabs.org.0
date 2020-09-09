Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B22630B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:38:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmQF0S0kzDqHF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkX3jMNzDqFL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkS68hFz9sVT; Wed,  9 Sep 2020 23:37:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <michael@ellerman.id.au>,
 Nicholas Mc Guire <hofrat@osadl.org>
In-Reply-To: <1530522496-14816-1-git-send-email-hofrat@osadl.org>
References: <1530522496-14816-1-git-send-email-hofrat@osadl.org>
Subject: Re: [PATCH] powerpc: hwrng; fix missing of_node_put()
Message-Id: <159965824096.811679.9956430323113603887.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:36 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2 Jul 2018 11:08:16 +0200, Nicholas Mc Guire wrote:
>  The call to of_find_compatible_node() returns a node pointer with refcount
> incremented thus it must be explicitly decremented here before returning.

Applied to powerpc/next.

[1/1] powerpc/pseries: Fix missing of_node_put() in rng_init()
      https://git.kernel.org/powerpc/c/67c3e59443f5fc77be39e2ce0db75fbfa78c7965

cheers
