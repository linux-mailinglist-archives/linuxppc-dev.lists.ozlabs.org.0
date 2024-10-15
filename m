Return-Path: <linuxppc-dev+bounces-2297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7B399F8D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 23:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSn2D5hmRz2y3b;
	Wed, 16 Oct 2024 08:15:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729026948;
	cv=none; b=fkoAXwvKCSGxj3QnwMoGXdvtgBdsj2y/MTbuSsniZYubnit8t37kfrPy9Jq6b+1+TsR7C6qO09R+rjerzws9Z7Rqt+sD5kf6qyvvhZ6YqwVv5rAB3eppRzFvl/k93nEK3pgGuOXtfcJXQIaPnorb4F9ShDrKC4l0ttOehrwE0r5izviikou/bcUtf+ofP2Lsjuh+8Vz/qyG9/gERIRbOlO8jyE5o7TyuWggJ5ExBa0+H/DXYEB2fGqcdNAi8Ah8iH01fcsOplxslpyZf/5ytxV+xEP7ttCCQ0SeZ8hdSZLzY4Spo3oFEkX6TB7EQKVChRQ41vqNOKCFBNeCLqzhzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729026948; c=relaxed/relaxed;
	bh=LtB9yc2UrDd5fOc/Y6GOgjDAR6TNIImG321+M/GOGFc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QH+DbW/x1bMyz/HoLUSGUSa0Nm4VdcvVcp/t7ykeE3jD/wwibi4wx5Rp0vPtQj1GqVi/7bqFhHXGpcaIheDSwcs/O7aTfqjMDoPqmLMUORZbrgVH0wToETBhYC8QpAydYIrh9SNbce3ukDx9IV/o17lKab8qHRkIvehaOkKLh+XxbXQUsyQlS19xjoMVqnj/yORiPkWd1XcNlhbDlUrl2ci+SqlQrgBBMk5MEZiu2NQ6AfNj6fIu/KhEGoAk5ayim+ohUooCAgQYntZYcO//3o9Em1AbKQBG8ldw5JEoEarSCXVwgRLhTQP86AUAcLBCxOygw9eB5kOXdh5Zu4SE8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=trEOH0Zd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=trEOH0Zd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSn2C515jz2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 08:15:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8570E5C5EC9;
	Tue, 15 Oct 2024 21:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8ACC4CEC7;
	Tue, 15 Oct 2024 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729026943;
	bh=nQF2Y1FXsj0Px4wn8LQKUfNX9xjpyWpZNQSrnkpLZ6Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=trEOH0Zdpqs6HWQC7Q/ezGdyCzVhzjryDzMZ9+YGw/NKH2LbiLWsBuWZEjzIYqHID
	 g2k+MabduCsmg+SE3H1uOFvRmveRjdBn9bT8y44hR0w+ka9YMSpRsg0sdsCdDP7PZP
	 6rR9dora0DN1UCB0rPPJHD/Ou8Z7NruHQG/Mzaa09zgCg5+QpNDIrSOoiWxcU4zQ47
	 8nQGOsALZtdYySytjGgAGemiRi/sbIpQMG3K3VmWoqj55KSeD9nHRvwNvtxzQfJyhc
	 iZpGtjRmYKLeAEe4pQHqYLvYu4uS8BNgu4bRU+J6Eo5hplEl3G1dPfKMO9WUYNLDmZ
	 ZUFaQn7kXcqGQ==
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
Date: Wed, 16 Oct 2024 00:15:39 +0300
Message-Id: <D4WOWALWYOES.Q12TQS9P30TH@kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Set TPM_OPS_AUTO_STARTUP flag on driver
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.18.2
References: <20241014141643.3101129-1-stefanb@linux.ibm.com>
In-Reply-To: <20241014141643.3101129-1-stefanb@linux.ibm.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon Oct 14, 2024 at 5:16 PM EEST, Stefan Berger wrote:
> Set the TPM_OPS_AUTO_STARTUP on the driver so that the ibmvtpm driver now
> uses tpm2_auto_startup and tpm1_auto_startup like many other drivers do.
> Remove tpm_get_timeouts, tpm2_get_cc_attrs_tbl, and tpm2_sessions_init
> calls from it since these will all be called in tpm2_auto_startup and
> tpm1_auto_startup.
>
> The exporting of the tpm2_session_init symbol was only necessary while th=
e
> ibmvtpm driver was calling this function. Since this is not the case
> anymore, remove this symbol from being exported.
>
> What is new for the ibmvtpm driver is that now tpm2_do_selftest and
> tpm1_do_selftest will be called that send commands to the TPM to perform
> or continue its selftest. However, the firmware should already have sent
> these commands so that the TPM will not do much work at this time.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm2-sessions.c |  1 -
>  drivers/char/tpm/tpm_ibmvtpm.c   | 15 +--------------
>  2 files changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-ses=
sions.c
> index 511c67061728..b1a0a37f14d7 100644
> --- a/drivers/char/tpm/tpm2-sessions.c
> +++ b/drivers/char/tpm/tpm2-sessions.c
> @@ -1362,5 +1362,4 @@ int tpm2_sessions_init(struct tpm_chip *chip)
> =20
>  	return rc;
>  }
> -EXPORT_SYMBOL(tpm2_sessions_init);
>  #endif /* CONFIG_TCG_TPM2_HMAC */
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtp=
m.c
> index 1e5b107d1f3b..76d048f63d55 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -450,6 +450,7 @@ static bool tpm_ibmvtpm_req_canceled(struct tpm_chip =
*chip, u8 status)
>  }
> =20
>  static const struct tpm_class_ops tpm_ibmvtpm =3D {
> +	.flags =3D TPM_OPS_AUTO_STARTUP,
>  	.recv =3D tpm_ibmvtpm_recv,
>  	.send =3D tpm_ibmvtpm_send,
>  	.cancel =3D tpm_ibmvtpm_cancel,
> @@ -690,20 +691,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev=
,
>  	if (!strcmp(id->compat, "IBM,vtpm20"))
>  		chip->flags |=3D TPM_CHIP_FLAG_TPM2;
> =20
> -	rc =3D tpm_get_timeouts(chip);
> -	if (rc)
> -		goto init_irq_cleanup;
> -
> -	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> -		rc =3D tpm2_get_cc_attrs_tbl(chip);
> -		if (rc)
> -			goto init_irq_cleanup;
> -
> -		rc =3D tpm2_sessions_init(chip);
> -		if (rc)
> -			goto init_irq_cleanup;
> -	}
> -
>  	return tpm_chip_register(chip);
>  init_irq_cleanup:
>  	do {

Not much to say about this ;-)

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

