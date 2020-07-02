Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D665D211773
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 02:51:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y00Y0z9GzDqk8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xzyg60wYzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 10:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TV/s7SwR; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49xzyg1Tkwz9sRN; Thu,  2 Jul 2020 10:50:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49xzyg00yBz9sQt;
 Thu,  2 Jul 2020 10:50:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593651003;
 bh=tghBpeUpVINCwtUmSl/NQWv8E/Z1QkKXA55tz9AjbQI=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=TV/s7SwRAIeAm4eY55KN6G3Xey1ukp48LLrLtLrp4gFKdMppdf2fTfHLBIpd4i/XS
 a6hWc0SoW7n3AcN+j2/uWVHR5GBJFeQk2DstBlfRWvlhiGzk+iupQLJxfNSPW2OGWs
 uyQ4GBNyNs4VT+MXRlUpagJhSSi7E0YgMq9iK9XpbE2E+voxXC/Gtf8BUxA09MDBJ6
 mZnZzWmaBa+ZS0I6OT6lErMhJCLtug+yjyvnGp2dRRpHzMAT3uMLnRKtvdDXMK/8AI
 lHiv6/zwfTS7QLPTAQBtYCSCP9TadKzSudZ227mZmiuwDzaqoEhGb0+nYGs61zxkrU
 bgjKyjojZukSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linuxppc-dev\@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: Memory:  880608K/983040K  .... 36896K reserved ?
In-Reply-To: <a598dcaea9e62379c74d1d78083d92898373c4de.camel@infinera.com>
References: <a598dcaea9e62379c74d1d78083d92898373c4de.camel@infinera.com>
Date: Thu, 02 Jul 2020 10:52:15 +1000
Message-ID: <87tuyq7n7k.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
> I cannot figure out how the xxxK reserved item works in:
>  Memory: 880608K/983040K available (9532K kernel code, 1104K rwdata, 3348K rodata, 1088K init, 1201K bss, 36896K reserved ...

It's calculated as:

	(physpages - totalram_pages() - totalcma_pages)

The naming is a bit historical I guess.

But roughly physpages is the total number of pages of RAM we think exist
in the system.

totalram_pages() is the total number of pages that have been freed to
the buddy allocator.

totalcma_pages is pages used by CMA which is probably 0 for you.

So the amount "reserved" is the memory that hasn't been freed to the
buddy allocator by memblock.

You should be able to see it in debugfs:

# cat /sys/kernel/debug/memblock/reserved 
   0: 0x0000000000000000..0x0000000002b40e57
   1: 0x0000000002b41000..0x0000000002b413ff
   2: 0x0000000002b50000..0x0000000002baffff
   3: 0x000000000a910000..0x000000000e93ffff
   4: 0x000000000fe80000..0x000000000fe9ffff
   5: 0x000000000feac000..0x000000000ffebfff
   6: 0x000000000ffed400..0x000000000ffed7ff
   7: 0x000000000ffeda80..0x000000000ffeebff
   8: 0x000000000ffeee80..0x000000000ffeffff
   9: 0x000000000fff0280..0x000000000fff13ff
   ...

> Is there a way to tune(lower it) this memory?

Some or most of those reserved regions will be things your firmware told
you to reserve, so you need to work out what each region is. They might
be firmware things, or even holes in RAM, you need to dig deeper to find
out what is what.

cheers
