Return-Path: <linuxppc-dev+bounces-11088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16075B2A46E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 15:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5CyF5z0mz3cZ1;
	Mon, 18 Aug 2025 23:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755523237;
	cv=none; b=Ga4jU7hNaIAAxWJNLX6eCHH8+3+mNYc2uhc41UgAt6CarJeJzFdbMGQcUBZ74+MwgaqDUy84vtgZ805gzSkUspTsZXgZI6n5xoh39pn/jHlm6llsIBdHQN7DekjwA4EIAP83brqxSqyQefBg9jAkcSnMI1Qr0OcsGOA5M5eTlS3wxHj8JDkXvEomSkXqz2Ej1Ck1+HIk2XmjaPi+gVqQ+XouUCzsjlR4EApeUX8Si9NGtbnBOeWAVGZpJozGSflAlGrJOTmt4ZCmbF4FBb36LXpZavL5v2Jz7vdYlUClfvD7phKYla7nwyAprbE2BzLvmXAaDgwIgCTLO6WFDgw0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755523237; c=relaxed/relaxed;
	bh=Y88O153/RxkHi6VICCziB1RMm+qfw2c385/MvJPXGIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=FP+TCiYD/xpl5b721pguqKCpOKxcvihRGOSHKhanxzvgVUJLlkOPCZIw8i5VSvYlE3o39K8OMs2LuSSxNebjD2BaNq+KBoeu2zjzqXz2GzsySSX5RfzAkdkRAB/ru/TO83Erv2JR3RiGWBeGntHw4Edu6yXtwjV1258tJccXbQeVuK5s3Jeh6khirf9CB/9lpYD89qS20sWMZyuhNkeOkwDZ3k0dCGT+xI8Yr7wpl5gnJIB+d8hRGBZSNzrdrsiyw/v+yPPgmXIQs02eVXoKJS950M1sF1R19e4BT5cuZUe1OvSdm2x+DsOGageet7326lwfFrF/dnfV7JKumwgg9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5CyF1RQbz3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5CRk2S5Hz9sSq;
	Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wsb2zaak__6t; Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5CRk1lWgz9sSj;
	Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 276098B764;
	Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Es3veHRypCjw; Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 085E08B763;
	Mon, 18 Aug 2025 14:57:38 +0200 (CEST)
Message-ID: <74ae8855-8a50-45f6-90b1-844d6ee389e6@csgroup.eu>
Date: Mon, 18 Aug 2025 14:57:37 +0200
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
Subject: Re: I am no longer with DENX
To: Johanna Denk <jd@denx.de>, Tabea Lutz <tl@denx.de>
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
 <dovecot-sieve-1755521435-64564-0@76fc889d3701>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <dovecot-sieve-1755521435-64564-0@76fc889d3701>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Johanna, hi Tabea,

Le 18/08/2025 à 14:50, agust@denx.de a écrit :
> Hi,
> 
> thank you for your e-mail. I am no longer employed at DENX, please direct your inquiries to:
> 
> - Johanna Denk <jd@denx.de>
> - Tabea Lutz <tl@denx.de>
> 

Anatolij is still listed as a maintainer in Linux Kernel:

LINUX FOR POWERPC EMBEDDED MPC5XXX
M:	Anatolij Gustschin <agust@denx.de>
L:	linuxppc-dev@lists.ozlabs.org
S:	Odd Fixes
F:	arch/powerpc/platforms/512x/
F:	arch/powerpc/platforms/52xx/

Did one of you or someone else took over the maintenance of LINUX FOR 
POWERPC EMBEDDED MPC5XXX ?

Thanks
Christophe

