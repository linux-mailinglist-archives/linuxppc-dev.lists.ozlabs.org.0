Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45356376BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 11:46:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHvn85r0zz3dvK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 21:46:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hkVtP7+T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHvmF2Tm2z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 21:45:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hkVtP7+T;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NHvm96p8Qz4x1T;
	Thu, 24 Nov 2022 21:45:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669286746;
	bh=a/rgvu+x3DNbb+TuaqIRMakhyJTfbEd0k5XDjibLn0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hkVtP7+TE9HiKfugwKMBr7W3jSEBpBQYR+0GKGVSazAx5OXNysgYeiUzQZR/ioHTH
	 dDR1vgi5ikZvLL4SHV4mGpLqv0Z0Sz8kbdb6rwrt763FeZt/I2xLpZapYdgOOA9A4p
	 8ipjhhxE5DInT76L6F+bFLnBqkXvKttNNAXEbl12lAsGcKNxfPER4nQCYfaQXuicoT
	 Bbg23ccChwoTDAXIuiR/p2D5LwK3X/o8byq42yLoK7zTPZi5OtaGousTMDgviiOVdu
	 0j+0Xi8T0UgkNI+Eq6xGXdnaHtTfeSnO2G80owAYuLP7JvWi1vJHJgNoGYcfYGM4Li
	 knciml4JyJuKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Donnellan
 <ajd@linux.ibm.com>, Julia Lawall <Julia.Lawall@inria.fr>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] cxl: fix typo in comment
In-Reply-To: <48936161-3e97-e8bb-1f85-ea511c13571e@csgroup.eu>
References: <20220521111145.81697-82-Julia.Lawall@inria.fr>
 <2835d67e-8ca0-cc2d-b86e-b2ac254428ab@linux.ibm.com>
 <48936161-3e97-e8bb-1f85-ea511c13571e@csgroup.eu>
Date: Thu, 24 Nov 2022 21:45:45 +1100
Message-ID: <875yf4d412.fsf@mpe.ellerman.id.au>
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 23/05/2022 =C3=A0 01:27, Andrew Donnellan a =C3=A9crit=C2=A0:
>> On 21/5/22 21:11, Julia Lawall wrote:
>>> Spelling mistake (triple letters) in comment.
>>> Detected with the help of Coccinelle.
>>>
>>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>=20
>> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
>>=20
>>=20
>
> How should apply that change ?

I will.

cheers
