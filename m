Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CB6C8F01
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 16:31:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkNNL1qGCz3fVM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 02:31:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fOW69DCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=fOW69DCE;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkNMM2sqfz3cLf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 02:30:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679758227; i=markus.elfring@web.de;
	bh=mnw3UxXN37BrMmqTaNoaZhH7eyrJQu+5+TVfPlBf654=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
	b=fOW69DCExngxD/3gTGyGRsC5ERyUB3rbnOsM7SMMQhsC91SYcu6ymCYNcA5Jkkx8J
	 sqntIucdWbvumrcWhtOhcv1NzENroK6Koq0uG/bhayqycg1jzxg08lthW02gVwrlwz
	 gMxrhK233unFPzqy28+8OaV0qgoA7I6zCg9KQ9FgqD8CQ8AtPPJGrHn0qOTl5Z8QKQ
	 YcWlxOODB/RuP+Y67n7GedDxS590uycedy57jbwCsiRrnSxPCxMOxkgKIXsK0ZOwLb
	 L5+cCUuUbFp0zzY7jyD8WclmDott1BKADlPf3qd21svdegvWQIujXBA4h8cdxufG0q
	 japLUAY+eQoTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMY1D-1pvpyu2C4l-00Jhxg; Sat, 25
 Mar 2023 16:30:27 +0100
Message-ID: <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
Date: Sat, 25 Mar 2023 16:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 0/4] powerpc/4xx: Adjustments for four function
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
In-Reply-To: <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iNgK0jltlcaV4tYapYQGvW1/T3nlfbQGVAeyB74C0KYaYTfCOWc
 fi9nchrN4LuOa1DgAHsyOH+90BiUgehqQKyk5TNFsYLk0d0U5xh79iyglnXVZk/xqbpWuC1
 D2Q+ITQbPijDXhjrvxBSYKhUf57Ea4k9FzKmqqhfUSyubGwnMhPacLcOz6T4i61gdg+/2gU
 5GwIaC8yncIoqvs4rWgoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LJ+eEHqAW8o=;OmpsWKz3ouNXB0x9MWwPHA5tWLE
 05vmQQL/n6bY4bZI7jOTT/n7B5TZJd2Jno8fK3s1uJpxMNlsY/Z7wres2kKI3evMrCIwTRLRk
 Jl/rODGFfhy7I1hyJhH2ld7BCdDm9Kz0CSjusFGdn7zo7QzUzJueaU4UaWvnGSRia+B2+5sU+
 Rr1M4SOQLHEewex4VFiOxw7cnk9h2NOeyLMJu7ugDVZI/s9dneeUhBh9VIc+Z3D9T2z5tSpWt
 YL3cmLeHUtlJjf76Yj2ETfO6ru4YtI/N+7nEqYNunu6n6vXEYCHjCInm8pSRdIpJG/SCxHSba
 I6EYBMVYDh2kIke7aqmt4y9HxYBMy3yZ1mmx4TIklw6ZcyXs76Xu3bzkyDe8Kd3i8aIQUk9OE
 omTvYd3vIvB+Afe/zeV7HhG1ATedqXT7cbsEN+JRcD5xCOHx49I8wDeuwIJQ9eEHaAbi8dRPg
 SMfQyWglx7QOyGTXpqddl95t2d7seCQN5hgQuIF9dm0SWDfwVxiexCdPfUR9XXBrnSIA8atAv
 vJ40rcM0PwDEFKuFWrcb+NkoImTzUZmKS4XznofjtGsk366YuJJo0/A/AhRoeOAalC+Wumve5
 TrGGpagvzth/7PUTpuancCBee+h0+vCGnjvPPhndnZ+8ht0t07f583Y0LMGy8URXS7Ib9Vrpe
 Km6tjx1WnyH/aqw8Dng/7SX+/7q1Qk2R9xNwwi5GSiIz6EmGUui64c+caWKZ7RGWi01RW2net
 MbeQVu1HnKCRJwX6R6QUzw6Tmrala8Izh0u+YOO7OO0gjIrnFtd1Ri1muxu9Jq/jB7OPC4EpQ
 r1Nipo/VtVLWL0TZIir9FxllRhSQUG/xUBZmNKxFcJ9Ie00hfoOA8aMVs2CcLtqIgWysvseFo
 wCFSD+pyXwOOFRPUze2xkLYScEFXzS7hdIBQsBPvlfXnTpl2mvj1DBoSh
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

Date: Sat, 25 Mar 2023 16:10:23 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Fix exception handling in ppc4xx_pciex_port_setup_hose()
  Fix exception handling in ppc4xx_probe_pcix_bridge()
  Fix exception handling in ppc4xx_probe_pci_bridge()
  Delete unnecessary variable initialisations in four functions

 arch/powerpc/platforms/4xx/pci.c | 69 ++++++++++++++------------------
 1 file changed, 31 insertions(+), 38 deletions(-)

=2D-
2.40.0

