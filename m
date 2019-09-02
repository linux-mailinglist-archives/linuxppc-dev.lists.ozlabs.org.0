Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5BA4E2C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:04:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MGgY2shdzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:04:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFv433YZzDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFv41xF7z9sN1; Mon,  2 Sep 2019 13:29:36 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 63ce271b5e377deaddace4bac6dafb6e79d2bee4
In-Reply-To: <cdaf4bbbb64c288a077845846f04b12683f8875a.1566817807.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/prom: convert PROM_BUG() to standard trap
Message-Id: <46MFv41xF7z9sN1@ozlabs.org>
Date: Mon,  2 Sep 2019 13:29:36 +1000 (AEST)
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

On Mon, 2019-08-26 at 11:10:23 UTC, Christophe Leroy wrote:
> Prior to commit 1bd98d7fbaf5 ("ppc64: Update BUG handling based on
> ppc32"), BUG() family was using BUG_ILLEGAL_INSTRUCTION which
> was an invalid instruction opcode to trap into program check
> exception.
> 
> That commit converted them to using standard trap instructions,
> but prom/prom_init and their PROM_BUG() macro were left over.
> head_64.S and exception-64s.S were left aside as well.
> 
> Convert them to using the standard BUG infrastructure.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/63ce271b5e377deaddace4bac6dafb6e79d2bee4

cheers
