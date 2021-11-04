Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739384459FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 19:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlXkk2FGtz2yPv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 05:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=ePwhnXSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.43.25;
 helo=mail-4325.protonmail.ch; envelope-from=stanley.johnson.001@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=ePwhnXSw; 
 dkim-atps=neutral
X-Greylist: delayed 60541 seconds by postgrey-1.36 at boromir;
 Fri, 05 Nov 2021 05:49:31 AEDT
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlXk35tlrz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 05:49:31 +1100 (AEDT)
Date: Thu, 04 Nov 2021 18:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1636051764;
 bh=btgDf7bwL18jcF4fliZ5LEgXsa4TA/uSU8/vj85TT2U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ePwhnXSw0rj9Bu33ic35GYQ3krjPQK7NyngZnOkTfNO+l3m2iQXmvLJSo7MBTflmO
 hH4pvLxQJhv3Mzsq4mxV8IsqD41yna31dVXbd6tT+CLr5eCbWADXNxOhxEIoNwKg1p
 gle/gr9p5ItWacHg26I4lZohsioV0Byktxi8rgHQ=
To: Christophe Leroy <christophe.leroy@csgroup.eu>
From: Stanley Johnson <stanley.johnson.001@protonmail.com>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Message-ID: <pPQwt3X9TSilU7SKca1e9YU5aFfFzGvW2om9_Ngg27413gpVJgkTQwFAW75LwU9s-rZr7x19ZtA-neZ3OUsER-2b1FAkVQoZ4v-UCmw9NLA=@protonmail.com>
In-Reply-To: <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
 <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
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
Reply-To: Stanley Johnson <stanley.johnson.001@protonmail.com>
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Riccardo Mottola <riccardo.mottola@libero.it>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, November 4th, 2021 at 10:40 AM, Christophe Leroy <christophe.l=
eroy@csgroup.eu> wrote:

> ...
> Are you using GCC 11 ?

I'm using gcc version 10.2.1 20210110 (Debian 10.2.1-6).

> ...
> Can you cherry pick 7315e457d6bc ("powerpc/uaccess: Fix __get_user()
> with CONFIG_CC_HAS_ASM_GOTO_OUTPUT") on top of d3ccc9781560 and see what
> happens ?

working on that now..


