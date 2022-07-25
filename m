Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E45804A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 21:44:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls9Tf0CZZz3c79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 05:44:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=HUXCmnoH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.58; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=HUXCmnoH;
	dkim-atps=neutral
X-Greylist: delayed 555 seconds by postgrey-1.36 at boromir; Tue, 26 Jul 2022 05:43:31 AEST
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls9Sz4xGPz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 05:43:31 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E1E9237CDA30A2;
	Mon, 25 Jul 2022 14:34:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id VnwW3Pumlutw; Mon, 25 Jul 2022 14:34:10 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 657C637CDA309F;
	Mon, 25 Jul 2022 14:34:10 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 657C637CDA309F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1658777650; bh=C6eQ56WoqflhVshYvw4eSCbTOWmWQugcnRK1KwC4InQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HUXCmnoHrk+82zDVSN5TwrZtJv5I32HBsm1W/0ygtdInl+yif0P4tia7Sd5JAJRPU
	 yulkymOoGGK7dA9UI8YmyA5VSuDRN1JJjoR3zzEIZDjsweTlVG5bWsddAOn3MbNmWo
	 OfLJgjUHcP5wIl4ettt6QsLNsTiDjIz4SB4rD9wA=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DNoUORfc-qsk; Mon, 25 Jul 2022 14:34:10 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3BA9737CDA309C;
	Mon, 25 Jul 2022 14:34:10 -0500 (CDT)
Date: Mon, 25 Jul 2022 14:34:08 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <1446417444.13111032.1658777648586.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
References: <20220725123918.1903255-1-mpe@ellerman.id.au> <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC103 (Linux)/8.5.0_GA_3042)
Thread-Topic: drm/amdgpu: Re-enable DCN for 64-bit powerpc
Thread-Index: bYJinp50nUzyW/1gBugq0G+Et27Ikw==
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
Cc: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>, linux-kernel <linux-kernel@vger.kernel.org>, amd-gfx <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexdeucher@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Linus Torvalds" <torvalds@linux-foundation.org>
> To: "Michael Ellerman" <mpe@ellerman.id.au>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "Alex Deucher" <alexd=
eucher@gmail.com>, "amd-gfx"
> <amd-gfx@lists.freedesktop.org>, linux@roeck-us.net, "linux-kernel" <linu=
x-kernel@vger.kernel.org>, "Dan Hor=C3=A1k"
> <dan@danny.cz>, "Timothy Pearson" <tpearson@raptorengineering.com>
> Sent: Monday, July 25, 2022 2:19:57 PM
> Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc

> On Mon, Jul 25, 2022 at 5:39 AM Michael Ellerman <mpe@ellerman.id.au> wro=
te:
>>
>> Further digging shows that the build failures only occur with compilers
>> that default to 64-bit long double.
>=20
> Where the heck do we have 'long double' things anywhere in the kernel?
>=20
> I tried to grep for it, and failed miserably. I found some constants
> that would qualify, but they were in the v4l colorspaces-details.rst
> doc file.
>=20
> Strange.

We don't, at least not that I can see.  The affected code uses standard dou=
bles.

What I'm wondering is if the compiler is getting confused between standard =
and long doubles when they are both the same bit length...
