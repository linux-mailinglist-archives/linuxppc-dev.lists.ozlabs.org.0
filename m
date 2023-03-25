Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B626C8E94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKzb5Zvpz3fTr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:43:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=F+3KSBJY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=F+3KSBJY;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkKyg74bzz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:42:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679751755; i=markus.elfring@web.de;
	bh=KO3BKZVVw6mbo81Zr5Lz6Z01ExV290PntqJFfRRjrKU=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=F+3KSBJYMSP5pb4y/6UgRtIeNH5oU5uU89AJtNbxlZvBYPFTgMh9MIucGfXrWy4gh
	 ISqTOWmtKiBccT5RqtjhosnUuFdrQlC6qPgQM3uNsPLNzYgtLnApk7h2uO/2Y91uke
	 R6NdLenHGCHVHkCrkSG5E2/GBp2UJ2NiNDKktJgqaUKb4uElmQrIpiCpJCcDntHv/h
	 PM/GcNRbxEd4SeuklaF2ZeIS+H04oXU1xT3NUjwHddnjkffFHTnrWvPYpPRNfd1FpZ
	 a6pNMVg3oZhUzazokWy9m8faPfw1MAUCab4aZmUnlhSHjyhKfTAsvP3ztIYGBAund3
	 K5xFlXxLilYkQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MgibY-1q7PEd2jSm-00h3HU; Sat, 25
 Mar 2023 14:42:35 +0100
Message-ID: <f5ac19db-c7d5-9a94-aa37-9bb448fe665f@web.de>
Date: Sat, 25 Mar 2023 14:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH resent v2 1/2] powerpc/pseries: Do not pass an error pointer
 to of_node_put() in pSeries_reconfig_add_node()
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
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
In-Reply-To: <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RfdaZlFOSV3M64SKFPUXdwaCJTA7xUu4N6/KaHtpNrcYpQ2mw1y
 ePwYGxPOYKd4LLfoQcjSJppIa2nvji/228ZpC2qOmUJFp2LtM8GkopMUPRggW5tJq6M3uYT
 1JbDjxgYSWVncu3ciDR6U96LOafJvToRGG8e26OFOEKpHxNMzD8vtCNToKHDiMkAWnRpXSN
 DWRuqpQno3pgFXBCi/aww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:euUHpvkGFEs=;yVylM0wy3kOod/nSXvMQmTXuEV4
 inKf53S6H+hxB+Gk3HT/DYa7hHeyKRvf30mnJX8iz/w4JCHlD0dVPZMtfSkz322fHhRRc7niU
 x3jFXG6q9ocHgp64EPZ1QGkjyuLA169TDP6Ih+z5a/QaQ54ncYwlLOp3I0JdFx5Us7PMLB9Bx
 5rWkbPZUlOcptjNgMGEXkJAu+PxI7JG619D9UzTqHIT27GWQKzBgh/zk6NkGa2RSd8URbHFgw
 IGj9TpatrH2CJoY5wHIFZLy9+PfJuYVelhvgB6N2u4oBmoekXiMKQfxsfUy93fpin7nZJheGo
 3ZS4q/kuurX4FSuSK+RoHv2rD+UwZX2H6YiBKfEyN4Cj3DisU4rhhAsu1/Y0f75fyFHjxpdcq
 hkb1zUDnpUUW/A+bQkKo36GHQGLI+Hr8gZFtWBMaLtaAIQ1PrRBgPRI6WU2ZvIyeeOWvBak6V
 XJxnlXsOW/8Hx2OtlicmHmOFXEtLCW7OHRRMxZu/dOnFbxJ688VatBTyXqoKu7Sf1zfmTCg7W
 lL79T7aYfwegoZW1J62GNUDe/RauWPohNCa4Fhxdmt9smUJ55/r8bm1jHH6enfEp8vVafZ0Kf
 nr9EfL888lMCOqBcQuMtJB6mvd3CelAiCIpeePdY6vv4FMzhdDeXCHDfRytACilNXraDqp6O6
 Ab4i8w8rMBQQXYIaScxK0u1wa7z/VZoeswLlxSLxJdNWPsdFMLQD9dXxua6Uo2WMAwC98+HtO
 14UX8gQnuosefZV3elSFrFUxrb03vxSFh4HNODX6hKhp7yyDrKnnIdKv/qgbRc7gxbtqLe7pt
 KwrnsqRNyt7L0wBcWzXbtAgRWgkvO1LJmjBQR4jv2jPK1BjUhVF9bKcpjGJida0PTSJ6EHpay
 0ba4wsPDhZ97cPG5hCZEo898B0Z1l5uQHjuOfLhWZyXBQoKc04N0cjRnc
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

Date: Tue, 21 Mar 2023 10:30:23 +0100

It can be determined in the implementation of the function
=E2=80=9CpSeries_reconfig_add_node=E2=80=9D that an error code would occas=
ionally
be provided by a call of a function like pseries_of_derive_parent().
This error indication was passed to an of_node_put() call according to
an attempt for exception handling so far.

Thus fix the risk for undesirable software behaviour by using
an additional label for this error case.

Link: https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256025.ht=
ml
Link: https://lore.kernel.org/lkml/87pm9377qt.fsf@linux.ibm.com/
Reported-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 ("Linux-2.6.12-rc2")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
V2:
This update step was added according to another change request.

 arch/powerpc/platforms/pseries/reconfig.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/plat=
forms/pseries/reconfig.c
index 599bd2c78514..44f8ebc2ec0d 100644
=2D-- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -40,7 +40,7 @@ static int pSeries_reconfig_add_node(const char *path, s=
truct property *proplist
 	np->parent =3D pseries_of_derive_parent(path);
 	if (IS_ERR(np->parent)) {
 		err =3D PTR_ERR(np->parent);
-		goto out_err;
+		goto free_name;
 	}

 	err =3D of_attach_node(np);
@@ -56,6 +56,7 @@ static int pSeries_reconfig_add_node(const char *path, s=
truct property *proplist
 out_err:
 	if (np) {
 		of_node_put(np->parent);
+free_name:
 		kfree(np->full_name);
 		kfree(np);
 	}
=2D-
2.40.0

