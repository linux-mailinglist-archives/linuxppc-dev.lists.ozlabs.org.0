Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0D6BE450
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 09:52:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdHtk1qTfz3f4M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 19:51:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GrwmQiSq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.3; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=GrwmQiSq;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdHsn1t3wz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 19:51:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679043045; i=markus.elfring@web.de;
	bh=Ny2+Yz8iLoa0LnoPg8+mF1BSkHbeR5YPbnmNfmmcLco=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=GrwmQiSqTF6Ok2u0OSsTIYJPI4m2pYPm7uUQ4xSB/4V7m6SeDwWB3guEsbcyEVMNz
	 hTu2KbdzesIDIerPnkQTtCTOpExDuJHpJu69NXlQgX5K5Uz8wHJywj1edKndj3Johd
	 azC3Z0/IE7vP4e71neX1iYABDkaMzFMANFxTRXL4DP15iwMwL2eg+fV5vHV5u64Mjy
	 koQJApTRkP+fIdCs1DqBbaJxgLMq1QpZxE+y16gxKHO9IIx4Fi/QyTcCmi/svW1tY3
	 v/2nkDNVfP3WdghBb8/8VQuFHy7uvwiTKH8A8LIXvGcN03lV2oYxX/UVTN23x8gEjh
	 yp44vHoa7S7iw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30ZN-1qeEGG3CaT-013KZ0; Fri, 17
 Mar 2023 09:50:45 +0100
Message-ID: <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de>
Date: Fri, 17 Mar 2023 09:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH] powerpc/pseries: Fix exception handling in
 pSeries_reconfig_add_node()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
Content-Language: en-GB
In-Reply-To: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ojqY97XPPs62oSQxFjJWFONEsarYto7h2+za5OLiEL7ZwTEngxH
 /X3CjkHqoK1cfnz8mTe+pGC0EPmPJb/diKcyGLGNMuFoh3CVhzznVs+IsMyraAJPGYGW4TN
 FFVnC5AsAjB/OT2GdTBt15JYMCFvzPkhYQ0wizndncjdn8VFIRAHwDRbm1TiSobs4E88TMv
 5Pg4EGFvsrI463PnZ3CUA==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:hYobDk1o2DY=;Zs4b7wxG2aIWT4tLpbu6BNwYHqn26
 85xKN3r1T9F7Bw0AB5dhaJ0aI/C/6+l9NDqBRy77IqwZXJSjsCQGa0MgeZLykjgh9UHy5IdP7
 SxlFA4dblugYJT2ROCGtY4lflntSDJWJ0hGOBy3oDaM74yXngQeRQjY6Zfq2BOLTSnIS5/rAc
 V/se0qiQ0JW2b0yoKyvjJBWKN/ZRbcYjg72XB3y/aXplme3s8shoSC6hTbtQiF3a77sDV9afC
 RuB7TI9ZvPQvMQM/v6+gh1uzluh/vEmXBll88jZ/fC+Dla75Jd/ppN+y0c49oeI90IZRgIafU
 Ulpcc+1TCVJO+SiWNvV6/p+2AcHKRdDnjASc2SVO2iAxUb5NaOQYnUJOZz3RPKyC+IajRX8Pb
 tf0WzK6OVLMr5zcHNkiC64dmI4AnZeJrEZTdv8I/SgD5/3o+i2uEb5Y/hfw+U9bHlCafcV8Uw
 Ux5da4Dr3yyUlaY4sflK+1MGwGs9eYwtFmW3z9RPRdFQffcNyq03uNT351rBVZ5TREbaZZUzo
 l3GtEEAzaqOrnvRDsq+EYgPHMh4UtXoSYxyC9WCqHfhvqt2QoYDpfGsyAnQK3V5h2NbVEdesr
 aoeyyWiN8pB4gyUOR5080CZM4t8rOZg/ZKoEB4KIN2F8EdahyXWm3HjNoNhHXJ1wCkEy5np/x
 TciWUWe8dWyoT+bVzlxflgQoTfGewaFgAZgjCK8OYnQ+qbuixJPBW3fo1U0fYGJEyJ9Yn4mxT
 NIRzKR2bp5lxH5WkJamPAyA/IiDuiQAggS5O/dlLntYzYJec9VO4GcqTz5tqplH2g0RHlIWZQ
 xXYwkI5fPrEE7R0bpvhKdHT7YmLylxSOyVQzPhCno9+XXm+1DdZ1YJ7DjoENyGXpX3pMoH1gq
 +tNQvmFG18WqsSTSatQTi9qRrVuYfoLSDL/xC1PtY+Uvy3p2HXlXWwYVE4HX0FHSexoJmCtz2
 gWFQqf2Z/SsM7X7SbDrZyGoGIlG1B95wvO9uj5xQKocQru1gjClKMoUdCIGM82rWazBd7Ozwt
 Fs/PU386mksn8sKo=
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

Date: Fri, 17 Mar 2023 09:26:13 +0100

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

Fixes: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac ("Linux-2.6.12-rc2")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
=C2=A0arch/powerpc/platforms/pseries/reconfig.c | 26 ++++++++++++---------=
--
=C2=A01 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/plat=
forms/pseries/reconfig.c
index 599bd2c78514..14154f48ef63 100644
=2D-- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -23,15 +23,17 @@
=C2=A0static int pSeries_reconfig_add_node(const char *path, struct proper=
ty *proplist)
=C2=A0{
=C2=A0=C2=A0=C2=A0 =C2=A0struct device_node *np;
-=C2=A0=C2=A0 =C2=A0int err =3D -ENOMEM;
+=C2=A0=C2=A0 =C2=A0int err;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0np =3D kzalloc(sizeof(*np), GFP_KERNEL);
=C2=A0=C2=A0=C2=A0 =C2=A0if (!np)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto out_err;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return -ENOMEM;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0np->full_name =3D kstrdup(kbasename(path), GFP_KE=
RNEL);
-=C2=A0=C2=A0 =C2=A0if (!np->full_name)
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto out_err;
+=C2=A0=C2=A0 =C2=A0if (!np->full_name) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0err =3D -ENOMEM;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto free_device_node;
+=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0np->properties =3D proplist;
=C2=A0=C2=A0=C2=A0 =C2=A0of_node_set_flag(np, OF_DYNAMIC);
@@ -40,25 +42,25 @@ static int pSeries_reconfig_add_node(const char *path,=
 struct property *proplist
=C2=A0=C2=A0=C2=A0 =C2=A0np->parent =3D pseries_of_derive_parent(path);
=C2=A0=C2=A0=C2=A0 =C2=A0if (IS_ERR(np->parent)) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0err =3D PTR_ERR(np->parent);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto out_err;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto free_name;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0err =3D of_attach_node(np);
=C2=A0=C2=A0=C2=A0 =C2=A0if (err) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0printk(KERN_ERR "Failed to add=
 device node %s\n", path);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto out_err;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0goto put_node;
=C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0of_node_put(np->parent);
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0return 0;
=C2=A0
-out_err:
-=C2=A0=C2=A0 =C2=A0if (np) {
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0of_node_put(np->parent);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np->full_name);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np);
-=C2=A0=C2=A0 =C2=A0}
+put_node:
+=C2=A0=C2=A0 =C2=A0of_node_put(np->parent);
+free_name:
+=C2=A0=C2=A0 =C2=A0kfree(np->full_name);
+free_device_node:
+=C2=A0=C2=A0 =C2=A0kfree(np);
=C2=A0=C2=A0=C2=A0 =C2=A0return err;
=C2=A0}
=C2=A0
=2D-
2.40.0


