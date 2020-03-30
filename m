Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD919762C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:06:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQ520YzdzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rQ2w6D9NzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:04:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EnDlkKcL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48rQ2v5hYmz9sPk;
 Mon, 30 Mar 2020 19:04:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585555448;
 bh=UEqraPxWZNMFx5fHfH7tIq3y+zDn+e9FvroX/7SOtOY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EnDlkKcLlbAbJLDWOjVc5qVM7tXpkLgrsGq89J8CccIFT2Nap0ukO8RWbj+Jp1YTq
 EWHcNOMOJ2dpbS1RyRL5Y1/y9xc+giTT/849l4uOpSZbYHGDSkAcR8+xYnIC8u04xI
 rYt8FQSHJkBhIJ7Z2Ml+i1EogXySuzoaEddN6WWk2nxzQCb1U/e0miceaKWsuOSqc+
 Mx6Lk4/zhhWSEckEdFgsXLKq+Z/fETWToLrsbjS8MtOSIRJ7H6RWFgFzVH7GNBmw3+
 lPqb6vvS4hLRrnCCQnmDsLLmB6H2btMDiZMaZMriLmP/+KPzZsAxEkQsXbxPOh2OR5
 jBZVYwGyz5UtQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <20200330074823.GA14624@zn.tnic>
References: <20200330143529.4dafeb34@canb.auug.org.au>
 <CAMe9rOqnRCEdHhSHOT=Ut11D3O2WhjiFYhvPnaU5dANZNPE-=A@mail.gmail.com>
 <20200330150819.7f0199a2@canb.auug.org.au> <20200330074823.GA14624@zn.tnic>
Date: Mon, 30 Mar 2020 19:04:16 +1100
Message-ID: <87wo72uv3z.fsf@mpe.ellerman.id.au>
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
Cc: "H.J. Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@suse.de> writes:
> On Mon, Mar 30, 2020 at 03:08:19PM +1100, Stephen Rothwell wrote:
>> What you really need is an Ack from the PowerPC people for the fix you
>> suggested and then tha fix should go in the same series that is now
>> causing the failure (preferably before the problematic (for PowerPC)
>> patch.
>
> I'll zap this commit from the tip lineup. There's always another merge
> window.

Or just squash the hunk Stephen posted into the commit, which is what I
thought would happen to begin with.

You can have my ack for it:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
