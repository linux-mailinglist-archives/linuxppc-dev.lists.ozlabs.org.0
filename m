Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DE8F2D61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 12:25:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781K93vQlzF1ls
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 22:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781Fc4lH3zF63k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 22:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ml77gR1F"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4781FY6nbkz9sPk;
 Thu,  7 Nov 2019 22:21:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573125714;
 bh=SQjOUdmp2dtdcIZfeEWQOp+PIbNXiuzVApc6kLzPTKY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ml77gR1Fw0n0YfITP4YrFd8lvFF3z05cSaeBXVnkc773KQxpPdng3SHv3ImLfW1dQ
 TmyY0wG5hy2lBweYfx4hOFVDTyBEUKftNjpsPHmXAgyJyqKWACQYAHarbG7rPK4SEN
 cG4xCqDtSu4ZiEMfQnQ8CB88m4tSVmpxoWiffIgpSC7FBZQXKcEK22QzeGL9QdRUld
 LNVlWGOzhUgjSPQHl7u1D3AEaSw6TGNZpOEiHUPKE4+uxn8X90JWEGyX0RkV+85n6F
 0OVVNrBzl15/VgDri0u4WuV0PCvwT2IRvrVaaZjocWET8WzcFY77w3N/ydjZCYJwRK
 UmAznZIU67zvw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "paulus\@samba.org" <paulus@samba.org>,
 "benh\@kernel.crashing.org" <benh@kernel.crashing.org>,
 "malat\@debian.org" <malat@debian.org>
Subject: Re: [PATCH v3] powerpc: Support CMDLINE_EXTEND
In-Reply-To: <46da00814535270a2b525de1f75afc79f3abbf5c.camel@alliedtelesis.co.nz>
References: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
 <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
 <46da00814535270a2b525de1f75afc79f3abbf5c.camel@alliedtelesis.co.nz>
Date: Thu, 07 Nov 2019 22:21:47 +1100
Message-ID: <87eeyk53uc.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> Hi All,
>
> On Fri, 2019-08-02 at 06:40 +0200, Christophe Leroy wrote:
>>=20
>> Le 02/08/2019 =C3=A0 00:50, Chris Packham a =C3=A9crit :
>> > Bring powerpc in line with other architectures that support extending =
or
>> > overriding the bootloader provided command line.
>> >=20
>> > The current behaviour is most like CMDLINE_FROM_BOOTLOADER where the
>> > bootloader command line is preferred but the kernel config can provide=
 a
>> > fallback so CMDLINE_FROM_BOOTLOADER is the default. CMDLINE_EXTEND can
>> > be used to append the CMDLINE from the kernel config to the one provid=
ed
>> > by the bootloader.
>> >=20
>> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>=20
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> Just going over some old patches this doesn't appear to be in next. Is
> there anything stopping it from being accepted?

Just me not being overloaded :/, sorry.

Have put it in my next-test branch, which means it should appear in next
in the next few days.

cheers
