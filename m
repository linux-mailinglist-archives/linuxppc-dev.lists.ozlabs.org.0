Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E79CD65500
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 13:11:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ktdr16GbzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 21:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ktbc0BxRzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 21:09:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ktbY11hWz9sBt;
 Thu, 11 Jul 2019 21:08:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sven Schnelle <svens@stackframe.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3 5/7] kexec_elf: remove elf_addr_to_cpu macro
In-Reply-To: <20190710180518.GA6343@t470p.stackframe.org>
References: <20190710142944.2774-1-svens@stackframe.org>
 <20190710142944.2774-6-svens@stackframe.org>
 <49206784-009c-391b-5f9a-11e9b1de930b@c-s.fr>
 <20190710180518.GA6343@t470p.stackframe.org>
Date: Thu, 11 Jul 2019 21:08:51 +1000
Message-ID: <871rywhlq4.fsf@concordia.ellerman.id.au>
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
Cc: kexec@lists.infradead.org, deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sven Schnelle <svens@stackframe.org> writes:
> On Wed, Jul 10, 2019 at 05:09:29PM +0200, Christophe Leroy wrote:
>> Le 10/07/2019 =C3=A0 16:29, Sven Schnelle a =C3=A9crit=C2=A0:
>> > It had only one definition, so just use the function directly.
>>=20
>> It had only one definition because it was for ppc64 only.
>> But as far as I understand (at least from the name of the new file), you
>> want it to be generic, don't you ? Therefore I get on 32 bits it would be
>> elf32_to_cpu().
>
> That brings up the question whether we need those endianess conversions. =
I would
> assume that the ELF file has always the same endianess as the running ker=
nel. So
> i think we could just drop them. What do you think?

We should be able to kexec from big to little endian or vice versa, so
they are necessary.

cheers
