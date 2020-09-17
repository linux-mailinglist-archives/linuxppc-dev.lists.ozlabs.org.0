Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E0C26DABF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsb012wNTzDqGQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:51:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSW73CTzDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSW22w3z9sVN; Thu, 17 Sep 2020 21:27:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ac8da0e3baa91dda805e1e492fd65aecd90c1fb5.1597643156.git.christophe.leroy@csgroup.eu>
References: <ac8da0e3baa91dda805e1e492fd65aecd90c1fb5.1597643156.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1] powerpc/process: Replace an #ifdef CONFIG_PPC_47x by
 IS_ENABLED()
Message-Id: <160034201470.3339803.3613969304863849846.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:23 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Aug 2020 05:46:41 +0000 (UTC), Christophe Leroy wrote:
> isync() is always defined, no need for an #ifdef.
> 
> Replace it by IS_ENABLED(CONFIG_PPC_47x).

Applied to powerpc/next.

[1/1] powerpc/process: Replace an #ifdef CONFIG_PPC_47x by IS_ENABLED()
      https://git.kernel.org/powerpc/c/04d476bfbb06426fef2985c8e53578bb04596a6f

cheers
