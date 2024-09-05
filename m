Return-Path: <linuxppc-dev+bounces-1060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58A96DBB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 16:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X01rJ3kfcz2ydG;
	Fri,  6 Sep 2024 00:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725546384;
	cv=none; b=CzJSmgENQlWWPghEtU8utGg5FEl/4zGnnbN5TDGvIQwBmceY6glXmAvFItt3PhEWOAiPhTIhHqLWQaTq/HdcNgAFQwQXo4FzuMdd9PfMOQ3NzyfNPRAcnRDDVRX92eeL0Is2/nD/YDJJxdsF4WWPOYgM4V3w/OV+/6TLK0UHFRG7dhM2y8byH0gZeCZukYgFZDSD2Fe94QCpeFg68TgMaPGS3pM/dRAxe6Muh4umvJUnM6R8genIL4SCPmznamyR5soQtrcyxF+93JaJYqasGKS/WNORmXYxdFJj1HrQaSGi7iAjrV2/X5wagxlFz3iGknA9UCpP6QEpOv+Zm2fG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725546384; c=relaxed/relaxed;
	bh=mZRLje0nZWz21+doXaYk4vxjz89WdRJ6395xOReDcKc=;
	h=DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:Cc:
	 Subject:From:To:References:In-Reply-To; b=YRpiu2oIXOzpe6u4VGe25eeGEU3SNsHZElwmhnALBKMVtw9K8Namsq6PdEKg1rVFoccr2jxsXNOcYaR12/51v5+rmiDdpM4j/ahRt1gRxyuvcqsDtxv/v+LSScYV9iYjkNdHchpRPi4T3mYFqpZJ/jNqY/7dQvwRb3l36hILW6DktpvlaJN9MxQrE5bJDh+uLOwGvOUGj1w1hLYB2TxwcX44B2fogoBaVu4VX0//Dqu4nMl1X8CaCFIqbGQdMIws0HE/5PpTO03S/S3z/TRj5rcfmc3V0NIV546ZZNrSwzkPUZj1Y+22eBrXaQtuwR7Ekqv5vp69sobPWQ2Z1pcx0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LT2emT1x; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LT2emT1x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X01rJ29cvz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 00:26:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3CCA5C5CBD;
	Thu,  5 Sep 2024 14:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1696C4CEC5;
	Thu,  5 Sep 2024 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725546381;
	bh=cjIK4MXp2ychqW40KbQPt1aZ9lUypAyZZyXEdWDht28=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=LT2emT1xvJ0FhLoGFLsWTR30Nr7s1gp/0JQHuJd0rqQXSTFLN26dVSci4YQmtqkb1
	 0T2VWkl0bW555WoLgXDkL4er5ehSlUK1+UI1hg0uRT1SmDv7C11kKwOAdyAgiH0dEO
	 SzeTyo0+tkxhWzyrcivLgoCMXT4It1F7Dv0DZg3tNzAYtXFEa8DWdpawrCDO+QAmJe
	 quT1X04TnwiNcVXjUoocSEg0OlBOljNnXW+TLcBISeQjCvKuXPZNEf+BvEx+6DteNJ
	 O78VDKO7XTonkh2xFA5tI29414mpqNTfzf34YKE+wt2bNUIWphHdTh1LmzrNgWuPnV
	 P2/IZZ/yopH1Q==
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Sep 2024 17:26:17 +0300
Message-Id: <D3YF52E4EVJ0.2ZJSCR5FCVIGX@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <mpe@ellerman.id.au>,
 <naveen.n.rao@linux.ibm.com>, <zohar@linux.ibm.com>,
 <stable@vger.kernel.org>, "kernel test robot" <lkp@intel.com>, "Mingcong
 Bai" <jeffbai@aosc.io>
Subject: Re: [PATCH v2 RESEND] tpm: export tpm2_sessions_init() to fix
 ibmvtpm building
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Kexy Biscuit" <kexybiscuit@aosc.io>, <stefanb@linux.ibm.com>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.18.2
References: <20240905085219.77240-2-kexybiscuit@aosc.io>
In-Reply-To: <20240905085219.77240-2-kexybiscuit@aosc.io>

On Thu Sep 5, 2024 at 11:52 AM EEST, Kexy Biscuit wrote:
> Commit 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to
> initialize session support") adds call to tpm2_sessions_init() in ibmvtpm=
,
> which could be built as a module. However, tpm2_sessions_init() wasn't
> exported, causing libmvtpm to fail to build as a module:
>
> ERROR: modpost: "tpm2_sessions_init" [drivers/char/tpm/tpm_ibmvtpm.ko] un=
defined!
>
> Export tpm2_sessions_init() to resolve the issue.
>
> Cc: stable@vger.kernel.org # v6.10+
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408051735.ZJkAPQ3b-lkp@i=
ntel.com/
> Fixes: 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to initiali=
ze session support")
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> ---
> V1 -> V2: Added Fixes tag and fixed email format
> RESEND: The previous email was sent directly to stable-rc review
>
>  drivers/char/tpm/tpm2-sessions.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-ses=
sions.c
> index d3521aadd43e..44f60730cff4 100644
> --- a/drivers/char/tpm/tpm2-sessions.c
> +++ b/drivers/char/tpm/tpm2-sessions.c
> @@ -1362,4 +1362,5 @@ int tpm2_sessions_init(struct tpm_chip *chip)
> =20
>  	return rc;
>  }
> +EXPORT_SYMBOL(tpm2_sessions_init);
>  #endif /* CONFIG_TCG_TPM2_HMAC */

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

