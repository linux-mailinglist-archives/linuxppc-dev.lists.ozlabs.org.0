Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4902DFB74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:21:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzxqN4SyBzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxR63zSczDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR61Qksz9sW0; Mon, 21 Dec 2020 22:03:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20201211145954.90143-1-ldufour@linux.ibm.com>
References: <20201211145954.90143-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/memhotplug: quieting some DLPAR operations
Message-Id: <160854857884.1696279.4074633690507075582.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:29 +1100 (AEDT)
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, paulus@samba.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Dec 2020 15:59:54 +0100, Laurent Dufour wrote:
> When attempting to remove by index a set of LMB a lot of messages are
> displayed on the console, even when everything goes fine:
> 
>  pseries-hotplug-mem: Attempting to hot-remove LMB, drc index 8000002d
>  Offlined Pages 4096
>  pseries-hotplug-mem: Memory at 2d0000000 was hot-removed
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/memhotplug: Quieten some DLPAR operations
      https://git.kernel.org/powerpc/c/20e9de85edae3a5866f29b6cce87c9ec66d62a1b

cheers
