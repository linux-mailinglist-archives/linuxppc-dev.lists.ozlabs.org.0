Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BCA14C657
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 07:05:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486tHv1833zDqND
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 17:05:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDw3H68zDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDs3h6zz9sSP; Wed, 29 Jan 2020 16:17:32 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: fbee6ba2dca30d302efe6bddb3a886f5e964a257
In-Reply-To: <1578632042-12415-1-git-send-email-kernelfans@gmail.com>
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: in lmb_is_removable(),
 advance pfn if section is not present
Message-Id: <486sDs3h6zz9sSP@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:32 +1100 (AEDT)
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
Cc: Paul Mackerras <paulus@samba.org>, Pingfan Liu <kernelfans@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-01-10 at 04:54:02 UTC, Pingfan Liu wrote:
> In lmb_is_removable(), if a section is not present, it should continue to
> test the rest sections in the block. But the current code fails to do so.
> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> To: linuxppc-dev@lists.ozlabs.org

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/fbee6ba2dca30d302efe6bddb3a886f5e964a257

cheers
