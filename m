Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E701C8AAF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:25:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ht3Q6LbqzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:25:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=HdHgVWug; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hstg379HzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:18:19 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AA23208E4;
 Thu,  7 May 2020 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588853896;
 bh=MSkChxFZqIspRLCauSd0CqP4IKv9LrIyPZ388vIuY7k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HdHgVWug8sOeiIUH0XthCnuDAbPqcWRNCMQy+00dXYQ/3BGhDowdVJCi+5oT+fiVi
 2j8PCk9mYTnbPiHxkicqfuuDr3evannnwYXnw8zrjlcmKlad4XgzqzD/9OAAfuvUeN
 EqP19g+z2+/OzJq7BVp4kT05T+biuRQ1l5d8vP7g=
Date: Thu, 07 May 2020 13:18:13 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, ChenTao <chentao107@huawei.com>,
 Xiubo.Lee@gmail.com, timur@kernel.org, nicoleotsuka@gmail.com
In-Reply-To: <20200507022959.183739-1-chentao107@huawei.com>
References: <20200507022959.183739-1-chentao107@huawei.com>
Subject: Re: [PATCH -next] soc: fsl_asrc: Make some functions static
Message-Id: <158885389338.38935.7126937131103152522.b4-ty@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 May 2020 10:29:59 +0800, ChenTao wrote:
> Fix the following warning:
> 
> sound/soc/fsl/fsl_asrc.c:157:5: warning:
> symbol 'fsl_asrc_request_pair' was not declared. Should it be static?
> sound/soc/fsl/fsl_asrc.c:200:6: warning:
> symbol 'fsl_asrc_release_pair' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] soc: fsl_asrc: Make some functions static
      commit: c16e923dd635d383026a306acea540b8e0706c88

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
