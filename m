Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 404829E2C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:34:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HhxP0bLxzDqwy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.11; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="BpaLbBhG"; 
 dkim-atps=neutral
X-Greylist: delayed 500 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Aug 2019 18:32:27 AEST
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HhvH4m6czDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566894734;
 bh=Q3RzmFGlafLwrZMdhMfy6OReR7/knZfbcIt381IISEQ=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=BpaLbBhGK9k73DK6c8wYIi/rexKDAphCQjb5Rcrf2+eWprfmD06edGZfF674McLaO
 dnJiQL/CHlux/FU/GkvjoHjidjh43is3ErBCoHgDsI1j8bMcJXhtzehPQI3qtPrHWf
 SKsE+uSVhQX0Pt5HLGzyCFhw2YqbEpY5wllgx4Mk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkyIj-1ialdK33pt-00anjT; Tue, 27
 Aug 2019 10:26:47 +0200
Subject: [PATCH 1/2] powerpc/82xx: Delete an unnecessary of_node_put() call in
 pq2ads_pci_init_irq()
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <lkml@metux.net>, Kate Stewart
 <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
References: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9c060a41-438b-6fb8-d549-37c72fae4898@web.de>
Date: Tue, 27 Aug 2019 10:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GSUID08LZurS7CQHIu10OnBtmTflRlh+77SCgRUzkqFza7LvP3P
 l6NdK9cjnWOYY4NtA9h2c5Lo9ghp6rGbB3eby/PaNOj5DCxi09EgmvKxuiLVvXvPo1WYReg
 LaQJ933/gQYL+QctiYNtCMKvgeTggzu3I3HRhjSQ4FN57apMcpAd3jXa0ORVM0wZnGGpVL9
 HdyX5XRR3MGF5pCHJYvTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cs99ByO+2XU=:u88BWFo6V8WAwPAUzh+tVh
 Osvj0l6BpBqbLNTMx0OHFBWkKGzSC464pPnIKfS1UGQc4dExXOcJ0Xt3g6X5r2R1th4R82t34
 RMRSIZfDaVBdDKYEjyCj8JKdt6gKnXAFFUoKY6Dv48qeI9S1/ksFYCdzLmHXlj2WhCk7Fwihd
 R7E9rvpGCODmEOl++NOga74Z4M89dc8NJ97F9Tyvuwhtp/uyzO5UpKZx3kYbvDHkV0B4hQVL0
 9np4l+HI28QU1uWfpf/oNyQhfBMtM592a27ufmQCmHoyJrJlsQa7hLlhUd0oE+XpYe5y09Mep
 DLB77vrXdF2okUKDKG+t4/psG7BD/fsIwvf+L0NIzzL/8edkBP+kNWviw5iQlcC6jSkqNhhFT
 L5OpwqGgXQU2R5yj4q2L1rUvyla2JIWk2jD2vWPpWsbeFGJVNjbGYp25iQFFvM8IjpqsrP1W2
 paQvf54XXs3J4VVQHv3g9kttvJor7KFAfa9uqm8oCu5xE6pO1bG4W4aqNm3YSE9y3qYjqdVZ4
 gW43JeBnJlGMGrEpwc04YCuOmO5ebqc9NpxFXCYr66ew+l1GBowEnKLjU5PgyKYKZZlv2OU+r
 GmqBNF2eYLYCvSNx8nze9k3LzdbsFFp97UAHaKWUJdLkhClRy/9rlGiHt41vwYTi2XIxeLGju
 Py0SUCoxl8jub+vkMWa4ZPE+bCmgG1usoPMFNSSoyJxmFD+RYXbhPHxMLWld4VOcGMuRRpRyt
 R1ohzejTgV11/2kR/7hEwpLBg+WCc8ckb0msuwR/G1sWTUgBn7h+LStKyTYSTPX9pr9MD8nJ2
 IbyJ8hRBlnqu7LZVSH/yaAWLXDYPORbSw+t6EeEqNq3//Mfe33PVHcYuMVJ/r+kwLEx3p6W29
 dQwQOE7/TxTrY5I5MXb1Y3b3p9xH+KAZLSV0ttDJ3H/gDBOuRCmKOgAcl3mEdWyT6XioBe07v
 GWgfRcG4SIa4PDF5X3YHQCNxRu5cdIaFJyPtSEFxZ/LE7fDnPkJWin46f5FPS2n4qD2neu7en
 NGdPlvnUqHHmKRaxmVp9D2lA0BKyu8MGdDB6w81uO287TB+iJODluC1QwfL2JE9Xc3dPBWbuI
 N9kkDuzq0rOOJSBf3zsSjdD/ZdIkO/RYAqySb8rK3qVOLNFz2J8+NwhhRYQXdmxwKf7J9VLpQ
 5mGWKRZHCUs+cZHOF51NgJgmit9MggoGwjhycGiTAsLkFNUQ==
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 08:44:20 +0200

A null pointer would be passed to a call of the function =E2=80=9Cof_node_=
put=E2=80=9D
immediately after a call of the function =E2=80=9Cof_find_compatible_node=
=E2=80=9D failed
at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/p=
latforms/82xx/pq2ads-pci-pic.c
index 096cc0d59fd8..6cc054db7043 100644
=2D-- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -123,7 +123,6 @@ int __init pq2ads_pci_init_irq(void)
 	np =3D of_find_compatible_node(NULL, NULL, "fsl,pq2ads-pci-pic");
 	if (!np) {
 		printk(KERN_ERR "No pci pic node in device tree.\n");
-		of_node_put(np);
 		goto out;
 	}

=2D-
2.23.0

