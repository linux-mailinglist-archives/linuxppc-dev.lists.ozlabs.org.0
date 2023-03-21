Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F6A6C2F25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 11:36:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgp130gMTz3chn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:36:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=A89V0Kgn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.45; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=A89V0Kgn;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgp070YQNz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 21:35:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679394837; i=markus.elfring@web.de;
	bh=vndjNXkPmTxF0BPBkraC9oszufUtdq4WgZMkzAOxXDo=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=A89V0KgngrmZZofv5QrNSfXK25TfNFNj5/6zVZYhKdHjLIg60vGUb7l+RQAWmykpt
	 8cN4Rh9/xL94Z6rlGmvffTUf5gfsR1JV9Mu+0VrVuPpezQki1W2ye7XsCRmuFW6fv8
	 znG1oYQIS7Kk9EW9SRAa18mb2WLrJ3tpX83H2i9vDkhJ9rhLedEFB1ie8bfZ22aeZw
	 /c+IwI+Oymj+RNM1rX8OlslC95M84pXnbgIq0I8hzx4ZMutgx9HZAN7gO9sqfncPSt
	 PE957TZlPqPD+Rz9FWE6kESBJLJgb0AbOXrgGgkAB4fa/1bHlNLIopwvn34JpABSPR
	 WlUdSGEqzJeGg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX5T-1qNIGW3LUb-00jO3m; Tue, 21
 Mar 2023 11:33:57 +0100
Message-ID: <8949eefb-30d3-3c51-4f03-4a3c6f1b15dc@web.de>
Date: Tue, 21 Mar 2023 11:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 1/2] powerpc/pseries: Do not pass an error pointer to
 of_node_put() in pSeries_reconfig_add_node()
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
In-Reply-To: <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cUS+tA463HYUlb/iUpPOArqy6VeUFp3JFsh/x1olBn4hTXcKng3
 vXYjvYRNl5OrT5wPkTpA5S7RFY1GKu/TSn7FBzeOL8e639SR2iaaWB3Fb2x4HC2u89sjsf6
 miv3T206bbdiH2QQpC5bBzSYFyDp1qTdKZwJggwZhGdb9x5SxBQl9UVlTaPJf8wqG42/JQV
 2BqvRnNJ7sz0FRY++A4qQ==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:Gr2jsBBO1Go=;liunclFFJopIqm5hKq6VgGlpa4tMs
 m/0CGPlgoSqPq4w4vbvfkPANp3Pb7FoaVcpTNlMm5dGWlurf8Tl4P3GzOGhQBeTm8dLPoLDh/
 atFnBFHMn9ba9S/S59/tlT1s4AdXmgL4P0GKDETiwW2T106q0QqlvmikTOjkV6+M071TttNDF
 1njSj4O7HZbL77vzuF2zblNA0+AtY9mYIOY0SWSpddXqtjVmZIoG6hRsK9tO1KuxZKqKAjhwp
 vQaxGXSpyabe27seFiE1kyvKWjat9PNO3vYgmPbBTJYbWrqmtuIpNBCMw6fN5JHhNbP7WNUMt
 LYawuT3AOCJLhP1i2X8c8T7Uiu3oV96XjHZbzPFbz6ikv90QquRvo/hQ6S/RGArXNfJDeztY/
 81onrXM9SWgGvSLmKaSLDCWvr1UTWoMCX2ifNYFcMxx1hxHplWQkHxyHTXkOloqF0QEXw1YYB
 MAHMh7gyBJD+xT1WO/xNM8Rzn+LyCDlH84wPjBDnGmlrNV7jy+YB68efJcmPE3n6qWFf8aDI/
 tCknHbsyLlYzLoYtbQ5o/CQtaV6RpJAbUwWUy2Jni6FhLDVUSnBtcJbm+ZJ0s0t59wLVqzyu6
 p9syNUdjH2aUim/YTcqIdgy/P6qLRpDDKlehdJeqrTS5Fm2if+1bWcBrdo0Pw4WlImWzuAZFn
 /GXxZakCedLq47Vr6ruwmhwVA8orKN2mDRFKrPjRZJdtPFWFfk6YvR8PMnJ5REPHj1LkssUwe
 VLG/tWUY5rsJaRCTW7lq5DC5NY2RzWEvgztx5NznJ/r9yTZVod3wPhZzEA7KcaTeNhz33lcYH
 K2Hz1FOiEmPj5bEYnGvMD7BcVMfGt9QAxAxtqAMpbiSR1R+Kf+j/4AQkJwsYn1GJ2jUx+UiPe
 M8DAytK5pELoT9x9aHTqqcTDmE5sIW6DsPLr8+6tqpNmP6JQ7zSIshh2Hoyw6Bpzt53HjV8oM
 Hm3l/YtdEdlOjL+wkkB9Z4XDVhPB/5J8w5soo/neI4bako5HkW2PJj2WotvusxaNmPhpgDnFu
 M2I4zvmU9+xY7OwM=
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

=C2=A0arch/powerpc/platforms/pseries/reconfig.c | 3 ++-
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/plat=
forms/pseries/reconfig.c
index 599bd2c78514..44f8ebc2ec0d 100644
=2D-- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -40,7 +40,7 @@ static int pSeries_reconfig_add_node(const char *path, s=
truct property *proplist
=C2=A0=C2=A0=C2=A0 =C2=A0np->parent =3D pseries_of_derive_parent(path);
=C2=A0=C2=A0=C2=A0 =C2=A0if (IS_ERR(np->parent)) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0err =3D PTR_ERR(np->parent);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto out_err;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto free_name;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0err =3D of_attach_node(np);
@@ -56,6 +56,7 @@ static int pSeries_reconfig_add_node(const char *path, s=
truct property *proplist
=C2=A0out_err:
=C2=A0=C2=A0=C2=A0 =C2=A0if (np) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0of_node_put(np->parent);
+free_name:
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np->full_name);
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np);
=C2=A0=C2=A0=C2=A0 =C2=A0}
=2D-
2.40.0


