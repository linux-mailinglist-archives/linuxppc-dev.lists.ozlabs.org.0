Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BF4271F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 22:20:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HR01P5WPsz30D0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jXEKme6T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=jXEKme6T; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HR00g6NPVz301k
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 07:19:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633724370;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=9Qddfdz3dC8KutvLRsZHf0Tt9+k+p0grqx2ZHUbhmX4=;
 b=jXEKme6TNHQ9fN90Rmr+8Xie0FB7EhkfPa03hZz0dwzq1vH6IQuSjvw4R+NygixnlA
 L/5WAIv1ns8EfmirUFPEGfMDrfxL/Nhy7iMVE3eYG3qGhIXq4c3PyNLAcNskNlVjSFnK
 9fAyL2GltqFIbUha9nTxIx/l2qYOHzwQLRmeh1MQxgjRhnJT2nllCHEEGBLa9Wb9d3Kg
 qIyAeVTOSthwOipGwI3ltcmYX5miYCe17ZtmxGv7YyOQ2HK5i6dyXs9NvdRL7DM7Yz3o
 NRb7YWEpLM4TGZw1GbnWDZHmytZktWwl4CMwbIFAqa9HM2zdOCXGcuEfR6IRzrpO676E
 IUoQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaM9fNtIXuaJFG7SAKEfgx/8vXcfbwY5mb44sEm"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple by smtp.strato.de (RZmta 47.33.8 AUTH)
 with ESMTPSA id I00cdex98KJS3uS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 8 Oct 2021 22:19:28 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date: Fri, 8 Oct 2021 22:19:27 +0200
Message-Id: <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
References: <87mtnylaam.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mtnylaam.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (19A348)
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
Cc: Darren Stevens <darren@stevens-zone.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>,
 mohamed.mediouni@caramail.com, Matthew Leaman <matthew@a-eon.biz>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd@a-eon.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Do you have a mbox link for the v2 changes?

I would like to test them on my AmigaOne X1000.

Thanks,
Christian

On 27. Sep 2021, at 09:58, Michael Ellerman <mpe@ellerman.id.au> wrote:

=EF=BB=BFChristian, the whole series is downloadable as a single mbox here:

https://patchwork.ozlabs.org/series/264134/mbox/

Save that to a file and apply with `git am`.

eg:

$ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
$ git am mbox

It applies cleanly on v5.15-rc3.

cheers=

