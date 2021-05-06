Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B2374DA6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHrP34dQz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:40:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XwdqdaP+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XwdqdaP+; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHp52cCpz30CS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:38:53 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id h11so4234176pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POSty/xjT/eLodok8fWzwr6xbYAtFXCRxSVPBEi6woo=;
 b=XwdqdaP+KGo4ZrwTuNTtJlqU9fAG2CSOww4T7oziXGeC8f2JMYzeTBr2GV0pzvKtRJ
 4yEUbXkxTvRNgoHN5ajllzjuTAdHsEr2KTtDqCA0RnRs9XHfQhg9K5ZXQSpOw7KMxOy0
 76F1oF1fGhgf4HoTGY9AS/HjiwK/ZrfXcaJgDNiOXnfb+QVqQAijijYvbO+cNZ1E96LO
 u/GbNmgn+eYuiHIxwUHNydGMXDqVMUFlbCPNCoZfiGOLq+t+9LqoweylYzJMsbP7yQZM
 6yxwGqBNtmvPLfUsEmaY6T1CT+C+s3ADEaqAQcnCISSTPZvwV3Ls+zBWatQcPm+fR57v
 C5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POSty/xjT/eLodok8fWzwr6xbYAtFXCRxSVPBEi6woo=;
 b=unkQJ3BSsJ/CWeJk7ihX/C4Btcy4sDp7YN6kenr+T/ldlC27PMw7HM8WOqcSP2/J7F
 6Sr35cKZWGAgf5iB/soVraj6dw25mwLY+doTYMFVLKLhyKwBikNGAUVfOosI1dFXNb+S
 P2GxhiViRiG7+R/IcdlzU0/4lGwAW7CQLGv9jfWemHDU/vK0wXGHVQNc+uhFXK42OVuD
 M2Ejrkfy+Wb2pevvmato0JJbOak3XNaOUZAKSRR0qkQ2FuMLnDB6HUhGRd6okJ9gAk3g
 uYMMtmVBm7bcKzHj7RxmrmVofMjkCRQeswqs8hHKjDjfwnwFrZa8mgMC/vWuj/TZ2iDz
 G90g==
X-Gm-Message-State: AOAM531KYyNba+LxNbIbDD3ZV8+vSuoeU7Pfzn4Fyt5C6CHOc14td5ZK
 NEZE8mycVG0hFbcqszUIuimvQ7M5kGw=
X-Google-Smtp-Source: ABdhPJwE9vJ70WC3n9tVo1A7buUKVSaCWNHDh4eu+4yXF3tVt1txy2h7sU9UXR5wa627Zvi4pgP4lQ==
X-Received: by 2002:a63:f965:: with SMTP id q37mr1949292pgk.132.1620268731401; 
 Wed, 05 May 2021 19:38:51 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:38:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 4/8] powerpc/bpf: Remove bpf_jit_free()
Date: Thu,  6 May 2021 12:34:45 +1000
Message-Id: <20210506023449.3568630-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506023449.3568630-1-jniethe5@gmail.com>
References: <20210506023449.3568630-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 74451e66d516 ("bpf: make jited programs visible in traces") added
a default bpf_jit_free() implementation. Powerpc did not use the default
bpf_jit_free() as powerpc did not set the images read-only. The default
bpf_jit_free() called bpf_jit_binary_unlock_ro() is why it could not be
used for powerpc.

Commit d53d2f78cead ("bpf: Use vmalloc special flag") moved keeping
track of read-only memory to vmalloc. This included removing
bpf_jit_binary_unlock_ro(). Therefore there is no reason powerpc needs
its own bpf_jit_free(). Remove it.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v11: New to series
---
 arch/powerpc/net/bpf_jit_comp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 798ac4350a82..6c8c268e4fe8 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -257,15 +257,3 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 
 	return fp;
 }
-
-/* Overriding bpf_jit_free() as we don't set images read-only. */
-void bpf_jit_free(struct bpf_prog *fp)
-{
-	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
-	struct bpf_binary_header *bpf_hdr = (void *)addr;
-
-	if (fp->jited)
-		bpf_jit_binary_free(bpf_hdr);
-
-	bpf_prog_unlock_free(fp);
-}
-- 
2.25.1

