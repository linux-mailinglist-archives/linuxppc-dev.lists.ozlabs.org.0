Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C29294A7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 17:55:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EFm+RcmE;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=feUqBK6f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGZj74LjVz3cR3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:55:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=EFm+RcmE;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=feUqBK6f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGZhN1LnJz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 01:54:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720281272; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oQu9NJpOTvlm5sqaOBtbtSjC0GmbqaTimIaErxL5er0Cy/y1doMRrYd8YHsasBDvv2
    +bpa44fULXnM/OBjToO6pjSsNp47pPrDs/uh4c233WTsognGXbU/xHZf7ukrIjVP4BZg
    RDNpuIgguQl5U4eickv0vIPFv1VdshLv9RL0fN9uR3l5fDQK0MxIIUihJhOfUtwJHYOI
    LOTldA+PQuA7IatRdqAY4xy3njnQUQTmzZElydx1EoXLofTU1PxE6/GEIbXwWOHrdQsE
    BmGRnxQUh9GGIYJYbpdt45g+5rGRr78G8DuOgkLjQOZBpyoec9SyqEO+6BWQLsnCweP2
    eYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720281272;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=V5YwiazAeEN4dRiis3W1yfsGHE0h2QF7Ju83ZXv0xIw=;
    b=DyT6PHTmBeSgGXeyC302gvjLyhYtgE5QH2EwcjMehTllmqGQGALl7lc9l0KXPFuahz
    CI4U/aIETe985yEzzLSZKBxiS5UD+owVLYCT9pk+ORt+c0+n0yk8jQV/Ck9rkIvmHqlN
    c0K2AjvqxGPBzvBDX9TbPJVDJ8pGpi2RxISJutYNTxnVtNpsHyqEIVfK6sdyXSvNssNv
    Jh8OH3qdqzaJqfgxEOeNFr/ypfASJCQ/HP2l1eFLRMEJuJQTXZqZqxYWCd02VfWTlWV6
    ZFrnfP9PXE03ZSdknClLVLth+Kmj4yGMZVm4xdIuUxfK4g/CSYco3EW0Z56DtB8qTVMA
    ZfmQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720281272;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=V5YwiazAeEN4dRiis3W1yfsGHE0h2QF7Ju83ZXv0xIw=;
    b=EFm+RcmEv3Jb6IZRdOg09a00x/Od740fpnTkH8XS2mvx3dIdfIgtyl9OLqp+av91aq
    AFPsmvHmMk9Q27zp6YWU08KM1I+eXCIz9b/BqEUtCf7iBaOjB7ua7y5S2OxEte2wwij5
    fpTecZk7yKJXlgG7BpJlgTQl/7k0x+2RVGI5NnFCUTd76FeOvoGKayrASRIBiTCN67d3
    7KkTan+cH7n4Jf8K+Z5cByWi7LE1b4f63NGtPYhfdluXG94oMzrPZ5euEUJABLQFmAQi
    4tboeUrDnPivRy0+v+b8VGNq0TPKxmWEhUoH5ckaGWqG7ok35jm3XulmmNnthRcawkEW
    xXBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720281272;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=V5YwiazAeEN4dRiis3W1yfsGHE0h2QF7Ju83ZXv0xIw=;
    b=feUqBK6fPUAJa9MwugIBfvjA9VqnYR2IcS/1VKpZyqPJcohTAspOxna4wuCDAPKPF4
    HMtx926oKldM5qV6MgAA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3s36WCHpkK6jpK2wKbeiFIUzgLYe3d6gbw0o="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e08389066FsVYVz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 6 Jul 2024 17:54:31 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
Date: Sat, 6 Jul 2024 17:54:20 +0200
Message-Id: <8FDD860C-4DA4-46EF-BAD6-8F68837DA993@xenosoft.de>
References: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
In-Reply-To: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>, Marc Zyngier <maz@kernel.org>
X-Mailer: iPhone Mail (21F90)
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6. Jul 2024, at 06:15, Christian Zigotzky wrote:

Our tester has tested the second irq patch again and the kernel boots. We wi=
ll test it again to be sure that it really works. ;-)

Second irq patch:

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 462375b293e47..c94203ce65bb3 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -81,7 +81,8 @@ EXPORT_SYMBOL_GPL(of_irq_find_parent);
 /*
  * These interrupt controllers abuse interrupt-map for unspeakable
  * reasons and rely on the core code to *ignore* it (the drivers do
- * their own parsing of the property).
+ * their own parsing of the property). The PAsemi entry covers a
+ * non-sensical interrupt-map that is better left ignored.
  *
  * If you think of adding to the list for something *new*, think
  * again. There is a high chance that you will be sent back to the
@@ -95,6 +96,7 @@ static const char * const of_irq_imap_abusers[] =3D {
     "fsl,ls1043a-extirq",
     "fsl,ls1088a-extirq",
     "renesas,rza1-irqc",
+    "pasemi,rootbus",
     NULL,
 };

@@ -293,20 +295,8 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phan=
dle_args *out_irq)
             imaplen -=3D imap - oldimap;
             pr_debug(" -> imaplen=3D%d\n", imaplen);
         }
-        if (!match) {
-            if (intc) {
-                /*
-                 * The PASEMI Nemo is a known offender, so
-                 * let's only warn for anyone else.
-                 */
-                WARN(!IS_ENABLED(CONFIG_PPC_PASEMI),
-                     "%pOF interrupt-map failed, using interrupt-controller=
\n",
-                     ipar);
-                return 0;
-            }
-
+        if (!match)
             goto fail;
-        }

         /*
          * Successfully parsed an interrupt-map translation; copy new

-----

Great news! Our tester has tested this second irq patch again and it boots.

Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=3D58632#p5863=
2

We will use this patch for the kernel 6.10-rc7.

- - Christian=

