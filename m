Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 128392C7A2F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 18:16:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkZm22XDSzDrcd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 04:16:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lxtec.de (client-ip=2a01:4f8:150:2161:1:b009:f236:0;
 helo=mailout3.hostsharing.net; envelope-from=riesebie@lxtec.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lxtec.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lxtec.de header.i=@lxtec.de header.a=rsa-sha256
 header.s=mailxtec header.b=GFPuQhUz; dkim-atps=neutral
Received: from mailout3.hostsharing.net (unknown
 [IPv6:2a01:4f8:150:2161:1:b009:f236:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkZkH3sNdzDrRy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 04:15:18 +1100 (AEDT)
Received: from h06.hostsharing.net (h06.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f19:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by mailout3.hostsharing.net (Postfix) with ESMTPS id 8E5F7101E6AA8;
 Sun, 29 Nov 2020 13:27:29 +0100 (CET)
Received: from mail.home.lxtec.de
 (HSI-KBW-095-208-010-117.hsi5.kabel-badenwuerttemberg.de [95.208.10.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by h06.hostsharing.net (Postfix) with ESMTPSA id CEA206040BDA;
 Sun, 29 Nov 2020 13:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lxtec.de;
 s=mailxtec; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:reply-to;
 bh=smV6V0Fk5xxOFfaY0U4Exd3ccFl2QWw26EIXMmcTuM8=; b=GFPuQhUz5IYFwtrcOSl+aWa88I
 BEXHR13HpGEuxI/69ew6WVs04ECY3ntJWIaeebQLTGhxjqrskCCDd4T3ODax5yBXpDWuktm7iYcho
 BjfTgVCcbPkjiwnTiSJE12eWb7V9qp2nu34McEuxnA+RO2SxkKYV27BC6Ws5QpPbVb80z45Usad+6
 ci0c2De5a9LT2LStuaLHDB3bvQc+n9hld9ZJdduDV1Y5/yT2hxCNaCITN9v+1DIHoup8Aw27dUmop
 YTPtNQgI1HqOGQy9oPquuTT7sm10+2E6L79/F9hEn3YFXMERfid86v5/l175Z2WwDZHaAxkMNLRmB
 MskZwQOQ==;
Received: from [127.0.0.1] (helo=localhost)
 by mail.home.lxtec.de with esmtp (Exim 4.94 2 (LXTEC))
 id 1kjLnb-0003JS-5R; Sun, 29 Nov 2020 13:27:27 +0100
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
 by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4O-rM7176pPT; Sun, 29 Nov 2020 13:27:27 +0100 (CET)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.94 2 (LXTEC))
 id 1kjLnb-0003Q4-1M; Sun, 29 Nov 2020 13:27:27 +0100
Date: Sun, 29 Nov 2020 13:27:27 +0100
From: Elimar Riesebieter <riesebie@lxtec.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc4 doesn't boot
Message-ID: <20201129122727.42zbknbaz26dedcg@toy.home.lxtec.de>
Organization: LXTEC
References: <20201125114030.2s3lbfxd4yvfc3zx@aragorn.home.lxtec.de>
 <88e539d3-22ed-3672-53d1-b3a217a08cc0@physik.fu-berlin.de>
 <20201125125216.lmid2m2tcdkxpioq@toy.home.lxtec.de>
 <740918d5-8ea3-4078-3bf0-7a627cd9777d@yahoo.com>
 <228955cd-e014-b533-b3bb-4d4e04baa9de@yahoo.com>
 <79a8734e-da7f-6563-2730-b1014ccb35c7@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <79a8734e-da7f-6563-2730-b1014ccb35c7@csgroup.eu>
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
Cc: debian-powerpc@lists.debian.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

* Christophe Leroy <christophe.leroy@csgroup.eu> [2020-11-29 08:37 +0100]:

[...]

> Try following commit: https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git/commit/?id=3D01776f070ffcbf336be3bf1672bd3c589548d6c4

I can confirm that this commit patched at 5.10-rc5 made the kernel
boot again :-)

Thanks for bisecting and providing the patch!

Elimar
--=20
  The path to source is always uphill!
                                -unknown-

