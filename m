Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7447E289
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 12:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKSzk4y5dz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 22:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H7HZlWW1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKSz60Mysz2xsX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 22:44:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=H7HZlWW1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JKSz45D6yz4xmv;
 Thu, 23 Dec 2021 22:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640259872;
 bh=9hQPRuG+ZL74d5IotcBT6emLikScsj754Sfn0BuoEWc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=H7HZlWW1AJSxhvRcUn94p+IHKJKFI2YoW1jhX21VxDDI/mrcqw5qOxYq1n45mgJo4
 dlWQLnV3X+Eeto+5/TAnh4WcgOMP3FihfUYByqwXvHW+S969z/iHbFhAFwnmK6/SwS
 CG5oo3T15uk9fgTec3wTuiKNV0ajIyWIaxiAynKbnRji+S0S54n8UdO6mLGBk6bbBx
 9jxBSxzAQicr6DhJkyldF6CXSBd/1Oub35nQEUJ/n3T4yj0nxwuvtAKNdepOtAAkj/
 vGNclFGtR1llG8EfZHBA0WU8al/dhF/lVpIPuTBbyCFkv2hLdnNeeAt9pxcV79bdH3
 JG9ObwIT5HX1A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Child
 <nnac123@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 00/20] powerpc: Define eligible functions as __init
In-Reply-To: <f1bdd55e-1141-c118-0f6d-b5ce61c6f7dd@csgroup.eu>
References: <20211216220035.605465-1-nick.child@ibm.com>
 <f1bdd55e-1141-c118-0f6d-b5ce61c6f7dd@csgroup.eu>
Date: Thu, 23 Dec 2021 22:44:28 +1100
Message-ID: <874k6z35r7.fsf@mpe.ellerman.id.au>
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
Cc: Nick Child <nick.child@ibm.com>, "dja@axtens.net" <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 16/12/2021 =C3=A0 23:00, Nick Child a =C3=A9crit=C2=A0:
>>=20
>> Changes in v2:
>>   - add `__init` in prototypes right before the funtion name instead of
>>      at the end.
>>   - respond to ./scripts/checkpatch feedback
>
> You probably missed the following comment from checkpatch:
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Nick Child=20
> <nnac123@gmail.com>' !=3D 'Signed-off-by: Nick Child <nick.child@ibm.com>'

I fixed it up when applying to use Nick's IBM address as the author.

> Sending from a different address is possible, but you then must add
>
> From: Nick Child <nick.child@ibm.com>
>
> at the top of the commit message.
>
> 'git format-patch' should be able to do it for you with the good option.

Yeah, Nick please teach git format-patch/send-email to use the right
address for future series. If you need any help just let me know.

cheers
