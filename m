Return-Path: <linuxppc-dev+bounces-5396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05AA16DA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 14:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcBRx2bHVz305X;
	Tue, 21 Jan 2025 00:45:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737380733;
	cv=none; b=MXneWkWDomkUmJkCyeNstFQp3LHX1vsHbRHGAD15l7mTSjDCokitCpbfmRExCwgZ5lE7VNWH0/U+s4Mi2KANVxOiTxPocrHs6jGAUEWf48IkXryb6ebv1ZGVODJu+Kx437sXkhXoB+Mzg4UwkI1ye+uAn1+mc9agNDggBRtFLYuOSRc6B9TmiXu5oWDAINIAwUX2rOFGwuC9vQrhghnTlnKki54Y0HQh/D+xC23dOZjIdxKtOYLpZ5GR49pKx6GmD8TRkMOkmWP6/w+RFpySdyDcKGwHNHFfotW4Vj6nNdZSuiTa8GRXYzpDVCHmavoYOAXxIVORNItlhvdKU69Jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737380733; c=relaxed/relaxed;
	bh=NuY4lntt+wpPMOwlY29nGQdQknJ504nvEIdtakSNjH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cpl6HSt/pjbcQ9rDGrFmS/fWW+7rb+JgnL6/rE1BEfDlLUx/ljEPwv3UY1x0JZciSdq8iLZvPHY/tbrPJsyCfgL516qzyr3lAHYuGiF/apsrgs8A5fOD+TTsvvrG3RpFtjc11XXNbbRPDWMR0wp1NCB+7lK8LNDqOVHVBv6acCwZmGg/7ycpI69iaZZ0VdjS+0JKBwYdNwHGH6SY2I4Ru2Bet5n95/q8K9rSeLgZYkJqCVKv2vOk7CdHn4CvGnfAgBmAYOsyvp5PhXLWzveiwMN6Pci8WqvzNnWdJwJuewEeBMmk0GUzgI84jLd92TMQcTY+CD2HOeM58kdIlTzl5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TMl9eJqH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TMl9eJqH; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TMl9eJqH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TMl9eJqH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcBRw3rZ3z305C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 00:45:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=NuY4lntt+wpPMOwlY29nGQdQknJ504nvEIdtakSNjH8=;
	b=TMl9eJqHt35pUJ3MMZPj2yK/o71x8wtsczC4QgB1kjv/llTXuxWhHVx5t3CxL1thu8hZ8S
	OD9c/iD1xGgZOHX/lVfcJGnqpkGP44j9W45hLRsHe/NgnA/d3Naqt5HoFu/KX3w2cNEFlY
	BG14niu1GthmVVMcdyCjW0YmjLZ3Jto=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737380729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=NuY4lntt+wpPMOwlY29nGQdQknJ504nvEIdtakSNjH8=;
	b=TMl9eJqHt35pUJ3MMZPj2yK/o71x8wtsczC4QgB1kjv/llTXuxWhHVx5t3CxL1thu8hZ8S
	OD9c/iD1xGgZOHX/lVfcJGnqpkGP44j9W45hLRsHe/NgnA/d3Naqt5HoFu/KX3w2cNEFlY
	BG14niu1GthmVVMcdyCjW0YmjLZ3Jto=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-2ZKrlAgyONWB5VKEmnE0Sw-1; Mon,
 20 Jan 2025 08:45:26 -0500
X-MC-Unique: 2ZKrlAgyONWB5VKEmnE0Sw-1
X-Mimecast-MFC-AGG-ID: 2ZKrlAgyONWB5VKEmnE0Sw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DA6541956062;
	Mon, 20 Jan 2025 13:45:23 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.104])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4222619560A3;
	Mon, 20 Jan 2025 13:45:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 20 Jan 2025 14:44:58 +0100 (CET)
Date: Mon, 20 Jan 2025 14:44:52 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <20250120134452.GA21275@redhat.com>
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
In-Reply-To: <20250120134409.GA21241@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
will crash or not, this is not consistent/safe.

Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
has no callers, these architectures use secure_computing_strict().

Also, after the previous change __secure_computing(sd) is always called
with sd == NULL, so it is clear that we can remove the code which makes
no sense.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 include/linux/seccomp.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/seccomp.h b/include/linux/seccomp.h
index e45531455d3b..e01dfe57a884 100644
--- a/include/linux/seccomp.h
+++ b/include/linux/seccomp.h
@@ -32,11 +32,7 @@ static inline int secure_computing(void)
 }
 #else
 extern void secure_computing_strict(int this_syscall);
-static inline int __secure_computing(const struct seccomp_data *sd)
-{
-	secure_computing_strict(sd->nr);
-	return 0;
-}
+static inline int __secure_computing(const struct seccomp_data *sd) { return 0; }
 #endif
 
 extern long prctl_get_seccomp(void);
-- 
2.25.1.362.g51ebf55


