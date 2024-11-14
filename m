Return-Path: <linuxppc-dev+bounces-3167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675C9C8416
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 08:39:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpsV10kQKz2yV8;
	Thu, 14 Nov 2024 18:39:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731569945;
	cv=none; b=fmt67JrsvetWiMLHE451UeaqzYCf7IozTc7f846VbUGNfHuoJjBvwitVpgWrPYsqSe8wpHafo9d1IgAVj32lAPU3JAiPZl9HvQJSDBbC0Dn9luPnUOdRsThd5z5bWeH+2E7GLPNQ60gf+wcAEhXcOKQpSZx38QWxFXOal7dzb2C+9IfceT76dFhRjtWRgoqVp9GQ+GbOWr+efUHtk/hN3OtYfNU/gsEOKYyWLE/RRrCgY4T8ZVPoKryxPYUSO0qVhM6gywXazAso9kyhKAlxWfl2xjtUW/VvQYP/43iyuE3EBavPx8NUj6YH6CTNf/4yO2N8YP62kKeC82R4zysC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731569945; c=relaxed/relaxed;
	bh=l951S4IYbydSxanTEwIpdoBDufR3qPn1Xqk5u0bjTOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POnaQ7zZ6OyjXdLYmke6fVHA4LKzTj9AMSdf6+UkHmH2hJQwDPXrCVx9mKGTR2I5wGO/3MahfFqHVdnnmPtQDxBrN9fOxphMPEClL39uaidiW0cteOtfRagyn4HsmVDkRukbgJPhgpFrrqcYGvUOZfq3/A4HA1RpXIVuQ8Xed8iFJyqL3NqUiUObXK9AYOSCXBEAON0pFW8Jhhiu2LNpqHZde37f6mqGU8pgY4/FR5F2nz75Xbm9DhaCeeW/cZmnyOxK+VGlpbW6Qej2H6qkQS/fGadEt5Q9VX7cBKxRBZF/LXhkiSCG/8wNP2tg8nArx2fO7vuonwS3hvG1j2rjJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpsV00JWvz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 18:39:03 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XpsTw45yvz9sSX;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJoK55fB28wk; Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XpsTw3MBWz9sSV;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63BAB8B7A0;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AypRQ-2jg_wh; Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Received: from [192.168.232.55] (unknown [192.168.232.55])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 283798B763;
	Thu, 14 Nov 2024 08:39:00 +0100 (CET)
Message-ID: <b22fb30d-96a5-4455-a0f6-0d7fe564cfa3@csgroup.eu>
Date: Thu, 14 Nov 2024 08:38:59 +0100
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
Subject: Re: [PATCH -next v2] soc/fsl/qbman: make use of the helper function
 kthread_run_on_cpu()
To: Hongbo Li <lihongbo22@huawei.com>,
 Frederic Weisbecker <frederic@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20240904022633.2079803-1-lihongbo22@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240904022633.2079803-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

Le 04/09/2024 à 04:26, Hongbo Li a écrit :
> Replace kthread_create/kthread_bind/wake_up_process() with
> kthread_run_on_cpu() to simplify the code.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

A similar change is proposed as part of a larger series, see patch 7 in 
that series 
https://lore.kernel.org/lkml/20241112142248.20503-1-frederic@kernel.org/

I prefer to leave this patch aside and not interfere with Frederic's work.

Christophe

