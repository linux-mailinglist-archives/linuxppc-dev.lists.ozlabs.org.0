Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD36BDA13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 21:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PczGd1mNYz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 07:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vFo0hpZf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vFo0hpZf;
	dkim-atps=neutral
X-Greylist: delayed 824 seconds by postgrey-1.36 at boromir; Fri, 17 Mar 2023 07:22:17 AEDT
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PczFj4xGMz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 07:22:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678998128; i=markus.elfring@web.de;
	bh=ZyUqUgJ712sd7hB/1hJRuDlfBU9H2cZJd5fAh/yVhFg=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=vFo0hpZflliS1Gg7LDB/L2T9UJHx+1LUgpZz6Yiem3gRrR3qGbkaipzPHV9K0E2XJ
	 YDuiLUI9dNXE6WDtxyf8lACGniJ/mwoqroSX9GfKUfIYyvHOgDyKOrXUnGroGoGy+s
	 3gLbMwebxX4Lf6ZUcO7bMakd5fVyBFZsp/Xndq2CssmVa9UN9z70XH4FRgRCKeqUEZ
	 XNes3CW6tbQgWHxrWrUy6EndYhAPJp14mHA5N3n7LMaOPiGciqe4p96Izi9dr/kTd+
	 ka6LpftpXaGWy4SDdN132A5rynWLtSMspzFYV6bHe9EDhzBnHNnZT+gQ7vmYmmFIrX
	 E2zyiED0/4s4g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N45xz-1qcFv32GmH-0108fu; Thu, 16
 Mar 2023 21:07:56 +0100
Message-ID: <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
Date: Thu, 16 Mar 2023 21:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH 0/4] powerpc/4xx: Adjustments for four function
 implementations
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Boyer <jwboyer@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Roese <sr@denx.de>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
Content-Language: en-GB
In-Reply-To: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0MEbJGSaiyScfOPZPwBBwq16kgkXOyIY0aAfBsztRRnxoUUPn3g
 n8eysQigjFkEvBs1lZrdO8gK8HRwlxKf6sJJZwA3xbYr0nEDM9PojZkN1qfYsHsGH2iegpp
 Lha8Bsm09JnNM/ls7TrGJWUc/olDduS8u2KFbBKiDmy3BZmu9U4x3sos4z2fUVb3ZQvCetA
 Y78l+uf0bzpj1NcsLxfiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:41VSI+1+rDg=;ULXzuPxQsnqq9dx77DOJExaESc1
 Heyvm6ibJTKwU8Azos30zrFjvdRJUjT9UtDT+qN5GCQOHMmYacPZoOlMQJnTbNeHOuyE5wT+P
 mzG6zTqMBb9b4qzppZvOSm3sopnsthiz3500o3NnKyKweadLrpl947ExTb52TW8SbE9Qym9rz
 g2XFv4YUNKc7FtCws2ECYdrSHNriRxVDsiCab6hvSkWBJvpEOTIKy8nf3+e5cVD9kOo2xlwF5
 4bCbRB5vbqW85OhC+sSg9Rik3ew66FeKaBI6hz2FhICy35vLpt+FQUz+wXi68UqB2pqmGl6Cv
 0FILl10so21JGidgUB45mqPxLud1AQ96VQukHZyHxPCBs/Tcu+D54R+sKwHPTXl6jFp03ecNN
 0rvPkqmfuI9diiFIwbkOFoxAwa7MBU1ktQfTv6qYPGkOj3YexBHpI5JnZPOh9dgeSz4CSuK6M
 aqGsy1X2h7AkKW6ULblyl8Mr6s3xzTea/tXHtHuc/9AgKY5BXC/BP6fhfLOH3+RWxR0pETEWV
 N6Dce/6m/w06GQs7lzE0onvKQSGuHJA9wusIyUxiYa4qJ6edmelOCOhBEo9KndusmXOU11HYK
 NtUVS9zZyU5FmIZKRdBPcW1Uqt4S328kmMRlpSPOlYcIXCZkOLg9NIyrvnPqFSdFrNWNVnQKy
 o27vwAOAlDjIf1mktokkw4zTbKTvVVh863H0DNHoz5VHIJ7oqWRsBxMcfRa4ZlhKcbzqqIsSQ
 DNppNmNi7lV3LbTvscm895kz1pbRyMdqXCxN5qkIh2urAU1wXj+c9bMBgAWb8u9O4t0BP6ZGW
 iIxcD9Up1DsWCxWndBqMU2nfy5/HQvnkE/hTBoh/dCZaxoB9FbyQ6tsfBVm2SiGTdNlgzoD9C
 SBH2hR+OgU7CMRr3HYr7J50N2ZdTBJUQDWTx0FCVaNch3aiBam35mItkYWF8HcTSnIBEjIlBd
 lj6lcw==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Date: Thu, 16 Mar 2023 20:15:43 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
=C2=A0 Fix exception handling in ppc4xx_pciex_port_setup_hose()
=C2=A0 Fix exception handling in ppc4xx_probe_pcix_bridge()
=C2=A0 Fix exception handling in ppc4xx_probe_pci_bridge()
=C2=A0 Delete unnecessary variable initialisations in four functions

=C2=A0arch/powerpc/platforms/4xx/pci.c | 69 ++++++++++++++----------------=
--
=C2=A01 file changed, 31 insertions(+), 38 deletions(-)

=2D-
2.39.2


