Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FEA17B364
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 02:02:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTqp324tzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 12:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3Z290lzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48YT3Y4CSBz9sSZ; Fri,  6 Mar 2020 11:27:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3Y2QBsz9sSs; Fri,  6 Mar 2020 11:27:52 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d42c6d0f8d004c3661dde3c376ed637e9f292c22
In-Reply-To: <20200219000434.15872-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
Message-Id: <48YT3Y2QBsz9sSs@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:52 +1100 (AEDT)
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
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
> 
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
> 
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile, or in scripts/Makefile.build for the boot
> Makefile.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22

cheers
