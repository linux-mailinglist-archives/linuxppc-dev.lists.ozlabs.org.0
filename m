Return-Path: <linuxppc-dev+bounces-12505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2CBB915F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 15:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVkJ44lyTz2yrQ;
	Mon, 22 Sep 2025 23:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758547236;
	cv=none; b=El7PMYw7IkIgloiMYNiNA6y3qpLodjZgpBNhwhUu0mu02KmFW5XvoAlZu5tquL302dezxo6EPIAnsKGurhZDrLEftCbsV3Zkkq7Z1zRN+wm5yot1SFbylkUq2z9c95saAZZNcH+5BW2mgGdrP7BDzE1vmEcXLGt7VLRQR3mA56aOW4hmJcxiEsmOE/INlSn8TCS0KfcdjKuPytC10lMsmXME/aCcQkyafATWXa/J3pSO5jJJaqTxhd6ClNtytDXyoVrsCLzSaQgNMWdvcnboXg2BE4c5sjvVPjuRwjxUhO2YgD4aTKR/P4l8MRvlXEzftm0YM8ez8jXSx10BlWBcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758547236; c=relaxed/relaxed;
	bh=09NfPGXcTMGgRt4Rf3qCoFOG4sMcSFOSiThddAYnSs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnWKBOcA8brhQddsCI+/YJUqgMsIGe222cvdfj0JYjnlAiOma3+p+we2IxtDKmp7xb2KN3aqyy+6fDpwlTnSEZxLpnfkbBU9EF7VPT4EpKAMsGDoBXiHm4QwK/VQagicsmPITdCJRXvJaXPj2Az9tevmyar5KLQsG11Yz02lwsPLToqsNK6H9lM0bFk2rIafn0Z725dxvsLzTqRs86U+j+Ym4VA0tf9yjmVnjOkt+nxgjqaOd2zh3bd0++rvXPPjfLRLHnBd0l++6QxJUbyevLTugkoKKoxKhFEk6V9mk0FVGfvdrcbnCJ6SOf8C02fZWsm1X4cd2OY213gcWvt59A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVkJ36gYWz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 23:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVk243pDkz9sSm;
	Mon, 22 Sep 2025 15:08:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paqhIbTdsh7r; Mon, 22 Sep 2025 15:08:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVk242s07z9sSg;
	Mon, 22 Sep 2025 15:08:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EF2B8B768;
	Mon, 22 Sep 2025 15:08:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xlgcRaQB3zpm; Mon, 22 Sep 2025 15:08:28 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FA3C8B763;
	Mon, 22 Sep 2025 15:08:27 +0200 (CEST)
Message-ID: <2fa11e77-0844-4432-8514-0d1e1b2222c9@csgroup.eu>
Date: Mon, 22 Sep 2025 15:08:26 +0200
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
Subject: Re: [PATCH] powerpc/Makefile: use $(objtree) for crtsavres.o
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Peter Marko <peter.marko@siemens.com>,
 stable@vger.kernel.org
References: <20250919121417.1601020-1-alexander.sverdlin@siemens.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250919121417.1601020-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/09/2025 à 14:14, A. Sverdlin a écrit :
> [Vous ne recevez pas souvent de courriers de alexander.sverdlin@siemens.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> ... otherwise it could be problematic to build external modules:
> 
> make[2]: Entering directory '.../kernel-module-hello-world'
> |   CC [M]  hello-world.o
> |   MODPOST Module.symvers
> |   CC [M]  hello-world.mod.o
> |   CC [M]  .module-common.o
> |   LD [M]  hello-world.ko
> | powerpc-poky-linux-ld.bfd: cannot find arch/powerpc/lib/crtsavres.o: No such file or directory
> 
> Fixes: da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc versions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

This change is already done it seems, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250218-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com/

> ---
>   arch/powerpc/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9753fb87217c3..a58b1029592ce 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>   # There is a corresponding test in arch/powerpc/lib/Makefile
>   KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>   else
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>   endif
> 
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
> --
> 2.51.0
> 


