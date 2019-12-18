Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A921123E4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 05:14:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1qc4t7XzDqXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:14:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1cl68nnzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47d1ck4ZNjz9sS9; Wed, 18 Dec 2019 15:05:10 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 61e3acd8c693a14fc69b824cb5b08d02cb90a6e7
In-Reply-To: <20191209132221.15328-1-ajd@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Fix __clear_user() with KUAP enabled
Message-Id: <47d1ck4ZNjz9sS9@ozlabs.org>
Date: Wed, 18 Dec 2019 15:05:10 +1100 (AEDT)
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
Cc: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-09 at 13:22:21 UTC, Andrew Donnellan wrote:
> The KUAP implementation adds calls in clear_user() to enable and disable
> access to userspace memory. However, it doesn't add these to
> __clear_user(), which is used in the ptrace regset code.
> 
> As there's only one direct user of __clear_user(), and the time taken to
> set the AMR for KUAP purposes is going to dominate the cost of a quick
> access_ok(), there's not much point having a separate path.
> 
> Rename __clear_user() to clear_user_asm(), and make __clear_user() just
> call clear_user().
> 
> Reported-by: syzbot+f25ecf4b2982d8c7a640@syzkaller-ppc64.appspotmail.com
> Reported-by: Daniel Axtens <dja@axtens.net>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Russell Currey <ruscur@russell.cc>
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/61e3acd8c693a14fc69b824cb5b08d02cb90a6e7

cheers
