Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8072B90A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 12:09:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcH4F4gXLzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 22:09:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.103;
 helo=mail-41103.protonmail.ch; envelope-from=skirmisher@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=d3w1xxqd; 
 dkim-atps=neutral
X-Greylist: delayed 444 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Nov 2020 22:06:35 AEDT
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcH1R0GlGzDqQ1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 22:06:34 +1100 (AEDT)
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
 [91.134.188.129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id C334E2000A74
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 10:59:06 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="d3w1xxqd"
Date: Thu, 19 Nov 2020 10:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1605783522;
 bh=tZgDWUN7aiKKgRhksUGJwTfCEdJMb54p3No3DxKsC1o=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=d3w1xxqdhc1YDepMa7JckCGgXePC0o2jXKqLH9kNcecaABcVZW81YUJLzFxfvphvr
 8MHkurY6MF8JeIsjPEZ1WdkQmAtV2kfNPxf21nZz9XqYlbLCtfdCN3DOparpUF/qtN
 xqeFNHb94rUbER9o2Tt0d7bbE3Mx/RWHZDYlyPaQ=
To: linuxppc-dev@lists.ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: CONFIG_PPC_VAS depends on 64k pages...?
Message-ID: <7171078.EvYhyI6sBW@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: daniel@octaforge.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I learned about the POWER9 gzip accelerator a few months ago when the=20
support hit upstream Linux 5.8. However, for some reason the Kconfig=20
dictates that VAS depends on a 64k page size, which is problematic as I=20
run Void Linux, which uses a 4k-page kernel.

Some early poking by others indicated there wasn't an obvious page size=20
dependency in the code, and suggested I try modifying the config to switch=
=20
it on. I did so, but was stopped by a minor complaint of an "unexpected DT=
=20
configuration" by the VAS code. I wasn't equipped to figure out exactly wha=
t=20
this meant, even after finding the offending condition, so after writing a=
=20
very drawn-out forum post asking for help, I dropped the subject.

Fast forward to today, when I was reminded of the whole thing again, and=20
decided to debug a bit further. Apparently the VAS platform device=20
(derived from the DT node) has 5 resources on my 4k kernel, instead of 4=20
(which evidently works for others who have had success on 64k kernels). I=
=20
have no idea what this means in practice (I don't know how to introspect=20
it), but after making a tiny patch[1], everything came up smoothly and I=20
was doing blazing-fast gzip (de)compression in no time.

Everything seems to work fine on 4k pages. So, what's up? Are there=20
pitfalls lurking around that I've yet to stumble over? More reasonably,=20
I'm curious as to why the feature supposedly depends on 64k pages, or if=20
there's anything else I should be concerned about.

I do have to say I'm quite satisfied with the results of the NX=20
accelerator, though. Being able to shuffle data to a RaptorCS box over gigE=
=20
and get compressed data back faster than most software gzip could ever
hope to achieve is no small feat, let alone the instantaneous results local=
ly.
:)

Cheers,
Will Springer [she/her]

[1]: https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs/=
linux5.9/patches/ppc-vas-on-4k.patch



