Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9E43C845
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 13:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfQr92CpPz3bSn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 22:07:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dXoS38tT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfQqZ00Ldz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 22:06:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dXoS38tT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfQqW1c9wz4xbq;
 Wed, 27 Oct 2021 22:06:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635332792;
 bh=gagwazaeXlV8j4sIKDqMdB5kheMU/VIZW2bhlG6Gp/s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dXoS38tTkKpP/N4OIwoklDXdvPPr7v134nTAySzQJwhwIz/4DM/j/P2DonPFZwMdi
 gK72PQGyHnqENBbLgHjceeACUIHMgXwUczp6Wg1Hfz4B1ohejF/xcfgDESzojv+965
 ZJib5TqnOooTcShDpHPGYFzU4BiXat+n68/zM8n0K1dsYKH9/ay92tyTIEOpbmxzYM
 v7390YUcrC4i39pRTUl97pV62LiHj9jvMNLQw2FVUR/5R7zd0uk/Qe81r6t3W4hcht
 +0h/ds1OQ2nGIloBfs7vVFP5hokmknbDQ2mnO6tZ+VAp01QgeEXAjk1/WX9nKh4lz5
 5iCJN+X7UQx7g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
In-Reply-To: <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
Date: Wed, 27 Oct 2021 22:06:28 +1100
Message-ID: <874k92bubv.fsf@mpe.ellerman.id.au>
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
Cc: oss-security@lists.openwall.com,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> Hi Michael!
>
> On 10/27/21 07:30, Michael Ellerman wrote:
>> I did test the repro case you gave me before (in the bugzilla), which
>> was building glibc, that passes for me with a patched host.
>
> Did you manage to crash the unpatched host?

Yes, the parallel builds of glibc you described crashed the unpatched
host 100% reliably for me.

I also have a standalone reproducer I'll send you.

> If the unpatched host crashes for you but the patched doesn't, I will
> make sure I didn't accidentally miss anything.

OK thanks.

> Also, I'll try a kernel from git with Debian's config.
>
>> I guess we have yet another bug.
>> 
>> I tried the following in a debian BE VM and it completed fine:
>> 
>>  $ dget -u http://ftp.debian.org/debian/pool/main/g/git/git_2.33.1-1.dsc
>>  $ sbuild -d sid --arch=powerpc --no-arch-all git_2.33.1-1.dsc
>> 
>> Same for ppc64.
>> 
>> And I also tried both at once, repeatedly in a loop.
>
> Did you try building gcc-11 for powerpc and ppc64 both at once?

No, I will try that now.

>> I guess it's something more complicated.
>> 
>> What exact host/guest kernel versions and configs are you running?
>
> Both the host and guest are running Debian's stock 5.14.12 kernel. The host has
> a kernel with your patches applied, the guest doesn't.

OK that sounds fine.

I tested upstream stable v5.14.13 + my patches, but there's nothing
betwen 5.14.12 and 5.14.13 that should matter AFAICS.

> Let me do some more testing.

Thanks.

cheers
