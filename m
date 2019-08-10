Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5988AD2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 12:37:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465JSn4HLgzDqXt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 20:36:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465J663RGRzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 20:20:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 465J6516RDz9sNx; Sat, 10 Aug 2019 20:20:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e7de4f7b64c23e503a8c42af98d56f2a7462bd6d
In-Reply-To: <20190503075253.22798-1-ajd@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/powernv: Restrict OPAL symbol map to only be
 readable by root
Message-Id: <465J6516RDz9sNx@ozlabs.org>
Date: Sat, 10 Aug 2019 20:20:44 +1000 (AEST)
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-05-03 at 07:52:53 UTC, Andrew Donnellan wrote:
> Currently the OPAL symbol map is globally readable, which seems bad as it
> contains physical addresses.
> 
> Restrict it to root.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Cc: Stewart Smith <stewart@linux.ibm.com>
> Fixes: c8742f85125d ("powerpc/powernv: Expose OPAL firmware symbol map")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/e7de4f7b64c23e503a8c42af98d56f2a7462bd6d

cheers
