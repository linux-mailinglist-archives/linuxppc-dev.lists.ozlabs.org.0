Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D172CEE78
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 13:56:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnXlY01tLzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 23:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnXdQ52qszDr24
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 23:51:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eQ7PsrIa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnXdC5F7Mz9sWl;
 Fri,  4 Dec 2020 23:51:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607086272;
 bh=rIn5aS6FXW/yfvCbJiZ+iQfNIifLeAJ91p+yFTfKKjU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eQ7PsrIae9ILdXx2+j49t8KuDjjNwYqaB3VQ72iTRYo9ywWOpStWpnv51IZKyKxpb
 T79TXKPpfKMTjnIugTp2HV/ORpU5H2LZZRbK+idI95zl29QNL+6u9lyy4iJhUTbOmc
 IGS5Bc4m8LzzBiUjwilBygjDwM9UD3E/HkcO6tu5y0J+AMkukvZbVbEo3zkh9I41cV
 ZmYD/1m+JQCTw2IRnu+Nz0E2HDUEdyUYABM5zAX8V3Bzgx3NHAUtRWWqvbqlIsnfes
 4nAK/9i0J70XlJfbLyquK2nbCbfwnFBfQGUWb6LjXxJopfhSq8Ka46kZ/qyCv7I3E8
 A2gltqyCvWDBg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 12/29] powerpc/pseries/mobility: extract VASI session
 polling logic
In-Reply-To: <20201030011805.1224603-13-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-13-nathanl@linux.ibm.com>
Date: Fri, 04 Dec 2020 23:51:07 +1100
Message-ID: <878sadvio4.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> The behavior of rtas_ibm_suspend_me_unsafe() is to return -EAGAIN to
> the caller until the specified VASI suspend session state makes the
> transition from H_VASI_ENABLED to H_VASI_SUSPENDING. In the interest
> of separating concerns to prepare for a new implementation of the
> join/suspend sequence, extract VASI session polling logic into a
> couple of local functions. Waiting for the session state to reach
> H_VASI_SUSPENDING before calling rtas_ibm_suspend_me_unsafe() ensures
> that we will never get an EAGAIN result necessitating a retry. No
> user-visible change in behavior is intended.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c | 76 +++++++++++++++++++++--
>  1 file changed, 71 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index dc6abf164db7..1b8ae221b98a 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -345,6 +345,73 @@ void post_mobility_fixup(void)
...

> +
> +static int wait_for_vasi_session_suspending(u64 handle)
> +{
> +	unsigned long state;
> +	bool keep_polling;
> +	int ret;
> +
> +	/*
> +	 * Wait for transition from H_VASI_ENABLED to
> +	 * H_VASI_SUSPENDING. Treat anything else as an error.
> +	 */
> +	do {
> +		keep_polling = false;
> +		ret = poll_vasi_state(handle, &state);
> +		if (ret != 0)
> +			break;
> +
> +		switch (state) {
> +		case H_VASI_SUSPENDING:
> +			break;
> +		case H_VASI_ENABLED:
> +			keep_polling = true;
> +			ssleep(1);
> +			break;
> +		default:
> +			pr_err("unexpected H_VASI_STATE result %lu\n", state);
> +			ret = -EIO;
> +			break;
> +		}
> +	} while (keep_polling);

This seems like it could be simpler?

eg:

	while (true) {
		ret = poll_vasi_state(handle, &state);

		if (ret != 0 || state == H_VASI_SUSPENDING)
			break;
		else if (state == H_VASI_ENABLED)
			ssleep(1);
		else {
			pr_err("unexpected H_VASI_STATE result %lu\n", state);
			ret = -EIO;
			break;
		}
	}


Or did I miss something?

cheers
