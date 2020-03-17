Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 365901886BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 15:02:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hZcG2xhbzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 01:02:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYYR4ww1zDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:14:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48hYYQ3LhHz9sSX; Wed, 18 Mar 2020 00:14:50 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: cc6f0e39000900e5dd1448103a9571f0eccd7d4e
In-Reply-To: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, ndesaulniers@google.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
Message-Id: <48hYYQ3LhHz9sSX@ozlabs.org>
Date: Wed, 18 Mar 2020 00:14:50 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-03-07 at 10:09:15 UTC, Christophe Leroy wrote:
> Commit 2efc7c085f05 ("powerpc/32: drop get_pteptr()"),
> replaced get_pteptr() by virt_to_kpte(). But virt_to_kpte() lacks a
> NULL pmd check and returns an invalid non NULL pointer when there
> is no page table.
> 
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: 2efc7c085f05 ("powerpc/32: drop get_pteptr()")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/cc6f0e39000900e5dd1448103a9571f0eccd7d4e

cheers
