Return-Path: <linuxppc-dev+bounces-9452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D90ADF332
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 18:57:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqfS2V0yz30VZ;
	Thu, 19 Jun 2025 02:57:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265840;
	cv=none; b=Qcy3ma6oOh2Df8Hd5aTc6yby763hQyXY/iPiYZJ0VLJbgqna8YBNfTVooRZUu46Em6qnWuFNy4a0ZXibZU2qWluL+rqMXcqVwfYU18DUWy9hS+IvGLo6vDE0WPyu/LyhngbAdwAtrOMSHqTzXCXdg9o/EqFjscEZ/A8X8P5lrhtijQs4t/bP9i0yf5atL6bsb8x8kFe4e9pwCBWMLamP15uLlQtvELwTnka29//jUDU56RORRh8kkWwSbaJ7xlZlXM2YxOhuxY6jCDQQAFh57qjALL+DHHCrR4T/Bmh/3wY8croKT3LxbRdODcpAsUNc5Py8iAk33LjyxcsJHmZ3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265840; c=relaxed/relaxed;
	bh=USAGms6qzWe7rESrb9AGGpmLmspKTjgFGVbO0Q+1BzA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=VuAFgtSzFU02dXRV2Ahir53EueLxt9I26N7700QCD9+i7LqEwIFRgurY0VjqnPd5CYNZHoPsqfM6AbZ71fDPnEwB2DqSs2iSMYEJojWQsMFGZnEeK6pTbiI5KRCVxfwjuunFOCRjDzHT3CNkSmRzu/1i6jbq4+lZKDy2smVc9Zx6M8loKgXdHOCDYwYEdDM0jxzIsYkWdniXI7NuNHFUr+gf/q2K7S8nCKB0kOZdZNgDXVz6dVvIw2/tLLzTGWhoqwpT7dAO1sZ7NbnfOevfAfeAKT5A9cmsCUX58nR6AVzuyfdFebTFDtI6xDeeSalME+TIspvuatsVCXNOcGbGow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=LFEN0DId; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=LFEN0DId;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqfR4nKDz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:57:19 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C20468286FBD;
	Wed, 18 Jun 2025 11:57:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kRel1SYbqiIX; Wed, 18 Jun 2025 11:57:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 319628287179;
	Wed, 18 Jun 2025 11:57:17 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 319628287179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750265837; bh=USAGms6qzWe7rESrb9AGGpmLmspKTjgFGVbO0Q+1BzA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=LFEN0DId7062kxNccMz/LnwhOwiWj4dMzKqnwFilyzqXGLpDuVEf3XpD8iZU4T0Nu
	 n4Q2hgjUDoFxzS35f4zaig8s01sjPr2hz56/z6acnphLNHLFa6qNIQQjPU91iSiXkx
	 Owd0NK0N5atfBk+HRHI+GZPxt1eeJZTgBsSC3FeI=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JsKIlELgcYoO; Wed, 18 Jun 2025 11:57:17 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EDA928286FBD;
	Wed, 18 Jun 2025 11:57:16 -0500 (CDT)
Date: Wed, 18 Jun 2025 11:57:16 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <374686472.1310637.1750265836363.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <581463409.1310624.1750265668004.JavaMail.zimbra@raptorengineeringinc.com>
References: <581463409.1310624.1750265668004.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 3/6] powerpc/eeh: Export eeh_unfreeze_pe()
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/eeh: Export eeh_unfreeze_pe()
Thread-Index: 7ViWVrejj338yZQm64sXoMCfdWvE4GWR/U+K
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PowerNV hotplug driver needs to be able to clear any frozen PE(s)
on the PHB after suprise removal of a downstream device.

Export the eeh_unfreeze_pe() symbol to allow implementation of this
functionality in the php_nv module.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/eeh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..3a2a926fbd64 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1139,6 +1139,7 @@ int eeh_unfreeze_pe(struct eeh_pe *pe)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(eeh_unfreeze_pe);
 
 
 static struct pci_device_id eeh_reset_ids[] = {
-- 
2.39.5

