Return-Path: <linuxppc-dev+bounces-1041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB696D30A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 11:25:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzv8X2CcGz2yYk;
	Thu,  5 Sep 2024 19:25:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=51.81.35.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725526916;
	cv=none; b=GRsJhF5YhV2vwBaoYbx5hNPDeHTtLAhJUHkqeMdH1i5L9L2O++4F1GFOfluEfMSrY6eCoy6GF25MVmRy90ENj6LEEvr2Kf+3mPUTMqFXUGDCu3SqrpxmXksLF9rXOul7daqMUaKb/16gkXVFpS7V+Vr8rHrfFjPjhONgnEXh2+kWjCh6RZB4JUS3EIZBf733Xf3cg0bQtgwfW+a3ihittCW6Jl7xnfmQFWqv+LhZuZLzdW+JHWfAO44aZCsTsL+vMZ/1LITslmxMatQluQck+qdc97o8p9HozfL7as+ExBys6Q9a0IRq/9xa07R+q+vBzn729Me7P1l+wAywwnC0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725526916; c=relaxed/relaxed;
	bh=H9MpIYSRcEX+VD9OMp2crHKTWLp2ChM3Wcl4xbI1QDs=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=XSjDiDB8sGBw4Kzdkew/0rWFfU2CRYYWvO/jmJCdYgWCkWQwaioT4ULj8vXKuwcCxdh/lcqjjCAtsj96s+TahYVANFrJ1uvQw3sBvMa1i6rysPoI0vMMI74beYk88pnYdRZHk4va9+iwyFnPRYYL+NEDQ1gHHPK7mv46MUT59DStq9Yf+xdv2WxE7/UWAfdSHkE41uBzdLwg4I1E+VX46NMgalOQOfOGdCCpvLidoBCO2c/nQLbIxt6NkAi5UyGlE9755TxG+eFpu5i3+q7uIXwFJYuDih6OHBAIkSiT55XcgWaoj8hMVgOUzhHHPauj3h2zZi7IbW8CyrgmIji8/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aosc.io; dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=w3IN+vsm; dkim-atps=neutral; spf=pass (client-ip=51.81.35.219; helo=relay-us1.mymailcheap.com; envelope-from=kexybiscuit@aosc.io; receiver=lists.ozlabs.org) smtp.mailfrom=aosc.io
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=w3IN+vsm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aosc.io (client-ip=51.81.35.219; helo=relay-us1.mymailcheap.com; envelope-from=kexybiscuit@aosc.io; receiver=lists.ozlabs.org)
X-Greylist: delayed 383 seconds by postgrey-1.37 at boromir; Thu, 05 Sep 2024 19:01:55 AEST
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wztdv6sQmz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 19:01:55 +1000 (AEST)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id D252F202DD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 08:55:28 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.157])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 201332619F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 08:55:22 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 96F293E970;
	Thu,  5 Sep 2024 10:55:16 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 91B81400B3;
	Thu,  5 Sep 2024 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1725526514; bh=f1MPAD4O/d2BtmRLp4/BYgjptMhBAm5TS4m5Ii3NVJY=;
	h=From:To:Cc:Subject:Date:From;
	b=w3IN+vsmPVD4TLlGAVgh4wAY9Bqv2QZbp8Oj/VVoDmNq6/9tyh4jXwVK6JAzQ/LVF
	 8uQeyoQK7+wn1+qwvO6gy5cOT2U1uHPL1qEAP22SWNT8bbwYFwhtipACq8SzjrU2E8
	 GQ/nP3k13J5pz/FrVkhMNSb55MnWeqkqwxHWitsw=
Received: from localhost.localdomain (unknown [58.32.40.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id ECFFF42639;
	Thu,  5 Sep 2024 08:55:07 +0000 (UTC)
From: Kexy Biscuit <kexybiscuit@aosc.io>
To: stefanb@linux.ibm.com,
	jarkko@kernel.org,
	linux-integrity@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	zohar@linux.ibm.com,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Mingcong Bai <jeffbai@aosc.io>
Subject: [PATCH v2 RESEND] tpm: export tpm2_sessions_init() to fix ibmvtpm building
Date: Thu,  5 Sep 2024 16:52:20 +0800
Message-ID: <20240905085219.77240-2-kexybiscuit@aosc.io>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 91B81400B3
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action

Commit 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to
initialize session support") adds call to tpm2_sessions_init() in ibmvtpm,
which could be built as a module. However, tpm2_sessions_init() wasn't
exported, causing libmvtpm to fail to build as a module:

ERROR: modpost: "tpm2_sessions_init" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!

Export tpm2_sessions_init() to resolve the issue.

Cc: stable@vger.kernel.org # v6.10+
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408051735.ZJkAPQ3b-lkp@intel.com/
Fixes: 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support")
Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
V1 -> V2: Added Fixes tag and fixed email format
RESEND: The previous email was sent directly to stable-rc review

 drivers/char/tpm/tpm2-sessions.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
index d3521aadd43e..44f60730cff4 100644
--- a/drivers/char/tpm/tpm2-sessions.c
+++ b/drivers/char/tpm/tpm2-sessions.c
@@ -1362,4 +1362,5 @@ int tpm2_sessions_init(struct tpm_chip *chip)
 
 	return rc;
 }
+EXPORT_SYMBOL(tpm2_sessions_init);
 #endif /* CONFIG_TCG_TPM2_HMAC */
-- 
2.46.0


