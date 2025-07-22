Return-Path: <linuxppc-dev+bounces-10362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293BB0E500
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 22:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmppM14mwz2yhb;
	Wed, 23 Jul 2025 06:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753216315;
	cv=none; b=KOcJlmIvkf7mEEru2ftUqHptVOAJzDWiz30GKEnOe1QObhZRTB0PcvVvDipPAl6E7zvxCh68DDFteuXo4TgAh5nmMnUAAYV2G0jWTYJNtXJJ4laCNS/pv21uegUdQgYD53EeS4vP0QKKGgu/BHcernPzh1OGqgyoMq7rUYoxXi0mvIckaKQqc1K/QH0kHgLHiB1+uY48+qlFRRgauwsSoW780r0lzFALtZtpj5GhVRsE9bsqikGwHcCNuOL7SnhFa1/nXaHWqmOvFLCpnwIns3D271MlsryhzbGu52R1/pOZC+a9jxjwdsQRpxAMX4qJ5id57UakLowgsNHvbNkQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753216315; c=relaxed/relaxed;
	bh=hetnCMXtpudx5SS3SZrduYJl7SdapCss9YBCODWh/oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVUrAB+D2x5NSxt1nlkJTDKo94UeZP7a3dqdnJdWYyESko7wqk3AyQcoIn+Mgb2jcD+f0TlYl6SNGYpLwxbf1SYqpXwygykg+oCDYL2IKJ8qp3w0qhiImSX/P2/ISAHdNceLpNeARDGpr73hHyRAxidcaOujXIIEW0zJNkQ+A2cWhgkOJ+NE/6bAESBZei876/Ma4S3BqAHtMLn2WeQCSShSWgt3bvduO8A55t2luWJugx0aL4NQZY3pA15Bo2l+hnKa+qR7/DMD9PoSPxWuzoi2MxQVR9JsvtxrugYFpqGYvlSEe46wfiysWhK7tmLP+/8PD6rhv97of3O7YBtYGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OguZwGLT; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FBhjcHAS; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OguZwGLT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FBhjcHAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmppL0vSKz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 06:31:54 +1000 (AEST)
Date: Tue, 22 Jul 2025 22:31:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753216308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hetnCMXtpudx5SS3SZrduYJl7SdapCss9YBCODWh/oc=;
	b=OguZwGLTIV/TP6wxTPTO2eIVfceWBS46xHtqKuhmXuJ6XFHGWi8SbtvpYVEg9RYX6965GF
	XdT10JTfkJRtuG2hCng7P4qxRhdKr7L/UGiy68zxaA0LuH+yeBiboqIVOo9nlGan88kIk1
	74RedlN8GWM7n/fR7Rsnl9Bw3M5fFHDolxb1m2G5qnsY/nt1zkcAQYGfYZzPNhIDDU+mlZ
	cH9FybSnQZXSljTPmL+AiBWEVHnAV91yDPOomBelPdNIQn62FOL6gL0GLKM7T0BXZWj/fY
	AMffps7nmiJIps8LbMcm5DrTh4s7GKze7AFS8l/eHxbZFdl+FDVoIaka+kcuUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753216308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hetnCMXtpudx5SS3SZrduYJl7SdapCss9YBCODWh/oc=;
	b=FBhjcHASNO3ItsJFzMJ6H2tfMBtfFTf8agVkhj7hfcm67sph+xe5Vpv9fiYP9wzUyvI4p6
	Q3FICOeelC/M+PAg==
From: Nam Cao <namcao@linutronix.de>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
Message-ID: <20250722203145.Y0vncMx8@linutronix.de>
References: <cover.1750861319.git.namcao@linutronix.de>
 <aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
 <20250722092402.uMLOYoII@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722092402.uMLOYoII@linutronix.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Tue, Jul 22, 2025 at 02:05:55PM +0530, Gautam Menghani wrote:
> > I am seeing a boot failure after applying this series on top of the pci
> > tree [1]. Note that this error was seen on a system where I have a
> > dedicated NVME. Systems without dedicated disk boot fine
> 
> Thanks for the report.
> 
> Using QEMU, I cannot reproduce the exact same problem, but I do observe a
> different one. They are likely from the same root cause.
> 
> Let me investigate..

So the problem is due to the pair msi_prepare() and msi_post_free(). Before
this series, msi_prepare() is called whenever interrupt is allocated.
However, after this series, msi_prepare() is called only at domain
creation.

For most device drivers, this difference does not have any impact. However,
the NVME driver is slightly "special", it does this:

	1. Allocate interrupts
	2. Free interrupts
	3. Allocate interrupts again

Before this series:

	(1) calls msi_prepare()
	(2) calls msi_post_free()
	(3) calls msi_prepare() again

and it happens to work. However, after this series:

	(1) calls msi_prepare()
	(2) calls msi_post_free()
	(3) does not call either

and we are in trouble.

A simple solution is using msi_teardown() instead, which is called at
domain destruction. It makes more sense this way as well, because
msi_teardown() is supposed to reverse what msi_prepare() does.

This would also remove the only user of msi_post_free(), allowing us to
delete that callback.

The below patch fixes the problem that I saw with QEMU. Does it fix the
problem on your side as well?

Best regards,
Nam


diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 70be6e24427d..7da142dd5baa 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -441,12 +441,12 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
  * RTAS can not disable one MSI at a time. It's all or nothing. Do it
  * at the end after all IRQs have been freed.
  */
-static void pseries_msi_post_free(struct irq_domain *domain, struct device *dev)
+static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
 {
-	if (WARN_ON_ONCE(!dev_is_pci(dev)))
-		return;
+	struct msi_desc *desc = arg->desc;
+	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
 
-	rtas_disable_msi(to_pci_dev(dev));
+	rtas_disable_msi(pdev);
 }
 
 static void pseries_msi_shutdown(struct irq_data *d)
@@ -482,7 +482,7 @@ static bool pseries_init_dev_msi_info(struct device *dev, struct irq_domain *dom
 	chip->irq_write_msi_msg	= pseries_msi_write_msg;
 
 	info->ops->msi_prepare = pseries_msi_ops_prepare;
-	info->ops->msi_post_free = pseries_msi_post_free;
+	info->ops->msi_teardown = pseries_msi_ops_teardown;
 
 	return true;
 }

