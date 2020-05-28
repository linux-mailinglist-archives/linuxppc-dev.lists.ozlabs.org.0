Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0E1E60BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 14:26:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xn4T5vNmzDqZ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 22:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xn154cG6zDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 22:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QVgS1zFf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xn1363Fzz9sSF;
 Thu, 28 May 2020 22:23:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590668617;
 bh=hIKUVBa7d1wuMGALSM0shNFll3TSEEkKGOhFvLGz82Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QVgS1zFfMMqL1C0G1D9y0F8uEplEaqsZuG6w6vpbUDMY7yuD7IrhWYi5xmwJX831P
 U9xV7nTUP4uf6TqM8IrShFCPwUCUH0HlF5Cwan4ANsBrHF4Jdf6bCYvNzCFU3eHsL2
 xb2rEQhJzoACq34EZhmwPQcUwPZk5DlNJeXxWdk6ZPF10P/ucxOkda++nnMde1FhC4
 yP+E/UZsizfT/DXyA0Y1s+UTPjjRpQPNboTtorlYWOKyoL3goRsylVVdZqyRBe6/7V
 9kuzfkjLWza0P8eUO8Fae1QlcsAcKzpH6DAYA0AlXcw5yyN0BvCQDNDT1iVnXLl6lo
 +Y+3U/6Pms/oA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] powerpc/bpf: Enable bpf_probe_read{,
 str}() on powerpc again
In-Reply-To: <20200528091351.GE3529@linux-b0ei>
References: <20200527122844.19524-1-pmladek@suse.com>
 <87ftbkkh00.fsf@mpe.ellerman.id.au> <20200528091351.GE3529@linux-b0ei>
Date: Thu, 28 May 2020 22:23:56 +1000
Message-ID: <87d06ojlib.fsf@mpe.ellerman.id.au>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Brendan Gregg <brendan.d.gregg@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Petr Mladek <pmladek@suse.com> writes:
> On Thu 2020-05-28 11:03:43, Michael Ellerman wrote:
>> Petr Mladek <pmladek@suse.com> writes:
>> > The commit 0ebeea8ca8a4d1d453a ("bpf: Restrict bpf_probe_read{, str}() only
>> > to archs where they work") caused that bpf_probe_read{, str}() functions
>> > were not longer available on architectures where the same logical address
>> > might have different content in kernel and user memory mapping. These
>> > architectures should use probe_read_{user,kernel}_str helpers.
>> >
>> > For backward compatibility, the problematic functions are still available
>> > on architectures where the user and kernel address spaces are not
>> > overlapping. This is defined CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE.
>> >
>> > At the moment, these backward compatible functions are enabled only
>> > on x86_64, arm, and arm64. Let's do it also on powerpc that has
>> > the non overlapping address space as well.
>> >
>> > Signed-off-by: Petr Mladek <pmladek@suse.com>
>> 
>> This seems like it should have a Fixes: tag and go into v5.7?
>
> Good point:
>
> Fixes: commit 0ebeea8ca8a4d1d4 ("bpf: Restrict bpf_probe_read{, str}() only to archs where they work")
>
> And yes, it should ideally go into v5.7 either directly or via stable.
>
> Should I resend the patch with Fixes and
> Cc: stable@vger.kernel.org #v45.7 lines, please?

If it goes into v5.7 then it doesn't need a Cc: stable, and I guess a
Fixes: tag is nice to have but not so important as it already mentions
the commit that caused the problem. So a resend probably isn't
necessary.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


Daniel can you pick this up, or should I?

cheers

