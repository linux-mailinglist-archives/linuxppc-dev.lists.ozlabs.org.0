Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C19FB2DAB77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:54:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFWS6WLnzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP31bwHzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:48:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP306HYz9sSn; Tue, 15 Dec 2020 21:48:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <8a4ffe4798e9ea32aaaccdf85e411bb1beed3500.1605542955.git.christophe.leroy@csgroup.eu>
References: <8a4ffe4798e9ea32aaaccdf85e411bb1beed3500.1605542955.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Handle PROTFAULT in hash_page() also for
 CONFIG_PPC_KUAP
Message-Id: <160802920749.504444.12908339583780328287.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:48:54 +1100 (AEDT)
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

On Mon, 16 Nov 2020 16:09:31 +0000 (UTC), Christophe Leroy wrote:
> On hash 32 bits, handling minor protection faults like unsetting
> dirty flag is heavy if done from the normal page_fault processing,
> because it implies hash table software lookup for flushing the entry
> and then a DSI is taken anyway to add the entry back.
> 
> When KUAP was implemented, as explained in commit a68c31fc01ef
> ("powerpc/32s: Implement Kernel Userspace Access Protection"),
> protection faults has been diverted from hash_page() because
> hash_page() was not able to identify a KUAP fault.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32s: Handle PROTFAULT in hash_page() also for CONFIG_PPC_KUAP
      https://git.kernel.org/powerpc/c/1b03e71ff6f2bd10b45a0128ce76e0e42014a44c

cheers
