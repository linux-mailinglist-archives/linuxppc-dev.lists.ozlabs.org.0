Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F51E2271
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 14:56:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WYqf6YM6zDqJs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 22:56:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WYmT2kHhzDqJ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 22:53:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JI1at74G; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49WYmR1NcJz9sSk;
 Tue, 26 May 2020 22:53:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590497607;
 bh=EtQztu5NmCVqCIZyOPV1ACDAhtqa29TG/2fKZ5rLLpM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JI1at74GbvNS0bVZEFf4OJViTkUOEyGb9fPhmr2DTYm5O7v0GBZG/v95TXx6OEi/3
 TJvX6neupQJbZFN5DwEeJCflq/AdfjG4KX2SVWUFJGqapba3Qhl9Th4l/pmHEIetbk
 WPgw4N5388UQGaJPyZ2DAM+ns5FY1MpNoEA/+N4r3AWzP3n6gh1s58vWvPV4giPXQs
 U6A98J/W8N/M0+FtXA/bEWw785sz4tDDsyqxXmwwC2Rj/dzm/CKtM5rvxXsM/W6xNj
 Dxj+d3NsG23J/wrpteipjywiqGmjwQcXbj2l+RDakBFQju9YkcBSK8UFtWDvzB5a21
 3gPpFoBMjaWCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 07/45] powerpc/ptdump: Limit size of flags text to 1/2
 chars on PPC32
In-Reply-To: <e505c554-21b1-3d02-1ea5-c2a214b80ebb@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
 <83a7a0cfca6198e63caf7a16839bd18454961f52.1589866984.git.christophe.leroy@csgroup.eu>
 <87h7w4fvcy.fsf@mpe.ellerman.id.au>
 <e505c554-21b1-3d02-1ea5-c2a214b80ebb@csgroup.eu>
Date: Tue, 26 May 2020 22:53:50 +1000
Message-ID: <87zh9ueu1t.fsf@mpe.ellerman.id.au>
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
> Le 25/05/2020 =C3=A0 07:15, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> In order to have all flags fit on a 80 chars wide screen,
>>> reduce the flags to 1 char (2 where ambiguous).
>>=20
>> I don't love this, the output is less readable. Is fitting on an 80 char
>> screen a real issue for you? I just make my terminal window bigger.
>
> I don't have strong opinion about that, and the terminal can be made bigg=
er.
> I just don't like how messy it is, some flags are so big that they hide=20
> other ones and getting it more ordered and more compact helped me during=
=20
> all the verifications I did with this series, but we can leave it as is=20
> if you prefer.

I think I do.

> Would you like a v5 without patches 7 and 8 ? Or I can just resend the=20
> patches that will be impacted, that is 9 and 38 ?

I dropped 7 and 8 and then fixed up 9 and 38, it was easy enough.

I used "coherent" and "huge".

> With the change I get.
>
> ---[ Start of kernel VM ]---
> 0xc0000000-0xc0ffffff  0x00000000        16M   h  r   x  p        sh     a
> 0xc1000000-0xc7ffffff  0x01000000       112M   h  rw     p        sh  d  a
> ---[ vmalloc() Area ]---
> 0xc9000000-0xc9003fff  0x050e4000        16K      rw     p        sh  d  a
> 0xc9008000-0xc900bfff  0x050ec000        16K      rw     p        sh  d  a
> 0xc9010000-0xc9013fff  0xd0000000        16K      rw     p  i  g  sh  d  a
> 0xc9018000-0xc901bfff  0x050f0000        16K      rw     p        sh  d  a

It's definitely more compact :)

But I worry no one other than you will be able to decipher it, without
constantly referring back to the source code.

cheers
