Return-Path: <linuxppc-dev+bounces-15351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F033CFC105
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 06:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmGpJ3Cdkz2yFh;
	Wed, 07 Jan 2026 16:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767763832;
	cv=none; b=oyM1B2cEvgRoU7cEBLPHKVHj4V5FkcMlb5QN34KC2o3C538Ndyll/VLEBSNoDTztyjeoqVEepuaObC7XhGHq6HWqwHs/Q/GjEz8pHHiHuVHd125oca6bK8zvDtoWRMNtsJ6ODAlM5nEywThrHf6nuaqj8mwYHU78+4+y/KENpkslcVXiKxc91I8en9lNRVfOjes+BQzsIYKS9uqkrfoA0jPoeYIp/ZSqdxDFFCFIMrPg3HCQauSFlk9IL/FRmyd6NV88AC7JlRNNoSEEzCJqyqpQ/qwwRTNuvRKX2CmEfPN6W78s9cNVV46gtngQtlqkYBa0pWcqK6NSGP+QrmUT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767763832; c=relaxed/relaxed;
	bh=PmJHXiqHc+iECf0VqMaKi1nRY5ftnlb6K1jtRASguiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrG9VygwVyjbEzhpYhYQXvUEWOKtSbFWX6gwEJeik1tIf0s+ZEHz8wFV16JvExngZnGea8XkIprmXDABnscT098Vwz5hfP/9dONIXE+IEWp8AV7NSPu/B8mn2YL1T1oXRZ5d1KY4IORgrjHKRvxYT9KLtbjooS3fgHpYThXzMEaM8PvlP6mTi9lShSbCM5qwP/zU67ZRmw0xFi5SlQP1tk6oudqiTmLW1pj8sR+4e5iIa2J5e83i+IBvcjHEXYCV94L2WiZNVjRSxK2EANLoEQcr/4+NrxKkGaQ1lmkv9GizDzZuaeFAcgoodolMarYjPPdBM0C7OgDsEflitW51wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0aPQ/Qco; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0aPQ/Qco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmGpH0Dbjz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 16:30:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2B5143956;
	Wed,  7 Jan 2026 05:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27671C4CEF7;
	Wed,  7 Jan 2026 05:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767763827;
	bh=4/ZQf8VUUfoUZh1OPYhG0F92DKQ4JV2XdIHkXpnMYdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0aPQ/QcomjudM2w+aZ6vT6EgNKEfBUjVnU4lT2k6WugoJ+ZdHVdc12uDMziqBi+M4
	 qJ/QeNTv9U75LAzW9pp/BvqcxsgrhnepgzAqiQVcQPGwQvbi4aWZimds7rtjOYkFtO
	 d81YrJEnibCiiMzVLqiqNmktYxeXk/WIshewk5qE=
Date: Wed, 7 Jan 2026 06:30:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type
 declaration
Message-ID: <2026010755-registrar-agreeably-a626@gregkh>
References: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 06, 2026 at 07:54:21PM +0100, Christophe Leroy (CS GROUP) wrote:
> Fix following sparse warning:
> 
>   CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
> drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?
> 
> As it is exported it can't be static. So declare it in mc.h like
> all other similar objects.
> 
> Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---
>  include/linux/fsl/mc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index 897d6211c1635..28441a456bb48 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
>  extern const struct device_type fsl_mc_bus_dpaiop_type;
>  extern const struct device_type fsl_mc_bus_dpci_type;
>  extern const struct device_type fsl_mc_bus_dpdmai_type;
> +extern const struct device_type fsl_mc_bus_dpdbg_type;

As it's obviously not used anywhere, this should not be the fix, please
just mark it static and remove the EXPORT_SYMBOL_GPL() as well.

thanks,

greg k-h

