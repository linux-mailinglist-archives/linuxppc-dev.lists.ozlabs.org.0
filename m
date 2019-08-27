Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBD9E847
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:47:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HpY51PC6zDqJY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:47:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="pwG+CVZu"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HpSW1cDKzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:43:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566909753;
 bh=VC2QvdrCbaIt/LdFIIg3zDvmOueJw0EM+bO6qh1H3L4=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=pwG+CVZucPG8JjqlnehbcRjJozmGGyTXoTkiP99gnoddZAl9GFkv/6lOpCHCKZM1E
 3avbZof5rDBOJ3VExrH127oMHHoQLL3XQgGaGT1L9zHOe5FS6uMEvPq42KYcWlxYAh
 /MCv3BUSJ45+XccYI82z9wG7p5ph0DNrgo7gQ15o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MfYj1-1hrxpq0FXX-00P4Oc; Tue, 27
 Aug 2019 14:42:33 +0200
Subject: [PATCH 1/2] powerpc/pseries: Delete an unnecessary kfree() call in
 dlpar_store()
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b46cc4ff-a14c-0c10-0c0c-95573a960178@web.de>
Date: Tue, 27 Aug 2019 14:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4WbKfj3BMvlzyZRPacSeaIx1Hkpgixn4uWiCQuxbneWkPrJ3uyx
 TOTDWsRUPVY9da5sgdHIjVoAwfYoxYUexRity68kBdvVFVHA5NIt3XrfuUpFMQgk8FcXN3Q
 mc/NVjFTFEOECc/PPRDTND9T0QyG9bV6Hgc7BkZlXMZIUQBK6QSVmM+AqZqSbxPNuwLSAoh
 SlqY/s0fgHYK2n6sjG2gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oWUI2J2XIEU=:n++pVAsRItNYxnfeygvcpy
 jG0XfKVcVv3MGWR69K/EGv320erIJuow9YxFCL8kqY7qfm4YQpI79sXnFts+EDhkR41q6fKjI
 xvGtViLhvFjLPVfI1i8aIJ8/gKhbE1QrIYqjNfJkPKQJTTmmQHq19Z+l7f5aSwEJe35L1Reb6
 0PeanOV6rEUVSnChLJM/CXHJ/aKFA1W5gu90L43bf2x4MPb4bTC0OvBi1xdhGw/f2AZyo6Lvd
 0S74StwA0lYwM2TIwC6cl5lKtzW6i0NKGs138+sa4P79c7kMeTyZaWxdMjnZfDlJv/x0IPlxd
 1NvDDRP3iHh2T5PxCKefLLX86bNQ9L4JII3x+gXxsjg1NDW9v/D5wpiCTUUb/3RoPyzgCykOL
 hbPVkMAqYKlyc0tIuW56NOdE7A7AFHyGan7SuWM/kuA41qs/bgiVKiPnEiNm3V8uaM8lpFz6m
 6oiHDNEVf1czEsYEq66+kVCaJ+AmaIqH2XGIQk5cC7fYS/e5FLtJdwbILOx/Lvg+vqQhNPk9d
 KN8wgDocNR2Q3Ri58i+ip05mz0+DpANoADaB53X+nivjUNvouASWfGS5Vykk+AO9BI37W1ICv
 hK4Y4NnLGoJ5MnpjgQmCLuwdLtmuIwfcKuUlGaIsgr6o6palbs1WcbWS1wCOcj0EWts3M7CTC
 a333n302rgMslW/6JqNDN0T8WG735zg/PrM8Cuf7eUUDBKldJYFlzGO/+TN+odcVDTgy1EqHC
 qiFd3CV5uEV9NjwztzPKFcqFaeczHnZJkF+nObATsFS44AS/XbCi+Rf/DR36RWgKXigP+nvkO
 yL0zaBlagjgMOn+HybOn23Nfdp8W1Fwl+TFbbJkODYxWtBp9M+Ng1LLX5glHJMi7QNSBhHiFp
 ZLMgrHV012tiGf17Dcljfe2QSkC6TwMhbnSe1rDKuBfqaUxMoclPRHm/6RLN8YV8js/a0Nf5v
 QOF3rmHRg5yFT13UUswp7hx4ipCfAFtBnziSQ9Lz1KVf7oKvmr/+JSBTapAtRf9fegDmTXUgC
 IsKyFq4fUzYgddNK24DFV3pnVMrYaP0IjcExW8HAr1nQPW2NnQQ16uvGHlp0T8eo1Ukk+dSbk
 DI5r2tpEXIY3ADnjPx2dQtwUqAMdvKWlvhpbNrIme5sp9hwgN4WpGZIeqSVzWsyZflOipjp59
 nRW1A=
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
Date: Tue, 27 Aug 2019 13:34:02 +0200

A null pointer would be passed to a call of the function =E2=80=9Ckfree=E2=
=80=9D
immediately after a call of the function =E2=80=9Ckstrdup=E2=80=9D failed =
at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/pseries/dlpar.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfor=
ms/pseries/dlpar.c
index 16e86ba8aa20..2a783dc0cfa7 100644
=2D-- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -523,7 +523,6 @@ static ssize_t dlpar_store(struct class *class, struct=
 class_attribute *attr,
 	args =3D argbuf =3D kstrdup(buf, GFP_KERNEL);
 	if (!argbuf) {
 		pr_info("Could not allocate resources for DLPAR operation\n");
-		kfree(argbuf);
 		return -ENOMEM;
 	}

=2D-
2.23.0

