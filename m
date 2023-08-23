Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFCD78505C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 08:09:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GFCnvMBq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwlm0kBxz3c12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 16:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GFCnvMBq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwkw5NCXz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 16:08:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770920;
	bh=HCRf0bYitUgJeoYadT30o4Zk+mj/zJgeLxF71JImRUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GFCnvMBqQ9inmxKAjf96S7+//Z9WNjbTaQP69TIaeMNHJ65k0waZvcUz2DBlnLsg+
	 mvyUbdPXSNsg5o/meCvX/NlJk5xwKYKegp7C2ZR71n0xDxDOYgffGwbmHpc1+Fjr/Q
	 +C8LvaU2skkBxVM3uHTCZj8l0G8xa0/wCbupV2rz4dCUSlK65n4mUmxJy9DMoqYZ3/
	 ynP52v9TTKhlE9e949ZztF9Vke09uRhyjNsNAYKqqZm+IZhYMi0P5HZMwyQN9AVJfX
	 zdOfuVWxW8K0fnS0oH4BmlskBmQsevNvF5NoR/hO/N2mvP6/Wmvml4o6UO1+vsBr1l
	 InorIjv7oXL+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwkw1zKjz4wxn;
	Wed, 23 Aug 2023 16:08:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
In-Reply-To: <2023082218-pecan-chef-e4bc@gregkh>
References: <20230818145826.00c7ead1@canb.auug.org.au>
 <2023082218-pecan-chef-e4bc@gregkh>
Date: Wed, 23 Aug 2023 16:08:39 +1000
Message-ID: <87sf8auw7s.fsf@mail.lhotse>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <greg@kroah.com> writes:
> On Fri, Aug 18, 2023 at 02:58:26PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Today's linux-next merge of the tty tree got a conflict in:
>> 
>>   arch/powerpc/include/asm/fs_pd.h
>> 
>> between commits:
>> 
>>   e6e077cb2aa4 ("powerpc/include: Declare mpc8xx_immr in 8xx_immap.h")
>>   fecc436a97af ("powerpc/include: Remove mpc8260.h and m82xx_pci.h")
>>   fbbf4280dae4 ("powerpc/8xx: Remove immr_map() and immr_unmap()")
>>   7768716d2f19 ("powerpc/cpm2: Remove cpm2_map() and cpm2_unmap()")
>> 
>> from the powerpc tree and commit:
>> 
>>   c2d6c1b4f034 ("serial: cpm_uart: Use get_baudrate() instead of uart_baudrate()")
>> 
>> from the tty tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> Note that after all the above are applied, it looks like this file can
>> be removed completely as nothing in the tree includes it any more.
>
> Thanks for the notice, I'll let the ppc developers remove it as it's in
> their tree.

Ack.

cheers
