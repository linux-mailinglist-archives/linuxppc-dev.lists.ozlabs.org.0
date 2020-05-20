Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B71DA8FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 06:13:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RfWj699VzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:13:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RfTP1GV3zDqFw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 14:11:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N2H1cxAL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49RfTK2DY8z9sT4;
 Wed, 20 May 2020 14:11:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589947912;
 bh=CvJ3PF6B7+bNDUTi33BJP3o11iVrkVe5hGPX18ByTpE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N2H1cxALj2tLLncIbgwqV7zn0zdLskGE79O/J/FdQ+Avz3bOQIH5qs7fua7VfGtDo
 vzGTdKO7GYA+lfQ9W6YqagcU1SZaFpXthL1fzyM5HDk1Kt2HFV5cmdu2KJFkQcGXl/
 cQKFAUlhllHPb1rb6t5CcHndGdB0FmmBOLcdSFvurDYyfOHcgLJb4NbFp91oAM4wFJ
 gVzxy+g34zQ+6Hq/0fITUO/H58IxkQKkQGdqfjmlpf0LqPLdbBeip9tw3ylM7EEoEC
 m5HYiMultHvUMa2SRJwXk0wxqoTqu7nGoQ3r1mq0XIOqFuID6Tndfx39dWA6ZepLna
 b1/yd1OSLJlww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
In-Reply-To: <20200519172316.3b37cbae@canb.auug.org.au>
References: <20200519172316.3b37cbae@canb.auug.org.au>
Date: Wed, 20 May 2020 14:12:09 +1000
Message-ID: <87lfln8cti.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the rcu tree got a conflict in:
>
>   arch/powerpc/kernel/traps.c
>
> between commit:
>
>   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
>
> from the powerpc tree and commit:
>
>   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
>
> from the rcu tree.
>
> I fixed it up (I used the powerpc tree version for now) and can carry the
> fix as necessary.

OK, I guess that works for now, we'll have to clean it up later once
both trees are merged upstream.

I created an issue to track it:
  https://github.com/linuxppc/issues/issues/298

cheers
