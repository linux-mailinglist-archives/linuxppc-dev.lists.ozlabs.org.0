Return-Path: <linuxppc-dev+bounces-17045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LwwIAhQnGktDwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:03:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C58176867
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKLcg5y3Vz2yFc;
	Tue, 24 Feb 2026 00:02:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771851779;
	cv=none; b=hPF171I/Uh7R/RPQZjvQbg1f6EzWUkCHKJBdFVO0tSCY87bg9eB00K5UKjgnBLKU4tvhesFXb44lw0oDp2e+Asy43fEgBJQ8IHlVxm7s5rsfwJGUg41dPXe8jP2+NUvK0YnAguGSdeHF/ctiCHDKQW8xoUmwRTlPyHAbBO0jrKcMM3S4587hJvK/JQga9VO6kU7S3n1jVan/1Fd3Y3TmgmIIBV27Smf5dhpELIRrbQwcFlePJrgunIb+juI8MgXeIoJtsgIcKhBxRmNtFcoq+5NEedXBwKYoCLJyAmrwu2Iocdzl5LTP1niDQ59vJhmLVqlrGd0MW/3dk8uR1S+FHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771851779; c=relaxed/relaxed;
	bh=T8bNnw4n0yRZCqrV5DD7E0brTxIXyWYVqVFXtX6Tk2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iWnf6zOEkhuE57pFcg0W6SLMQ6+AYfIU8zT/mOgcgzMgRBV3o+B/4MJ1rGEyrwnF5qXWyQABnLgrdNUadr/yYT7cDsItCm+aBfWhQxOZusaSIPL8yex5PPUOhsfbHEFu19wofb69plifI6B1KC4b9GvloB4saHkWKL5xM/kRuUYjMm36KegVNRSGWgfLzLezyvJ2Ha+wE7/n5kC93CEbCvipyNlFa8Uo3hu96Jt4aJt1paiqr7FyDNZau8rreG+zndFpqsHN3x2ClQHC5o/E27JTJhrMOubBr2K8DwTH4ir3l/hxhQHpiUui0p8VNxfqI7KbpR/zY1scjI6TioA9XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EACiBWri; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EACiBWri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKLcf2q16z2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:02:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E596B43BC3;
	Mon, 23 Feb 2026 13:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC47C19424;
	Mon, 23 Feb 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771851773;
	bh=iZBlwQliLKOaK+xvvX3FOn/PA3LT6MHuwUPt+gChPDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EACiBWriChy1jxD1pIwPsXwtgGcD9o364heVNUAxRBZ1sQkq+GJjO13PgypgojArv
	 +q3mxYpshrSqNHLUgfb8A2e5btCOVZs8KrKs/USVUB/GT97HWBgkwSNPGj/vwbLlge
	 CMX2UxlRJW+P7yxlkx+v8cnIEKQ+f25YYcsFho4wincbwYzmtGLFxgIfvd75uFSMdT
	 zSlUFnKsnPA72515URXnT7URdo00dBNZWh7eWWBfRyRtc0Pyca3knsGhf2aRTzLlVP
	 DFlEQ5BtDf9kMAv/DpHEmmk8soywcgeHB86IrDhR4OkzbMDsopTUbzbZEqpOOuU/si
	 vr8QCRbyNJryQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <86qzqbal69.wl-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org> <87seasv11z.ffs@tglx>
 <86qzqbal69.wl-maz@kernel.org>
Date: Mon, 23 Feb 2026 14:02:50 +0100
Message-ID: <87pl5vvchx.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17045-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C3C58176867
X-Rspamd-Action: no action

On Mon, Feb 23 2026 at 09:01, Marc Zyngier wrote:
> On Sun, 22 Feb 2026 22:57:44 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> This rejects as you are building against an unmerged change (I assume
>> it's Lorenzos GIC5 stuff). I can fix it up when applying.
>
> That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
> that this is still doing the right thing after the ACPI crap fest, and
> repost the result.

Ah. The other way round :)

My resolution is simple and it looks about right. Please note the
cosmetic changes I did on the way :)

Thanks,

        tglx
---
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2022 Intel
 
 #include <linux/acpi_iort.h>
+#include <linux/fsl/mc.h>
 #include <linux/of_address.h>
 #include <linux/pci.h>
 
@@ -186,10 +187,12 @@ static int its_pmsi_prepare(struct irq_d
 			    int nvec, msi_alloc_info_t *info)
 {
 	struct msi_domain_info *msi_info;
+	int ret = 0;
 	u32 dev_id;
-	int ret;
 
-	if (dev->of_node)
+	if (dev_is_fsl_mc(dev))
+		dev_id = fsl_mc_get_msi_id(dev);
+	else if (dev->of_node)
 		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
 	else
 		ret = iort_pmsi_get_msi_info(dev, &dev_id, NULL);

