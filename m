Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBCD9951B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:32:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dlp51cbMzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGg2ZRkzDrQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGg0X9Kz9sP8; Thu, 22 Aug 2019 23:08:58 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 663c0c9496a69f80011205ba3194049bcafd681d
In-Reply-To: <4f887e9b77d0d725cbb52035c7ece485c1c5fc14.1565361881.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Erhard F. <erhard_f@mailbox.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kasan: fix shadow area set up for modules.
Message-Id: <46DlGg0X9Kz9sP8@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:58 +1000 (AEST)
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

On Fri, 2019-08-09 at 14:58:10 UTC, Christophe Leroy wrote:
> When loading modules, from time to time an Oops is encountered
> during the init of shadow area for globals. This is due to the
> last page not always being mapped depending on the exact distance
> between the start and the end of the shadow area and the alignment
> with the page addresses.
> 
> Fix this by aligning the starting address with the page address.
> 
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204479
> Fixes: 2edb16efc899 ("powerpc/32: Add KASAN support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/663c0c9496a69f80011205ba3194049bcafd681d

cheers
