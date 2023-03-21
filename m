Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB86C2F04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 11:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgnwb023Rz3cdJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=q8Ner4fy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=q8Ner4fy;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgnvg12vHz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 21:31:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679394657; i=markus.elfring@web.de;
	bh=CT7xHXG8JhBeOVufCmoBkVwuGJ+QQcGx0Cjdf+u/rjo=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=q8Ner4fyHjhZM3MaiXKTZ6CilhhyzZJc/gyP7RQ+qmNKPyAPDxEkRP78nX7DvGouE
	 HWFI9yJfxr3xFXmponEhY/MDX+Ho+g4ZwU2tup3mDJkD3w6ixzMhI/n0Kle8/Z7mXq
	 HpUswXEVz0a00QZycvx/hiAi6fluX7OfaKd/y/k2uz7/M4s38Q45j826csJMjL6+YN
	 7IMAmcTXfeZO1W3Zv0uKu7ui+SUtJ6tTeo1Izy9a3JgjwyQNntgu+7Jz9QXYQwPgtb
	 nQU16R67FX30cWu9dFRWsf08fi0iBUf06mWtSbTgSdB2erDznE1NXf9dY9L4GncUwS
	 h9ZwGXY4WAyyA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQ8Wg-1prqvg3li4-00MGg8; Tue, 21
 Mar 2023 11:30:56 +0100
Message-ID: <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
Date: Tue, 21 Mar 2023 11:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 0/2] powerpc/pseries: Fixes for exception handling in
 pSeries_reconfig_add_node()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
In-Reply-To: <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SLleS0P+H73Nybkhw8BxrdfS/dXDDovlM3aLN+oPSrpwr76OOc+
 rzdxlaYdZ57zLjQzG7CKlLloAPFukKnt2yYW76WvVOdL3cPE8aIutleaC45LyLxrx1YB+og
 BxdHjHpbRU1hL+PxsHPg8XNvQBoJGko6AI3HXHGZjgCwWJlS2QmdkAfVlia/IKOVWLJdFw4
 cHIRCAgnsYKWInFirH7gg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WVBGSyKNTaE=;9fsatsBPW+TcfwzouDdkJeHRc1R
 al4qDFd2oRGDmBC629xDeyNEmF/sn5NAVVNvJSxg6PJ5gSR8JNpYFekonxmdrshPCCgFny/mD
 uALTIunjwdIKTG1gAh1b5GLa3izxUvlxyxG/gXUhjb/EonxMjCXNUTPZQPMiioSaD0RlpSljv
 FsZiihEG5CsB1NKYhD7VENLjX4qjwJ1Jcj1kRVZFdOh7dToJiWtXZzVtBgBqm6QwJU6Y8rvsQ
 IHTrA6l6kWL9PXHeoIXfNs7fkuygxOaacsqyiFAfuayfn9rn67pW8WInGO0ysBtIQ14D4uE+t
 Td/PrQCclxZcCzi4DgcSP8c8qBGJDu85uTZF+6ef8pBZX9hQr5HcRh91gh2112gp32o+IsFTo
 4hJ24VZ3MaO59ydXcbYxZZ2L9dZytNik00cKpNWYlDZCW1iokA7absyvqsmbvPE7Mk/3B9dP8
 69wOVaPQJCXZn0LvrjlNxM/Jn86DLiqOfIeBKSlHpZ2zKdKG1DUj8szIFUKNYcINZH+fDgFum
 AYppCg+9CRpetQLVf1CwKakGrkB0OagCjxm8hR1yJZvVHid5rQdHbF8itfJ9eR9Iu6654Dvss
 eZT7STk6I7C1e6c+w8aL+7Mg93EXEHS/quspwTZIphtbDx9u8/6QqOzlxh3U7EbA5/GTbwVaE
 OBWzqErLeTvzGa0CWjs1WJGr+JSpgsPGta8zMzqhd6Gz+cFrKERiXMQH5Vud61yFjtelAOShv
 +t4cO71EgqFrIa96IvskQj9PZ50zV2NfOrF/SSC3FvMu/sE/eXo2KrVJTW49/V9fZJzBU3EZ/
 wktEy7hNbXVymtU15qahGNip6LeXwZCCIWgHi+FFcew2uK5mlNp3Cv38TTXtXRwOOSSTfWejf
 lwKtsBpAK4iOAc5Sh6QcdeI/tB1x6y48Wi/o7StIawKo0BANuC8Sqp70ctVBc7GC1+mFwCjQF
 kSjnJw==
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

Date: Tue, 21 Mar 2023 11:26:32 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
=C2=A0 Do not pass an error pointer to of_node_put()
=C2=A0 Fix exception handling

=C2=A0arch/powerpc/platforms/pseries/reconfig.c | 26 ++++++++++++---------=
--
=C2=A01 file changed, 14 insertions(+), 12 deletions(-)

=2D-
2.40.0


