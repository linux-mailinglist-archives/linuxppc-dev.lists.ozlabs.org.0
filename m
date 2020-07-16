Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6354222579
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xSy051fzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQF6sFMzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4B6vQ94bmZz9sTh; Thu, 16 Jul 2020 22:56:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vQ92NLtz9sTm; Thu, 16 Jul 2020 22:56:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20200713052435.183750-1-sourabhjain@linux.ibm.com>
References: <20200713052435.183750-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v6] powerpc/fadump: fix race between pstore write and
 fadump crash trigger
Message-Id: <159490401653.3805857.8284745366151771293.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:16 +1000 (AEST)
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 hbathini@linux.ibm.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jul 2020 10:54:35 +0530, Sourabh Jain wrote:
> When we enter into fadump crash path via system reset we fail to update
> the pstore.
> 
> On the system reset path we first update the pstore then we go for fadump
> crash. But the problem here is when all the CPUs try to get the pstore
> lock to initiate the pstore write, only one CPUs will acquire the lock
> and proceed with the pstore write. Since it in NMI context CPUs that fail
> to get lock do not wait for their turn to write to the pstore and simply
> proceed with the next operation which is fadump crash. One of the CPU who
> proceeded with fadump crash path triggers the crash and does not wait for
> the CPU who gets the pstore lock to complete the pstore update.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fadump: fix race between pstore write and fadump crash trigger
      https://git.kernel.org/powerpc/c/ba608c4fa12cfd0cab0e153249c29441f4dd3312

cheers
