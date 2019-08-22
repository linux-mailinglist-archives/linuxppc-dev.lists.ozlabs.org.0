Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B994995C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:02:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DmSL1SF5zDr1x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGt6zk8zDrQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGt49BMz9sPW; Thu, 22 Aug 2019 23:09:10 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7ab0b7cb8951d4095d73e203759b74d41916e455
In-Reply-To: <c6cea38f90480268d439ca44a645647e260fff09.1565941808.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: Add warning on misaligned copy_page() or
 clear_page()
Message-Id: <46DlGt49BMz9sPW@ozlabs.org>
Date: Thu, 22 Aug 2019 23:09:10 +1000 (AEST)
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

On Fri, 2019-08-16 at 07:52:20 UTC, Christophe Leroy wrote:
> copy_page() and clear_page() expect page aligned destination, and
> use dcbz instruction to clear entire cache lines based on the
> assumption that the destination is cache aligned.
> 
> As shown during analysis of a bug in BTRFS filesystem, a misaligned
> copy_page() can create bugs that are difficult to locate (see Link).
> 
> Add an explicit WARNING when copy_page() or clear_page() are called
> with misaligned destination.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Erhard F. <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204371

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7ab0b7cb8951d4095d73e203759b74d41916e455

cheers
