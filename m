Return-Path: <linuxppc-dev+bounces-1506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25897DC05
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 09:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9hF83rjNz2xrM;
	Sat, 21 Sep 2024 17:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726904875;
	cv=pass; b=kf6nkBvGADZwsFeB1JLIhbShwN+yOEoEcVvesMQZ8LW1ibZKd6UEkYz5RFffBBcOyy5EvekH4B2neUIi476NZLwgxkA9UME66sbAcYAHQN7PdC3dbdSWk2okrxOcqiEsQn/4f3UlXdhdBB8Q3b3gsWhGELHi/ftvAexlRxvEYke1lMyY+0vfE7N6PMD86R59bI4TjFw6nDp/Jg0wIzzmDIhV56YjDCpzwhuq5w+QFnaeXnCiip79C17J9cbEPrM6ERdBA3DC8CMpkpsr+Iin4I5i8clc2bRtGU8xsmm+cO9N/jirGNCHqPJHi/bu3difGk6yEO4airMExm3kuBaQdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726904875; c=relaxed/relaxed;
	bh=UX6oax5JNv0f4YrefZ/CLdZTH+8SxXkpF1uGuXRjE60=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Mc/4a6XaZqpuLwtY2GtfDJZf9Guu/JdUoblXLlvPLtXB6A95/VkjaxEPkROppv2Xscgbs+seN8hrD0igk15h1bnVe+pA/Tvu2D2jxmHCP0jsxiPs7iFqjvyAagtuEIn9om0phbCfs46g+NZ/hoatXnvJtgzr7PSafVwI+iwRiLernqSu57v0rUNGEyN8qv7V0XT+dRF5Q11ZsfJ/TZ65c+2cazHT/xCKLxn6+BU7Y1aEtyeQJqjcjoFofiPFdrfUPOnT9RSrXba7Ah1NQzU5ah18kMphTtt5MYuKwno3Ue3wxqKPTYh/QtyorCDNVC0fKvPXJbQd2gkp+vrevidcWg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=H4r+FQlq; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=F6f3KcUf; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=H4r+FQlq;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=F6f3KcUf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9hF41hWpz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 17:47:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1726904826; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tA5C4sR6/p/2xLmQzyIx/9080eklDLXhpIdYtjavuRariA+rlATtDhrChpbfHTTYmF
    X4vnbmzz9A09XKLkYWDwTLUrx8jbzs+/2PDYfHOks3V4nY6d9uE76GX17OWEHfXHIXMX
    nR2ypl30eHbcFU/BktE5EGTNpZt2LbSQiaLrbab3TlMMOMgeyKemMUEbhHXnb+xcgHZj
    MpfneGGCuKP+hx2PTRQGuHCZXcfUuwtDXe9w33QMc9TTdVaPV4tPlb6ZDV2Nem7rItN+
    f5cmDzKPzMZfL0YTNHRsH62vy5X54b+ErjNYm7phRIwcxWTPBbNlXjIUxwHZOa6pTRcn
    ACCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726904826;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=UX6oax5JNv0f4YrefZ/CLdZTH+8SxXkpF1uGuXRjE60=;
    b=CxdUoBOD3KhVEVOUrzpqV0g8hxqGBOv69X8V/Iz2GI75KjE2g/+fRcZxvFi4MG0EOV
    McYyHwstoJfD+Z4EMr5zPtRBrqdL5l7KLFp4XGW9XkIUmn+xMmHdDpzftgiiI2W7hCBO
    YeeFIDHSqczdb9c9Juef0GBwgFbj0KY7HJ2ngDdjWdLS/XkNDyVQQ+LnSA2UDfSPu2y/
    aYn/Vwzsy6aCJg85f+tYhmSOAMx/FPPPOFscmmCrawSe9ONDY4hEZ56DEVtL2VeqyVE+
    4tnubQN4VOU4alMFtTKS1Kx89e0FpsxZZaCIIbN6++iwe35WK5OCyw7VPRw1UE626rN+
    aduQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726904826;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=UX6oax5JNv0f4YrefZ/CLdZTH+8SxXkpF1uGuXRjE60=;
    b=H4r+FQlqcir3ZPpK395lhIEGzfMss5Pvn0yynrBDej9OthbGbOSZo8Xs8/QmmeW1iV
    ctUHvWJs/Kh2JBLv/roXdHB5HLnKHqb+Tt1puTaV2F26WUtqj4KLM09nMoe8Z5XgEWxC
    ASBC8HATD/CVPOty41O9kms0/NUic9bzM8zSDu2L9uZRnBD/AB4+e4z+E89Vq4wPSpMH
    BGLhNEaMdw8DkXiDlRYKJl187xVQNaW3V0loxTro1bzSwGFCQyAaN0GHD6IeoCE8bUSi
    P3AgA1n0Gh+n+nzd9OzCdZ9CaTbn3B3i9a93NlUsjIdPsY6oz3osGRm9oY7Pqp/CKg/1
    WEow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726904826;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=UX6oax5JNv0f4YrefZ/CLdZTH+8SxXkpF1uGuXRjE60=;
    b=F6f3KcUfnXx68RHsHehldiIaWNutml+8+RLZ76cbwv8zFcJoAYbQzfDTpwA1iCB+Qh
    kj8wMAWA0lZhRigTRABg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VpngsyrDDn7tV8xuJ2lZeftchKhvJvsCocNyYw=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a08L7l51aY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Sep 2024 09:47:05 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] powerpc/vdso32: Fix use of crtsavres for PPC64
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu>
Date: Sat, 21 Sep 2024 09:46:54 +0200
Cc: Jason A Donenfeld <Jason@zx2c4.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Trevor Dickinson <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
Message-Id: <A9FC02B9-A15D-4A75-872F-BC85248A1BBB@xenosoft.de>
References: <aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (22A3354)

On 19. Sep 2024, at 20:56, Christophe Leroy <christophe.leroy@csgroup.eu> wr=
ote:

=EF=BB=BFcrtsavres.S content is encloded by a #ifndef CONFIG_PPC64

To be used on VDSO32 on PPC64 it's content must available on PPC64 as
well.

Replace #ifndef CONFIG_PPC64 by #ifndef __powerpc64__ as __powerpc64__
is not set when building VDSO32 on PPC64.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Closed: https://lore.kernel.org/linuxppc-dev/047b7503-af0c-4bb0-b12a-2f6b1e4=
61752@csgroup.eu/T/
Fixes: b163596a5b6f ("powerpc/vdso32: Add crtsavres")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
arch/powerpc/lib/crtsavres.S | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
index 7e5e1c28e56a..8967903c15e9 100644
--- a/arch/powerpc/lib/crtsavres.S
+++ b/arch/powerpc/lib/crtsavres.S
@@ -46,7 +46,7 @@

   .section ".text"

-#ifndef CONFIG_PPC64
+#ifndef __powerpc64__

/* Routines for saving integer registers, called by the compiler.  */
/* Called with r11 pointing to the stack header word of the caller of the */=

--
2.44.0


It works! Thank you.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>=


