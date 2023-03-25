Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D456C8EA0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:45:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkL1k5Q0Sz3fR5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:45:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cT3A7uc5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=cT3A7uc5;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkL0q1lncz3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:44:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679751868; i=markus.elfring@web.de;
	bh=9MEMV3HONXkOFdWmD1JKhyX20q5i9cTWfln64sH0OnM=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=cT3A7uc5KNtpT3Ndr0DpZhZmxgz02TyJ68nuD1VYOzF5hqehYYxGDIOW12+Raea2D
	 zyAxGfFTwaW1P8Xva8QvXJE77EaLnjEd8ARJaYX4kU2sFjaW9UNxvUTAoeYjytLvjp
	 ecftofcOSlhZiFWYj37ngPIbOFrL7wdb7MwYUfoidFu2dayG+aVeb5iN+Kioh7CmxU
	 Xp9fBuOPFnlM0SGJN4ExMRtbcjTntXLRycTRgbFMB25Ib/y4zGx9eHyYDMkQnbjirK
	 TqkkjmYnxBr9mtstzwH33bCqRKREeLmkM0lMwjq0ZGvuB3FN/G6AdV/hclZrJjac/l
	 KMuQIdTWHo8KQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWop-1qAQvf246V-00eYGf; Sat, 25
 Mar 2023 14:44:28 +0100
Message-ID: <b54f8f9b-f279-c353-f68a-763e2ac3705c@web.de>
Date: Sat, 25 Mar 2023 14:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH resent v2 2/2] powerpc/pseries: Fix exception handling in
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
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
In-Reply-To: <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JoEdPDWmvgdeSdF982ek9rSr9udo+HdUu5DiQjjaQjTjG+v4jf/
 eyv2L9JJ+4HRvl5WUJmKLUzQsYQri5K+5uWHa/LTB8X417ZMtSh/kQvFTMOYLhcgwyU6MQm
 ow9BgWmLEmhs/TuY9ZWlc0Vafzd4B9zRALz9Y2rAqKwrbB6wEwCpoIX8Fcs2KUlgJaZUSrr
 NwCHGzZ17BoLOYvT0aUIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PXV7EA2zsIc=;S7bNfX5q2cCpl7RnOrCc42eGJs9
 b50zOCwALGHAJKTbK2cFrj/O4Jp0gKlBHfjWIuIZ5ZezUA7ynYY2Y3zFnBrZMpiVcVghjbaWD
 Sf+NAF/nmPwUA+CAzxKQDbZIsW39FhZTpnmL0XDtHuX8g3W22QBl/fO0qfCQa97DkjawxiudM
 Q/KklQZMsgip6ZGy2wraEKJY7IS3QaEObijmB8fdwEILC5gZAMNWODX2f+KCKU+MdlKvNlsk3
 cwXMHF5/6o+/CgdrSERbsd79Y85LLkp+C+wce0j/j5xqC9DrXo7giOP0bG5zGhfZnZ0XMbglW
 /36VD2E0rN+COGJYBxuu6kRe+YXuRW32GDNTPNNBd1EJE3M01YeetF4BGAl1MP9scebcrl4T6
 9xaqvsSvGZPKx+RVm1aKBC0NME/yARSLsoNkWuXrPN9qpgMo0SSGv6mHszd7V1OvtM3dKfZUN
 3gwd5QtP08n/LdLM/65XQigNhQpZvFJgoQ+/SOFyb524vPSRaWiokJYFhTMADgq8BCrO2gyj2
 7z2WNp9EC/ckWcVaZfMDw1i/M8ZB4/H1xyQGghL79RJK1wokOt5O02Y25AXhRI2rgh8LVlkFe
 4G+o3K+A3gICmzqsyyQaFCsV0awQNdv6TcAwOMYkwtqNl875rv3dEqx5imTPg9lwv43Y5+4WT
 kM2dR07eRo3t20Wd0FvVQvcujB456sRVWj42XlMJU4d+8nZ/Thh9JymqgSxUIkEwFi8hufigK
 nplv/fhR7C2d+2y0jCLhXDeiGvg+Ldop5qgjgunaYCKyxgsruEYY9skXyFkaw08x9D/E/+urP
 z6i863Uu3JmrcZKlDMWw0VyUCPZr0ob5Cbva0YgjzgbiwU4IAq4KkjtBmKdFwMo/HVk4tA1r7
 P5iKVI5aO2RQtn9TibzgauzLpWz0kJ1ZAXoBFZq8g1BDAdJ2550s9570t
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

Date: Tue, 21 Mar 2023 10:50:08 +0100

The label =E2=80=9Cout_err=E2=80=9D was used to jump to another pointer ch=
eck despite of
the detail in the implementation of the function =E2=80=9CpSeries_reconfig=
_add_node=E2=80=9D
that it was determined already that the corresponding variable contained
a null pointer (because of a failed function call in two cases).

1. Thus return directly after a call of the function =E2=80=9Ckzalloc=E2=
=80=9D failed.

2. Use more appropriate labels instead.

3. Delete a redundant check.

4. Omit an explicit initialisation for the local variable =E2=80=9Cerr=E2=
=80=9D.

This issue was detected by using the Coccinelle software.

Fixes: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 ("Linux-2.6.12-rc2")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
V2:
This update step was based on a previous change.

 arch/powerpc/platforms/pseries/reconfig.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/plat=
forms/pseries/reconfig.c
index 44f8ebc2ec0d..14154f48ef63 100644
=2D-- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -23,15 +23,17 @@
 static int pSeries_reconfig_add_node(const char *path, struct property *p=
roplist)
 {
 	struct device_node *np;
-	int err =3D -ENOMEM;
+	int err;

 	np =3D kzalloc(sizeof(*np), GFP_KERNEL);
 	if (!np)
-		goto out_err;
+		return -ENOMEM;

 	np->full_name =3D kstrdup(kbasename(path), GFP_KERNEL);
-	if (!np->full_name)
-		goto out_err;
+	if (!np->full_name) {
+		err =3D -ENOMEM;
+		goto free_device_node;
+	}

 	np->properties =3D proplist;
 	of_node_set_flag(np, OF_DYNAMIC);
@@ -46,20 +48,19 @@ static int pSeries_reconfig_add_node(const char *path,=
 struct property *proplist
 	err =3D of_attach_node(np);
 	if (err) {
 		printk(KERN_ERR "Failed to add device node %s\n", path);
-		goto out_err;
+		goto put_node;
 	}

 	of_node_put(np->parent);

 	return 0;

-out_err:
-	if (np) {
-		of_node_put(np->parent);
+put_node:
+	of_node_put(np->parent);
 free_name:
-		kfree(np->full_name);
-		kfree(np);
-	}
+	kfree(np->full_name);
+free_device_node:
+	kfree(np);
 	return err;
 }

=2D-
2.40.0

