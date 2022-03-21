Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276304E228C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:51:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSyT6f8Bz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:51:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RTpvI40Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out5-smtp.messagingengine.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=RTpvI40Y; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSxs08DFz305B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:50:39 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 840B25C00AF;
 Mon, 21 Mar 2022 04:50:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Mar 2022 04:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4ZAouKjLpC5h4H2T+
 rBDcUdFqGSww9lvE0PZHfaLkkM=; b=RTpvI40YBMxSvUWqEZ2Tmz5LBJYP6qAMv
 15J+4VNBkCmDjo1YAB/FKtzc0o+NLzUWYBr8DdAtOQEOwvE148n6metJ0ljqB9l6
 bjuvqkiOITKuE75iqh/h6/i8Y0IN5Fim7kihZfven84N80hs/x4wBdrmSDCc2Cdt
 0T5TMD/XpTeDY7f0LvTmskhNr1XURPKqRS+Ouvk+OuhKwZDV07Cl1C65XmBi/pbE
 8hrXMkfl97f7w5NhCnE9YASU/ZuHsTwFKcQsHSvZM1YpaINothtAjc5cnFFl9fxe
 5BSjw4mbIoYosvVdkRGJujMXq91wWbcnQOC/JVd5/shCl9HmxUwJg==
X-ME-Sender: <xms:XTw4Yri048sE_ro5ls-IT4HC10KOCcSxBV3pfsaVrfL-wcawOsN5Hg>
 <xme:XTw4YoBe59WFoTMvbKpgIIqoNQQ806MoqYuidXEJCQlKN_t98Cjmlq-f0Ytfwdr_Z
 7SN5RR1Av0D0ojdl58>
X-ME-Received: <xmr:XTw4YrGUygfBuyDoM_B0CwmKoABDl89syBqOzv0gyRwS55BfUO0iJi-gF9C1giUusMkgWcJfjA25gB0ZW7Du2kuQBDULECOFTfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegvddguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffh
 gfehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:XTw4YoTB5yiUMlhyyt6xd3DkptfcvjtpMDf4zvVp6EJmW1cycJ_asw>
 <xmx:XTw4YozBfbzOge1jLg1jhAUAcC6TrWhOoW5i_WUpSm1p12EBfE1TPQ>
 <xmx:XTw4Yu7MZZOF7tOdtYMGEqMHP_R_ihXQjpTCRbJZ5nx71hY2lMKqeA>
 <xmx:XTw4Yj_0chEIvNWuUGEuuhZ81vzl4nQR1Sx3xGF9S1-XpXPDyIa1Vw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 04:50:34 -0400 (EDT)
Date: Mon, 21 Mar 2022 19:50:41 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
In-Reply-To: <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
Message-ID: <7b16264-dfef-414-8195-87c14a89fb40@linux-m68k.org>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
 <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
 <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463811774-1170941894-1647852641=:12278"
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1170941894-1647852641=:12278
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Christophe,

On Mon, 21 Mar 2022, Finn Thain wrote:

> On Mon, 21 Mar 2022, Christophe Leroy wrote:
>=20
> > Le 19/03/2022 =C3=A0 08:20, Finn Thain a =C3=A9crit=C2=A0:
> > > drivers/macintosh/via-pmu.c:897:12: warning: 'pmu_battery_proc_show' =
defined but not used [-Wunused-function]
> > >   static int pmu_battery_proc_show(struct seq_file *m, void *v)
> > >              ^~~~~~~~~~~~~~~~~~~~~
> > > drivers/macintosh/via-pmu.c:871:12: warning: 'pmu_irqstats_proc_show'=
 defined but not used [-Wunused-function]
> > >   static int pmu_irqstats_proc_show(struct seq_file *m, void *v)
> > >              ^~~~~~~~~~~~~~~~~~~~~~
> > > drivers/macintosh/via-pmu.c:860:12: warning: 'pmu_info_proc_show' def=
ined but not used [-Wunused-function]
> > >   static int pmu_info_proc_show(struct seq_file *m, void *v)
> > >              ^~~~~~~~~~~~~~~~~~
> > >=20
> > > Rearrange some code and add some #ifdefs to avoid unused code warning=
s
> > > when CONFIG_PROC_FS is disabled.
> >=20
> > Why not just put those three functions inside an #ifdef CONFIG_PROC_FS =
?
> >=20
>=20
> You'd get a warning about the prototypes ("declared static but never=20
> defined"). Rather than add an ifdef around the prototypes as well, I=20
> just reordered things a little.

Oops, I was forgetting that I also added an ifdef around the new=20
prototype.

The simplest solution is probably the patch below, as it better exploits=20
the stubbed-out proc_* API in include/linux/proc_fs.h.

Was this what you had in mind?

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 2109129ea1bb..495fd35b11de 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -204,9 +204,11 @@ static int init_pmu(void);
 static void pmu_start(void);
 static irqreturn_t via_pmu_interrupt(int irq, void *arg);
 static irqreturn_t gpio1_interrupt(int irq, void *arg);
+#ifdef CONFIG_PROC_FS
 static int pmu_info_proc_show(struct seq_file *m, void *v);
 static int pmu_irqstats_proc_show(struct seq_file *m, void *v);
 static int pmu_battery_proc_show(struct seq_file *m, void *v);
+#endif
 static void pmu_pass_intr(unsigned char *data, int len);
 static const struct proc_ops pmu_options_proc_ops;
=20
@@ -857,6 +859,7 @@ query_battery_state(void)
 =09=09=092, PMU_SMART_BATTERY_STATE, pmu_cur_battery+1);
 }
=20
+#ifdef CONFIG_PROC_FS
 static int pmu_info_proc_show(struct seq_file *m, void *v)
 {
 =09seq_printf(m, "PMU driver version     : %d\n", PMU_DRIVER_VERSION);
@@ -977,6 +980,7 @@ static const struct proc_ops pmu_options_proc_ops =3D {
 =09.proc_release=09=3D single_release,
 =09.proc_write=09=3D pmu_options_proc_write,
 };
+#endif
=20
 #ifdef CONFIG_ADB
 /* Send an ADB command */
---1463811774-1170941894-1647852641=:12278--
