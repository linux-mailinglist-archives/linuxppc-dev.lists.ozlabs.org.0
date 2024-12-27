Return-Path: <linuxppc-dev+bounces-4496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB79FD7AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 21:36:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKcjY2pVdz2xn3;
	Sat, 28 Dec 2024 07:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735331809;
	cv=none; b=Y0d2/Z/niRKzkh6Zo3Alh3usW+J6N6u81HHtO9rxNlT9tv9/LQKXG09ahcbLE81t4zb+Q+qSi9+BDYjh23c4Dvqp+yyjEF7b4NZClt1LdFthanzGiGDfcy51cavxyRn74L8swJMu2/4ghF3RpNNvLHzP/3gW9hO/LE6kfPz35lx9OpcZrIJZai1V29k0tKWCI6wYKCV3mFnFxZCT2/Curwx9HJW54UcRZJgR2E0wMwTRUuw/BcizPQ8Az4wmL8A/va+fuFH0UomfCDsKwtthJFAMI1JhwBPjBJzHq1W+7cvBSEdtFGRD4hnrPVqTa9q8koQumpKM4FlDn0Aayw1/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735331809; c=relaxed/relaxed;
	bh=ZLoaewLaNbBagbxBsOZNZeHMkFTPiSaczS7RkDtYKok=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yp8UpgotQ89vFTouBURDfsuQ+GuGLHTXvx8qSBN3AXR6MiQT5j/Ru8DocBopuw4xshOpnuqaAhRjK8Cpo+PkHaX8qwdkBU21MNXXAIYEia1+E2irRNmGEEFh39MoPdCTspQSD/T+vx6BZ6zmbWD/77+izG++XvjFn+zJLz8vEyZLf6ynKNH7MJIqfGDbxubIsz7o39xHe3j/fMpeLLk8YvB6AS7E2BoWo9X4wPtUtSLYyrFuQUld1XbaX7AUtmn0RXRiRuwdVg90ocQrhkc/wslHhYPIvmOcpPO2dJ7fuUeF/3mv7W4E9ebE63p4Q/rNhOEnpuJazZv1eLKtZt4xsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=K/eJcIh9; dkim-atps=neutral; spf=pass (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=K/eJcIh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKcjV3nkXz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 07:36:43 +1100 (AEDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YKcjJ733nz9slk;
	Fri, 27 Dec 2024 21:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1735331797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLoaewLaNbBagbxBsOZNZeHMkFTPiSaczS7RkDtYKok=;
	b=K/eJcIh94SAlMGy9j0IujjadR8/pB8gkvQSkX31iLJiURtvDzbjB7K0sJS8jdljcZxUUw/
	DEVeKkGghZPW2k4X/gaWwDuOcgGGvXGDxbioFtHd4nE+HLbrt4HJhYCXn4h5hCDYyw2D6u
	hg98M3AelMez8tO2FaLJ8Ewv9BwYChcXCIg6adKCSuBFAFZznaNriP2KOgKhIrWnml0L0o
	5OwzWubsFSn+g0iXauk7bTwSQ5G5CAoLtuvA9T6R6HCXx5o48a+bszt2mpPjpFkmDZ7Aa7
	vMLD/wzu4iXBkFCvBcVuqo0E/GNSQOnmBzSBDsBhG1gyJ2i1uCmRTh2LumVPVQ==
Date: Fri, 27 Dec 2024 21:15:27 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0 on
 G5/G4 (kernel 6.13-rc3)
Message-ID: <20241227211527.009a0f13@yea>
In-Reply-To: <87jzbqpnd9.fsf@mpe.ellerman.id.au>
References: <20241219000749.6836d610@yea>
	<87jzbqpnd9.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a90aa51ceef70f26913
X-MBO-RS-META: fqs9ctqn6d5q91csahaihxmcu6ns44sx
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URI_HEX autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 23 Dec 2024 23:58:26 +1100
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Erhard Furtner <erhard_f@mailbox.org> writes:
> > Greetings!
> >
> > I am aware there is commit cf89c9434af122f28a3552e6f9cc5158c33ce50a
> > (already merged in v6.13-rc3) which fixes some of the "Missing
> > '#size-cells' errors" but there is more:
> >
> > ------------[ cut here ]------------
> > hub 3-0:1.0: USB hub found
> > Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0  
> 
> Something like below might fix it.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 8e776ba39497..462ee36ef891 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2898,11 +2898,11 @@ static void __init fixup_device_tree_pmac(void)
>  	char type[8];
>  	phandle node;
>  
> -	// Some pmacs are missing #size-cells on escc nodes
> +	// Some pmacs are missing #size-cells on escc & i2s nodes
>  	for (node = 0; prom_next_node(&node); ) {
>  		type[0] = '\0';
>  		prom_getprop(node, "device_type", type, sizeof(type));
> -		if (prom_strcmp(type, "escc"))
> +		if (prom_strcmp(type, "escc") && prom_strcmp(type, "i2s"))
>  			continue;
>  
>  		if (prom_getproplen(node, "#size-cells") != PROM_ERROR)
> 

Works like a charm! No more "Missing '#size-cells'" errors on both my G5 and G4. Thanks!

Regards,
Erhard

