Return-Path: <linuxppc-dev+bounces-8928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D8AC3366
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 May 2025 11:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4tp412DCz2ySg;
	Sun, 25 May 2025 19:27:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748165228;
	cv=none; b=oxPusNYlnstMcX0WRb78aPnSOcdQQsmAffXDg5gB3l5LeqI0ZcgHm1WfxU5oFyIc4lmVVmneqZsTxZu85n/IRbIATSM4aia7E+yZF8PWaEaGQ4c8OEbH4o0XQ4C4tcu91dN8UPrF2DpObyq9XI8cBi3PfppyzANr31iaUTdqMQfux/g4DNUMVDrTC8jP8QacEiEQ9KH2sBtlSASp+3dTR5gDCs/BzAWetrzqN6IDMLmWDTXqjdiXPjRhu9fpf8B39FIyQ7nQ1IMhAut0L/HkzMHBeNiY9BOG1J5sroxgL/Lspho7hYkRSm5SEgHnQwvtZHbPhRVuIKJDqsPF3yknrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748165228; c=relaxed/relaxed;
	bh=OGn3BwLOH7YC3KcHU0ofvcYoFuV0Z4y8oUmjvrjbrFk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgzqhaJkCKuJosBYJeemorMZc+dCGwgIk/eB2Ut+OHF/Iv6g0qLrE6YzEpwbyPXXBGD9kHphP7dMvWoto7tPh/0myCe6EuqItYIjXxRzwe5N5xHhe3HNswKa2zSHt0Boi8Up71VBaHlsU0mM+EMbVg8p7CS0DW91jX4yrdAMdah70FMRi3Dl5UHeCEGJjEMjaRHF5qHcJbjOKMlsip2UoXRTFnHuLY/NcdTaRbEO8kGbBz0WDgePPHDACIB5cosfwtt1aMNLt5CyIBOBOxlewoUV0a0aSyhjYvQwD+Q0DbV3rcg1aMCBeE8u0Qdxu1b26tXb0C7833+r14BtQ8Ibfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VuK2HLae; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VuK2HLae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b4tp33jHzz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 May 2025 19:27:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6548A60007;
	Sun, 25 May 2025 09:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5C3C4CEEA;
	Sun, 25 May 2025 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748165224;
	bh=Htcbn+KyEsVVp9c2bRKjfXUW1dKWwN+XtF2ZkuOSr8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VuK2HLaem2onVHwfS8qW+RYrrZ3YEYH9fCNhLpOtyJCgi5rX+wzQmmYY55MV/pNnE
	 fWzsBoHhWwYLw3j74ptI4dXHQZOHdLI4Yaofv82l9FgMrLEOjpoZrUXFO/xMJK59i+
	 ebUdLMBFw+uZa2NTzDf0fn5wan9jKVyN8ZnY6glM9ctLTsytwn691J5IFCauLOwdlU
	 /Zr0lnXQdt5TPYe8kSUvx0+iBWsA3Q+XOT5oB+XFFejUlIGlB8h1vq6mU2eHBde/lt
	 832OJP59vPr7QOR3+KlFQ1WtE8HhrDwBm6dXTfdNxY1JWK7oQxrq1BUBIZaYYAI2gA
	 OIAPGtJtcDNsw==
Date: Sun, 25 May 2025 10:26:54 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Subject: Re: [PATCH v4 3/6] iio: fix potential out-of-bound write
Message-ID: <20250525102654.5b761490@jic23-huawei>
In-Reply-To: <20250508130612.82270-4-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
	<20250508130612.82270-4-markus.burri@mt.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu,  8 May 2025 15:06:09 +0200
Markus Burri <markus.burri@mt.com> wrote:

> The buffer is set to 20 characters. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> To protect from OoB access, check that the input size fit into buffer and
> add a zero terminator after copy to the end of the copied data.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
I added
Fixes: 6d5dd486c715 ("iio: core: make use of simple_write_to_buffer()")

If it predates that we'll need a manual backport anyway. If you have time to
take a look at that Markus that would be great.

Jonathan

> ---
>  drivers/iio/industrialio-core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
> index b9f4113ae5fc..ebf17ea5a5f9 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -410,12 +410,15 @@ static ssize_t iio_debugfs_write_reg(struct file *file,
>  	char buf[80];
>  	int ret;
>  
> +	if (count >= sizeof(buf))
> +		return -EINVAL;
> +
>  	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf,
>  				     count);
>  	if (ret < 0)
>  		return ret;
>  
> -	buf[count] = '\0';
> +	buf[ret] = '\0';
>  
>  	ret = sscanf(buf, "%i %i", &reg, &val);
>  


