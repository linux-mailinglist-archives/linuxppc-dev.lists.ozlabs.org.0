Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4985939DBE1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 14:04:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzBqT5YVPz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 22:04:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fEs7IubW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fEs7IubW; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzBpy30ntz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 22:03:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FzBpr0y35z9s1l;
 Mon,  7 Jun 2021 22:03:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623067412;
 bh=4VIaLxdE94V49Ugi/DzDUyEZSXbSah/t7XDQwEdLyak=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fEs7IubWd3DEqBc0yGDeXPkqBGVIjOhfvYMh1NQweGdz9J10MTG/lhb2iE3Kj2PlX
 VP3mwYYV8qu5KN2td68MsckOs2pp1rRArcf5NWOcDcqTTBXHqOeqiQPtkNR2CKXm1o
 b1v7cIzOUxpegSuxIF9e71t3Wb2EHM3lWD/XQ4nGE3lfYugQJuwPOmZDYtYUk6uWFB
 u2olW6vsDmt/QaICTGf5QIxmGK9UaolwhVb/1etvGLw8dnHmm+bZimJXUjDPf0Cchw
 SAGOfgNcGrpEv81XZgcX8tqbTtK3CEEZYyiubN9PZxM/X/QVXRk15+TZtRgoEdb5yX
 PdE2fwyONNLgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] Fixup for "[v2] powerpc/8xx: Allow disabling KUAP at
 boot time"
In-Reply-To: <db70d1b3-440b-a612-f04b-f7bfabc6f945@csgroup.eu>
References: <b175c35ce1596603bf321a5193e89400ae180057.1623001343.git.christophe.leroy@csgroup.eu>
 <db70d1b3-440b-a612-f04b-f7bfabc6f945@csgroup.eu>
Date: Mon, 07 Jun 2021 22:03:31 +1000
Message-ID: <877dj5g9v0.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 06/06/2021 =C3=A0 19:43, Christophe Leroy a =C3=A9crit=C2=A0:
>
> Michael, I sent it as a Fixup because it's in next-test, but if you prefe=
r I can sent a v3.

That's fine, I squashed it in.

cheers
