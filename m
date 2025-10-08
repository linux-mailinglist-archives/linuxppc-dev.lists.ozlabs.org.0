Return-Path: <linuxppc-dev+bounces-12714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF017BC4E51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 14:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chXhk0FlHz30NF;
	Wed,  8 Oct 2025 23:42:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759927349;
	cv=none; b=KiqyqPOmCOFuj2+5naq6oqj89p2o/8GpKlcOJop5pRziRNfxBM2xCPmeD6VPBb3BJRGnNdY+bR+GrI3C/GG4yJalPlyHkVflQ1VAbRzP7Uxd1mdeisFnhYFn8UGQW1+dg+c5xZKdAKXxqXQ4+uG2NWTyaySpfvsNs/eAI7w1fVyvykIzHTY3GqiUcXze8mH0n/R642O/oDsqGbGSpjN01V3Uh2XQB4D+JaisgKeD6nL0D8CV+1RlCMO5+41yoXKe5sk+C6XgQAjOFtQjMuMGj+JW/AcWHLwRa+kTMj3DkmFoxJszdY/uyZNNtceLmby2NpKUzdJnsXTZJMiD2o44TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759927349; c=relaxed/relaxed;
	bh=SEB371UVD7p9y6tuscumDyLeJGmkjZ51qI7OiaqfHYQ=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S5NLa+oLgdaalH0+yNlZI1MVH8+AMQGpRMbMZDtSBoK6L8K9oUo07LppQrLFgYWmr42SoSxfKMENq/ZiHJ/gZvc/iFsIAHUuoBqXgPQcD8T8j4XHskexph7JLji5gNr8rq/wYKyxlRNxJxDbPm7begcTOIOHp8eFtoElY9gkBX0f9aHSocEs5gTvMSHNeuawGsyEQJoDxZ/oYN/MStzaipmo1vfldhUyjxZfFyFLiK72OK/blA1pF7/3f57703o/aWpGMUYzPyllvV3rvFPO13iNi/+lNz3R+bstvR0L9p0BsAWHlN32YWQPwEIkv30i15YW3kA8/Tm9hjKoGimOAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O1FR00z6; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1hKkeoZd; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=O1FR00z6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1hKkeoZd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chXhj177vz2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 23:42:29 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759927343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SEB371UVD7p9y6tuscumDyLeJGmkjZ51qI7OiaqfHYQ=;
	b=O1FR00z6YIWDmCnUQnYJ/rkfBxjhVctVN1ldKAHZuqM7AZMiiiTiG3xt3bUMJG2QdsLDnL
	+tYlj1dm5Bv83Fh28wjSU6yOWAXp5vmR4I4rjbevk5VdVgCmIATmCJ1bNYzq7wyK0tP1dI
	a8Tn9S3gmAftbWlWn4Wsc4zs7GMXXaJ69ld862jc+04trtrQVYKVC4G7cgKF1RfwflfvOH
	QZfapA14EaBcqDMo06wxXFwZARn65jZ3pQ9KAdN7GVYvlkJWVrfubNqZ8//+6DOtyacF6R
	B/klHx/5snA7XPOwcyzDEyq5MNhUFGExt8qY6utqqdouYZ6RVFaJLxPaTzs2yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759927343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SEB371UVD7p9y6tuscumDyLeJGmkjZ51qI7OiaqfHYQ=;
	b=1hKkeoZdxe2Wz/9/ZnYPPSi8pqPSIkKVb++Fz2slv1L8s3IDPVuroDvdRTH0cnMrehC9fN
	IlBm9k7eXY5gX1Bg==
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [bisected][mainline]Kernel OOPs at msi_desc_to_pci_dev
In-Reply-To: <878d7651-433a-46fe-a28b-1b7e893fcbe0@linux.ibm.com>
References: <878d7651-433a-46fe-a28b-1b7e893fcbe0@linux.ibm.com>
Date: Wed, 08 Oct 2025 14:42:22 +0200
Message-ID: <87wm55h8ep.fsf@yellow.woof>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
> IBM CI has reported a kernel crash while running module load and unload 
> testing on lpfc driver.

Thanks for the report.

I trust the below patch should fix the issue?

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 825f9432e03d..a82aaa786e9e 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -443,8 +443,7 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
  */
 static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
 {
-	struct msi_desc *desc = arg->desc;
-	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
+	struct pci_dev *pdev = to_pci_dev(domain->dev);
 
 	rtas_disable_msi(pdev);
 }

