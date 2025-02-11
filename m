Return-Path: <linuxppc-dev+bounces-6076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41CA304D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 08:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsYWg0pJzz2yDS;
	Tue, 11 Feb 2025 18:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739260206;
	cv=none; b=YnTKj4nkenkYtKB1zQ+MdXxbkE5VTK0ThSrGJEWYM4J425yE2vVOxB0gea9pEJUo7wmZZ6LiJUzDoXLrXN1jdjHfVt/Utzro+UECCDr7FcdgFwhLe2KYgkYJjAWkb0eOPNj1f4QF6RNKr2jJ32sfDn4p4IhTjxI/sT1u8CpEBj3EkLGuEy/vMqaWbgFdgm/OS9xlmDgrkj+fYYLdX3qY/WQVuoNrUUpnG0Lb/4VLL4VNkEPysMGZOFOTKOyOmXLnypRGZthdDF3DSCJWAotlpLbMF1ASLODHV2IN7UcBNj42XRT9sbEoBGtY4xgii557npgDrkjglII5yYzCLWVyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739260206; c=relaxed/relaxed;
	bh=HCmb0JDS/dVhju2koP5pjTa2AYGqpha+tCg9kui81kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpX6/P01Zkp7dhBaz0MjcpnDwVyinR2O9WurUK1l4OQhwGQ8sAFzdoaDT89JsIDDayNdzcapy0oUPIU6g+zPLshMptUFWn3OfXu4QJOybrwbA/m+jSvCdb1I6htcAgq8QbDaWmiDoEvwfxldwDcgO9uuxAbZI3knosUeF+ooBwYbRsxQBsS3DauXERAlBanw86mwgT5SCvI5dL0/nyMNU435/GVAyYfs4BMfmiqcpI0sU2payQcaN/wFPhcwMGpCKUagOVGomlhZI4/t15/mSkwNqlt1E9p8VwOedNPMEjyPvH1rruZaKgw4+ulRtwpA2zOdkQ68psykGFpz6LCAJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsYWf1N3fz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 18:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YsYGq5hL9z9sRr;
	Tue, 11 Feb 2025 08:38:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PyDAp8eJ96qm; Tue, 11 Feb 2025 08:38:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YsYGq4vLhz9rvV;
	Tue, 11 Feb 2025 08:38:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94EBD8B76E;
	Tue, 11 Feb 2025 08:38:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Mcg1AS7qWGp7; Tue, 11 Feb 2025 08:38:59 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E3DF58B763;
	Tue, 11 Feb 2025 08:38:58 +0100 (CET)
Message-ID: <bbf7bd7e-6395-42dc-9e94-ec6d8f99deb4@csgroup.eu>
Date: Tue, 11 Feb 2025 08:38:56 +0100
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
Subject: Re: [PATCH] powerpc/crash: Fix non-smp kexec preparation
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, hbathini@linux.ibm.com
References: <20250210195240.438127-1-eajames@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250210195240.438127-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 10/02/2025 à 20:52, Eddie James a écrit :
> [Vous ne recevez pas souvent de courriers de eajames@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> In non-smp configurations, crash_kexec_prepare is never called in
> the crash shutdown path. One result of this is that the crashing_cpu
> variable is never set, preventing crash_save_cpu from storing the
> NT_PRSTATUS elf note in the core dump.
> 
> Fixes: c7255058b543 ("powerpc/crash: save cpu register data in crash_smp_send_stop()")
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   arch/powerpc/kexec/crash.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 9ac3266e49652..8c11cfd19e734 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -359,7 +359,11 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
>          if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
>                  is_via_system_reset = 1;
> 
> +#ifdef CONFIG_SMP

I see no obvious reason to use #ifdef instead of IS_ENABLED(CONFIG_SMP), 
is there any ?

Ref 
https://docs.kernel.org/process/coding-style.html#conditional-compilation

>          crash_smp_send_stop();
> +#else
> +       crash_kexec_prepare();
> +#endif
> 
>          crash_save_cpu(regs, crashing_cpu);
> 
> --
> 2.43.5
> 


