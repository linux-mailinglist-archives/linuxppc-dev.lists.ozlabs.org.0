Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2CD2630A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:36:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmMF1qpkzDqCh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:36:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkY091tzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkT4fZ6z9sTv; Wed,  9 Sep 2020 23:37:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Nicholas Mc Guire <hofrat@osadl.org>
In-Reply-To: <1530691407-3991-1-git-send-email-hofrat@osadl.org>
References: <1530691407-3991-1-git-send-email-hofrat@osadl.org>
Subject: Re: [PATCH] powerpc: icp-hv: fix missing of_node_put in success path
Message-Id: <159965824114.811679.16588415498534668818.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:37 +1000 (AEST)
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

On Wed, 4 Jul 2018 10:03:27 +0200, Nicholas Mc Guire wrote:
>  Both of_find_compatible_node() and of_find_node_by_type() will
> return a refcounted node on success - thus for the success path
> the node must be explicitly released with a of_node_put().

Applied to powerpc/next.

[1/1] powerpc/icp-hv: Fix missing of_node_put() in success path
      https://git.kernel.org/powerpc/c/d3e669f31ec35856f5e85df9224ede5bdbf1bc7b

cheers
