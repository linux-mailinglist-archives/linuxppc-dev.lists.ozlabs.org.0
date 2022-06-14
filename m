Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E586354A82B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 06:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMb9k66tBz3chS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 14:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ceAGhVIf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMb963rf1z3bbl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 14:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ceAGhVIf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMb944NfPz4xD2;
	Tue, 14 Jun 2022 14:31:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655181065;
	bh=hr6Ctk9teg9wJ7NmPejpZpdF6eQTJ3lDN+bxj57y4mI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ceAGhVIf4HvMyQjohaYpA6XwpPpQyXD0ZyC20Zf6So5wgQsF1u/DW00k8oFfE52rN
	 jJlviOXoTlbljjL2r1j4RNkWB6U4ssSzg5z2aGCX4I20v2w9bZBOGAKzQXfPNXPLy0
	 wEfwNMX49wCcySOKNXwRuaE2YN7r8Hcu4S/Cz0bkzB9Pdq/JmGDTK/Jc5gIgSBDr+m
	 KlntWH9Mtb3kVVdI6yFixVp9cx+H8034KDEOTYeY3o/3ZzbBvIIsCKW2aVk5d3W9aX
	 jnOMjvT5RA5q9YqhbouNPHcszNAD8OroI6pj4hf3BHEEeyWLvr6PbBY2OMnLGGPp0u
	 5hdi0BH5g+nZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
In-Reply-To: <20220613184830.GW25951@gate.crashing.org>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601160023.GV25951@gate.crashing.org>
 <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
 <d79992ce-d49b-314a-cb64-8804f43f6c03@csgroup.eu>
 <20220613184830.GW25951@gate.crashing.org>
Date: Tue, 14 Jun 2022 14:31:01 +1000
Message-ID: <875yl3dfy2.fsf@mpe.ellerman.id.au>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Sat, Jun 11, 2022 at 08:42:27AM +0000, Christophe Leroy wrote:
>> Le 10/06/2022 =C3=A0 05:32, Rohan McLure a =C3=A9crit=C2=A0:
>> > .macro ZERO_REGS start, end
>> > 	.Lreg=3D\start
>> > 	.rept (\end - \start + 1)
>> > 	li	.Lreg, 0
>> > 	.Lreg=3D.Lreg+1
>> > 	.endr
>> > .endm
>>=20
>> I'd have a preference for using a verb, for instance ZEROISE_REGS or=20
>> CLEAR_REGS
>
> "Zero" is a verb as well (as well as a noun and an adjective) :-)

And "clear" is also a verb and an adjective, though helpfully the noun
is "clearing" :D

We could use "nullify", that has some existing usage in the kernel,
although I don't really mind, "zeroise" sounds kind of cool :)

cheers
