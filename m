Return-Path: <linuxppc-dev+bounces-5304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0459A12C3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 21:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYHCD6tMbz3bVG;
	Thu, 16 Jan 2025 07:09:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736971768;
	cv=none; b=SmhqIn7CKgQ4Vm4If0w3aaT7x781iokzasblC8XBU+j3N6oYzXaLsx3NySkajahnQZyGxz/aN6MTFa9qB5v3/3uWvBTSqNyyLLS8BsFXxaw3DY2QIlAjJRsLWmXUuZ2uCU5M8OpnfZz9QC5PgsRR1AJ/m7u2wd5PMifYndM2t+bK38Ge+TRgJb6qnrLc32YZuzI4M0fAdgRzWrxhYFKW7Ox7ZuaOYH39yy52C6FFyFIdDsGZ8YG5bP1UaPsTBPw5VU+Xd3RkUq8zloIqd71v/axfiEbD+H+gKmXRJ1h4PJtbbu8rKpJTaZe/V19FFy7MvT+95h6/r1oC0mbje4WbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736971768; c=relaxed/relaxed;
	bh=MstsdCK7fs6TiHB2aoEPFnlipyR3FTW1b6bpj6iFCyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLaMt/YFSzbTdJ/L6ujZ0j6dcZAklX7ZkTktbFo+gRZT1tLEtTo9XX0OKQTJVIVMZ/sRn31guBX3ySkF63ukEuFPyWhc4EyVvdYwNjbxXnfcME54kq/GBY2MIbZoR+YAusCVtkEpoBPEJDaYJjNHNbfo5KFfPSdmuTNLScvlbEL98ZZZlIWc9Coms+2Cr9XvQHVtJjE6Fr8i53c2W8zz4GrYvIIx/L0ojYz0a9VJ3ZMvQk0G49GjHGzn0sFno0/ZC76oEEZn3mH/mwMvaQQdYzb+gvssQjbkhCQeWoSDyYvV0FXEskqm7/c9p5afJhLlkK3bipQ1tYCym7YfC6BAWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mMh7oPcJ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=wei.liu@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mMh7oPcJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=wei.liu@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYHCC3WBvz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 07:09:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41F7BA42164;
	Wed, 15 Jan 2025 20:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A6BC4CED1;
	Wed, 15 Jan 2025 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736971763;
	bh=HKd2BYN0EJzvcqr3Xx3Vueop4tDJh+K1d/v1F43ixq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMh7oPcJEGeeR1CbLFNvT6sYm/PkFQwDWfBsQ90yztglpZ3/YZEBVnarQ1AC7szWo
	 7TIaoC/5Ds9yuqwsCSv511HrZQrz9DYKTCs5teywBQChtbtwCLdUU15B57wDXyESFf
	 A/x13wKP5lj3nSG+MtRjOv+yVwR6g+BlMg1RaQLmyhmo5lqJ4XKmsH9giN7zUcgT0G
	 JjdlmRxxbsFDdoqRPMfd7BNNsEMs0mR8Cyqj/oCkFnsbRsTmQflWeOU3bRrVWJH9mq
	 wFz46x9sk38sYnuYTKWOXCW+bAgDPbIH7khSU1whNzE/e3Hn5P+2qU6Lun6bUVc/Ly
	 lJaxe0RpKwpyA==
Date: Wed, 15 Jan 2025 20:09:21 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
	Song Liu <song@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Corey Minyard <cminyard@mvista.com>, Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
Message-ID: <Z4gV8QNnafm-iCC4@liuwe-devbox-debian-v2>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
[...]
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index 7a35c82976e0..9453f0c26f2a 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -141,7 +141,7 @@ static int sysctl_record_panic_msg = 1;
>   * sysctl option to allow the user to control whether kmsg data should be
>   * reported to Hyper-V on panic.
>   */
> -static struct ctl_table hv_ctl_table[] = {
> +static const struct ctl_table hv_ctl_table[] = {
>  	{
>  		.procname	= "hyperv_record_panic_msg",
>  		.data		= &sysctl_record_panic_msg,

Acked-by: Wei Liu <wei.liu@kernel.org>

