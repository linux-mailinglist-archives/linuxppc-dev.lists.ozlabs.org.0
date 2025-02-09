Return-Path: <linuxppc-dev+bounces-5999-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2EA2DBE0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 10:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrNH91cbVz30Ng;
	Sun,  9 Feb 2025 20:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739094613;
	cv=none; b=YFvjViTwzaXgvnAvoxwvC51XlflBk0RF3eV6QeusmdM/7e0873DuVzSlqkZplls9MAEYxUT05ELyjAktHWTJhkiGrxzmA15eyW0ekpHHyYk/JOVCK0Cwpjyf7ALej/hm+JcZIDVYHRyHzP8bM3oh2K3G/DpYLjMVw/A5w98pUO/U3cLg/uR52xAp2Z+lB+xtmbnfFT7BlvSZY5brQiljYoXG6hdoAzBbff8bemddYsyWb5obGqdejuRRhbiXN9Rn5Wke6bGJz36A+bq2/vJ73eaTPYb7aOc9WAlQdynCtMLe77Lgfi9OeOIY6K3izs8DPRBqKhIQ2kOoYqj3T5ideQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739094613; c=relaxed/relaxed;
	bh=ckI1RqsjMyU0sE2QURMCMC6KgUXPyPicfhatXov8UOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqYjDVTUDFpJjgB4cy2oDFX8jDU54BNBVKwjrNu/2tATo7VV1ufmgerMSaYBXFpGS+th4A5PfBSD2y/bOt0fL6YSvgcae81WNplf9iIYqrrvgfjS/4tp44Svi1Jr1a9FPdpelO5DPsrfpnKaUqIthMoiV5RjMItBM7c3k4JxOP0yv7mEHZrEUUfYK/FKotK5UTNiWcZlDYDgNmH0y7+0zbhMKF1+AA0DzH5DeI4MFSTPo6XxNBprQIDithC3LOSIqyVCd2MZP2CCcuN7+trBKhZsTCwmcDkj2ttkT1WJTSePYUwMEMSFxwB5VufSQcDblUmClLRJXMhxVw548HLjgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrNH83HSbz2xmS
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 20:50:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YrMXQ0N35z9sPd;
	Sun,  9 Feb 2025 10:16:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNuFw5IlXRuw; Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YrMXP6dxTz9rvV;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D19888B764;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kpTQIB64sT6S; Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 124738B763;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Message-ID: <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
Date: Sun, 9 Feb 2025 10:16:35 +0100
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
Subject: Re: [RESEND PATCH] fadump: Use str_yes_no() helper in
 fadump_show_config()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Baoquan He <bhe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250209081704.2758-2-thorsten.blum@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250209081704.2758-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Le 09/02/2025 à 09:17, Thorsten Blum a écrit :
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Any reason for resending ? Your patch is not lost, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=89400

If there is a reason that you don't want to put in the commit message, 
just put it here below under the ---

> ---
>   arch/powerpc/kernel/fadump.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..8c531533dd3e 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
>   	if (!fw_dump.fadump_supported)
>   		return;
>   
> -	pr_debug("Fadump enabled    : %s\n",
> -				(fw_dump.fadump_enabled ? "yes" : "no"));
> -	pr_debug("Dump Active       : %s\n",
> -				(fw_dump.dump_active ? "yes" : "no"));
> +	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
> +	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
>   	pr_debug("Dump section sizes:\n");
>   	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
>   	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);


