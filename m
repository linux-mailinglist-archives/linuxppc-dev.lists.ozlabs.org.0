Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924A19AC60
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:06:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48smfB6J17zDqk8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:05:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMW535rzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMT75j9z9sT9; Wed,  1 Apr 2020 23:53:09 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b77afad84e1eedca03658ae1478ce5b8ed5aa18c
In-Reply-To: <20191125092033.20014-1-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: drop unused ISA_DMA_THRESHOLD
Message-Id: <48smMT75j9z9sT9@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:09 +1100 (AEDT)
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-11-25 at 09:20:33 UTC, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The ISA_DMA_THRESHOLD variable is set by several platforms but never
> referenced.
> Remove it.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b77afad84e1eedca03658ae1478ce5b8ed5aa18c

cheers
