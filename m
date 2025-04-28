Return-Path: <linuxppc-dev+bounces-8082-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A09A9ED32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 11:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmJbd0rGfz2yrZ;
	Mon, 28 Apr 2025 19:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745833837;
	cv=none; b=czJ8prx407pnJWt31mCWQljX88JzTIA7dlTZn+hG8djCcf0l3HhaZ5672xRpfzNJDNb561yUuANx8N6zj6kRqXs6yr5YUuRgFoRjbeUrD+BlobO+qmk/P6Nfo1US0rCeC14rzCKazDTcZXj2WQo6ujhO0nHeFMaV7ca/PbPRy2JopHr9uDR+XsgxzQwZByJVAbidv9FwXFdKj67qw0WfRsSHXziY3pCBuys2SFCdxvrRCtBHC2+ROjju6W5JwaK0Wh55HKxRpQN+9blY92FnfQAh+qyS5YdNVzJDPJG9eUGpqIqmTQBOiriRRJz7TnrrzPZfKxyk/+CoFQWaZuT2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745833837; c=relaxed/relaxed;
	bh=4Ku09usOfIbbtlFaYeOAG320ThDpsVr3BFWncbfDmK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQ9/jw70fLJWBdVnf0iK5LNg6jVjJXBn+me3L3P81TeShP6FTim6gzxJUmmZex7AduKzCKgGKGSgTkTPnhb2uRRxrwHHGwr/Zg9oaJp+H1kacrNRXcOK1dfij0N1NWD1pEWSbzBXGmvQQR5g2ALaagweHcB0AMOleT+dPJHX9Hoste2tqbimJ01ey7Fv69Ut4REzLrmWPfij8/VWiMN+3H7NouETF2S9pmLMG4atzCp2oQTEgbR2/Ihim7fORNA5Q0aop1/1u4Gn7m8sFhMygg9lyXFVsVXehgLgJ9R796BHwIht30wbdjshlHEwLo25q/Y164qsa1a879zEL8/UQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmJbc1WYmz2ySQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 19:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmHx70jzTz9s2l;
	Mon, 28 Apr 2025 11:20:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzOENPXM0yv2; Mon, 28 Apr 2025 11:20:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmHx6757fz9s28;
	Mon, 28 Apr 2025 11:20:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ED06D8B766;
	Mon, 28 Apr 2025 11:20:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id txsmwIS9nDw7; Mon, 28 Apr 2025 11:20:42 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E6FD8B763;
	Mon, 28 Apr 2025 11:20:42 +0200 (CEST)
Message-ID: <4b42c00a-0ef5-4121-9e40-9214bf9a1197@csgroup.eu>
Date: Mon, 28 Apr 2025 11:20:42 +0200
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
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on
 TRIGGER_START event
To: Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
References: <20250410091643.535627-1-herve.codina@bootlin.com>
 <174429282080.80887.6648935549042489213.b4-ty@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <174429282080.80887.6648935549042489213.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mark,


Le 10/04/2025 à 15:47, Mark Brown a écrit :
> On Thu, 10 Apr 2025 11:16:43 +0200, Herve Codina wrote:
>> On SNDRV_PCM_TRIGGER_START event, audio data pointers are not reset.
>>
>> This leads to wrong data buffer usage when multiple TRIGGER_START are
>> received and ends to incorrect buffer usage between the user-space and
>> the driver. Indeed, the driver can read data that are not already set by
>> the user-space or the user-space and the driver are writing and reading
>> the same area.
>>
>> [...]
> 
> Applied to
> 
>     https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbroonie%2Fsound.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C438de093b4c04d4c0a8f08dd78362e30%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638798896267382068%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=d%2FuL%2FFAOcpRY2v9YtxTMdiX%2B3GgHKDE7y5TMTc9cK94%3D&reserved=0 for-next

Would it be possible to get this patch into one of the v6.15 rc as it is 
a bug fix ?

Thanks
Christophe

> 
> Thanks!
> 
> [1/1] ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START event
>        commit: 9aa33d5b4a53a1945dd2aee45c09282248d3c98b
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 


