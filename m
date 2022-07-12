Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318C5720C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 18:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj5jf6zjSz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 02:26:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o7F7qm8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj5hv1s8xz3c22
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 02:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=EyUFDwm+MCF5o/jfmCwe0q+h8aIIfJ6Fh6QWFZidMRQ=; b=o7F7qm8JPqBXj5UYxBg1ZN3Oz+
	6C8spyb8w8F+4P09llAiHI8Wuy0lpK087JBQEthXA1isE0s+SKnUBUcBhkVNTPO0aMwYgxSA3pdNi
	CbVedOTzknDAgDJwtxaVuziPs9sWWkxmtQguv2Lh/DPSxzBMrnLpEj0DMNW5DXKnRw7LxDNGNEaSp
	oXUH8yN7BNYsimD++6N+CwpgDrD5/IaXGSZhEy7RHl5ejZHcfgi4Mn3IAiedh5M06h6QUm4NGx4qX
	q0vuQEzjtx4PKMb9PgsOc19SQsFznoZbdfvBdaeQ+99sDDlhUdjCKfiMpLaG0DdbvQdCtKkOLm7Pn
	OZnZor1g==;
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIha-00ClSx-5G; Tue, 12 Jul 2022 16:25:34 +0000
Message-ID: <a646b2e9-e7a7-3d52-413e-4e2b8c48e383@infradead.org>
Date: Tue, 12 Jul 2022 09:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/4] pseries/mobility: set NMI watchdog factor during
 LPM
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, wim@linux-watchdog.org,
 linux@roeck-us.net, nathanl@linux.ibm.com
References: <20220712143202.23144-1-ldufour@linux.ibm.com>
 <20220712143202.23144-5-ldufour@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220712143202.23144-5-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi--

On 7/12/22 07:32, Laurent Dufour wrote:
> During a LPM, while the memory transfer is in progress on the arrival side,
> some latencies is generated when accessing not yet transferred pages on the

                 are

> arrival side. Thus, the NMI watchdog may be triggered too frequently, which
> increases the risk to hit a NMI interrupt in a bad place in the kernel,

                            an NMI

> leading to a kernel panic.
> 
> Disabling the Hard Lockup Watchdog until the memory transfer could be a too
> strong work around, some users would want this timeout to be eventually
> triggered if the system is hanging even during LPM.
> 
> Introduce a new sysctl variable nmi_watchdog_factor. It allows to apply
> a factor to the NMI watchdog timeout during a LPM. Just before the CPU are

                                              an LPM.            the CPU is

> stopped for the switchover sequence, the NMI watchdog timer is set to
>  watchdog_tresh + factor%

   watchdog_thresh

> 
> A value of 0 has no effect. The default value is 200, meaning that the NMI
> watchdog is set to 30s during LPM (based on a 10s watchdog_tresh value).

                                                    watchdog_thresh

> Once the memory transfer is achieved, the factor is reset to 0.
> 
> Setting this value to a high number is like disabling the NMI watchdog
> during a LPM.

         an LPM.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++
>  arch/powerpc/platforms/pseries/mobility.c   | 43 +++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index ddccd1077462..0bb0b7f27e96 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -592,6 +592,18 @@ to the guest kernel command line (see
>  Documentation/admin-guide/kernel-parameters.rst).
>  

This entire block should be in kernel-parameters.txt, not .rst,
and it should be formatted like everything else in the .txt file.

>  
> +nmi_watchdog_factor (PPC only)
> +==================================
> +
> +Factor apply to to the NMI watchdog timeout (only when ``nmi_watchdog`` is

   Factor to apply to the NMI

> +set to 1). This factor represents the percentage added to
> +``watchdog_thresh`` when calculating the NMI watchdog timeout during a

                                                                 during an

> +LPM. The soft lockup timeout is not impacted.
> +
> +A value of 0 means no change. The default value is 200 meaning the NMI
> +watchdog is set to 30s (based on ``watchdog_thresh`` equal to 10).
> +
> +
>  numa_balancing
>  ==============
>  


-- 
~Randy
