Return-Path: <linuxppc-dev+bounces-1855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7D299585C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 22:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNSGc0Bt9z2yGs;
	Wed,  9 Oct 2024 07:26:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=199.89.1.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728419191;
	cv=none; b=JaaP+TQfdFT1g0Z7ZS0cw4/xXD7j5ED8CuWweh0GwB0yTa29QrfR4Tvlm8cg3bQCI+s7QtBdmr9Tf8ry/kC2TzBgqIbv54AgCZZ5HPjSF1foNWUky3r0bqJPnGKl0diDl2UxZcSoh/RTOhEvGOay03xiU9Jy+glNJ8kfkIVnPlrdYd4uRyVH+BPJons00PN2DMdHi8A/AlLx6fRsVp5MFCmtX1sVcGzbi3XFipUp3IwYD8Mzn6vhpc7maRclUDkKC7FcYKM0Dg3Zuyl0pvE2XqbCQgK/vQ/pmKKxiFNPhEvOf5BuPoKm0rVAIbjaMu3x3trxB1KnzeMFUEQ2HtENRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728419191; c=relaxed/relaxed;
	bh=MyUaPbvugmKd3NVvycIqSqhXcIEjEkyEltEdZjwCUac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsQHhZrYhYXzgUltzyjgJbrmvKA+DE4OJjLh7VJue/Zh2NayfjmSfc5svrHJszkuB2cDeL7OdlGzNkKqP5Y4oYkHBZuEu+tTNwKvsMTNhBCjR4HuZjYvOYMThdpo9UQylZmMBpuPqDIJntMCuvHopy+m7imqgKsKoG5owhWnJZ3MUAJqEwZwdfrxHn6A0QYqw+/H3pF0qfX+HA9Y/7XwUBZC3JgJMGcxBfLOQAvI/czrOOmtws3PHvUqdd4KWxFnOrEGHdryj1msfn8JCps5BSEK8MDrYT0UVLuq0WWxRN2CI0YnOBzFOKOGWlQQoOpVp/exY9o9MFxWxDpknyNUFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org; dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nP6zLf64; dkim-atps=neutral; spf=pass (client-ip=199.89.1.11; helo=008.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org) smtp.mailfrom=acm.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nP6zLf64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.11; helo=008.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNSGZ5xjbz2xjY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 07:26:29 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XNSGV5q9Lz6ClY9d;
	Tue,  8 Oct 2024 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1728419184; x=1731011185; bh=MyUaP
	bvugmKd3NVvycIqSqhXcIEjEkyEltEdZjwCUac=; b=nP6zLf64ncxoqFuow88JG
	PVz/1BU/VJ0/+eAKkW0zzH1vKaMXqfNnI+SbvKfnQnW3rPvLOt1klprltNo9c0Sg
	jNqnd8L6Gbk6qsksxWUNcq+M6nAkaxfiUH2wU8fV7vMcoVJBkkkrEF3Sjv9RQ/sP
	ajKN4yd1zEb4Ht7QqtAXvScPla4VlogqMUI8jtIAH/fjHgEZEaLYc3bO1kw/U5Ft
	dMtxLERx2QBPC9ozZ9IejIWwTCggADUl8ehPHUyTHn2NHFj/zpvcCpPh3KgJDCmw
	vugGMRrqC7i8xVZYdPJ+U3QhPo/oygIhpWCRXBWRceiPPuEhiM64BEuW8tzgx7Uh
	w==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id n9sqEiyXRz1i; Tue,  8 Oct 2024 20:26:24 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XNSGQ4TP7z6ClY9Q;
	Tue,  8 Oct 2024 20:26:22 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/22] powerpc/cell: Switch to irq_get_nr_irqs()
Date: Tue,  8 Oct 2024 13:25:43 -0700
Message-ID: <20241008202601.3737326-5-bvanassche@acm.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008202601.3737326-1-bvanassche@acm.org>
References: <20241008202601.3737326-1-bvanassche@acm.org>
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
'nr_irqs'. This patch prepares for changing 'nr_irqs' from an exported
global variable into a variable with file scope.

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

