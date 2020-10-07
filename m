Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25920285717
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:32:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5fzX1t1YzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:32:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkN4G3XzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkN2DwMz9sSf; Wed,  7 Oct 2020 14:21:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Christoph Hellwig <hch@lst.de>
In-Reply-To: <20200924041310.520970-1-hch@lst.de>
References: <20200924041310.520970-1-hch@lst.de>
Subject: Re: [PATCH] powerpc: switch 85xx defconfigs from legacy ide to libata
Message-Id: <160204083070.257875.3579468523934981224.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:15 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Sep 2020 06:13:10 +0200, Christoph Hellwig wrote:
> Switch the 85xx defconfigs from the soon to be removed legacy ide
> driver to libata.

Applied to powerpc/next.

[1/1] powerpc: switch 85xx defconfigs from legacy ide to libata
      https://git.kernel.org/powerpc/c/874dc62f548f28649ac3d7e31025b1e8cec3868a

cheers
