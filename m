Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C22E9B7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:25:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47372S0B7pzF4DM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:25:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736nj2GCtzF4BM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4736nh6vHhz9sPd; Wed, 30 Oct 2019 23:14:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nh54WPz9sQm; Wed, 30 Oct 2019 23:14:16 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 96664dee5cf1815777286227b09884b4f019727f
In-Reply-To: <20190907061124.1947-2-cmr@informatik.wtf>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v7 1/2] powerpc/xmon: Allow listing and clearing
 breakpoints in read-only mode
Message-Id: <4736nh54WPz9sQm@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:16 +1100 (AEDT)
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
Cc: ajd@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-09-07 at 06:11:23 UTC, "Christopher M. Riedl" wrote:
> Read-only mode should not prevent listing and clearing any active
> breakpoints.
> 
> Tested-by: Daniel Axtens <dja@axtens.net>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/96664dee5cf1815777286227b09884b4f019727f

cheers
