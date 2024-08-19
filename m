Return-Path: <linuxppc-dev+bounces-175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D679568E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 13:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnV881CFmz2y06;
	Mon, 19 Aug 2024 21:03:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+uG3ule;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnV6F4GMvz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 21:01:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3224DCE0A20;
	Mon, 19 Aug 2024 11:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616A0C32782;
	Mon, 19 Aug 2024 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724065315;
	bh=RKjobX7+cX15lxVhF/xFB6okKKom6P4UVqu82yq3zr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+uG3uleWXjeur9lX+9XwXwxgSHehaXUwK+vFzMctal4HzHStOMls2jxPEzk0Wjfo
	 Bu/h9UZC0pCV6jNe5Bg1rHMUO8gI/M/5Sbt2+B40OcTSu8N5wzCYg1qQKGFtqvVkUq
	 QmWI8CXEu/xi4bPLtz2PRSnXB7VeXD/RsJ8A7ohg03DWcpMEDbEFNquRY2BcrxfGEe
	 TbLGt2xeH91Lv1R73kGteOt/rnUy6Etc2p/1FmRHxdxp/pFcM/4sryD40sFRa5Kqr9
	 flmplLT4BzvhyUrZQbpk4w94J1Bapnux9sHIHeqxHWXP045OHXcRJcDhPmjoSFIx41
	 qFykD+krjPjtg==
Message-ID: <737ad178-1198-4103-b1ee-46a67ecf12e4@kernel.org>
Date: Mon, 19 Aug 2024 20:01:53 +0900
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
Subject: Re: [RFC PATCH] ata: pata_macio: Use WARN instead of BUG
To: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, linux-ppc@kolla.no,
 vidra@ufal.mff.cuni.cz
References: <20240819101913.489513-1-mpe@ellerman.id.au>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240819101913.489513-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/24 19:19, Michael Ellerman wrote:
> The overflow/underflow conditions in pata_macio_qc_prep() should never
> happen. But if they do there's no need to kill the system entirely, a
> WARN and failing the IO request should be sufficient and might allow the
> system to keep running.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/ata/pata_macio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> Not sure if AC_ERR_OTHER is the right error code to use?

Given that this would trigger if the command split has is buggy, I think that
AC_ERR_SYSTEM would be better. Can you resend with the change and no "RFC" ?

> 
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index eaffa510de49..552e3ac0d391 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -554,7 +554,8 @@ static enum ata_completion_errors pata_macio_qc_prep(struct ata_queued_cmd *qc)
>  
>  		while (sg_len) {
>  			/* table overflow should never happen */
> -			BUG_ON (pi++ >= MAX_DCMDS);
> +			if (WARN_ON_ONCE(pi >= MAX_DCMDS))
> +				return AC_ERR_OTHER;
>  
>  			len = (sg_len < MAX_DBDMA_SEG) ? sg_len : MAX_DBDMA_SEG;
>  			table->command = cpu_to_le16(write ? OUTPUT_MORE: INPUT_MORE);
> @@ -566,11 +567,13 @@ static enum ata_completion_errors pata_macio_qc_prep(struct ata_queued_cmd *qc)
>  			addr += len;
>  			sg_len -= len;
>  			++table;
> +			++pi;
>  		}
>  	}
>  
>  	/* Should never happen according to Tejun */
> -	BUG_ON(!pi);
> +	if (WARN_ON_ONCE(!pi))
> +		return AC_ERR_OTHER;
>  
>  	/* Convert the last command to an input/output */
>  	table--;

-- 
Damien Le Moal
Western Digital Research


