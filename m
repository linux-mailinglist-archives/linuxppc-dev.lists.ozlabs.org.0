Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C345D021
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 23:35:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzwnZ521fz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 09:35:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EpMGMGim;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzwmz4JVnz2xsh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 09:34:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EpMGMGim; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hzwmw4294z4xbC;
 Thu, 25 Nov 2021 09:34:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637793297;
 bh=VE6ywgXDc5ARYmbnjMdxfl9Cysjsei4YMDMFRtpcZs4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EpMGMGimlu+zzxOMdQEPMnAXhvMm8RLamGGMuiFBurebn0lzKi3C9NzMK5Azx8J2R
 Ff4Mu3yqv2IK5vQNV7XsWbTcZNnLEeAumtYW6ozjHUJcrOrS6481iKV0FlrdKrGMW1
 y9sncSGXfuYobI89Kk1Vfx3rwEtuFSntMxvmE6uzysakUYUrIQyGnqoden90/EvBwM
 TRRwZvQNslddpkLGHvCVQ6gQVwm7xyNznkHDeDtcWzXNehN1fo+guPCtt4qeGN8IrF
 9FWzPy8Ec81vJ0du1BY668GonvjvqQz3npz6CYA7VT/xtmEd3xLyHzswoZmSdi3CC+
 /zePjev5c1jHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, "Naveen N . Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
In-Reply-To: <cover.1635423081.git.christophe.leroy@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
Date: Thu, 25 Nov 2021 09:34:52 +1100
Message-ID: <87r1b5p4hf.fsf@mpe.ellerman.id.au>
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> This series implements livepatch on PPC32.
>
> This is largely copied from what's done on PPC64.
>
> Christophe Leroy (5):
>   livepatch: Fix build failure on 32 bits processors
>   powerpc/ftrace: No need to read LR from stack in _mcount()
>   powerpc/ftrace: Add module_trampoline_target() for PPC32
>   powerpc/ftrace: Activate HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32
>   powerpc/ftrace: Add support for livepatch to PPC32

I think we know patch 5 will need a respin because of the STRICT RWX vs
livepatching issue (https://github.com/linuxppc/issues/issues/375).

So should I take patches 2,3,4 for now?

cheers
