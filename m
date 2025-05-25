Return-Path: <linuxppc-dev+bounces-8927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C914AC3361
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 May 2025 11:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4tk95Y8Dz2xWc;
	Sun, 25 May 2025 19:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748165025;
	cv=none; b=WKxQaosPap8ebviL/996ABWYJRibkNqYfwtnRLoSxAx126UL8jm5IWAb67gC/MiEqOP/rejsNtPS7DOaQ6tYbDAy/9dwvKyLZriKbPnw+bMpb5oFNDlsQvD2+j9hzAx6/XuysKqwAHY5IziCDCl8ixJ4jaWl69N00/0K/Iy8Sp/Fm2Gsq1tt83+5kN9IqxP6JeUtXLUsey0OiiT414ZM1elqibUoLL5aVQMiGi7cBIvxLCyZVde33VvKq0iJpRMQLcQynVNL1lzvn02WvYT9en+9MX6/TUXuw9hnDJbjvWLu8k37kRfM/zGRGfOUYhplBwtk4a0fqRmDI6O5A5o7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748165025; c=relaxed/relaxed;
	bh=vZ2SuRPsJIgknfFDvaNtMyraUR+yfG2ZAip9yBYX7Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbcUUCcVmoMYDCMFyLnskn1Y41AxBKNP0NSqXCxDHhWWU0IK9q0e759+fWo+UDOFn02eQqgrtRrx6O3tPhVK4Sp+o2S1PsftEahYR/G3h9geYis0H7QaXDFCrxCzJETzBLJ/OqWJ/b4vlcac0nDbcg1W7qQXrDUlO6ho1G34YErq0yapSK6G736fSUwR+xc00VpmgzkxRg+J0CHRRJVA86svzqiAm0O5SOwX9lw123Q5uP5ftYj6NZp2BImoI6dhQDy5KFm8YSLnUw/R7Yt6y8FL1AIykyDpDdDbJhimUDiyF3awAfhpbDP/CupBsIUlEGEKAPu/29Y3yjFTNZtXbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MssJ1DTl; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MssJ1DTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b4tk91JfMz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 May 2025 19:23:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B612845109;
	Sun, 25 May 2025 09:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD81C4CEED;
	Sun, 25 May 2025 09:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748165022;
	bh=8xJ/4cJzkengF8ieK0oPHmswKBr0WzC4IkIOgHiz8OY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MssJ1DTlorerzrvBZ0h4vsvrIEFfdcrfkqEUa2npxXjrdxEMK7wbDqdR5lHNfNcLD
	 tu0B7WAPk+NpFWNPAreGfoyUJ8JJ9O2pvIkTJ9CfYSmibOjh/DGPYhGP067DDmnnzy
	 yppRkwTZAED4PSUxIkMUbyeTWL1keMWrSPcSTanp/PrmuNHhK5p8QRusrfjBJhzvJv
	 1793QewmP6CGsO0FjgNnWhIBD3WYK9SFox4uzhaV2eb3yfZBFY6cB7ooxROezwGjDb
	 dnyXiZeM1qQKpNat8UKWUaOOV5FP+Yzo5E6Ff6BCxQW7BWAB0zyUANLZOWOTJikBuI
	 jdvyzQ2bRHfiQ==
Date: Sun, 25 May 2025 10:23:31 +0100
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
Message-ID: <20250525102331.46a4d778@jic23-huawei>
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
> ---
Applied to the fixes-togreg branch of iio.git.

I'd still like some more eyes on this if anyone has time though as
experience teaches me that subtle tweaks to string manipulation end
conditions are easy places to make mistakes!

I'll not be pushing out as non rebasing until I rebase on rc1 anyway
so we have time.

Thanks,

Jonathan

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


