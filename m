Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C613081D643
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 20:23:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VslatbEQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SyDbh2YHBz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Dec 2023 06:23:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VslatbEQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 330 seconds by postgrey-1.37 at boromir; Sun, 24 Dec 2023 06:22:42 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SyDZp4jFKz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Dec 2023 06:22:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703359352; x=1703964152; i=markus.elfring@web.de;
	bh=wZCbHnDCjJnEvDzsimFepIu5Oz2VW9fSNRNdT/39XCg=;
	h=X-UI-Sender-Class:Date:To:From:Subject:Cc;
	b=VslatbEQEXtKCg/t2fnbeKqFcCiIWWu4Rq6HfUEomxwg4IVpfpD7/AR/GsjN/9qG
	 K8uYmXgpdVvLZbmH4F78mLfR+AjbmBV9UUUq0s//YvXw7rfhbgPtQ7+a0UEqzFq07
	 zTNmLNqwIh9gwGCf0+z1ppRoYjRF3rQEJCoK8QqkfVMHZ3lFBklUtzu93vaVuu5D9
	 84snwPZPzfF4Dm21o5GuyBRpNxDJRSXXLF7w5T+z30/2JZhQ55qwceNBSIRy1Tvha
	 SrhQ8OSTuqw1sgnAw4JyB88jtuM6CkaNFFdI1memtveM36cddZxDxQ8a4ouhOCN8H
	 op+O1lzOI6YPLI+zKA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQPZd-1rctcp2beT-00MD18; Sat, 23
 Dec 2023 20:16:34 +0100
Message-ID: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
Date: Sat, 23 Dec 2023 20:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SSNGOMyB9De3VAUo1rhXHF89mRJ2KEVJ3ChkKr892h5SNGxCeeg
 6J+BiPBDqKSqZOQJSI7/6dasGH93mG6rOKPO3ScMqM8AviJ+KPiZc5PmobjTqW69T/kXuCD
 ZniowXIJDCCGOU5569t6BzLCctJHry+HWycsWnfBuTKzd2+LjL2Khh75fYznYTx94/LLCTy
 tmJl2Eeq6ym/8IPcW4dcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hEzd3mff3wY=;hq2uCKyMCor7J9/JlPNcV11Ct1P
 KCfaluCR8LBi9kJK7qKPX3eQCqzsNSpO5RvmoNA3QakGaY/lcD3ybg9Fup3CNKVEXQsSZ3cfH
 g8Lh8WdvoVYEgKiLHMrVwvQHAIRDD9QU0zxLMmFmb+rFV1vxoAdvBmBGdqEQg7GVFgbkuMwqY
 vnBf3uS/atd7WTaGQboDd9b5JfgdBPFOODKO+DyGSAZ9cJsVedkc8U8HU9DT8oThXvRTg306P
 Tgtz/Hb5gKlWnMGRCNgaHo+dJ1SlHDGl1R4YUeQq4FjAdb47T6ETZI+QE1xkefrdqL07XppDf
 qVFDmzKhx42NzwNZLfg2Yjr/9v51YnLjb7z8+Tj7znpm44q/GcB7+eIxQwN0qSJSj/ZUWnkAQ
 NBb+ehpUOSvdmPU/iGbc2hN14+8Lad/a1wWGI8GXgwF6Ns/IyiQqA1gdATcdPkuoKVQrUpoud
 WGuXi8i4dgvR/Awnvoj5Yhar0fvCDIR0sOmV2OA+PKig3SHfKLhArtlWvzA7415Fj9mezyEGd
 VgIzNyZThl++sPE1oAko/RVmZajS2iPJBFhM+gYi8URLeDy5rx0His8QRZrLCJ81d1Z3kQYu5
 90ZZktLEZUlw3DQz1yWjjSfpeJCR+QZJrrYwqZiQb2YOXFs/kzZBInhCZfJCW5xnrEUrfzpDQ
 Fo2MOYYcaKpPQpLHy9jEVUooE0q/PwDCJT1A3TBFj22SLkEmEzaFNLCJa9iqqErwc0iUdoPt1
 J2QQTgUzrqEwsIjGNTyi1IGhD8O3Scz0W05QnLUMvYdJ0sH85r69sxjuGbBT1GdZ14vmuiM78
 IpfEO5DXs0leCEUHa65DV7Vprl7LuIuIXK9jn5s1dVMTJdVVeRSgfJ61eSTNc9yDFm2amTLgd
 YdLUNLmeNBZQytIk+rAEnBlpOd1jOTRbjdkPQxCsh1uoDI2+PfiAolMsAcOsCwZcCaa9XxkD7
 LmKldw==
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 23 Dec 2023 20:02:02 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  One function call less in vas_window_alloc() after error detection
  Return directly after a failed kasprintf() in map_paste_region()

 arch/powerpc/platforms/powernv/vas-window.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

=2D-
2.43.0

