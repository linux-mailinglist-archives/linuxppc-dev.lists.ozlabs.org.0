Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A28CA29CDF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 06:24:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLcSk3vgTzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 16:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLcPy4fyLzDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 16:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=b2XLqh82; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLcPv3x0rz9sWR;
 Wed, 28 Oct 2020 16:21:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603862517;
 bh=nf1mLdFJ0kx+l4bAzc8TDSq5oJ1BVY7ziOLLxVUp4Ec=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=b2XLqh82Ft0BUKNmxn6WyYG3MvYWbcldWNHuB1m53NzFePCrmosVnlIj8ykkV3HDX
 SqS5GtgZhko82slMH+mrT+4gxr2bLXW6iGTj/C6c9ro9DhC7UH0aQyObVk/Swn1mb3
 ceSFoFaxbuQtUaq26iJTgHEhcbBUn4pVNp2rEQFG+0pP1McVeVISWnEElHAw2UmW5O
 nALchLvR1IJehEWMw7fn0BKXBXl4Bbix/VP1IEktUuGpzZOW1g/Fn1J/Eq7iW9OGGr
 yFAhni8dMYOgy3eEbaKMT9xxpQ/43w8SJzuwFfIUzC04ErSSbOiqnVmNSGb4e9L2Nj
 cncTTn5+1o96g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
Subject: Re: [PATCH] ibmvscsi: fix race potential race after loss of transport
In-Reply-To: <20201025001355.4527-1-tyreld@linux.ibm.com>
References: <20201025001355.4527-1-tyreld@linux.ibm.com>
Date: Wed, 28 Oct 2020 16:21:54 +1100
Message-ID: <87o8knvsb1.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> After a loss of tranport due to an adatper migration or crash/disconnect from
> the host partner there is a tiny window where we can race adjusting the
> request_limit of the adapter. The request limit is atomically inc/dec to track
> the number of inflight requests against the allowed limit of our VIOS partner.
> After a transport loss we set the request_limit to zero to reflect this state.
> However, there is a window where the adapter may attempt to queue a command
> because the transport loss event hasn't been fully processed yet and
> request_limit is still greater than zero. The hypercall to send the event will
> fail and the error path will increment the request_limit as a result. If the
> adapter processes the transport event prior to this increment the request_limit
> becomes out of sync with the adapter state and can result in scsi commands being
> submitted on the now reset connection prior to an SRP Login resulting in a
> protocol violation.
>
> Fix this race by protecting request_limit with the host lock when changing the
> value via atomic_set() to indicate no transport.
>
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvscsi.c | 36 +++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
> index b1f3017b6547..188ed75417a5 100644
> --- a/drivers/scsi/ibmvscsi/ibmvscsi.c
> +++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
> @@ -806,6 +806,22 @@ static void purge_requests(struct ibmvscsi_host_data *hostdata, int error_code)
>  	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>  }
>  
> +/**
> + * ibmvscsi_set_request_limit - Set the adapter request_limit in response to
> + * an adapter failure, reset, or SRP Login. Done under host lock to prevent
> + * race with scsi command submission.
> + * @hostdata:	adapter to adjust
> + * @limit:	new request limit
> + */
> +static void ibmvscsi_set_request_limit(struct ibmvscsi_host_data *hostdata, int limit)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(hostdata->host->host_lock, flags);
> +	atomic_set(&hostdata->request_limit, limit);
> +	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
> +}
> +
>  /**
>   * ibmvscsi_reset_host - Reset the connection to the server
>   * @hostdata:	struct ibmvscsi_host_data to reset
...
> @@ -2137,12 +2153,12 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
>  	}
>  
>  	hostdata->action = IBMVSCSI_HOST_ACTION_NONE;
> +	spin_unlock_irqrestore(hostdata->host->host_lock, flags);

You drop the lock ...

>  	if (rc) {
> -		atomic_set(&hostdata->request_limit, -1);
> +		ibmvscsi_set_request_limit(hostdata, -1);

.. then retake it, then drop it again in ibmvscsi_set_request_limit().

Which introduces the possibility that something else gets the lock
before you can set the limit to -1.

I'm not sure that's a bug, but it's not obviously correct either?

cheers

>  		dev_err(hostdata->dev, "error after %s\n", action);
>  	}
> -	spin_unlock_irqrestore(hostdata->host->host_lock, flags);
>  
>  	scsi_unblock_requests(hostdata->host);
>  }
