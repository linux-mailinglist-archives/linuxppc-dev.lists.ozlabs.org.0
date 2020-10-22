Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2F295612
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 03:27:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGqTw5zdXzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 12:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGqSM1kcVzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 12:25:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=khduU1Fe; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGqSL1NcTz9sSs;
 Thu, 22 Oct 2020 12:25:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603329954;
 bh=68bf+e7qgn9t6IspaKKAZFvKbPtMo54nW9Tq19GmrbI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=khduU1FeaFRXgpJ3UXiPb7TvY+L++QDEWMpSX0nJHI3xNpJBflpHKVyiuaVJtoExu
 gYiZHKQoXXtwouww9L250il4qTK3ZmkmFgNyny9vR8zS4NfdQTfciHAz3chdxfptUd
 UxooONT3sjJF2O7L/ZYsYrdhr7I8KAvdGMv09x6KUdNNmJ7oBnk1jMxg5tBk6jO5Fb
 6ln3ttRIEQgDnlGUNNrhMImgLdHd1tBCjNmkJthpvca9qRmIJossHwiAwAGrLceeSY
 +PQqnqFeALRoS+Rs33sA0nnRGl2BhnsS5hyFF1wtdVJM3mIPeqgqk1MjtAlENrGUop
 5mQ8ulvVVhe3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 5/5] powerpc/perf: use regs->nip when siar is zero
In-Reply-To: <6ad49bc4-6fc8-0cb9-2228-3da9fea3f0dc@csgroup.eu>
References: <20201021085329.384535-1-maddy@linux.ibm.com>
 <20201021085329.384535-5-maddy@linux.ibm.com>
 <6ad49bc4-6fc8-0cb9-2228-3da9fea3f0dc@csgroup.eu>
Date: Thu, 22 Oct 2020 12:25:49 +1100
Message-ID: <87r1prxd9e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 21/10/2020 =C3=A0 10:53, Madhavan Srinivasan a =C3=A9crit=C2=A0:
>> In power10 DD1, there is an issue where the
>> Sampled Instruction Address Register (SIAR)
>> not latching to the sampled address during
>> random sampling. This results in value of 0s
>> in the SIAR. Patch adds a check to use regs->nip
>> when SIAR is zero.
>
> Why not use regs->nip at all time in that case, and not read SPRN_SIAR at=
 all ?

Yeah that's a reasonable question.

I can't really find anywhere in the ISA that explains it.

I believe the main (or only?) reason is that interrupts might be
disabled when the PMU samples the instruction. So in that case the SIAR
will point at an instruction somewhere in interrupts-off code, whereas
the NIP will point to the location where we re-enabled interrupts and
took the PMU interrupt.

cheers
