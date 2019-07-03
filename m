Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CCE5E70C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:46:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3nd1n0ZzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Mt533mzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45f3Mt388Xz9sPD; Thu,  4 Jul 2019 00:27:06 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 63982618662e2a05e5c5c3e4247456d1d3467f32
In-Reply-To: <20190625145239.2759-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/4] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-Id: <45f3Mt388Xz9sPD@ozlabs.org>
Date: Thu,  4 Jul 2019 00:27:06 +1000 (AEST)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-25 at 14:52:36 UTC, Christoph Hellwig wrote:
> This function has never been used anywhere in the kernel tree since it
> was added to the tree.  We also now have proper PCIe P2P APIs in the core
> kernel, and any new P2P support should be using those.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/63982618662e2a05e5c5c3e4247456d1d3467f32

cheers
