Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661308AA64A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 02:42:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YAp6FL07;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLG7Q1Npqz3dCH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 10:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YAp6FL07;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLG6g30zwz3cNc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 10:41:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713487290;
	bh=NHQNrd99LJ9MCuk0KL/kZIA73cOzGBuWiBRcno6RL5o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YAp6FL07CTI4y3Sq9B2GU6XiWXcFkW9Dnb3nbVlsty3SZpOJYDW+PZQ1YdkkslClb
	 uHU+cHmAxw2ocGndLAqhSjEWmo1CbnohJjrXCbg5Zg8wUAoQr8b1Pu2TApfsiYFngh
	 L+jikFj2KqK6YLefc8J4RY1cfNQefRXouhndrq4HXUYNqiO48nrCcyZlcd4fSmNyhA
	 8jFDBWIlNwm3J6QzHT4e1C+Tx7DkMdi8wqKNd0DAY9bUFhVuSlsE0hAspeH0ISsyn8
	 akcTI07axeLP9ZToKe3hMQ4i1WFYFHI0j2rvVQOus+cEIBbRC8qhZMG3+Qz+Si2Eem
	 X12cZe8M1rpIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLG6d1yqHz4wcn;
	Fri, 19 Apr 2024 10:41:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Christensen <drc@linux.ibm.com>, dougmill@linux.ibm.com,
 davem@davemloft.net
Subject: Re: [PATCH net] MAINTAINERS: eth: mark IBM eHEA as an Orphan
In-Reply-To: <20240418195517.528577-1-drc@linux.ibm.com>
References: <20240418195517.528577-1-drc@linux.ibm.com>
Date: Fri, 19 Apr 2024 10:41:24 +1000
Message-ID: <87zftq9oaz.fsf@mail.lhotse>
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
Cc: pradeeps@linux.ibm.com, Linux PPC <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Christensen <drc@linux.ibm.com> writes:
> Current maintainer Douglas Miller has left IBM and no replacement has
> been assigned for the driver. The eHEA hardware was last used on
> IBM POWER7 systems, the last of which reached end-of-support at the
> end of 2020.
>
> Signed-off-by: David Christensen <drc@linux.ibm.com>
> Reviewed-by: Pradeep Satyanarayana <pradeeps@linux.ibm.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b5b89687680b..bcbbc240e51d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7831,9 +7831,8 @@ W:	http://aeschi.ch.eu.org/efs/
>  F:	fs/efs/
>  
>  EHEA (IBM pSeries eHEA 10Gb ethernet adapter) DRIVER
> -M:	Douglas Miller <dougmill@linux.ibm.com>
>  L:	netdev@vger.kernel.org
> -S:	Maintained
> +S:	Orphan
>  F:	drivers/net/ethernet/ibm/ehea/
>  
>  ELM327 CAN NETWORK DRIVER
> -- 
> 2.39.3
