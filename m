Return-Path: <linuxppc-dev+bounces-6518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F4A46E4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 23:14:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z380b3jMXz30Vn;
	Thu, 27 Feb 2025 09:14:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:67c:2050:0:465::201"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740608095;
	cv=none; b=Vl1FpiMdB2dHvXs34LNbSDA5I3YzletBfp5HmhExJ0p5L7MpYLPkoFRBylFmvajnn6gXt7wRzfHlUQkUmzscIEknnV4/P0QA24BC2M/WAD8EcLWDzApFwGBu2KBmkqxFkqsAi/utfYdfuCJbULdWrdvyYNoN0RK51HImoC9L143/DFAe9jtLYghNfQ0kdyF/0vFVY7ZOgA0djXgUTJfXaUYqqMG0beI2aUUKa2CVUCWLmL86ro5dEEeOb2F//ojlZds0HXIc/bT36fCkZpHOjzwZ+qog5gyg2tt/KeZHSIS2ZCYRp0TgNVnKdoF+b4nF1NB/vwPRvTb2xvEw9ig2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740608095; c=relaxed/relaxed;
	bh=4ZWsQZVcLDQu4UyI4Ncn4OWU1oO2DUa0oKEX3wnEkjM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eisrk+J5HtyUJgKrbLVPvfvVtLnyRwNvefs4NEbIDUPrHZhTDS6QN3xD9NQEj57T4c4Bl9re0SbitxsEJ6+/OiUcK4i6/fKawDlGsb6z01gs73KksQ+74VJML/loAK9ypFNS04974Ox8r4ht7keQVJ1eQ72PkhAJVs6yhLutu1SaJVP+Of3xwJKHdRcAOWhCAROKtv3f3GcRleJuu5CoKuPTOM67KOJTPwQmn0RsQL0S+lnEZv5PI29Jr7Dk7XbOJo1Hx09mesl3SsZTWWMPYVx9gjLATpmWLi3a5j6/Gqcfmm9wPkJCb9NJwP+ejrpT2eTFJqW1gEraoqn8NQNuPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fA1hsg/J; dkim-atps=neutral; spf=pass (client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fA1hsg/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::201; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z380Y4jfxz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 09:14:50 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z380K6bVfz9sW5;
	Wed, 26 Feb 2025 23:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1740608081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZWsQZVcLDQu4UyI4Ncn4OWU1oO2DUa0oKEX3wnEkjM=;
	b=fA1hsg/JAhApvdVQdBIoRrVaY7MSzb4ZF4DE1iLI+I9ir8W8fVb6Vv9eDZr4lZSK2lQ18K
	+m4LVX9WZCb0b0a7qMi1fYCW+UYDA+mVnZqPm+7Akdj5Z2tiaALGIdvMbkQtAtctEPmy6/
	BuJecjMd8GYuxVw4992cxTkidlgOIY5JYDX58xvXRNxK4L0PplqDcwOXsFFAhGxhbiKHCG
	nc5hobDDvFtdK9o0N6P0z8sD6ER1oWNqFaIKX1TfsToo1MlCNzyQ5CR17kjXg613U4T7z/
	/Wx8civUnv1ziRmlVO0vVjXxhmjiWUGzXuryzmOS88MSyeKVlbbbUOYcNEY/8w==
Date: Wed, 26 Feb 2025 23:14:18 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: Missing '#size-cells' in /ht@0,f2000000/pci@8/mac-io@7/i2s@0 on
 G5/G4 (kernel 6.13-rc3)
Message-ID: <20250226231418.1df533c6@yea>
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
X-MBO-RS-META: smqrx9z7eiexes3bar8ph3xe4rth91wi
X-MBO-RS-ID: 4d4a2b2e80ea233cd26
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

The fix works on my PowerMac G4 DP. And there is also https://patchwork.ozlabs.org/project/linuxppc-dev/patch/875xmizl6a.fsf@igel.home/ which seems to be the same patch.

But as of kernel v6.14-rc3 none of these is included. Could one of these patches be upstreamed?

Regards,
Erhard

