Return-Path: <linuxppc-dev+bounces-2832-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD89BB7DD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 15:33:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhv8T4q7Jz2yF4;
	Tue,  5 Nov 2024 01:33:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730730793;
	cv=none; b=HJGiw+wbB/vdFxRZ4moEqIL8gwf0rNwihQV4pbcBCcrH8X9THCG4pFXTicpD6wEkMwJAGV5c7ykOzlnoiAGx5Fik4al2oWeZFTivMIw84sbBxm3ynMXCEpe++OAoCPtOmTweCNmlcTeqA3IulqNTN0y5Cpt+21WsYcxOdJMI2iYQTqzXff4Ufmt2kBcfCpy3HBpCDRdDNEYvMbZcLFMKHl1aBGPoBzvMhVbBJxx21tGeTmV3RTWnBzR6UREgvkDVgNsGzo/YnlLXwhTG/R3eHHCpiy6zh2ixXUstE5vfrduicZdrhCQc+rE4rU27QTYgymMoSvUUxfysRYzO+Gu5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730730793; c=relaxed/relaxed;
	bh=uE7/EEHJQMi0IC54XrajBkKpxP0fphrJFkkngDzHsLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpP9M+F6r65KJOM3E1fJAkRcPtVMVOHhwVL4TFk0tc3AZcXbQFsoYYpkVM6Xu/fBx8/hrVY0ZyOygkVtynopf9eCncxhhtLFILJWKx/QxXV/K+egqnxvjAOHvAFP08hZ7GE1EgQ/6V8yiCvdA+Bj9GZzKjEl126NWOsia2/1w6I9qwlUsk9uZXoxq6SjVxD05QyaWN5vIZAZFydubxojbVy1irHpE8E8mJnpZsGDYIfkF/fpZ/XCtW+/Cew61JnVvf+Bzu6cCJ6eHbMKTkcLNpHensYha60keL51qEE7BFB+EE/FJot5m9n684smmhEgCkfwYe2xY7jqP0ZmXHL9ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhv8R6qSCz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 01:33:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xhv8J72RNz9sSR;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWfhLmnpm9tF; Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xhv8J6736z9sSN;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3EE88B770;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X3XWHlYHgmaK; Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 811948B763;
	Mon,  4 Nov 2024 15:33:04 +0100 (CET)
Message-ID: <34c972b7-ba53-46ba-ada9-df741bc21e47@csgroup.eu>
Date: Mon, 4 Nov 2024 15:33:03 +0100
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
Subject: Re: [PATCH net-next 1/3] soc: fsl_qbman: use be16_to_cpu() in
 qm_sg_entry_get_off()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Breno Leitao <leitao@debian.org>,
 Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Radu Bulie <radu-andrei.bulie@nxp.com>,
 Sean Anderson <sean.anderson@linux.dev>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20241029164317.50182-1-vladimir.oltean@nxp.com>
 <20241029164317.50182-2-vladimir.oltean@nxp.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241029164317.50182-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 29/10/2024 à 17:43, Vladimir Oltean a écrit :
> struct qm_sg_entry :: offset is a 13-bit field, declared as __be16.
> 
> When using be32_to_cpu(), a wrong value will be calculated on little
> endian systems (Arm), because type promotion from 16-bit to 32-bit,
> which is done before the byte swap and always in the CPU native
> endianness, changes the value of the scatter/gather list entry offset in
> big-endian interpretation (adds two zero bytes in the LSB interpretation).
> The result of the byte swap is ANDed with GENMASK(12, 0), so the result
> is always zero, because only those bytes added by type promotion remain
> after the application of the bit mask.
> 
> The impact of the bug is that scatter/gather frames with a non-zero
> offset into the buffer are treated by the driver as if they had a zero
> offset. This is all in theory, because in practice, qm_sg_entry_get_off()
> has a single caller, where the bug is inconsequential, because at that
> call site the buffer offset will always be zero, as will be explained in
> the subsequent change.
> 
> Flagged by sparse:
> 
> warning: cast to restricted __be32
> warning: cast from restricted __be16
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   include/soc/fsl/qman.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
> index 0d3d6beb7fdb..7f7a4932d7f1 100644
> --- a/include/soc/fsl/qman.h
> +++ b/include/soc/fsl/qman.h
> @@ -242,7 +242,7 @@ static inline void qm_sg_entry_set_f(struct qm_sg_entry *sg, int len)
>   
>   static inline int qm_sg_entry_get_off(const struct qm_sg_entry *sg)
>   {
> -	return be32_to_cpu(sg->offset) & QM_SG_OFF_MASK;
> +	return be16_to_cpu(sg->offset) & QM_SG_OFF_MASK;
>   }
>   
>   /* "Frame Dequeue Response" */

