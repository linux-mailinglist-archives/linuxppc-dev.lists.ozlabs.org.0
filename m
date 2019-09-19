Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF54B783B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 13:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YvKJ09n4zF4Py
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 21:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKm4DNpzF4Y0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:26:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKl43Myz9sQq; Thu, 19 Sep 2019 20:26:03 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: ad9b48c52296ddb7620e3f2b66a7479b78632dff
In-Reply-To: <20190915052905.13431-1-adam.zerella@gmail.com>
To: Adam Zerella <adam.zerella@gmail.com>, 
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] docs: powerpc: Add missing documentation reference
Message-Id: <46YtKl43Myz9sQq@ozlabs.org>
Date: Thu, 19 Sep 2019 20:26:03 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, corbet@lwn.net, paulus@samba.org,
 Adam Zerella <adam.zerella@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2019-09-15 at 05:29:05 UTC, Adam Zerella wrote:
> The documentation pages for 'elfnote' and 'ultravisor'
> are not included in the powerpc documentation index, this
> generates Sphinx warnings:
> 
> WARNING: document isn't included in any toctree
> 
> Additionally, when one includes these missing doc pages,
> more Sphinx warnings appear. Unused footnote references,
> syntax highlighting and table of content ordering has
> been adjusted.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/ad9b48c52296ddb7620e3f2b66a7479b78632dff

cheers
