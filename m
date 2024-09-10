Return-Path: <linuxppc-dev+bounces-1213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613A972C2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 10:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2xlC4yM2z2yRF;
	Tue, 10 Sep 2024 18:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725957127;
	cv=none; b=YErNhRwgRgzi0M64CC2GID/OFwSNCDQP8ALtTrm37UFQdlG0WVgfmu4dTsCye9mYpq4ZvKKR7D5Q31+jaPPdnZX8DLxDh4fKEkcfZoXoZ73Ctfh6EtgAGnx7HG9tImT+XMW6MncvPNXNKZw1p+6rdBVL6APfm2eUMVRcCBK3G0He3ahnpKEB0TMeRG8mE7pxpw48HucggjP2jSBslchNcF+BFNs/6KXl3l+93y0mu0dOw9E/jg0BHRJKy24baAIjv9fPOUYaCxsgUHq4pRF9altph0hNMHQd9fHL0SZul4HA8CfgJQebveYYxfPomc2nYBGQlRWwuSlp8vPcTLqeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725957127; c=relaxed/relaxed;
	bh=0Cu/821ks5FQF1eaN1UZvUuEkPHBz1+vogQ/2/8m++E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9y/DCqJnsXJYOoGjEER8SSrqcO3pIkVRztvCojtdgCEpfpIzGUSGxRXHepRzyHaUUXMg5HObFgMzuTG697Ks5iIiXi1q0ixTS7ZL32JnrqftY2hzwHBIDrekYq8LRR1vO2h6D/O64YX91MO0KDlVpTJYFWbZ65WaHhSba5v7ApgDQPbKI3AXnpun/uaOQGuvc2SdJn3l9q9jY0PYls2G2hsbnV06HZPmkrQKnlZXHKC8YJrmNiMvCIdTjSCT/fS55QLxJmREwI98w4GwYXp6Ep43DIs0Lsobe8FP7fu40dDuN3T+Bx1PqUno0wG7aVmN0KMzaVr4vsntXkI0J0btA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2xlC2YvHz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 18:32:06 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2xl203YTz9sPd;
	Tue, 10 Sep 2024 10:31:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WECQOnNEitDQ; Tue, 10 Sep 2024 10:31:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2xl16Dtlz9rvV;
	Tue, 10 Sep 2024 10:31:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C2E588B770;
	Tue, 10 Sep 2024 10:31:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WK6MAQwnSTyr; Tue, 10 Sep 2024 10:31:57 +0200 (CEST)
Received: from [192.168.232.177] (unknown [192.168.232.177])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 574848B766;
	Tue, 10 Sep 2024 10:31:57 +0200 (CEST)
Message-ID: <125adbe2-453e-4b02-a7c5-25f655b431a7@csgroup.eu>
Date: Tue, 10 Sep 2024 10:31:57 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: No rule to make target 'arch/powerpc/boot/dtbImage.ps3', needed
 by 'arch/powerpc/boot/zImage'.
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Anders Roxell <anders.roxell@linaro.org>, naveen@kernel.org
References: <CA+G9fYvG3Tv-Gk6f6oSTuY4=sJWMcF5oRc9Qe1otFvetysm4zw@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CA+G9fYvG3Tv-Gk6f6oSTuY4=sJWMcF5oRc9Qe1otFvetysm4zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2024 à 21:25, Naresh Kamboju a écrit :
> The Powerpc cell_defconfig and mpc83xx_defconfig builds failed on the
> Linux next-20240909 due to following build warnings / errors with gcc-13 and
> clang-19.
> 
> First seen on next-20240909
>    Good: next-20240906
>    BAD:  next-20240909
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> build log:
> --------
> make[3]: *** No rule to make target 'arch/powerpc/boot/dtbImage.ps3',
> needed by 'arch/powerpc/boot/zImage'.
> make[3]: Target 'arch/powerpc/boot/zImage' not remade because of errors.
> 

See 
https://lore.kernel.org/linuxppc-dev/b154ab25-70f6-46cd-99db-ccfbe3e13fb7@csgroup.eu/T/#m7cc489243ce5a17af97ff8ec7cc15c663565b6fd

Christophe


> 
> Build Log links,
> --------
>   - https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-master%2Fbuild%2Fnext-20240909%2Ftestrun%2F25078675%2Fsuite%2Fbuild%2Ftest%2Fclang-19-cell_defconfig%2Flog&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152486474122%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=k4QsFvSrqrtJkwe5i8qvTetu941J%2FiokAMEDIy1hgO4%3D&reserved=0
> 
> Build failed comparison:
>   - https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-master%2Fbuild%2Fnext-20240909%2Ftestrun%2F25078675%2Fsuite%2Fbuild%2Ftest%2Fclang-19-cell_defconfig%2Fhistory%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152486482765%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=hZJF6oi09QQnOcjWlPkn5YQw3L33uG5vobqZX%2FJzW%2Fc%3D&reserved=0
> 
> metadata:
> ----
>    git describe: next-20240909
>    git repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2FLinaro%2Flkft%2Fmirrors%2Fnext%2Flinux-next&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152486487967%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=FIZK7ic0Dwbnt8zclmji5w2mTS0konX%2Bh6izCQ2QoqQ%3D&reserved=0
>    git sha: 100cc857359b5d731407d1038f7e76cd0e871d94
>    kernel config:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstorage.tuxsuite.com%2Fpublic%2Flinaro%2Flkft%2Fbuilds%2F2lpXzh3wwbuC6nYpMV2nPNA0IpF%2Fconfig&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152487540129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=KPpD9d%2FM2gxLqjaVIsN26jwolSkzetd%2B0VGVMaV4Mwo%3D&reserved=0
>    build url: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fstorage.tuxsuite.com%2Fpublic%2Flinaro%2Flkft%2Fbuilds%2F2lpXzh3wwbuC6nYpMV2nPNA0IpF%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152487548564%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=dS0BYsDDrcnW7fF2KeUZFBvFKnMKLz36nLWt%2BmeqIIQ%3D&reserved=0
>    toolchain: gcc-13, clang-19 and clang-nightly
>    config: cell_defconfig and mpc83xx_defconfig
> 
> Steps to reproduce:
> ---------
>   - # tuxmake --runtime podman --target-arch powerpc --toolchain
> clang-19 --kconfig cell_defconfig LLVM_IAS=0
>   - # tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
> --kconfig mpc83xx_defconfig
> 
> 
> --
> Linaro LKFT
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkft.linaro.org%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cbea1fddc11ef4588817208dcd118fdb1%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638615152487553541%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=Pzu3tW7FdI%2F7FYj%2BUSz%2FTfENPPGRZUEf%2FsXcaSpPXB8%3D&reserved=0
> 

