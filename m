Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFE82594A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 18:44:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lq67GxWJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T69nB5sWwz3cZG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jan 2024 04:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lq67GxWJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T69mN25zxz30XZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jan 2024 04:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1704476573; x=1705081373; i=markus.elfring@web.de;
	bh=wS6PsNt2y18wBuHSYkuJprLzMZM4lOzVE4kOejHdGJY=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=lq67GxWJRGfWDFM4hyAkBMKMcaHlk13zd6znpFgEpJpfUlLXls1iWoacwPmMzlbw
	 NusFy5rCO0Ep0RNpefUSE4YLq3a/KY9x5LNPGfmqkNPNZ7bJNDPQbQSvdXT7au5iQ
	 KwadT2y4CxO1taJKxbo3LfI2V8H0bDSoeSFf+JRwo/iOaB09W4O2mnUoIvjmEbZIE
	 JzM0vMa6GmvlUHjQuJtiJeosOJAIDMErIE53ks7rQ6FSf1VR2wh7sYLnG4ZyeHeI5
	 xaf9H2r/NtUV/Y5W6L1u70UimZt09lH7SokDAjSh0XfQIhkOJthGUAqz6y1ITQ2Os
	 y/KxE7HuG4jHHrxq9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mr7ek-1qsjvv1WcA-00oMI5; Fri, 05
 Jan 2024 18:42:53 +0100
Message-ID: <ecc3a3ea-e199-4d57-b244-9811b5e408e4@web.de>
Date: Fri, 5 Jan 2024 18:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] powerpc/4xx: Adjustments for four function
 implementations
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Josh Boyer <jwboyer@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Roese <sr@denx.de>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
 <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
In-Reply-To: <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zlLBn14E+TDhGhUEP6jHPfOKj+JOryPQzEfKwTZPn9VnLpoNOWk
 povpIOGxci93DD4OQ/nyOXkfEbUxDLyobedMEKhL3zb+nMzue9M9TR3B7R3nzWvgszWO9SW
 EZKE7FXceD19TgMmqAGY7VJ9VK1HZABLig9YT0s58t6k8V52guQycNjO1y4cb4TMY5IvGl7
 AS/rulsxSv/Kya1J0AXLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a/PxcM6gL48=;hh+akCP6GjvdmxP77qr8CwY8Muu
 l3Nx8PTqKpbr7FACJ91WCKUmGSyEsJdKzbD0rd21/mAmN8LQ5riMx+yLrvNYv/uDN2SjaVvMt
 Ldcj0yZgirw1rpno3hD8mGQ2jLp0Cq/2CTXwgd9B4IqoGqkvcviOuLnPCJLG1HCYWEbxYoV0L
 UuEdwG3ktj9bA51saHYDq8i5qk8wE3cGu1lCxWHULJ0feMroT5/q5inhUvGKIzXyepfAUMObF
 xH/M+oVrsQuXW/yqBfTvpdJeyGLkv3hBnrR+1hgIoklym4WWHPKPj/iTLVSfxwVya3+RggSUb
 SUA/3xa3TX61JKt2DZ0EMfKTnT7uPIYgLzuY+/p45BLqhSDJXYER87iX3/eLmO8pe9Ot856IB
 CMvSV/k/tDR17WUCCuFY1OI+MFKcJQHVirSk05JCu41VeF3mbpn0PxlcVrSpdAChj9/PGdlQt
 PDAubueycD6xze5PGjyqNGHbNl/H27p2574LNrvsz23xVjsh956o9Hu5UKLHwLM71eQBkeTkH
 JEo2tgYJxh2nSUvGKtVd9EgZCuSY1rpPbNklWwx2dfenIWf0gt5KU4AC6cAKF4buACL8EDv8T
 yAuBpHRmN7X3GEvqb8+xhQZNLygtP65zLDItZGik9ApIoawowVDPMb/J3vvOU3k5VsN6NynGm
 GXrATSuC8IXzu5a8kUU5HFy5kGG8ykb6fhCS5NFRYQD54vBiGbQjeLLHf6vlal8hzMkPMyBKZ
 WkLQdmmT448o8OHyKVid5M0oqmIThs6XqlPc+wjR4i6hbK50RJX11NGSHaWIs+y8gwudB+bwY
 wESX3Vq5hgiVTy5eGW9iZ1VgaXC2/OBAo7e3TZAAKXe+7pXq6kBfWQQvwCOmiFrN+m1PuVlCg
 6sM+tW5LQ5Nh+RDPCZUUwvy4UEQnTJBt40QJNb2ch8kKYiFvbY3xZKhWFQx4ko2xzGy88Vqsr
 /a4h4w==
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

> Date: Sat, 25 Mar 2023 16:10:23 +0100
>
> Some update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (4):
>   Fix exception handling in ppc4xx_pciex_port_setup_hose()
>   Fix exception handling in ppc4xx_probe_pcix_bridge()
>   Fix exception handling in ppc4xx_probe_pci_bridge()
>   Delete unnecessary variable initialisations in four functions
>
>  arch/powerpc/platforms/4xx/pci.c | 69 ++++++++++++++------------------
>  1 file changed, 31 insertions(+), 38 deletions(-)

Is this patch series still in review queues?

Regards,
Markus
