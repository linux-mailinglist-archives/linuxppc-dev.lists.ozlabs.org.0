Return-Path: <linuxppc-dev+bounces-12632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C18BB2ADE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 09:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccjr658zYz30Pg;
	Thu,  2 Oct 2025 17:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759389638;
	cv=none; b=LcFyrOyrnjOam6C/NzC/iqXBIQ+z46bWTz56ZXRZe7nSC5e5BMCEIDjCKmGqbidj4wVg9uX+MzlIByzpaXNJKdIXsHbRkfD+YePPQPPVJcD6HoLjkvOOy62F0bAnz8LT1ytn+jQgmKlE5TsibvS4GbGqPv/39DhTgBpbwMfRFWOjbrQKYwADRkmF6BpOMCBTj/OI/GHvjjcX9WFiaB+vnSv5iAtrtUMCtYyDY9cekuMpuBn7nqjeaKkH2poVnBgqGHogoTPuCXlyvYUzdEznctZ2T26fAOpEoR43UsU3vY8fUWMLALTLfqk9LZFz/6qWcSGhm2wnfN+w6BG+r7Y1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759389638; c=relaxed/relaxed;
	bh=s8K6VyOzySEkXALtvV3zegEvTsjx9LMdQZhMJZkRRxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGXlMAIHekLY44evc1HBfpbFKdHWIIfvHX0YkVJQikN8UPkDxyNyzORU2ZcnOrU2VHmvDF/MOehJ9uxc43RbjHJRXo3e/GRKhergE9qxFrgvHkHKUNZnLN1bkEkhBPFoI/UH7hzkRqIoe5jVTrqzbpykjIyEvYKWBb9jBRITDMheF/+tYZznXHof/0h411Bst1squPPhncZIs2gsqKzrsDSFjbNHJf1tP77O8Z1tiNUuE86Nt6hNWoC1uWoqukFDw7LqSdhqtiAqUf+rouExj0MsbPKYpG+pEEX+5uFP+ZHAyZvD3DoJLF0dDrrutCv2YVOnbnlYd3o1V5nxxd45VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccjr54rkRz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 17:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ccjCS471cz9sS7;
	Thu,  2 Oct 2025 08:52:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBandp4y6DE4; Thu,  2 Oct 2025 08:52:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ccjCS2t3Mz9sRy;
	Thu,  2 Oct 2025 08:52:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 507EA8B796;
	Thu,  2 Oct 2025 08:52:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GrYjV0F4DxGN; Thu,  2 Oct 2025 08:52:20 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DB90B8B774;
	Thu,  2 Oct 2025 08:52:19 +0200 (CEST)
Message-ID: <1b6074f6-1d23-48bf-98b6-beb57bd81886@csgroup.eu>
Date: Thu, 2 Oct 2025 08:52:18 +0200
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
Subject: Re: KVM-PR no longer works when compiled with new GCC compilers
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>
References: <cfd779d6-9440-46b2-9ed5-752f1ae6b5d1@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <cfd779d6-9440-46b2-9ed5-752f1ae6b5d1@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 02/10/2025 à 08:37, Christian Zigotzky a écrit :
> Hello,
> 
> KVM-PR (-enable-kvm) doesn't work anymore on our PA Semi Nemo boards [1] 
> if we compiled it with new GCC compilers.
> The VM can't boot. There aren't any messages on the serial console of QEMU.
> 
> It boots without KVM-PR.
> 
> Kernel config with new GCC compiler [2]:
> 
> - CONFIG_CC_VERSION_TEXT="powerpc64-suse-linux-gcc (SUSE Linux) 11.5.0"
> - CONFIG_TARGET_CPU="power4"
> - CONFIG_TUNE_CPU="-mtune=power10"
> 
> It works if I compile it with an old GCC compiler [3]:
> 
> - CONFIG_CC_VERSION_TEXT="powerpc-linux-gnu-gcc (Ubuntu 
> 9.4.0-1ubuntu1~20.04.1) 9.4.0"
> - CONFIG_TARGET_CPU="power4"
> - CONFIG_TUNE_CPU="-mtune=power9"
> 
> Mtune changes to power9 automatically if I compiled it with an old GCC 
> compiler. If I compile it with a new GCC compiler again it changes 
> automatically to mtune=power10.
> 
> Is mtune the reason of the KVM-PR issue? I think the issue is the new 
> GCC. [4]
> 
> Could you please check whether KVM-PR is compatible with new versions of 
> GCC compilers?

On your side, can you try with the following hack to test new GCC + 
CONFIG_TUNE_CPU="-mtune=power9"

diff --git a/arch/powerpc/platforms/Kconfig.cputype 
b/arch/powerpc/platforms/Kconfig.cputype
index 7b527d18aa5e..b8480cdb3a9a 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -264,7 +264,6 @@ config TARGET_CPU
  config TUNE_CPU
  	string
  	depends on POWERPC64_CPU
-	default "-mtune=power10" if $(cc-option,-mtune=power10)
  	default "-mtune=power9"  if $(cc-option,-mtune=power9)
  	default "-mtune=power8"  if $(cc-option,-mtune=power8)



> 
> Thanks in advance,
> 
> Christian
> 
> 
> 
> [1] https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FAmigaOne_X1000&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C0ca7898bcfed40a2839108de017ea0b4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638949840566572384%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=9U0DLwRhoWagfDe4bTRCdHZpf52tvZbXAMGE8jHibyU%3D&reserved=0
> 
> [2] https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgithub.com%2Fchzigotzky%2Fkernels%2Fblob%2F45186997e6f347fd092f9ab629d62d6041426227%2Fconfigs%2Fx1000_defconfig&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C0ca7898bcfed40a2839108de017ea0b4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638949840566592849%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=KAcTs9%2BiNnjhKkvlW6JHsiRts0uRBp0Oza56rVZRxvs%3D&reserved=0
> 
> [3] https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fgithub.com%2Fchzigotzky%2Fkernels%2Fblob%2Fbc7a3e27b3fcdee52a8135435f02cf807a43872a%2Fconfigs%2Fx1000_defconfig&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C0ca7898bcfed40a2839108de017ea0b4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638949840566604830%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FTh46dqFpLZyNrnhVgjHgUrlG689ryfymogE9oAVhE4%3D&reserved=0
> 
> [4] KVM-PR no longer works on an X1000 if the kernel has been compiled 
> with a new GCC: https://eur01.safelinks.protection.outlook.com/? 
> url=https%3A%2F%2Fforum.hyperion- 
> entertainment.com%2Fviewtopic.php%3Fp%3D57146%23p57146&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C0ca7898bcfed40a2839108de017ea0b4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638949840566617191%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ih%2FgNl3HKEavfrn%2ByHM9J3ZpZvztC95aWUhC%2Fy1YjiQ%3D&reserved=0
> 


