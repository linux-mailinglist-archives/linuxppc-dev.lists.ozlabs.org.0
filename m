Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4B22E6B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:38:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWqv3HJczDr9w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:38:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWZw6kHszDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZw3Xqrz9sTV; Mon, 27 Jul 2020 17:26:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Finn Thain <fthain@telegraphics.com.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <cover.1593318192.git.fthain@telegraphics.com.au>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
Subject: Re: [PATCH 0/9] Macintosh II ADB driver fixes
Message-Id: <159583478319.602200.6930356633424802467.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:48 +1000 (AEST)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 28 Jun 2020 14:23:12 +1000, Finn Thain wrote:
> Various issues with the via-macii driver have become apparent over the
> years. Some examples:
> 
>  - A Talk command response can be lost. This can result in phantom devices
> being probed or an incorrect device handler ID being retrieved.
> 
>  - A reply packet containing a null byte can get truncated. Such packets
> are sometimes generated by ADB keyboards.
> 
> [...]

Applied to powerpc/next.

[1/9] macintosh/via-macii: Access autopoll_devs when inside lock
      https://git.kernel.org/powerpc/c/59ea38f6b3af5636edf541768a1ed721eeaca99e
[2/9] macintosh/via-macii: Poll the device most likely to respond
      https://git.kernel.org/powerpc/c/f93bfeb55255bddaa16597e187a99ae6131b964a
[3/9] macintosh/via-macii: Handle /CTLR_IRQ signal correctly
      https://git.kernel.org/powerpc/c/b4d76c28eca369b8105fe3a0a9f396e3fbcd0dd5
[4/9] macintosh/via-macii: Remove read_done state
      https://git.kernel.org/powerpc/c/b16b67689baa01a5616b651356df7ad3e47a8763
[5/9] macintosh/via-macii: Handle poll replies correctly
      https://git.kernel.org/powerpc/c/624cf5b538b507293ec761797bd8ce0702fefe64
[6/9] macintosh/via-macii: Use bool type for reading_reply variable
      https://git.kernel.org/powerpc/c/f87a162572c9f7c839a207c7de6c73ffe54a777c
[7/9] macintosh/via-macii: Use unsigned type for autopoll_devs variable
      https://git.kernel.org/powerpc/c/5c0c15a1953a7de2878d7e6f5711fd3322b11faa
[8/9] macintosh/via-macii: Use the stack for reset request storage
      https://git.kernel.org/powerpc/c/046ace8256489f32740da07de55a913ca09ce5cf
[9/9] macintosh/via-macii: Clarify definition of macii_init()
      https://git.kernel.org/powerpc/c/3327e58a04501e06aa531cdb4044aab214a6254a

cheers
