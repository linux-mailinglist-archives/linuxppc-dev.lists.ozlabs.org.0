Return-Path: <linuxppc-dev+bounces-8495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE9AB2906
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 May 2025 16:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZwQ732cQlz2yGQ;
	Mon, 12 May 2025 00:27:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746973647;
	cv=none; b=TmT4I2eExjcrrP9ClBsuaQiQvDZTxuHt6rkuaJdtRNhmEyxcIHzxgpCuUxwqPhsWQLXAutygtySymqpGK0HAT167d9cDivni49Tw91cBw/ufGhQukVm8q7DLQJ2kYGl/N79fFv6KLO7xqq9mRKW9YmqnQ4elVy8P4/l4SUoaEBsAyr40nhT2v9CPxep/zbNKCy/+IAhjtr4feAQoxyEHfVSyalTZmreoo3TSzCGN9WpwZzQ66h/zUevGGc7lBCcBCjKZTAykmOAkmzm8eHj0c2kM0Y88iRrzKPnX0zieMRIhUvLeX+tk8YBwL0prr4cC1elx4ji1+6ojpS6eM2pU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746973647; c=relaxed/relaxed;
	bh=DVIB5wGlaXiymm1bc4bla8Eg1UdlODas43+QI3gvlzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFFLzRNb7ceMAQ1ED6HUQrQKZ3QM/grmv3ThIhMek7iNuZmMoKkktpdFsIggl4p3pVIaF0Gv/AbAaeWNCE86DN4zNlCJYbXd7/QanUtFRZcljejGsP9ZaBsqwo9SZzXBPaG4SASsD293PrxIB27ofKzmQwRsIbI+rsMqjhc0pr/g5cIt99/TBqv0X2dEBueJpmik3T47j/u3Kq3yc63Y+5FGqhxBnjUa5McKiQSFFyQ3z9z/x+dPVkqvQe2tm6FDcB0rcMVSTzFFBC2zKtVaqZdC8LX47Ccxe0YvKKiVUFZte6sZ/8CEib+Kw46M4VbDYx77VWaggQk5bVIBR7daNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VUTFGZsf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VUTFGZsf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZwQ711GHsz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 00:27:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32B95A4BBF0;
	Sun, 11 May 2025 14:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0707C4CEE4;
	Sun, 11 May 2025 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746973639;
	bh=qYsPB5KTJZb+XUGm4MW6ZwKZMh54o71O1hC+tg3tZWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VUTFGZsfLBrHnjVnBTeej4wSPZzyPI6+32RY1g9O8Wgdp865wvZgZqUP6ZUvCJDST
	 OW9a5RdYmOw53EABLcl+/LFqcmiT5iL1+avGUChdgS2gHQHfczML3CrO2wTkJ8rz6F
	 CMazwxn5m+RtnpAo+K7dg0TAGowB8SZaK9LQU5Q11spR3ShzejqeaPM7SnJ1szITOY
	 sCNQW1pmzbbK6k2NgqwrqJMvUQ4TPg3TVB67TVoslAlYYSSfXXssVHNG27CZLSPrLb
	 3MWWCAShtdXDHPI9siix40h2m2Xw1ef67f7pd8l4hEffQk+2J/CmA2n9AKwsqWUYnu
	 zICK5ZaW1dXtg==
Date: Sun, 11 May 2025 15:27:07 +0100
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
Subject: Re: [PATCH v4 1/6] iio: backend: fix out-of-bound write
Message-ID: <20250511152707.294bc7b9@jic23-huawei>
In-Reply-To: <20250508130612.82270-2-markus.burri@mt.com>
References: <20250508130612.82270-1-markus.burri@mt.com>
	<20250508130612.82270-2-markus.burri@mt.com>
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

On Thu,  8 May 2025 15:06:07 +0200
Markus Burri <markus.burri@mt.com> wrote:

> The buffer is set to 80 character. If a caller write more characters,
> count is truncated to the max available space in "simple_write_to_buffer".
> But afterwards a string terminator is written to the buffer at offset count
> without boundary check. The zero termination is written OUT-OF-BOUND.
> 
> Add a check that the given buffer is smaller then the buffer to prevent.
> 
> Fixes: 035b4989211d ("iio: backend: make sure to NULL terminate stack buffer")
> Signed-off-by: Markus Burri <markus.burri@mt.com>
I'm looking for a tag from Nuno on this one before applying.

J
> ---
>  drivers/iio/industrialio-backend.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> index a43c8d1bb3d0..31fe793e345e 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c
> @@ -155,11 +155,14 @@ static ssize_t iio_backend_debugfs_write_reg(struct file *file,
>  	ssize_t rc;
>  	int ret;
>  
> +	if (count >= sizeof(buf))
> +		return -ENOSPC;
> +
>  	rc = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
>  	if (rc < 0)
>  		return rc;
>  
> -	buf[count] = '\0';
> +	buf[rc] = '\0';
>  
>  	ret = sscanf(buf, "%i %i", &back->cached_reg_addr, &val);
>  


