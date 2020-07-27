Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41222EA7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 12:55:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFcCl0MhszF132
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 20:55:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFc9z45jxzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 20:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eRLlt8tq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFc9z0qXCz9sPf;
 Mon, 27 Jul 2020 20:53:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595847239;
 bh=Jl5P2R8EW87UhiFOPA+lLYHDbsVjgelW9j/0I9L9CHU=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=eRLlt8tqJtz/yvxG2YnEXu6zRhmFdn3PX68KW4UosOCua6GpdLgFiTCgu13TgSi/8
 gAnETyZLg7vQU1MGR4ZhkrKSNU0efkfrYnqSIcYhDaitOUojjSKjAX3CzvH/JmZIkU
 YfRIgE8sFKbMzdML8w7JesFQaY9N09/t6cC3kmAqNfV2iNtuft71xBsWR835zNR6hw
 ECTpX9x0PS0naRvznJunHNt+/tY/58z27pOGABiNAu10TB9LiiF+9VF9yvz9+ewhfB
 G0aJVnyyOdXSTawx1q74r0V8Zyc6P2wB8JXNidNrMt/Nu1lCUD+tBivynhAHpJYUFO
 4XWNuYurxdR/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v2 01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
In-Reply-To: <159583477725.602200.17371356742597086381.b4-ty@ellerman.id.au>
References: <20200722042628.1425880-1-oohall@gmail.com>
 <159583477725.602200.17371356742597086381.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 20:53:56 +1000
Message-ID: <87pn8h6xff.fsf@mpe.ellerman.id.au>
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

Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> On Wed, 22 Jul 2020 14:26:15 +1000, Oliver O'Halloran wrote:
>> This function is a one line wrapper around eeh_phb_pe_create() and despite
>> the name it doesn't create any eeh_dev structures. Replace it with direct
>> calls to eeh_phb_pe_create() since that does what it says on the tin
>> and removes a layer of indirection.
>
> Applied to powerpc/next.
>
> [01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
>         https://git.kernel.org/powerpc/c/475028efc708880e16e61cc4cbbc00af784cb39b

Something weird happened with the "thanks" script. Pretty sure I applied v3.

I think I applied this version previously and the script just matched
the subjects?

Anyway, ignore this mail.

cheers
