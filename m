Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 794486C2F2F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 11:37:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgp382k3cz3chw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:37:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dfz0zp6k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=82.165.159.35; helo=mout-xforward.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dfz0zp6k;
	dkim-atps=neutral
Received: from mout-xforward.web.de (mout-xforward.web.de [82.165.159.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgp2G2Pzkz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 21:37:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679395005; i=markus.elfring@web.de;
	bh=BIc+PISjxVPBc55dVATLly0k5R8zHbZLDGw/LWHdgf8=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=dfz0zp6krx+HoOSz7F1rfYLCpZTHHaC7lDA3Jz2vgPqqtICIqSP6b3oo1FgqfFae7
	 ZpMptq4ZLbCFOj5LZd2x92d+L+l7vxaKiyLtw8rhGolAARCdgqL1lFxKj7hKkbwh6v
	 Uw6GYi4DMP2ycsaBXAt/lvPVQNcd2D9Cy/z6sEulXmIQ7HhCgQTaIr4EEztkxeeQsy
	 rSe0G7MfdXxoexhxSEDO+r5+w8d0fE2Ahxsaa707BOpTq0jpxi5rj/pNleJHblra03
	 vvdW+P2gh70ivHz3DJSWP6LtWvDZN6+PgrF3r+OnFkxV3GcUMvETHxgR/iMssirAjt
	 GpMJXILcuP50Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MumJF-1qVZiZ4AFP-00rr2m; Tue, 21
 Mar 2023 11:36:45 +0100
Message-ID: <feb8f422-8c22-a3ae-6004-8e32148c322f@web.de>
Date: Tue, 21 Mar 2023 11:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 2/2] powerpc/pseries: Fix exception handling in
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
In-Reply-To: <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nyp/+9Cx269IjOVyB3aeJBjyVAjpww9ps+sIKWMCzGEvmhY1V09
 72ZdbXxsX1BJs9FIoo2LKijY04Kh/qN7K3wsuxnJOFLhGDxEhM2sI9lXSjpwR1bOknL4aX/
 xTsUU6kT8uthSOjksmIv9RgWMBPiZMB1wGo6Ni4IdQR4qwnDVOkVBSkmKaW4PwrYKYgbPtX
 zJ8QKDaFzjsrvxiNbQn7w==
X-Spam-Flag: YES
UI-OutboundReport: junk:10;M01:P0:MQApYcTHWzo=;kyFUCZrqQ//ZeA3kapsjbL1leYLFU
 KmYSlBz8okWRgaEzUx6G3nnS7iGqgpUDT8E6cssesZTYn4pebyl6H+AZ6+pBdRjhhlChCAgA0
 wTMaUL2x7cODL6it2tN3KrBP/hx1Hkoipeb7QFdaRwRNWG7yWM8C7b9LE5RIhLW+wlKyqY9TL
 tiDkXUXtlnENnMMVf7KtwYShCakjpJVBpZXTA1z1iAxjScoWiaP+taxG6LuIEj8xsbbQRqYge
 lXUD5GGGX7L/AaDipeoiavex85lwIm5zA2OJ8upoCyiNHYY/Kdvtks0CA1vGGUFwQbEJ4TDdH
 Ogmr8s5VBlu3yNEebt1Oj7N/RoF+JV/623WXW3iYK3k/IQuMzENs9FyQyQcCh5GbH0hHFlm/E
 BM4M6Fr8qBOf3D+ZMhZGzLYG4RcpgJlC7uPCytYQKBbm3/ySt88MJyKVBBJ1EZVe957F/Ohcj
 EEMxO4PEIe9nCDlPNDPz+sa/oPkO1ZoaW++lABVsKS54uPZE7Slaacm5E0L6YMxd8YNBg4Kfy
 1n+OlTq85GGEK76/cn5AyOmqhBKxSGnoljWEmSIwD5+etkSGgivGzIiXJmtDCDKhXoIKS3UGc
 qw1A4sL1WifH2l6doR50OJ6G0GTMI786RHHy+1cGGW+yrmW/qQ5X/6S7ejWBpNZwUIQAw362L
 4/ioAsuIVsZaejbruo18ZfbHgEAb3kIH1NZttMuSXMrrhgQVxuZzFBfol4eQsMKpSu46Mm9Dv
 c7IBv6YAAK0kYcmteAodWS3jbVTRe0SMc3ZoRfuUEhFBogdmOszmsc8riImiVdeToMV4bV2IM
 1FY9LFTLVQH5RO9t0AKeKj0Kwv26m3p9V8CZO627lF1HDSMGVipS79AiK1qX6IMpHK4X19JjH
 e1d9C/dZUUU45H6y4UreV1R8gNTA0Xv0I7v74dPx6hgjoo87ltKW1ZNkyN5sxMa/07LTs+rPq
 a6owtble8Ov2ohyEAGLMVA1lnrJcHEP/xYsN0CZwpm3urYYkbSBGFo9uj+LiuGTw+jYzEp9En
 f3hyCnWVXQ9yqK8U=
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

=C2=A0arch/powerpc/platforms/pseries/reconfig.c | 23 ++++++++++++---------=
--
=C2=A01 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/plat=
forms/pseries/reconfig.c
index 44f8ebc2ec0d..14154f48ef63 100644
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
@@ -46,20 +48,19 @@ static int pSeries_reconfig_add_node(const char *path,=
 struct property *proplist
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
+put_node:
+=C2=A0=C2=A0 =C2=A0of_node_put(np->parent);
=C2=A0free_name:
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np->full_name);
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kfree(np);
-=C2=A0=C2=A0 =C2=A0}
+=C2=A0=C2=A0 =C2=A0kfree(np->full_name);
+free_device_node:
+=C2=A0=C2=A0 =C2=A0kfree(np);
=C2=A0=C2=A0=C2=A0 =C2=A0return err;
=C2=A0}
=C2=A0
=2D-
2.40.0


