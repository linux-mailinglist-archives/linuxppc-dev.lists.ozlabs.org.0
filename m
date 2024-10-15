Return-Path: <linuxppc-dev+bounces-2295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79A99F6C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 21:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSkFn3jhqz2xHw;
	Wed, 16 Oct 2024 06:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=199.89.1.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729019437;
	cv=none; b=Xhm2PbHho0q1co0oRusdfQtp6CUMXkHwQ7QKAYSHL1GaS0iQ5rzmjWHa1KmNzIAbTHI6oyvCsEw2cSoboanD6JTduhp74HgJYEYiTv7RyNK4Xw2mNI7+xgdUoTvm8HkjoiC5RtGROLs1MgGheJazWCNjB4Sx3DsPsFY/i3nKch4DHbaeZ8BaBCk9mwYs3sslig2z6d+jPiHoEoQkjsgpMTTQ4XDQCNu4fNIsZzwR12tKAxjfE/E+4Ws49EBCnx+DWc/es8Mgc9bxF11vrBK5+UsP8H0KSOHlkHYADG8fWelA0ZUPzJBCEgzXWvGNFfuCF5W3dys5EyWpxE2GuaA7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729019437; c=relaxed/relaxed;
	bh=LlbN8fEKFiaYt76DPdWX+8dI6iXGCc0rnW7U7UW4744=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDbFIPtVE3MWB8MFDflGOcyab4D3dRK+wCwBaqOp38+EK0eJ6Hdzn+xaizKKtziDnkIqGejbtJgj1V4hNjgEvfLVm932gXxJv6NOBZjFy24Fmfh21k23dmOR8SyGloAdVcmIDUbxJEJiTFLDjyWGHoSM6wLnHADTbvFwd9o4SPgdSowGgfTqYKImiKFSRAYyZfZlwF/sX4NqEjGV23NtZ9K1vl75Tv3zT+GPE3CDfQMXKGwDov2k9nvUe2zacnzhZLEmwJqkU8LYvx75jBN5DNIhKUzRGP9tW8n787OEYLRAtOAlUjeMsJd0lDUPpMCe57b1lNWf5YatpePwWYg6Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org; dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=TvHB2qpI; dkim-atps=neutral; spf=pass (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org) smtp.mailfrom=acm.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=TvHB2qpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSkFm3hF4z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 06:10:35 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XSkFg2N9YzlgMW3;
	Tue, 15 Oct 2024 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1729019429; x=1731611430; bh=LlbN8
	fEKFiaYt76DPdWX+8dI6iXGCc0rnW7U7UW4744=; b=TvHB2qpIFY3or6zxqZVm5
	AIgtvaupXyI21cowk5v2WrBlRXGTsCK2nFuNfZgcA9uQp46LiQHGCQAmZNRaayo7
	RqjOz/5gXuZ/KaFyBKTKQePQJl6SUBN3faqZGUXgWbpV4L+yBBFCVp5tPRF0uU5S
	47o/HsFx0aWSqxJVcjYS6Ki7G0osoNdMaYiuo97rPXLpErG34792txxzeFrK1Kk7
	hJiGQnHEencfzvDbh5pBaX/aTWvXxjg469DfK9Ub3d6zkFy+H+oL/1sR+S173A6V
	oYcTnTwwLr01fwJ/hp7rQJ8YcTPLOhcsVE56uQzGRcQht9JgQKok5jDZz9Pjhmyc
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4r7H_nvKU7k8; Tue, 15 Oct 2024 19:10:29 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XSkFZ6XhLzlgMVx;
	Tue, 15 Oct 2024 19:10:26 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/22] powerpc/cell: Switch to irq_get_nr_irqs()
Date: Tue, 15 Oct 2024 12:09:35 -0700
Message-ID: <20241015190953.1266194-5-bvanassche@acm.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241015190953.1266194-1-bvanassche@acm.org>
References: <20241015190953.1266194-1-bvanassche@acm.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use the irq_get_nr_irqs() function instead of the global variable
'nr_irqs'. Prepare for changing 'nr_irqs' from an exported global
variable into a variable with file scope.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 arch/powerpc/platforms/cell/axon_msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platfo=
rms/cell/axon_msi.c
index 28dc86744cac..d243f7fd8982 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -112,7 +112,7 @@ static void axon_msi_cascade(struct irq_desc *desc)
 		pr_devel("axon_msi: woff %x roff %x msi %x\n",
 			  write_offset, msic->read_offset, msi);
=20
-		if (msi < nr_irqs && irq_get_chip_data(msi) =3D=3D msic) {
+		if (msi < irq_get_nr_irqs() && irq_get_chip_data(msi) =3D=3D msic) {
 			generic_handle_irq(msi);
 			msic->fifo_virt[idx] =3D cpu_to_le32(0xffffffff);
 		} else {

