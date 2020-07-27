Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BF22E700
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:56:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFXDd4M9qzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:56:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWb66DDdzDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWb52cR4z9sTm; Mon, 27 Jul 2020 17:26:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200724105809.24733-1-srikar@linux.vnet.ibm.com>
References: <20200724105809.24733-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/numa: Limit possible nodes to within
 num_possible_nodes
Message-Id: <159583478336.602200.18251206166089177032.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:56 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 16:28:09 +0530, Srikar Dronamraju wrote:
> MAX_NUMNODES is a theoretical maximum number of nodes thats is supported
> by the kernel. Device tree properties exposes the number of possible
> nodes on the current platform. The kernel would detected this and would
> use it for most of its resource allocations.  If the platform now
> increases the nodes to over what was already exposed, then it may lead
> to inconsistencies. Hence limit it to the already exposed nodes.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/numa: Limit possible nodes to within num_possible_nodes
      https://git.kernel.org/powerpc/c/dbce456280857f329af9069af5e48a9b6ebad146

cheers
