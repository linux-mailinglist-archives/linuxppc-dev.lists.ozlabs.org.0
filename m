Return-Path: <linuxppc-dev+bounces-13604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EBC22360
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:21:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFrP5bDHz2yG3;
	Fri, 31 Oct 2025 07:21:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855701;
	cv=none; b=KGb+0AwzMV6MBYpI4LLe1F87AdIjJ+2jBfVg9zRoTf0Iy9PmdhUFAlBskAGszSZNjRnHQyDSrfLhembPa0y22NLEKNuYTQbD8wu2pZKAJNOQ4gZ6L3E2MrLGyuv2B79Hddgl2eAmH31yZZydgZKJANj0Irr5EUXlxsdhML4GHqalBcXm3nORop77K7F9T1TzOEjX61EpiMApA7kI5rI4sdQpuOHnQysyPyp2YM9YKeNgyBDi285EVVJQTm96+iQmy2M0HsrhVvd+9M+LHH1Qv5yKHikvVyw4gPZAeoGAOZlur/8XEqyM8ZHKexXOxf2cmsen3KEyijUWd9Z6bHyqag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855701; c=relaxed/relaxed;
	bh=cAHsNtMVwc24wWBKRK3QNoBBpNkNdPaX0c4TrVubbbo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SVpbsnxQ0DeVWyQs1BsgHdEcZGCqdi2DNTv/poAt/5l3z4ReS0S+vWrGTgBKLpkAz+Y6YqHLWgAjjqloQuPiCjIyzcGzUsbv08LlWFTEY3RMtgOIRUiNjZxiZptuDBDGmD16FvgkSa73xEmvSxPNLP9u0wlBBjYOLKq7dvx2hgtVm6FgZkm3+WO+9nnw5djcQ29vRl1KIlhuEj0poiyu29e7vf3vs+m+UF6hjTVZ1yHcB6xRmd/em/eomo1EBpx7SX+c8VDnQg6YLc5thLDVpqrvnrg1iZTJpCjdfK5DZAHrdvGep4FE0bqRoKyKIVpOesKn29tFoNwSG9r1+f2jWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KboUcAXn; dkim-atps=neutral; spf=pass (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=KboUcAXn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 334 seconds by postgrey-1.37 at boromir; Fri, 31 Oct 2025 07:21:38 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFrL71Jmz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:21:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761855695; x=1762460495; i=markus.elfring@web.de;
	bh=cAHsNtMVwc24wWBKRK3QNoBBpNkNdPaX0c4TrVubbbo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KboUcAXnGx1U+UvsN9teOrcCVUMV4rS1wMFwaYx1wKPCw4MsIEzUX6CwT1HgrhMW
	 i5gbalgS+ZXbDbZpQ5qrQ9YZokdhNuW9Xvxd2DAqfWr0F8cTl6S+JahJNLwGfwi8L
	 IEk9i1paEaMtOGM6V05h41C7QnHCF2jt0q0XM2O9CTjI81Si1D5Nu/7ngWQqNVD2t
	 4bOzLU1zdtNUpnvzpgFsIGPDddkiaD/rcSmeZCsaHi0PNHgeL+bU691kH5b/O7x8V
	 D1xHzasFPJpCc5VeprRj9e9bAaYj78U2n5dxtTVMpOno3H2r10TjBcdhpwJfpRM2k
	 uNuXkXwKKOjfqTMkuA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIL0Q-1vSuWP1U7I-004ZY9; Thu, 30
 Oct 2025 21:15:57 +0100
Message-ID: <6c61cf90-5811-4450-b649-7a2c84584ee9@web.de>
Date: Thu, 30 Oct 2025 21:15:55 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dmitry Vyukov <dvyukov@google.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powerpc/cputable: Use pointer from memcpy() call for
 assignment in set_cur_cpu_spec()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/w4kvdMgqHhlPWqWIJrxL4MxO5AZkrkNH/trkN0zUhCEGKGAxZz
 lGVqbHB27sesOCCqZZI+Sdg4+v8wsBNBHZGIg7WqDWVwVkrhYCbVw/CPFdSK9fDS43JL1H/
 axmq1M3xdVT24dUtp2aBGnkULXhCwNO+qwHspXzdRpHfOBcgsioCFX8YBFzq+Mb572hxRl+
 B+w2V0x4qoyf0zqSNApKQ==
UI-OutboundReport: notjunk:1;M01:P0:93muQI2dCjQ=;sAH/Qqelnu34qLp8EaeiB1nUBy1
 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
 emUMChW+EMUxEqpYTa03rp5YNM1XdBquJX7iYU
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 30 Oct 2025 21:10:11 +0100

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/kernel/cputable.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable=
.c
index 6f6801da9dc1..a69ea88b780f 100644
=2D-- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -34,12 +34,11 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
 {
 	struct cpu_spec *t =3D &the_cpu_spec;
=20
-	t =3D PTRRELOC(t);
 	/*
 	 * use memcpy() instead of *t =3D *s so that GCC replaces it
 	 * by __memcpy() when KASAN is active
 	 */
-	memcpy(t, s, sizeof(*t));
+	t =3D memcpy(PTRRELOC(t), s, sizeof(*t));
=20
 	*PTRRELOC(&cur_cpu_spec) =3D &the_cpu_spec;
 }
=2D-=20
2.51.1


