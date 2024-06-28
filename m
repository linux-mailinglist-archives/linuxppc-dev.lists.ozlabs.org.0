Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B56591B44A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 02:55:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dw3FWGCl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9H660qM9z3frc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 10:55:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dw3FWGCl;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9H5N3nP4z3bYR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 10:54:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719536073;
	bh=nK6ECkNoWWUSbgwv/8Nj8pwVUjgeZlZeQEQ65DI3FjQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dw3FWGCl3P1VHFi8yriJUkoxa2i6gMD7vyIVjlRNnE+dSEi+QCTwW0ti6cCo5P4Bs
	 Zp3+N4QjGAhAIo8fSBG3V7is3heKklaJWPI9TaBUyK4mKGrSlcM3YdU88fBX3+PUO0
	 Ov86/kuCrhKKMq/OGTA7/A72/hTPsZeOIaTAcxQ+sxc1670631sByC0lgYD/+XZbTu
	 WjPM68tNBEq7AepAepoqZwDLK0CxECqLpBQxNeKkHmeeTOGzKx9F07F2ovZr1f2oLK
	 1rBKnDY5fQZu705WcZ0eE65kSe4wuCMr9VUjixPNpprQQAkCa2r/iCpo92AVDTJFQW
	 FHBUTpnaglwjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9H5N6hF0z4w2N;
	Fri, 28 Jun 2024 10:54:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: regressions@lists.linux.dev
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
In-Reply-To: <20240617193408.1234365-1-stefanb@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
Date: Fri, 28 Jun 2024 10:54:31 +1000
Message-ID: <87pls1lwe0.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org, naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> Fix the following type of error message caused by a missing call to
> tpm2_sessions_init() in the IBM vTPM driver:
>
> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error 0x01C4
> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>
> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index d3989b257f42..1e5b107d1f3b 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  		rc = tpm2_get_cc_attrs_tbl(chip);
>  		if (rc)
>  			goto init_irq_cleanup;
> +
> +		rc = tpm2_sessions_init(chip);
> +		if (rc)
> +			goto init_irq_cleanup;
>  	}
>  
>  	return tpm_chip_register(chip);

#regzbot ^introduced: d2add27cf2b8 
