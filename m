Return-Path: <linuxppc-dev+bounces-7507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270BA7F37D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 06:20:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWtDJ3DCWz2yk3;
	Tue,  8 Apr 2025 14:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744086048;
	cv=none; b=CHSLEVrRAwon3yCAT6riHei238Uiq4xHV2HfpiFZQTj0OllYp2KsKdC4E1lNwpKgAHaH3KhkBZIm2ilnqWjjZzitPIgjg9JA9dy6UDAgrORnkogtB/A0WHGarmjmcCA7AjUrwv6hPlej4cT8igdwF3XfR+i0HBPfjovELPrL/lXqdzf2M8CyH6p/GA6rscwovV5fPZHCHFGBAyUXRYNvpRcHDAloNCA30MJPJ8Ag3ADY8Jzp46h4RbgxDAFTFgUuLuAtrG0dgzUOS0z0Sveq8DhJHT/oTSDFdERsmWRCbF6uEkLXuy9gxmclQmPBfTPBYtA2vXOwkkqRCe9ahOdDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744086048; c=relaxed/relaxed;
	bh=f/DoFNRuiiVAkwV02tS1l/zFMuQjpgmiB/Gter90zGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhOy+t6xikimK6YFsLE1fpd+y7ECM5pKJWeIjuYqbC8a+Uty5HcNojteFPdKasxIslgQ1jf8/neNNcLXms2M2+tYWUfG4ZaAHiYhhRyknT3up/fJBbngP/EbgHwrExpv4ZMF3WuIYtWK90mYdT7+e1sUpeFQTTAte63lQ8iyOcI9Ya1YFmbRELnoL7bAa9So8ShwI51W+nvRzz4/lpVNhBqFRV0LJcYZutqGNuHN1yiQXcNYwVFohkyxDGIoqYygaxbDTl+qUVacDkJILo7ogrR4y5I8UXdoEpLKFv25CjyaEL0MNPM4hIWr+WqTmrroZmsAzhaxH6KpIJadZYE/pA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=OKTDF4+E; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=OKTDF4+E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWtDH2SFRz2yGZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 14:20:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=f/DoFNRuiiVAkwV02tS1l/zFMuQjpgmiB/Gter90zGI=; b=OKTDF4+Efe4g+aPEIyC/KLv4Nw
	Fi+R60MnSn4xlGz8gKguCFkX4SSGRyT/gj/df+JWet8duRcWVA974LmmTGwccMJKZ2gb5DcqEB+/a
	j4r6Y12EcCVBw7BXh2eWJHLyMPN2EaWXbbvhL4R2f3LE0Q7Rf01PO4V924C8rk5CKqVt2/5HO9tb+
	KOeBL48wE+dKScZeGtncQ+X2kKh/kePMqu1+FLsdGyVxKLamqTb2vZ6LwV3OKgjVxdU4dFVJr1bjq
	MSlzH1m1hbS5VTehq5kePO5kVvTA+Gf02DDNk9XTct7Q+iHF7RvLrWbh//63REJdqAlGnwGTEUFuO
	8gmO9SeQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u20Ru-00Dlm8-25;
	Tue, 08 Apr 2025 12:20:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 08 Apr 2025 12:20:34 +0800
Date: Tue, 8 Apr 2025 12:20:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-crypto@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] crypto: scomp - Fix null-pointer deref when freeing streams
Message-ID: <Z_SkEnIWk8E0mLJf@gondor.apana.org.au>
References: <3c239727-6c46-45c2-80e7-d6853427f72c@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c239727-6c46-45c2-80e7-d6853427f72c@linux.ibm.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 07, 2025 at 11:49:27PM +0530, Sourabh Jain wrote:
>
> [   90.892796] NIP [c000000000845eb0] scomp_free_streams+0x6c/0xe8
> [   90.892803] LR [c000000000845ee0] scomp_free_streams+0x9c/0xe8

Looks like I never tested 842 which curiously does not have a
self-test.  Please try this patch:

---8<---
As the scomp streams are freed when an algorithm is unregistered,
it is possible that the algorithm has never been used at all (e.g.,
an algorithm that does not have a self-test).  So test whether the
streams exist before freeing them.

Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Fixes: 3d72ad46a23a ("crypto: acomp - Move stream management into scomp layer")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/scompress.c b/crypto/scompress.c
index d435d4b24469..f67ce38d203d 100644
--- a/crypto/scompress.c
+++ b/crypto/scompress.c
@@ -111,6 +111,9 @@ static void scomp_free_streams(struct scomp_alg *alg)
 	struct crypto_acomp_stream __percpu *stream = alg->stream;
 	int i;
 
+	if (!stream)
+		return;
+
 	for_each_possible_cpu(i) {
 		struct crypto_acomp_stream *ps = per_cpu_ptr(stream, i);
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

