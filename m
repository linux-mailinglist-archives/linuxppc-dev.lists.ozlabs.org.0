Return-Path: <linuxppc-dev+bounces-1536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68DE9839EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 01:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCHkm0fklz2xbY;
	Tue, 24 Sep 2024 08:30:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727110370;
	cv=none; b=aWbx8wGBbVcfqE5yI/HXSGQNKkSSdo59G4stHMExlnH6mwRrKCM12ILp97iiNwnkiHl63qZmqzoxmZXRXPcV/HNm9vqCv1ZZlgbvV1JV1qMa5jZSpoZJOstDZqJWOgsLz/OdGsXFi40q5gNjSg32QpbE8cIbzH+yWLwTq0b8HJKRuYqHBgWudkipX17ynaHKHRgqex+x4vldETkpLeKLnC/qSaeZ2sjpv3QUeCLnTdtAJCBYXD99tMtzp9S9tHS4lkR4i9i8eFzQfkSVef0mZpJt0WfnvHqB61b7FLnfsZh8Rc3JzBQ7S6dpH7M/ajbgnONW/No62Ff9IDdB8u/kkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727110370; c=relaxed/relaxed;
	bh=cLl2PIYMfeKrxIuDVB1meXKJeIwGbLWbFBXhJWFwUWM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=acF2da8K9fbZq/pnwnkKKI2Ok/1t/pz+SihbRrzmWAbnPlpABSkNCd66JUSXNRjzgR2c3kuzfkncuVnpzVqBQfRkkJZ5SFGso/D1qpywbEuZ9DdL9M0oRRR87tXJUzx39ZKlKyn4mhbO9fwsF9a1yN3y503OGEOTx+HTB7rMB57EFqPPIm0CvhTSJSpAkhD+0iqSmGnPTQghMSDzWdLHJvDI3ep0pb5cJMTCFop3cCyUsVjtnKadyF3iTglitpko+cBYxIMG5YDIeVxONEJrQfZZgkGf1wVlm28seMMLqw7f69Nqk1jfLVawjScf3WCwgkpqHmDXniEHdejGFdxHuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Qw0Rsn7U; dkim-atps=neutral; spf=pass (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Qw0Rsn7U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 332 seconds by postgrey-1.37 at boromir; Tue, 24 Sep 2024 02:52:48 AEST
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XC8Dw34hxz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 02:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727110359; x=1727715159; i=markus.elfring@web.de;
	bh=cLl2PIYMfeKrxIuDVB1meXKJeIwGbLWbFBXhJWFwUWM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Qw0Rsn7U2XhhaOxh0hVTwpbtRpoCbCXf3huN0NzoWIxDQSZ9thTgVBJi2N9onVr8
	 yoqk5VoAWdTzmNiWwMC0tQals0HREASXBPJ+RcqZI+71AlJzNE7Smc7AbQYKYrhCB
	 ox+sgkHzN4Dmu5PdXJHb+qHCD0HI9tdLeP5oAPZdxOVyOsqlHfeA0sh6fzu3SKFgK
	 BZGVA45fa7b5sIwph9HjRHldhkpc/gIRjbqddjEEG/T+dYSSd2myTFxiGfi39xixn
	 6VOPvI3hCpMrDK5meVfIyFXeR7qgS9j+1T5DrSrNA9ehAhbBMGg2bUunUW03fX1we
	 VuViTdR6wa6U5QqOwQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MEUW8-1siKjz3NCE-004LHi; Mon, 23
 Sep 2024 18:46:33 +0200
Message-ID: <95114539-d177-4be7-81bd-a10ef9dd64f2@web.de>
Date: Mon, 23 Sep 2024 18:46:27 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pci/hotplug/pnv_php: Reduce of_node_put(dn) calls in
 pnv_php_register_slot()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4mCo/RU42zxNcsXGSzibyvIeiV2BzIe9Aa534X8UIIfGsmSXiCo
 5mEOeVPUkp9CQ3cTsBKMR+P0Vw39x2t80SxhlRc7aL44PFv20PS/2gNsJb85lV1epa9ifwF
 J/L/woOOkj6zxuOK+2Ui+0M1tLnBnur7FfSrHi/ot2xnGtb+/9g21y62SLFVrdBH+mFq+/N
 PUeZt57Szc9Kn4k1NyGng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y45TeBcINis=;+NDXRK/kqjtxVstnXh6NB1ZZgDo
 BzOnqxzWcYtW4i46jIEdg375HhNojJu/qRWWSzwlgA7WBVUKhfvDIDGl0IizZxZxiku+CDibA
 qXVOIDkPuGJNwlq3SbWgIJ7rM3ckEeX+siJLR9vLdMTR9FaSeDaMM21dupIhzU/GaoSCzwmAU
 Qa5nrkQULWeLiMP2EwijFUeECdMwxEaE6BnIM0AmzqVnftqHnr7fkohPbYq8FN5qeTR+j19sv
 VWeiEn89v35gTpUTrC7AYOlVvAK/6mWmgOCd/LZzl9S/FpYUy7bXDVQQnxxI7sfEFSyZHumyy
 AEzyRFqdhvNQu23Eg80g5hgecCPJe9gsR420lxgeIEpnbsoSmmWs5GE51j7Y0B+HUde8rkrpy
 an7IYhakfdFAnZKXqQE1MCIgd4H3mJyBwq4pFSLDOYfPHskGGqUvCXUd4wGplNVO9Xp+FQ3Hh
 +wd3KA43GGtONu6weu2KErBAaHn1NcTx9CvTWyTW3ZSIAr2F0s5JVjIiOifSKoPHJTatlfnmF
 SFcLQFjnL8bnk7D4LCpJnYrb/DBbq78st0YOwSYzYWqj85VxfSS5CNQHSSyPSqpYE3m3kApj7
 08x9CzVuduBOgsfwfYA2Mltosj3j8TEV591DmZib/yl5SjYhP+kN8uwW8ix04qBIFl3Lf/fH+
 AO4ui4AiqUSawGuZj5XFaVBfcVsWIRgCEJobsxbYQRfyx346WaE3IOwOkYwC3Woa725n/Kk9D
 w81WA30gWmPi+mqXI6Zufyjd9gFzT9iJoKXGj+ES6CaSeM+lRvpsn2wT0nUrDzyqq0metkYLr
 NIWazh1UFQyT3QAiAHLiE+ZA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Sep 2024 18:32:21 +0200

An of_node_put(dn) call was immediately used after a pointer check
for a pnv_php_find_slot() call in this function implementation.
Thus call such a function instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pci/hotplug/pnv_php.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 573a41869c15..fcbf20db136b 100644
=2D-- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -697,12 +697,9 @@ static int pnv_php_register_slot(struct pnv_php_slot =
*php_slot)
 		}

 		parent =3D pnv_php_find_slot(dn);
-		if (parent) {
-			of_node_put(dn);
-			break;
-		}
-
 		of_node_put(dn);
+		if (parent)
+			break;
 	}

 	spin_lock_irqsave(&pnv_php_lock, flags);
=2D-
2.46.1


