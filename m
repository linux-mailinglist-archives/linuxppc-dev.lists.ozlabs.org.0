Return-Path: <linuxppc-dev+bounces-2899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737409BE016
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 09:14:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjydz5N7vz2yfm;
	Wed,  6 Nov 2024 19:13:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730880839;
	cv=none; b=ZPBXemQcAoIxj2vfPHtCSu1OYgL3+sfgiWUl5hXjwVvssJSnpPx05EsO+xw7eqbO5thBZTPAaNWg5WxnJX7LXY8bKct7pdPM8OxiSJNdRSjfYfP0jndL/WNB/m9JBY2HE+Xjc7pGNOL1mByoqEC935wLwRppMuFp9mtMh549xvgx1SJ97q7StB/mX+okH+Gmwh5eSa7VvBQVKxpaIcI3dKaBMSsxwnpuvgdc6ySOcpRgqGKr5mlFoYVWzu+w2qmYp4xSwiZs8M2TXsEa3aEylEK8KtuD42jitFZC2anC7au7KPZTL7QF+EXCybjjZ8d3d8775yqxh4uhztuGFI8ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730880839; c=relaxed/relaxed;
	bh=u2secMimeI4+f4dvxa0WxHbdFtZeWJOJ8zwpB2N9L3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LbVWLaZLhm0p5gXMvSmsxi/A1wwNEWsk2RG58gLPl49Q0UVXpZYWP4f3Siy17eBn8eg8kHjZwMs1x7MTUn1Z4Od5dR6EaguU8Y2Y/OSyTfQhIaHCDFZmzFfJUtl0i6JLbuOj5UmfsXh8JkcQQq2covKTbnp/H0NMd4AD/kgHWQil3qp8y0d9lm3NfYN+zyiJiumw0GdvkvtyDD4eeOKe4wK2wBnjlMQVMc8vqWkaPpX8V2xO/RhO7GPLbqGQiyW0eCXMBzPdd3/mvnb8xCMO84jrJwKhm2c8fPemtUC6yewVl4Z35lS+1qzlHQ/LGFzk0lIauYFCwsmHw5tVCTqqEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUuWGGZ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6gzjtXi; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=lbulwahn@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ehUuWGGZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6gzjtXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=lbulwahn@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjydy2B2jz2y89
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 19:13:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730880830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2secMimeI4+f4dvxa0WxHbdFtZeWJOJ8zwpB2N9L3U=;
	b=ehUuWGGZJ/U863VXX9dIqO6S3SjmecykBvJb3I+QkqpL9iFEHI7nby7jo0Sd/xPn4g7sE9
	Sb9M5qabQItdxxttl+XlJHSPn9crpw+eqO1+ATh3PoYs0aGp+R7aiBGZABcc9tNF8SwbnQ
	7PvokHuR532jokHCHiyU22ggVhVJQ+4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730880831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2secMimeI4+f4dvxa0WxHbdFtZeWJOJ8zwpB2N9L3U=;
	b=Q6gzjtXi9OYw1Fu/gCA3w1uow4IslOmy8aoSVPokDFSlVf+xmoo98AVKvy9799auOWD0ar
	UjpKJ4R0YdUw8qTb/CinC6JJn34MVoUDY3CYHvJDp/8/kvXgwYG6MjJwxbgzGUJ8R5csRL
	pfm5KhNL7X3oNKBtPLQSfWmo1dsx4Hg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-XAaw5PtmOyCLnlWglHrFDA-1; Wed, 06 Nov 2024 03:13:49 -0500
X-MC-Unique: XAaw5PtmOyCLnlWglHrFDA-1
X-Mimecast-MFC-AGG-ID: XAaw5PtmOyCLnlWglHrFDA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43157cff1d1so46935235e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 00:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730880828; x=1731485628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2secMimeI4+f4dvxa0WxHbdFtZeWJOJ8zwpB2N9L3U=;
        b=YbImtLlDUlcrk9k62zR9cQHDq3KVYmHzrs/wN1XK4b3Xuctzskot2lQPeqxhDvtnMo
         TjmVAFT9U9OZGf+tnH0zC+Iu7bA3e2ftOqGTJi/wx4owVbCWBc5V5Be8AgbXn00Jy/jT
         oaO7u3QoPa7MEKtorMJFNKjr7mkAcoG5FmOQuHGUfueaPkEy0PZ6z8uHfnC+QFgTrqOi
         H7i+MRrt1ht1R1StzaEac1cyiGtOoDpy8mSYEQ0QXCYvpKhZGPOKk533cu1/bovT2txB
         7DrhB88O3KwuVyzv9mGRxlhYIlXI59xCxIDOzfVwvmk4tdz2w2/FtOJ9VQELSpGU6MKL
         vLwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD1U8mFmymE4snrIf6bDngFWPk9Q//ItGIQVtPrTNUNN75mScYiP1M3zOo+kKWhY9dnxyyuGuSRC8zlbM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzslmNnhDYCL+nF+z8Pi3OKpItstw922e4k01Un1b2uHlr/rgF+
	gjIWG6/27bwIMJJEarNXWmaHqcHgvQJxCyToxizKUxQ6XU9JiXZvLMJlFDKy3Uli5RbbgR62R9K
	TKkYK/YQ7pbsEUKpzY9/ZkSoq537dPTywo2ZpQ4mnLiXQh+PWyO+YC3DA08zXiTw=
X-Received: by 2002:a05:600c:5115:b0:431:7c78:b885 with SMTP id 5b1f17b1804b1-4327b6f954emr187771625e9.4.1730880828393;
        Wed, 06 Nov 2024 00:13:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEDbzGtgbC+limkqrDb3bgxn8MtUgaok9LxE3/Aqw87YDkCd2Xwwy8yw7eixK0KNLGFNgNJg==
X-Received: by 2002:a05:600c:5115:b0:431:7c78:b885 with SMTP id 5b1f17b1804b1-4327b6f954emr187771455e9.4.1730880828017;
        Wed, 06 Nov 2024 00:13:48 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c2bsm18387226f8f.23.2024.11.06.00.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 00:13:47 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] hwrng: amd - remove reference to removed PPC_MAPLE config
Date: Wed,  6 Nov 2024 09:13:43 +0100
Message-ID: <20241106081343.66479-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.47.0
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _KeeeDpL8TY9TeTpWV7TT8sdo8KytSBFtsw-2JmVlQw_1730880828
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 62f8f307c80e ("powerpc/64: Remove maple platform") removes the
PPC_MAPLE config as a consequence of the platform’s removal.

The config definition of HW_RANDOM_AMD refers to this removed config option
in its dependencies.

Remove the reference to the removed config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index bda283f290bc..446c2def055e 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -50,7 +50,7 @@ config HW_RANDOM_INTEL
 
 config HW_RANDOM_AMD
 	tristate "AMD HW Random Number Generator support"
-	depends on (X86 || PPC_MAPLE || COMPILE_TEST)
+	depends on (X86 || COMPILE_TEST)
 	depends on PCI && HAS_IOPORT_MAP
 	default HW_RANDOM
 	help
-- 
2.47.0


