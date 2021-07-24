Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD73D4861
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jul 2021 17:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GX9NK4Blxz3bbb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 01:39:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GX9N00dSTz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 01:39:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GX9Mm2wCszB8p0;
 Sat, 24 Jul 2021 17:39:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mhdamgu_XzUK; Sat, 24 Jul 2021 17:39:00 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GX9Mm1qk3zB8nr;
 Sat, 24 Jul 2021 17:39:00 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 5083C653; Sat, 24 Jul 2021 17:44:16 +0200 (CEST)
Received: from 37-165-72-176.coucou-networks.fr
 (37-165-72-176.coucou-networks.fr [37.165.72.176]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Sat, 24 Jul 2021 17:44:16 +0200
Date: Sat, 24 Jul 2021 17:44:16 +0200
Message-ID: <20210724174416.Horde.SGJpvfIKCho_9unV7fRnmA7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH v4 03/10] net/ps3_gelic: Format cleanups
References: <cover.1627068552.git.geoff@infradead.org>
 <56efff53fcf563a1741904ea0f078d50c378b6cc.1627068552.git.geoff@infradead.org>
In-Reply-To: <56efff53fcf563a1741904ea0f078d50c378b6cc.1627068552.git.geoff@infradead.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> a =C3=A9crit=C2=A0:

> In an effort to make the PS3 gelic driver easier to maintain, cleanup the
> the driver source file formatting to be more consistent.

Many of your changes in this patch go in the wrong direction.

For instance, you shall not use { } in an if/else sequence with single=20=
=20
lines=20in both the if and the else. See=20=20
https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-br=
aces-and-spaces

In=20a multiline operation, the argument of the second line must be=20=20
aligned=20to the matching parenthesis.

Christophe


