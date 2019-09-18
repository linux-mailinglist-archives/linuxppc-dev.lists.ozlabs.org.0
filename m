Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C78B5BB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 08:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y8p812NyzF3Qx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 16:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y8lq5LK0zDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 16:12:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="QY/9K8+m"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Y8lq3kqtz9sCJ;
 Wed, 18 Sep 2019 16:12:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568787159;
 bh=rKbION4BRPZJT2pVRWztj3dezrjkCwmBEIqMY9p6PwM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QY/9K8+m/yJdqnZ3LNdZBaa+TpfQPC3Ev3jRfcmfiOogz72qFx1Ge0VppqA0ik4sf
 /pT+hFIbHBUlB/4gKA52zNc6pW83UbJE9nESuNFU8ayoAKY5s5LZJGFDAMYCbsilFE
 N/R0TbJb+RcLzLfDL4O45/bepv7BWhiq0DdbuqVupmIVIBtoqVWLi8vAiErAAea6uK
 ZvFEstiXYCGM8PnvqtiBktJ8PdbhoIZySgWJr+Wg91mhVnIXobZNcSoE4yUjPwg8O5
 3yJTH9fmEeruNdQVGGdclsxHlqhm7lEDO6YhU4qocUNRvNUcS1FXhv9gqTHzk+KPyY
 JjBuIDdR8qmCw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Juliet Kim <julietk@linux.vnet.ibm.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net/ibmvnic: prevent more than one thread from
 running in reset
In-Reply-To: <20190917171552.32498-3-julietk@linux.vnet.ibm.com>
References: <20190917171552.32498-1-julietk@linux.vnet.ibm.com>
 <20190917171552.32498-3-julietk@linux.vnet.ibm.com>
Date: Wed, 18 Sep 2019 16:12:39 +1000
Message-ID: <87ef0ew2so.fsf@mpe.ellerman.id.au>
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
Cc: julietk@linux.vnet.ibm.com, tlfalcon@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Juliet,

Juliet Kim <julietk@linux.vnet.ibm.com> writes:
> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 23 ++++++++++++++++++++++-
>  drivers/net/ethernet/ibm/ibmvnic.h |  3 +++
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index ba340aaff1b3..f344ccd68ad9 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -2054,6 +2054,13 @@ static void __ibmvnic_reset(struct work_struct *work)
>  
>  	adapter = container_of(work, struct ibmvnic_adapter, ibmvnic_reset);
>  
> +	if (adapter->resetting) {
> +		schedule_delayed_work(&adapter->ibmvnic_delayed_reset,
> +				      IBMVNIC_RESET_DELAY);
> +		return;
> +	}
> +
> +	adapter->resetting = true;
>  	reset_state = adapter->state;

Is there some locking/serialisation around this?

Otherwise that looks very racy. ie. two CPUs could both see
adapter->resetting == false, then both set it to true, and then continue
executing and stomp on each other.

cheers
