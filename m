Return-Path: <linuxppc-dev+bounces-14722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B5CB5590
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 10:21:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRnC93dKsz2xQr;
	Thu, 11 Dec 2025 20:21:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765444885;
	cv=none; b=DJEx5cDlWk2rnLPaHO7t37kCo7mxgmtBtBrlf+au9zwkLlUq42vhg+qtw2CgSgrgOmCqlPR/hUNlbUNAcnduPB2gPNqCfatdXgRw3ONIkO2DIzEf09kAA8EP9+QDE200cFwoFMZ3E4B/EMy1HC79lNKt6uAYn6rBjNAyngeFO7rAcAWzTyodAl1Shv4W7HeR8l8Eft/Vf7mzswQ2JvZlpU/pUlaDjONUQPp7IyCEs1b6PdRBOFK8NPfiUv74RIlR+O2HXp2PgLYDsA4+jmRjr3nE+fM6uVIhw5CtiyRCs2Djxs8e0tps9AbmVcPyCaSOLvb65bSfUhc9pQk5PRmsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765444885; c=relaxed/relaxed;
	bh=zUeTzyKgAHPIF3zVnRMPq7SZRqG9rzDF3c7epE5Un+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX/RDgkV2CYiXtttlAaPWt1JylyfGsay6U++IRUXs90xofKRzchV5/0ToRJeOxj+KhOG3VHIAm49JY/850JgSdmOljungFEpTo3twNHIR2eekOSoHhJXZUIp8766u+rrOh9PRKDMur/Iqvw23lACNpwIHLnRNEn+69b4/bBxatq+FTvSRJR0sn6zsHzkXmptI2MGvDQe04b9t0X1MlQ1isjKui6VVjnHdKHvDKqT0og6Y2kcUb0fZh4TxKLmfPUXWccKx+RXEtyUVakdFOkhKATBXYspz/BSWgJP7mgAPJvjrL/EfBxUB1m78l5k1HL4mRW/FxC54u8Zc/uDtm47wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbIhm5j2; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PbIhm5j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRnC25ryyz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 20:21:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C2C44170;
	Thu, 11 Dec 2025 09:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2BBC4CEF7;
	Thu, 11 Dec 2025 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765444872;
	bh=SBehDgdMPTSDtZC1W09Bt+hpubfovfTn9Mo/6XwxNew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PbIhm5j2W8Fk+QcREUVKTOm67gke01qbA8vTg777JLwUYQaa2QF8KZ/7xQnwaaPbh
	 M/XxQ7XTNPfAwh34TWsF3yNSnoz/dw68y76244zW7nIKkwoqCnvHf+UAQ9AgNUNqmF
	 Rb5iDk32QeT63pKt0hnsfgPJPN03RkDD4f/nQCO6w4eXuHtO9Tv5gG7DSTMHOCzp7Q
	 SdWP/+yMMae+Jh/2D9gBxNIefQ0eppzBGgbsC+0Veuf4BfAadMHbLmBi+5L9qAp8S3
	 DwEhvfpxcz8Jtt0bOI18sOZEuPvQiH5B2Bmpt0J1sOioNw3nWd+BsmY/i6Cxukw3rI
	 IqQGVQtR4rupA==
Message-ID: <4e8b3733-3f12-4911-8dec-4c71870da050@kernel.org>
Date: Thu, 11 Dec 2025 10:21:08 +0100
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
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
References: <13B0A253-0AED-4B02-BC95-242A9480C321@xenosoft.de>
 <5DADF74C-98ED-4557-82D8-77E2B414FFA8@xenosoft.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <5DADF74C-98ED-4557-82D8-77E2B414FFA8@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christian,

Le 11/12/2025 à 07:26, Christian Zigotzky a écrit :
> Hello Christophe,
> 
> I was able to reduce the patch.
> 
> The following modification is responsible for the boot issue:
> 
> diff -rupN a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> --- a/arch/powerpc/kernel/interrupt.c	2025-12-09 06:57:20.717347165 +0100
> +++ b/arch/powerpc/kernel/interrupt.c	2025-12-09 10:24:37.357301725 +0100
> @@ -38,7 +38,7 @@ static inline bool exit_must_hard_disabl
>   #else
>   static inline bool exit_must_hard_disable(void)
>   {
> -	return false;
> +	return true;
>   }
>   #endif
> 
> - - -
> 
> After reverting this modification, the kernel boots without any problems.
> 
> Please check this modification.

Yes indeed, I realised that allthough the BOOKE powerpc doesn't have the 
RI bit, this call is still necessary to switch off IRQs in case they are 
still on.

So I have to think a bit deeper and see what the solution could be. I 
will let you know as soon as I have a solution.

Christophe


