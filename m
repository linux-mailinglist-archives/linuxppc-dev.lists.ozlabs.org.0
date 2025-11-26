Return-Path: <linuxppc-dev+bounces-14504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F66C8B422
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 18:41:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGn0r4chTz2yvH;
	Thu, 27 Nov 2025 04:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764178876;
	cv=none; b=apDfp8jOgsEa2eoatLLml1a4lM7qqpVY4RZ0seLh6ReXQdmTBxjI9zeRcO8cSQkEY3s8EG1eBzg/bMztqsq0Nwptyc8eVD/UvUm+Ok28BBMZN1ftqvU15CYRolCH6pD6nhMCWaI/SeSamNiRqFgR3VEW8iawLcZYZEQLiS2g8Do0HDZeyhlnUXhYpWNiwmH0sEbONaHmoVTUyLyS33MGStBCsslJh1z5lFup3DBWjuNsYpSMGb5Q2CHlfEg/nFz38m2DWQ4b56K+4/KQfTJnKIEiisXdXZQSvUrBNrgmpdb+4XDt6vN2/P997i8K6bBqAdfmhyIU1NEuGvsz2Dyo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764178876; c=relaxed/relaxed;
	bh=ySM7DNl7njp/e8CKEZrABaNukINMeu+Yl3TIf7QKPok=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CQfjM7auPlRf5ump9Z/tN8DvfCdlQlq15UyaytDVWO5JOX/8DHDB+sKdKPpRgnqc41cbw7ForQvY95U1I1Y9P7dP02jn0QtHcH0iwyJhLfbHscfmX7huPOvdSeBhBz4N1G04U7Ift9sEZSOKY0Fkn+xzSqKrnyOr8WkqGr5mCilbAVQdhanwWP4RIKUm1rtlgZ+6/opIkQbKsJEj/0Ak2L3+MJv+DtQxxHlKMRbvBQw70Rc+RvdgdxknHt44EMusdWUlMcbcSy7I/TNcOda+Llyb2tnecWnJI84W+6C9qHWS89pl/EfPKFGNbiDSR6pqf8YfkPYpqeDIgX7uV+L80g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OpjHFWNy; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OpjHFWNy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGn0q707lz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 04:41:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC75D42D6F;
	Wed, 26 Nov 2025 17:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE36AC4CEF8;
	Wed, 26 Nov 2025 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178868;
	bh=fPDqUcVAiQR4NjJRm0o5O0ia2lSZh8oWkwubXUN5wYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OpjHFWNyGrOoOVKB4WiUUWnOVHzkUkOqw2thB/YhgHKqed8SLqFL8Q6yU9d36TqN1
	 L4BJOyUxFqO9j5R9rkJZSu+VMnpkYvS+120GwmeCAFMgjnPP+4iZvKcXeoKnaGQVmL
	 rKWQASRjp9/0AYIIgvyP/9BsEvWbTVu90/Fymp+mFJt9+iin7zI4mE+W8sMVtZ9VhP
	 HtXGefaR6QxfdNZLTqERCFF5WzgW0z6cftfQ4borGPXeWjpbNYSsPaos+QcvJzC+Ei
	 qTIFs3zy2NdSW8WyKi4lnrdo6oq/0ih0Fs9DRALY3xIHuxzR+7KVZjUkaN2G0IQRbE
	 NRwhdn3xKTTOw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20251126064509.1900974-1-shengjiu.wang@nxp.com>
References: <20251126064509.1900974-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: clear the channel status control
 memory
Message-Id: <176417886645.96001.9476091546839523665.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 17:41:06 +0000
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
X-Mailer: b4 0.15-dev-88d78
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 26 Nov 2025 14:45:09 +0800, Shengjiu Wang wrote:
> memset_io() writes memory byte by byte with __raw_writeb() on the arm
> platform if the size is word. but XCVR data RAM memory can't be accessed
> with byte address, so with memset_io() the channel status control memory
> is not really cleared, use writel_relaxed() instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: clear the channel status control memory
      commit: 73b97d46dde64fa184d47865d4a532d818c3a007

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


