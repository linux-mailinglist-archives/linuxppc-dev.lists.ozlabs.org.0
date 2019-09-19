Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47543B777A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:31:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YtRT5WKmzF4Yy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:31:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKH2Y6wzF4Kn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKF1jchz9sP6; Thu, 19 Sep 2019 20:25:37 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 67c87892e2e17b7083cb8b4289ed8ff69ad9ac1e
In-Reply-To: <20190813051212.6387-1-jniethe5@gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Remove empty comment
Message-Id: <46YtKF1jchz9sP6@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:37 +1000 (AEST)
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-08-13 at 05:12:12 UTC, Jordan Niethe wrote:
> Commit 2874c5fd2842 ("treewide: Replace GPLv2 boilerplate/reference with
> SPDX - rule 152") left an empty comment in machdep.h, as the boilerplate
> was the only text in the comment. Remove the empty comment.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/67c87892e2e17b7083cb8b4289ed8ff69ad9ac1e

cheers
