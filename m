Return-Path: <linuxppc-dev+bounces-15977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10597D3A63D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:07:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnj14MMDz30Lv;
	Mon, 19 Jan 2026 22:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768820821;
	cv=none; b=MMS10rZ7lX1QYZYQqchfPRZt7mkZx+kvHb3/EZWHVnNGFCpL/3OvvX9GXyL2W/qGsOoaBWS3lO4j8rSBA69UFyEND4g2nXY8LxveecDS8nXKa9zQwlgBMgCWSP6bqtrztd0ckJ8TWqYvUR5JG7UnZUmjbE0/cFctUOqSRF+vj96vECHEtsGm5CWJcsdb/qAmeNtKoUqX8rutvFm5Nws8Iy9htUYJn0kqgcNotOdnAsPdhAHkjy5dhuwLvOStGlzxMEQVdHjd2GmYcrobuSfYdZtsO0PyQ1TJifgLelhIWmGU5qbV1l45lUlUERPtjvNdxqhDeBZFgpsVpsD/xAYv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768820821; c=relaxed/relaxed;
	bh=InzMZ2sKPU+dBiXuXrFvQIinli9OSxMqyO9gWD6Sl84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0+9RadB/epFMF8JKvrboOPNUWOfCY35z3DiQV0hDIgqDP9c1xo6F1ifHmf9/6MrxeQuU4eP+2c4zwFwjw7Xi86VQFw04hiDEyIGXnVBX4COZBomxfpR4scs3RzdHE1TICrWkPSGQ+5kx1gvPgEoFNXRzf+a+1ISeqQxYQeVbt7LJXQRBpXFeWJsIEjKFOEJkDknk/aK+YrzCJwx+pO37iH24iEZ2IQGgZ1MVg2A16XZL56gJ36fMAvVUytR0+H9qNrqxH9ZkrUQpoAzfH5dBxhsKNgdX8E65QJC595/TuFOq3wrVcBqDBLCwjL8s7Z/CAhhg7Ffsy4ezf70keJT6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/3rPe+V; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M/3rPe+V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnj05jbKz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:07:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12BBD41A4E;
	Mon, 19 Jan 2026 11:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEC8C116C6;
	Mon, 19 Jan 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820818;
	bh=FSHtm5y+0kZFCu8h7MAlOolnmcLEJiXQsqC8mgqCK0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/3rPe+VeDwVPcMY41CgntHHzX52DrZ0Q9LntDEdhFwNDiNZ+STK82e5P8+fTyKDM
	 DyPXKjY5ovs4CJIuPMfV4bFzgLkuVtS9YVZxtJVrjT3KTCx6Lt50yKGHNFtwjJiioZ
	 nRo+/iFAN2Yo41CvjEQUqCEYz+oCH0IdS9UATPlAo/IjYIH20q8aTsdTpeQSk7f+Qz
	 8eou2/M7Ip9TXxzlIaBsgTffX6DujbxZky1fjiNwbe1DQLng6YsJKWQD40SP/jF/2q
	 1OLSx6lcmdOrWzcG4u/cDPaN57epDjYD//Wwa+BRG53He0SLZsLR2jz5ALHlw9R7Rn
	 813vdS2ZEk1iA==
Message-ID: <ff8db3d9-cb27-4ea3-8953-a7786eb54a01@kernel.org>
Date: Mon, 19 Jan 2026 12:06:51 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/of/base.c  | 13 +++++++++++++
>   include/linux/of.h |  2 ++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>   }
>   EXPORT_SYMBOL(of_machine_compatible_match);
>   
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>   /**
>    * of_machine_device_match - Test root of device tree against a of_device_id array
>    * @matches:	NULL terminated array of of_device_id match structures to search in
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>   	return of_machine_compatible_match(compats);
>   }
>   
> +int of_machine_get_compatible(const char **compatible);
> +
>   extern int of_add_property(struct device_node *np, struct property *prop);
>   extern int of_remove_property(struct device_node *np, struct property *prop);
>   extern int of_update_property(struct device_node *np, struct property *newprop);
> 


