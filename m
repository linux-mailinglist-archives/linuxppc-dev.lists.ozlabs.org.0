Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F647FAF52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 02:00:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pjq/Cf0/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfPJS11Ggz3cZv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 12:00:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pjq/Cf0/;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfPHc2sC0z3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 11:59:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701133179;
	bh=C+WoRpLz4ShCJ4XjCw9fNycJzhe2kxDftUueiTVyaKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pjq/Cf0/z/HjG03/EP2bb0mnMNe51x2mxMm9n1J3jZOLtkfmLEZlIz3G4g1RDXuqm
	 Hgt/KkoMn7pdM75wkf8dhBPxAfcBVMo5VDTk61SsYvBiwsye/A+8DFpg2v7dKqhp5D
	 xBob1guuriG237cOzgfyBA2MfBV2KaUiO2qM3fY5TfGFmiArEBseknn7I/3/3O+iA5
	 a+637wNwjBm7OjYHztaCfl1O310XYvZ3Vuhf2ifBMtIhWKyZxyTtvNFqedI8FJ7drM
	 GQYd+1gw4+57gj2GUQVWYcaLmLSTjR8Bt6mtmykG5Cme7EHM6+8oQKOlagTaEuFksl
	 Ha1n9HqhtFK+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfPHb32Qhz4wc8;
	Tue, 28 Nov 2023 11:59:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Timothy Pearson
 <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
In-Reply-To: <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu>
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
 <877cmc7ve9.fsf@mail.lhotse>
 <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com>
 <874jhg6lkn.fsf@mail.lhotse>
 <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
 <87leaqjs8x.fsf@mail.lhotse>
 <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com>
 <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com>
 <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu>
Date: Tue, 28 Nov 2023 11:59:35 +1100
Message-ID: <871qca4rrc.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>, npiggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 27/11/2023 =C3=A0 19:39, Timothy Pearson a =C3=A9crit=C2=A0:
>> Just wanted to check back and see if this patch was going to be
>> queued up soon?  We're still having to work around / advertise the
>> data destruction issues the underlying bug is causing on e.g. Debian
>> Stable.
>
> Has any agreement been reach on the final solution ? Seeing the many=20
> discussion on patch v2 I had the feeling that it was not the final soluti=
on.

The actual patch is fine I think.

The discussion was about improving the explanation of exactly what's
happening in the change log, and whether there is a larger bug causing
FP corruption unrelated to io-uring.

I'm now reasonably confident there's no detectable corruption of fr0
happening except via the io-uring -> clone path.

It's still a bad bug for us to corrupt fr0 across sys_clone(), but in
practice it doesn't affect userspace because fr0 is volatile across
function calls.

cheers
