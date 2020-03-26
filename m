Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAB193F71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 14:08:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p50C1dDkzDqGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 00:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3d55WgFzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:07:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3d52mHWz9sSx; Thu, 26 Mar 2020 23:07:05 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7074695ac6fb965d478f373b95bc5c636e9f21b0
In-Reply-To: <20200324182912.1048906-1-farosas@linux.ibm.com>
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom_init: Remove leftover comment
Message-Id: <48p3d52mHWz9sSx@ozlabs.org>
Date: Thu, 26 Mar 2020 23:07:05 +1100 (AEDT)
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

On Tue, 2020-03-24 at 18:29:12 UTC, Fabiano Rosas wrote:
> The if statement that this comment referred to was removed in
> commit 11fdb309341c ("powerpc/prom_init: Remove support for OPAL v2").
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7074695ac6fb965d478f373b95bc5c636e9f21b0

cheers
