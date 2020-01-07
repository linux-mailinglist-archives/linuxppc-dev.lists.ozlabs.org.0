Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC99131EA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 05:26:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sK7w661MzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 15:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sK5Z5KjYzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 15:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="JTC16qCc"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47sK5Y66j8z9sRG;
 Tue,  7 Jan 2020 15:24:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578371058;
 bh=VKOMCJ/k8+UtH9oQhQ+1uTXrYkuBzN9DP/SBN9pafhE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JTC16qCcquUWB7B8ZJ6iZwqiOveDKFP+MMW8bhOL2eZ9AYzh3VDHNv8s1SfcBYLhI
 o2TiSvd809hXUWZG6tI4dZSeyUnHKlGWKTe6x20e/TDNE6HGQfkroXkgDUVzPc0/lL
 OMVEqoAGVbmCUnBJLapjApZRZXXmZazUl5HSzBCxkshdZ1TwUsnOctoPrtVoQU6G/t
 Gv68pEjviqn/pRW5pjtnOmgdoNJ1shv0y7IfkvOFKaSYCKMydI2egqP/3HbGSLowoL
 c+xML1bKUAPR17KBqc9gj1E3KMTF5oWDEG/IXiVQlZyKtuzQ3JvdG9o9yk5HmlcX04
 ApANEflE9aSYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] powerpc: add support for folded p4d page tables
In-Reply-To: <20200106060217.GA5444@rapoport-lnx>
References: <20191209150908.6207-1-rppt@kernel.org>
 <20200102081059.GA12063@rapoport-lnx> <87v9ppi7ky.fsf@mpe.ellerman.id.au>
 <20200106060217.GA5444@rapoport-lnx>
Date: Tue, 07 Jan 2020 15:24:15 +1100
Message-ID: <87tv5728sw.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Rapoport <rppt@kernel.org> writes:
> On Mon, Jan 06, 2020 at 02:31:41PM +1100, Michael Ellerman wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> > Any updates on this?
>> 
>> It's very ... big, and kind of intrusive.
>
> I've tried to split it to several smaller ones, but I couldn't find a way
> to do it without breaking bisectability.

Yeah I didn't necessarily mean splitting it, it's just a lot of churn.

It seems to break qemu mac99 booting pmac32 defconfig, haven't had time
to look any further:

  Loading compiled-in X.509 certificates
  rtc-generic rtc-generic: setting system clock to 2020-01-07T02:42:59 UTC (1578364979)
  BUG: Unable to handle kernel unaligned access at 0xf10af004
  Faulting instruction address: 0xc01cc6c4
  Vector: 600 (Alignment) at [ef0b5de0]
      pc: c01cc6c4: f_dupfd+0x6c/0xb8
      lr: c01cc698: f_dupfd+0x40/0xb8
      sp: ef0b5e98
     msr: 9032
     dar: f10af004
   dsisr: 40000140
    current = 0xef0b0000
      pid   = 1, comm = swapper
  Linux version 5.5.0-rc2+ (michael@alpine1-p1) (gcc version 9.2.1 20191127 (Ubuntu 9.2.1-20ubuntu3)) #8 Tue Jan 7 13:38:04 AEDT 2020
  enter ? for help
  [ef0b5eb8] c000550c console_on_rootfs+0x44/0x90
  [ef0b5ed8] c090d7c0 kernel_init_freeable+0x1a4/0x24c
  [ef0b5f18] c0005770 kernel_init+0x18/0x108
  [ef0b5f38] c0017274 ret_from_kernel_thread+0x14/0x1c
  FAIL! Booting BE pmac32


cheers
