Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A4461938
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 04:07:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpkM42tszDqB7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 12:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hng65kX2zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hng44xwMz9sP7; Mon,  8 Jul 2019 11:19:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c0b1b23b9c87569d5f90d06e86f26b31b544fa1e
In-Reply-To: <20190701143338.16824-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/mm/nvdimm: Add an informative message if we
 fail to allocate altmap block
Message-Id: <45hng44xwMz9sP7@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:44 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-07-01 at 14:33:38 UTC, "Aneesh Kumar K.V" wrote:
> Allocation from altmap area can fail based on vmemmap page size used. Add kernel
> info message to indicate the failure. That allows the user to identify whether they
> are really using persistent memory reserved space for per-page metadata.
> 
> The message looks like:
> [  136.587212] altmap block allocation failed, falling back to system memory
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c0b1b23b9c87569d5f90d06e86f26b31b544fa1e

cheers
