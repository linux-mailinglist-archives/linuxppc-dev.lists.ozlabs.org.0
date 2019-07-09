Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A705962F4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 06:20:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jTdd19w5zDqQC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:20:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jTbx0FfYzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 14:19:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45jTbs6PjQz9s7T;
 Tue,  9 Jul 2019 14:19:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>, kexec@lists.infradead.org,
 Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH using git format-patch -C] kexec: add generic support for
 elf kernel images
In-Reply-To: <e016c0bb-c857-b78c-a159-120e42d0db03@c-s.fr>
References: <20190708100624.EBCDF68DB2@pc17473vm.idsi0.si.c-s.fr>
 <e016c0bb-c857-b78c-a159-120e42d0db03@c-s.fr>
Date: Tue, 09 Jul 2019 14:19:21 +1000
Message-ID: <87pnmjhmba.fsf@concordia.ellerman.id.au>
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
Cc: deller@gmx.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Hi Sven,
>
> Le 08/07/2019 =C3=A0 12:06, Christophe Leroy a =C3=A9crit=C2=A0:
>> From: Sven Schnelle <svens@stackframe.org>
>
> Please describe you patch.
>
> All the changes you are doing to the ppc64 version in order to make it=20
> generic should be described.
>
> Those changes are also maybe worth splitting the patch in several parts,=
=20
> either preparing the ppc64 for generic then moving to kernel/kexec_elf.c=
=20
> or moving to kernel/kexec_elf.c without modifications, then modifying it=
=20
> to make it generic.
>
> Note that your patch only applies on Linux 5.1, it doesn't apply on=20
> powerpc/next.

Don't worry about that. By the time it's merged powerpc/next will
probably have moved on, and if not I can deal with any conflicts.

Using master or powerpc/merge as a base is fine.

cheers
