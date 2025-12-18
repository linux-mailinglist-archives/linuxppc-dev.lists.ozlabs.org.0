Return-Path: <linuxppc-dev+bounces-14886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF4CCD213
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 19:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXJnW3KyPz2y7c;
	Fri, 19 Dec 2025 05:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766081903;
	cv=none; b=b8gPLRyD0rb3WCisEj1uLnZX81UW31BH61VUugGzhUKmNkM+nHxDsMO8afT2iV0n/GSiDLfdfw9zYZSaNSa8JBfU+7TErO/rkPYGOuSnKGnYOOoN+1vo2yTSau/jVpjrkJLn2owQfwaZ4d2468pC4SQtdcqsvCYAtS065KXc8qMpo5v4Cd4DOzNm2RLdLHpESo/CU9vOqT1RUgujPXMhtr5ucr05zu4qvXtrOJDZdfyCENHHwwDHCsfpDvfVJ7+HRXEFloWawyqDIXAuLUyjLrdLmGxZh50e5b3/X0l1scmIvxIMraZMb0pMGLbjQDvQTVwWSq0dykBVkJQ9qslttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766081903; c=relaxed/relaxed;
	bh=5yAEe+2Csw5olb3QOfrQvZogMI1JOb80TlsJvRocuaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYJ50a4F9MjDVN9/pjtpCsbBYtzRg6wq6OH7eHTRAQMH6Zbgtf3zYAuWSBCHfXKH8IxLm9q441v+6lV685ILoC3NJC79/o7Vqm/af2HJOyFfuvAZKoNQ2Hs0KK8m8R8/7e+HEyM9GHhOu0xU7ZLSJm48P2nlq8pIQzrLtlvV2qvlww2PVhSAdtptCE7+aWrf42c/4zSu/YZpli3Pf2H/bXu7AKbubyD6iGhjevli2gJbjjviSoRCCVkOMbNhwCFxrYh17C01HtYPmxQs8wZ+253R9/QJVqPbIaMPZ4nR12SHCMC67namHy7AU/vOGAg0o2rOj7RUGX1p/1W6FnLepQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BR6+Y+QM; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BR6+Y+QM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXJnV34Dcz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 05:18:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80DBB60008;
	Thu, 18 Dec 2025 18:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C7EC4CEFB;
	Thu, 18 Dec 2025 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766081869;
	bh=6ySNi6XK++fEIBHrYyI+0sg8GNMuv8hF9Un7iQAeT5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BR6+Y+QMLl75VmQjA/M1LYhujuNhRvNzy20+WTY7Pzz6rl24GmjPOlI6/rLQd/dJA
	 j5aXGvllMT+awUXA71zEV+2Rs5yuhhaCv4XXK34j6fTnc+iMOjwOteNdV91KjZAeH/
	 25MicZ1IOl+xmF0VxqWUzhfolPz3VEyOrclh8LOXbOgcPeQCx0kuWGbftCZVysV48a
	 24fwC9q6eil+ISnAr22o6uGFlYOlbjmAfR39FpU8EX29emN8aHqzVTONgClSuQ8z+J
	 qX6OLMMgl/FjYSOSMGfTqujVI2xmXfWIDJDUWoQAwKEjSCQeCWIk3TQ4ZPmH1QrZvb
	 5Yov4DRVc4Hlg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
References: <20251216102246.676181-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Add missing registers to cache
 default
Message-Id: <176608186693.237766.7370584798182861413.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 18:17:46 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 16 Dec 2025 11:22:45 +0100, Alexander Stein wrote:
> Drivers does cache sync during runtime resume, setting all writable
> registers. Not all writable registers are set in cache default, resulting
> in the erorr message:
>   fsl-sai 30c30000.sai: using zero-initialized flat cache, this may cause
>   unexpected behavior
> 
> Fix this by adding missing writable register defaults.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add missing registers to cache default
      commit: 90ed688792a6b7012b3e8a2f858bc3fe7454d0eb

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


