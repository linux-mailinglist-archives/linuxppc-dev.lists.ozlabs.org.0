Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FA2CEDF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 13:20:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnWy81TtTzDrHF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 23:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnWTz2XSkzDrQc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 22:59:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CnWTw27N8z9sWw; Fri,  4 Dec 2020 22:59:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20201127053738.10085-1-srikar@linux.vnet.ibm.com>
References: <20201127053738.10085-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Fix a regression on memoryless node 0
Message-Id: <160708314536.99163.11915004839253152045.b4-ty@ellerman.id.au>
Date: Fri,  4 Dec 2020 22:59:45 +1100 (AEDT)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Milan Mohanty <milmohan@in.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 27 Nov 2020 11:07:38 +0530, Srikar Dronamraju wrote:
> Commit e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
> offlines node 0 and expects nodes to be subsequently onlined when CPUs
> or nodes are detected.
> 
> Commit 6398eaa26816 ("powerpc/numa: Prefer node id queried from vphn")
> skips onlining node 0 when CPUs are associated with node 0.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/numa: Fix a regression on memoryless node 0
      https://git.kernel.org/powerpc/c/10f78fd0dabbc3856ddd67b09a46abdedb045913

cheers
