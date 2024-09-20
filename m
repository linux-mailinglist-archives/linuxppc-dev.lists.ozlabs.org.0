Return-Path: <linuxppc-dev+bounces-1490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955A97D3C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 11:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X96kk72vcz2yQ9;
	Fri, 20 Sep 2024 19:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.141
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726825086;
	cv=none; b=dcylzCjwxEZDWX6+qfBmUylH2b9Mnw25KfuzwOPaNxfS0QsPBx2Ahtge51wSdu9cAcTxmZM/2AaRthvVsMMqC4ok+lz6t8/3PBcBQ5qw7HqBJP4UEYcF+eq32DrEhXiJ9lYHeztUM3f9LV8Y7ndqfxjryMDlHDIcqxOcP3sB6OhOO5sgxUHMzouOorPCPye2Q0sYmXcOaE54WtoQLI2wdFN/jPLEwQDcRJoxXyCRL6JqmP1yXC8lu2uEqXNeJ9+G9yOv16XJqKKrIlOZwLtdA3Z+6xQ2eKX6NcyEtDaxONQSDCon5lrEuYUPEeJkZQa9+hSA/xYjIUSaad6JG8aq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726825086; c=relaxed/relaxed;
	bh=D0mskHRaG8uO51XB0w+Qjupk2ywjqNEa2TOnwxQtqhQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DRQOOABuBXgUOX9ZMzMGQ6RoRfkO4pXVRwhgbDOypFmjGvQbtEPz0d7HupZrWogI511jUTil2rH+lciZ03dH+BYF14cErxLMGiWgvw9KDOWwEgCoBSlUxxGECYdCPx2H1W2hf1Zyg9/t3NJmDMVNT5HCxeaNFFb+/A9SG6sSONpbPfV0rABHO4V9VBNXPhMnSjvTsBUArEPg683O5BAnvF38NS8L2kKrPMZskViyqFP8X6wjSIdY014mYN9Tvv1sTU+fMY0YvuNH6RSIctyKelXcjRPopXj7VwyTjPv4b2HVA4EEI2t0buRpGju7lkfV0gag/Gh6rld2cfCRlQxDqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=a3kWlhvp; dkim-atps=neutral; spf=pass (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=a3kWlhvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X96kh62VPz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 19:38:02 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48K9bKjn025160;
	Fri, 20 Sep 2024 04:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726825040;
	bh=D0mskHRaG8uO51XB0w+Qjupk2ywjqNEa2TOnwxQtqhQ=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=a3kWlhvpf7IkGjWVT7lDFl5kpISZbS1j+VWuBtJR9VfBSU3nRHit4EI73t62rGy8m
	 hMuak9pesVjAl9mfLUqywH+IJBAmsyq72nQxbgDpafsse10uCQUWAmJ3Q3itijTb/k
	 Qfx183o9yeTivmeYQ6bqd1Ht+sdtxnzoXLoHXf5w=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48K9bKDD015708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Sep 2024 04:37:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Sep 2024 04:37:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Sep 2024 04:37:20 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48K9bJLg087632;
	Fri, 20 Sep 2024 04:37:20 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Danny Tsen <dtsen@linux.ibm.com>, <linux-crypto@vger.kernel.org>
CC: <stable@vger.kernel.org>, <herbert@gondor.apana.org.au>,
        <leitao@debian.org>, <nayna@linux.ibm.com>, <appro@cryptogams.org>,
        <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <mpe@ellerman.id.au>, <ltcgcw@linux.vnet.ibm.com>, <dtsen@us.ibm.com>,
        Danny
 Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH v3] crypto: Removing CRYPTO_AES_GCM_P10.
In-Reply-To: <20240919113637.144343-1-dtsen@linux.ibm.com>
References: <20240919113637.144343-1-dtsen@linux.ibm.com>
Date: Fri, 20 Sep 2024 15:07:19 +0530
Message-ID: <87ldzmll80.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Danny Tsen <dtsen@linux.ibm.com> writes:

> Data mismatch found when testing ipsec tunnel with AES/GCM crypto.
> Disabling CRYPTO_AES_GCM_P10 in Kconfig for this feature.
>
> Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
> Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
> Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
>
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
nitpick
checkpatch complains
Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' -
ie: 'Fixes: 45a4672b9a6e ("crypto: p10-aes-gcm - Update Kconfig and
Makefile")'

There is no rule for 12 characters, but it is generally preferred.
I guess it is just a typo for you as you have correctly added other
Fixes tag.

If you end up re-spinning, please correct this

Also, just to understand,

"A Fixes: tag indicates that the patch fixes an issue in a previous
 commit. It is used to make it easy to determine where a bug originated,
 which can help review a bug fix"

from 
https://docs.kernel.org/process/submitting-patches.html

should there not be just single Fixes tag? as bug originated from one
commit, may be the commit that actually broke the functionality.

P.S.
Not expert on this, just trying to learn.

Kamlesh

