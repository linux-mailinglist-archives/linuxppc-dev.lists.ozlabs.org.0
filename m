Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023C1F33FE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:17:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0KT5QC4zDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFL3xL1zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFL0WpHz9sV2; Tue,  9 Jun 2020 15:29:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Michael Neuling <mikey@neuling.org>
In-Reply-To: <20200528230731.1235752-1-mikey@neuling.org>
References: <20200528230731.1235752-1-mikey@neuling.org>
Subject: Re: [PATCH] powerpc: Fix misleading small cores print
Message-Id: <159168034354.1381411.1178658127765747776.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:09 +1000 (AEST)
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 May 2020 09:07:31 +1000, Michael Neuling wrote:
> Currently when we boot on a big core system, we get this print:
>   [    0.040500] Using small cores at SMT level
> 
> This is misleading as we've actually detected big cores.
> 
> This patch clears up the print to say we've detect big cores but are
> using small cores for scheduling.

Applied to powerpc/next.

[1/1] powerpc: Fix misleading small cores print
      https://git.kernel.org/powerpc/c/82a7cebdd95cffa55449d6c1d97cc9b743a66056

cheers
