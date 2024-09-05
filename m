Return-Path: <linuxppc-dev+bounces-1035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031796D06B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 09:31:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzrdy6M6rz2yZ5;
	Thu,  5 Sep 2024 17:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725521510;
	cv=none; b=CQxi9TGhjvjagk851miRhk4BGPbV1GzpUSUNbo5Nz+m2e5kW9CzMGaPV1YUs0zXiOpVNmfpRaVOBxY3MjcbJlcRHUWTSNYrb8Yn7pNWTeOszAIAPyxvLP9ZcbXHLTQ5QMeW/qt+fIeXvMxN1FFa9/oBelJzdHl13EW4jeaLbk6miB1I8MujUxDD7fcgZOXfa7IBcyG1j9H/8mgBi1NrFykKBTQOF0nJNN4nMdADE8d4mqO7EHMPC5vQQ9CT3oPQSOdW0R824vBa8fYHzTktyMh/FCQ8VCiYasLw0Ij2MIhl/9vM4s7naD3aBdW/pUGz1gIW0l8nmaG6/oMoFUhezkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725521510; c=relaxed/relaxed;
	bh=xmmWOCZtOwyto8mzNTT6ilGg/ea+rxVbD795v79eR44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLdcnWzp1Ugl6srCfPehr8fwiNSHW4rX2YwInarp9p6/TG77z53lBNrzGQYrjKd68RaM2thwuSHCxIljM8Kr9JjS51lJKTBNf+ZV+Cxoiawp3neHLg8Nx2SGTSgn2W3uBNYfrVgZl0Mv8uPk+A24b53y54YEHXBsJtQEl1TInhbiriOqpWVskfEdjo3n2w906wjNOXxwFq5uJmmnTlCcOExAdMR1JLdS9O3Vfy65NilhUqwjlu6O+WGEl81rey2DvN/iLewrdLYrGjxRKiJltoqYAPhlgWboz4hxIbELJeSthvf/YmiBe1ve1g0oRkoKDZ4lXKAVHB6sucCjHmBmRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzrdy3yQLz2xXp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 17:31:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wzrds6bn2z9sRs;
	Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRPEweHwrZMe; Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wzrds5sNzz9sRr;
	Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B93ED8B77C;
	Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kyGx2BmjE22I; Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
Received: from [192.168.235.27] (unknown [192.168.235.27])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 580E78B778;
	Thu,  5 Sep 2024 09:31:45 +0200 (CEST)
Message-ID: <7091c023-c7e6-4b3a-b306-12d73b8f6698@csgroup.eu>
Date: Thu, 5 Sep 2024 09:31:45 +0200
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
Subject: Re: [PATCH] soc: fsl: qe: ucc: Export ucc_mux_set_grant_tsa_bkpt
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, kernel test robot <lkp@intel.com>
References: <20240905072215.337010-1-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240905072215.337010-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/09/2024 à 09:22, Herve Codina a écrit :
> When TSA is compiled as module the following error is reported:
>    "ucc_mux_set_grant_tsa_bkpt" [drivers/soc/fsl/qe/tsa.ko] undefined!
> 
> Indeed, the ucc_mux_set_grant_tsa_bkpt symbol is not exported.
> 
> Simply export ucc_mux_set_grant_tsa_bkpt.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409051409.fszn8rEo-lkp@intel.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Arnd, it is ok for you to take this patch directly ?

Thanks
Christophe

> ---
>   drivers/soc/fsl/qe/ucc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
> index 21dbcd787cd5..892aa5931d5b 100644
> --- a/drivers/soc/fsl/qe/ucc.c
> +++ b/drivers/soc/fsl/qe/ucc.c
> @@ -114,6 +114,7 @@ int ucc_mux_set_grant_tsa_bkpt(unsigned int ucc_num, int set, u32 mask)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL(ucc_mux_set_grant_tsa_bkpt);
>   
>   int ucc_set_qe_mux_rxtx(unsigned int ucc_num, enum qe_clock clock,
>   	enum comm_dir mode)

