Return-Path: <linuxppc-dev+bounces-4713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80602A027AF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 15:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRbtH2yxwz30Ty;
	Tue,  7 Jan 2025 01:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736173207;
	cv=none; b=Y7xwycnS2Uj2JOu6i5jIhwkM4mt6Lp5DapA9WUhler3nb+mborNYOSqljfp/Eb/gm2BkRBovpT6WbyD6BBrBEOUdK1jKHlCWLkU6CPQVIenJWXX32sxB/5bvTp8N38iVhbKu4DR3LW5/5vdHeEZ3ZLxJdBwJlKFAGEVuq2G6kmjBB+exGp10YM5sKqXXyNtBTVApXJW85jeIxu3+whjO7VAr/E85U50fZGY4B2IXAXyav0YomJKsxlyOdOAR4Kk5eoMdYgOKLw/kpMGKUJGQy6FZ/1wrBKjQp1zWEwNA6X08YziWLdUpFGCYVuRkBoC9KWALn9Sod4cZQzGaQdvelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736173207; c=relaxed/relaxed;
	bh=dZPKFacgLfwYeltjnF+HINFrkV9GyAoM5vjny40EBNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTeRczcrtcCaXCvCOpkNKcsGubgK6762bztkcqIuiQ+hTBzig+zMr9j2E7JPqKYOG7/IRlO0bOac7OE8KxfFKq3PDh4HmDUfyS1PONWm5BBAXEdy+/fXAQhTfdNGKudZSfiWiOgc1JdCwlyGYjFYDthVSibpQzCVG5Fsar+FssAOJ645IPGbYCK24ubxI/UIf73I6qUZzsTx6TDTRH9ubPD2zXPChC2hTrjX/G7D+k/Jqr/LJ0RFtddHmJcQUgo8LViLkDe63+j1/OJWw59z+vSiURIDLnygD/rHCIshyyYy9jl2H0Ine0ByM3geuDG5cIM9w8WAEHW9+0Is3BOHHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRbtG1302z2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 01:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YRbKm4tWrz9sS7;
	Mon,  6 Jan 2025 14:55:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9Oh1RsQil6n; Mon,  6 Jan 2025 14:55:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YRbKl41kYz9rvV;
	Mon,  6 Jan 2025 14:55:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 765CE8B76D;
	Mon,  6 Jan 2025 14:55:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 658LmXtQ7wrh; Mon,  6 Jan 2025 14:55:23 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C588D8B763;
	Mon,  6 Jan 2025 14:55:22 +0100 (CET)
Message-ID: <6443434a-f810-4591-b1e4-cfea0bc0b993@csgroup.eu>
Date: Mon, 6 Jan 2025 14:55:22 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] powerpc: boot: Build devicetrees when
 CONFIG_MPC831x=y
To: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250102-mpc83xx-v1-9-86f78ba2a7af@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> In order to produce useful FIT images, the kernel needs to know which
> devicetrees to build. To that end, follow the same approach as other
> architectures, and enable devicetrees per platform.

Why do you need that ? Why not just use CONFIG_EXTRA_TARGETS for that ?

> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> I've only enabled MPC831x devicetrees, because that's the hardware I have.
> ---
>   arch/powerpc/boot/dts/Makefile | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> index 0cd0d8558b475cfe342f36f4b78240ef88dd2e37..6aee895d5baaa2c978d4b1c82a6d198d9e166ea2 100644
> --- a/arch/powerpc/boot/dts/Makefile
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -3,3 +3,8 @@
>   subdir-y += fsl
> 
>   dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> +
> +dtb-$(CONFIG_MPC831x) += \
> +       kmeter1.dtb \
> +       mpc8313erdb.dtb \
> +       mpc8315erdb.dtb

How will it know which one of the three to put in the FIT image ? Or do 
you want all three in the FIT image ? In that case how do you select 
which one to use at boot ?

> 
> --
> 2.45.2
> 
> 


