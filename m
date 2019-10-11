Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EFD3B31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 10:32:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qLmy0sHXzDqcG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 19:32:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qLXk2XHmzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 19:22:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46qLXh6VtKz9sPn; Fri, 11 Oct 2019 19:22:12 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 2272905a4580f26630f7d652cc33935b59f96d4c
In-Reply-To: <20191008141342.GA266797@gmail.com>
To: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] spufs: fix a crash in spufs_create_root()
Message-Id: <46qLXh6VtKz9sPn@ozlabs.org>
Date: Fri, 11 Oct 2019 19:22:12 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-08 at 14:13:42 UTC, Emmanuel Nicolet wrote:
> The spu_fs_context was not set in fc->fs_private, this caused a crash
> when accessing ctx->mode in spufs_create_root().
> 
> Signed-off-by: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/2272905a4580f26630f7d652cc33935b59f96d4c

cheers
