Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B76701903C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:02:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mbdD5vXDzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mbYL5Jv6zDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:58:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RkSyeq37; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mbYL0THpz9sSH;
 Tue, 24 Mar 2020 13:58:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585018726;
 bh=pnaqBz7SMoS7pSvgsxbi1WyrO4gR9k0CpdIGUOxniwo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RkSyeq37dNPZcWz0cypFRYwcF2tGvvW0waQY72B/meCEufwTOLM1Qu88/i/CYD7i/
 +gzGhXID3yNfxlEySaJADWHv9zklwkQ0dc7bcuUHbPBu5uhChta5cept5NlGSAKHb7
 hz9cgBUX4lMtdnNNXYTI/nd3c8r9PPQbc2Lmz5/XxmNU0pSQkygvlAPZx9zObwouSZ
 VIaDsGBPAKDYFzbH4ogMtXsnzR50yg2bNhbW1dI5VLin8/Xql22c4fygTCOHQLzGey
 Bi14dmz22uX7fzXrMaHb77FfbFghk52uTTap1JJtfk/Je2gMoBoGe5xZ7q8RMrLz+L
 438AD5gqyPzkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc: Use a datatype for instructions
In-Reply-To: <1584956855.oidzv2r2fr.astroid@bobo.none>
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-4-jniethe5@gmail.com>
 <1584944554.pe2tzckmyl.astroid@bobo.none>
 <CACzsE9qy7dUv+sbcCN-i0EeYiH=DacutULunpBdgV0h8D0m2yQ@mail.gmail.com>
 <1584956855.oidzv2r2fr.astroid@bobo.none>
Date: Tue, 24 Mar 2020 13:58:51 +1100
Message-ID: <87369yzces.fsf@mpe.ellerman.id.au>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Jordan Niethe's on March 23, 2020 7:28 pm:
>> On Mon, Mar 23, 2020 at 5:27 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>>> Jordan Niethe's on March 20, 2020 3:17 pm:
>>> > Currently unsigned ints are used to represent instructions on powerpc.
>>> > This has worked well as instructions have always been 4 byte words.
>>> > However, a future ISA version will introduce some changes to
>>> > instructions that mean this scheme will no longer work as well. This
>>> > change is Prefixed Instructions. A prefixed instruction is made up of a
>>> > word prefix followed by a word suffix to make an 8 byte double word
>>> > instruction. No matter the endianess of the system the prefix always
>>> > comes first. Prefixed instructions are only planned for powerpc64.
>>> >
>>> > Introduce a ppc_inst type to represent both prefixed and word
>>> > instructions on powerpc64 while keeping it possible to exclusively have
>>> > word instructions on powerpc32, A latter patch will expand the type to
>>> > include prefixed instructions but for now just typedef it to a u32.
>>> >
>>> > Later patches will introduce helper functions and macros for
>>> > manipulating the instructions so that powerpc64 and powerpc32 might
>>> > maintain separate type definitions.
>>>
>>> ppc_inst_t I would slightly prefer for a typedef like this.
>> Are _t types meant to be reserved?
>
> No, just convention that structs are not normally typedefed unless
> they are a pervasive interface that gets passed around a lot but
> does not get accessed without accessor functions much. When you do
> typedef them, add a _t (or less frequently _s/_u/etc). pte_t,
> cpumask_t, atomic_t.

Ideally we wouldn't use a typedef, we'd just have:

struct ppc_inst {
	u32 val;
#ifdef CONFIG_PPC64
        u32 suffix;
#endif
};

That may make the conversion harder though, because you more or less
have to update all usages at once.

cheers
