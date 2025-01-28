Return-Path: <linuxppc-dev+bounces-5655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC032A214A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKf5MD0z2yNt;
	Wed, 29 Jan 2025 09:57:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105078;
	cv=none; b=X/0hk86kHufpVdCVkBQCsDSHCR4stdIlna3EJ8SxWXI7/ncmjcxJnNjHzlaVC1D9u3GOkczgiNg7QS0dKV1Yun5bB0HKEvZ7Vah+dzYy49mpYmP+tOM3RKgsN7EkmQrt2UvCLnse7MA9V+hek3sGmf1cm3lmdiqw3uMxrdPLTALw1ByQXkJCEZc2Zs6k9rBnCbuL1SxXhYw29CxPP6VzVd26f1PmDD+MG0OEEZWgNP/JzXotaUozCkZ1AHRvf/EVcLhwKD2zW+Y3s/CgL6IMuocg+DBNdVTOrRfmNTR8lr+lFF4XcrGI6T/1rzNdAr+nAdeOJU+Xrg9KgjGuxe6m3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105078; c=relaxed/relaxed;
	bh=f6F/8wX1InYv/lb2QMy5MdLscYTPRcpVlUy1/MkmLwo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in2d24kGZO8/uvJ3w0HWsHGWd9MLSehHdA3LnKpBjS2sA2pWwrNaZVjQP3U2NBbkzSMERtTpALWBxdewc2b9HRZTjvWdUZuQjAxscsCy4eeYq7kSGy6TJSSFkVGDBHtrbp4yZtHbrPAqYI1HsQeUKjdXjWaTR8mY2aRT7Sf+Mmpm2WtqiNhET8TvbGQSqwtsNHLSWEbvZ7BFyojsMfnbL44Sgeb0x4Sl+mXhrIBAtPptU7K3/kURmL7qT2F80RsCXPTxUzJ22JMbb3RbHwTQizngRhLZmf9GpxAi5W3W0iDqVQuiADs7Zy3JVFF5v8inUqn4HBGLMDyFvN6p/RqK7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Upygvm7Z; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Upygvm7Z;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKc11BRz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=f6F/8wX1InYv/lb2QMy5MdLscYTPRcpVlUy1/MkmLwo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Upygvm7ZS7LwaEx5FUaci4Kz0c046kJeBDTNibpZtfY7hmB7wNeyufbCpjBETwyHw
	 z/QX4O609dnNHwic1igz7wcPBPy9WfhYuEHr87kqP5K4jKXoTvlZU5+LE/0ok8F4YI
	 y6EVeLASulRhs0M502xF3wTXNIrWXxh/7wRaW6hAdLFqUE+IBUPLb7e2CjxCkxk9Qd
	 yE6OgUB8DBEqxB/cLoe8K1u/fLdiWCBWwHUqCZztzAoPdcKrV8lnRkDXAdE1nIxnNr
	 9qKFUw9EfdZas2HGmMwRnlhfl2LziGX3OWDkgebmnhjvhIAaQVvP4pdBFQLWspZtq3
	 X9Jnullt0SXww==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR2n0jz4x2J; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:52:56 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] powerpc/microwatt: Define an idle power-save function
Message-ID: <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This uses the 'wait' instruction to pause instruction execution when
idle until an interrupt occurs.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/platforms/microwatt/setup.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 5e1c0997170d..97828a99780d 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -34,10 +34,19 @@ static void __init microwatt_setup_arch(void)
 	microwatt_rng_init();
 }
 
+static void microwatt_idle(void)
+{
+	if (!prep_irq_for_idle())
+		return;
+
+	__asm__ __volatile__ ("wait");
+}
+
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.compatible		= "microwatt-soc",
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
+	.power_save		= microwatt_idle,
 };
-- 
2.47.1


