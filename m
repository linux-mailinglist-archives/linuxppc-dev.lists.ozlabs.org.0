Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390B93F746
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:08:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JwwDgkKm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgFM1HMFz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:08:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JwwDgkKm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgDg1fBSz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:08:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADD48CE0B75;
	Mon, 29 Jul 2024 14:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F54C32786;
	Mon, 29 Jul 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722262079;
	bh=k2Wgl0ohB56vYKU3fZm6+LvL1i/f4Mqea5qYebNbSZM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=JwwDgkKmSb+BuAiNqTCjB6mkuvvynOnWH2ysajbNDNfggq9ZtVdUXJLM5ynrtTb4U
	 xy/0tuM2EgN7KSQ4aF+CColeRsZdaheCQSszOEfr5wuo5dM+OZFgka8642W926GhXc
	 NzYqsyGJQyR4nyHVmm2n+N6LSx0OKB+X0ty4c1GcAYMC+2hhEdg4RF5E7I1ymHug2s
	 +QAk8qFna1fwKKSasA2wabL+Id/M+WoU4mSBEJPsCSZtswPgWimPzda6N6tVjIUdat
	 4A/MMPJAALtXThBSZKoi039axYvqdKzLKSmQWWIeIawYV4KNhXqswBmuErqpOHL4wg
	 8hQYKgxIfPpsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jul 2024 17:07:55 +0300
Message-Id: <D322YAQANPJS.1XC8XCTMZ5NJ7@kernel.org>
Subject: Re: [PATCH v2] tpm: ibmvtpm: Call tpm2_sessions_init() to
 initialize session support
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.18.0
References: <20240729132934.311136-1-stefanb@linux.ibm.com>
In-Reply-To: <20240729132934.311136-1-stefanb@linux.ibm.com>
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jul 29, 2024 at 4:29 PM EEST, Stefan Berger wrote:
> Commit d2add27cf2b8 ("tpm: Add NULL primary creation") introduced
> CONFIG_TCG_TPM2_HMAC. When this option is enabled on ppc64 then the
> following message appears in the kernel log due to a missing call to
> tpm2_sessions_init().
>
> [    2.654549] tpm tpm0: auth session is not active
>
> Add the missing call to tpm2_session_init() to the ibmvtpm driver to
> resolve this issue.
>
> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtp=
m.c
> index d3989b257f42..1e5b107d1f3b 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev=
,
>  		rc =3D tpm2_get_cc_attrs_tbl(chip);
>  		if (rc)
>  			goto init_irq_cleanup;
> +
> +		rc =3D tpm2_sessions_init(chip);
> +		if (rc)
> +			goto init_irq_cleanup;
>  	}
> =20
>  	return tpm_chip_register(chip);

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
