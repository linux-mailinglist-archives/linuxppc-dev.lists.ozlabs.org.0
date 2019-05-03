Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD751128FF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:39:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPCn1x0QzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKR1nVCzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKQ4DqFz9sB8; Fri,  3 May 2019 16:59:22 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f341d89790b0b7f99ca7835e0cf7de1026ceae39
X-Patchwork-Hint: ignore
In-Reply-To: <20190423151017.14429-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH][next] powerpc/mm: fix spelling mistake "Outisde" ->
 "Outside"
Message-Id: <44wNKQ4DqFz9sB8@ozlabs.org>
Date: Fri,  3 May 2019 16:59:22 +1000 (AEST)
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-04-23 at 15:10:17 UTC, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several identical spelling mistakes in warning messages,
> fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f341d89790b0b7f99ca7835e0cf7de10

cheers
