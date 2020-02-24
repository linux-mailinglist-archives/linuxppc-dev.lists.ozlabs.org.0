Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895416A495
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 12:05:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QzkM4Xs6zDqSY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 22:05:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QzhS1RSzzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 22:03:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GeJYJdfx; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48QzhR4VK7z9sP7;
 Mon, 24 Feb 2020 22:03:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582542231;
 bh=fcegNANegdW2YGsHf2YhTSfHu8ZoUriijsKGVDkpJkk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GeJYJdfxpOoFGlB8YLIbSJjvq3RNTaOgQERNOfzq3FWxcGrrp1eSTaoWmGVFfVLUy
 603Yj6egKJ5TlIb+t/OyDIar3vLlKtldxoXdPulBSnJjXTyyJdDVv7GAvMS6Dj/hRd
 30d31clZHjOuhyZ7ySv5EzzU8mdbLlG3Nds+CaLCwasiAYpEW5wppNxhixJg39u8GW
 lrc+9SA637DRNRPoBtjb1rdy+tUsG+rHc221zy2XHQyxpbPCJ4PQuD6AsFzbAqfLUc
 qlxSWfOp73cbNcsKRIDs7vBv5TwhceitHmt0jvZQM6+b+nJSuabSfyH13smMVe9FGt
 a9Ftpwiq7DH2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Include .BTF section
In-Reply-To: <1582516561.ya4ydk7t7x.naveen@linux.ibm.com>
References: <20200220113132.857132-1-naveen.n.rao@linux.vnet.ibm.com>
 <8736b0j090.fsf@mpe.ellerman.id.au>
 <1582516561.ya4ydk7t7x.naveen@linux.ibm.com>
Date: Mon, 24 Feb 2020 22:03:51 +1100
Message-ID: <87zhd8z1pk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Michael Ellerman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>> Selecting CONFIG_DEBUG_INFO_BTF results in the below warning from ld:
>>>   ld: warning: orphan section `.BTF' from `.btf.vmlinux.bin.o' being placed in section `.BTF'
>>>
>>> Include .BTF section in vmlinux explicitly to fix the same.
>> 
>> I don't see any other architectures doing this in their linker script.
>> Why are we special?
>
> I think this is due to commit 83a092cf95f28 ("powerpc: Link warning for 
> orphan sections"):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=83a092cf95f28

Oh haha, right :}

> PS: I also see a linker warning for '.gnu.hash' if I enable 
> CONFIG_RELOCATABLE, but I couldn't decipher what that was for, and if it 
> should be retained.

Yeah, Joel tried to remove it but it caused breakage:

  https://lore.kernel.org/linuxppc-dev/87d0pwqweg.fsf@concordia.ellerman.id.au/


I never got around to looking at it.

cheers
