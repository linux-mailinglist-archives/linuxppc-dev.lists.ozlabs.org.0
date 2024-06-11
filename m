Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82018902E96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 04:49:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n5d2Rslb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VytRt2n9cz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 12:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n5d2Rslb;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VytR924gGz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 12:48:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718074133;
	bh=iDuiwhB+pKUJIaO9+T/AdLMu71C/Az9pqj1QFlkz4Mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n5d2Rslba9yBwabDT8iSTrqM52wJpO+0wn1Ki7P4/7yWgp9kolhkBXb7IahJG+BfY
	 VYSEnGTfEhyjtutmgZGdK/ZtrVne7NEn6nbEELtM1Yi0GqSM5Kk8xNI0UtlxJw0txW
	 GhCv4zbM+OljZCTHVOZ8NRQileZqmE+uH4etvSzlXvLQ3JjmeTGw1tLl2YAhYxQavE
	 UD1S/RZkYOy0YYD1tQ38BFP1Yu4+ukOAiahV2GaQVUkt5YaEtfoHarhP+O1VEfbF8s
	 CBXdeZEUT1qWUtMX7+AXjRxeXdT5v5K0INovQBpR9l1GUcpBRuoD2gzFukHwJ2XRvg
	 xhMaAim97o89A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VytR95zlxz4wc5;
	Tue, 11 Jun 2024 12:48:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/eeh: avoid possible crash when edev->pdev changes
In-Reply-To: <20240527075433.415693-1-ganeshgr@linux.ibm.com>
References: <20240527075433.415693-1-ganeshgr@linux.ibm.com>
Date: Tue, 11 Jun 2024 12:48:51 +1000
Message-ID: <87cyoop52k.fsf@mail.lhotse>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> If a PCI device is removed during eeh_pe_report_edev(), edev->pdev
> will change and can cause a crash, hold the PCI rescan/remove lock
> while taking a copy of edev->pdev.
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh_pe.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index d1030bc52564..49f968733912 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -859,7 +859,9 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
>  
>  	/* Retrieve the parent PCI bus of first (top) PCI device */
>  	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
> +	pci_lock_rescan_remove();
>  	pdev = eeh_dev_to_pci_dev(edev);
> +	pci_unlock_rescan_remove();
>  	if (pdev)
>  		return pdev->bus;

What prevents pdev being freed/reused immediately after you drop the
rescan/remove lock?

AFAICS eeh_dev_to_pci_dev() doesn't take an additional reference to the
pdev or anything.

cheers
