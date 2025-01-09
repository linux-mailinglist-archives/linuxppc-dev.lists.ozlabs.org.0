Return-Path: <linuxppc-dev+bounces-4917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175BA079A3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 15:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTSNT3svrz30T9;
	Fri, 10 Jan 2025 01:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736434153;
	cv=none; b=G1dxAzgtHFYx7qB/Bj6sCqzLHthER3tOFQcvO75A9CuJ1/jFk9H5vaucupNAahT0Bc155TpBGQ1UYdi+wiOu72PIpAvjre1FhEuzrWUnAnOfxXFUih7skZmCjCY2Y1NoPY4ZaehbftoJ+PudY4g/oQ5DIqhaHQTOgIA5980ZubJVRctbcJycibSveeF6uUQEuJAZ0VzIAuCL417ryLJVwzMFF5Sge+67tkJ9DyY3LO1SDOHQErGrfjYDFTO3tm6VvENygokWxLRgyZ69uqOtx8F6t7IQKoskjqHVNKCPSf8TpB8pfVpomAM5J57eA8HW4/FME1Xa1GGNIvo0bseCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736434153; c=relaxed/relaxed;
	bh=hItSMR0IDjkdMJUBRKLD8SPiYiiCgPMm35ASO9oVDjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PCKVmVU+EmrJuO0oItHs4Ud3TA+cwuPdQZwUPW63M8f+5uM+niHwB9WCqcJcCklB5ZEP5X4/uso/A5SUEuLWGZbrai5hmQ9swoiN4P8YCVVqYgQ8rvRDWalLTwO/ywIca0EpaDI43SA5brDo8yZWn+agZt3zqLFGJbajfFYL4bMk0SQk7AzBx3fY2uD0JryIp4m72CAcpY98vvind/9aUnfM/F7bIIhAfXHv429j2l64BGCo2T4AlaIzh9GCfQpH97rgJDeS2+3YyWLkUuvo+dB0TzDPjTaRGogpT9ckTzZfWKkIsCrBmM2OlxQAtbVYewo7mL1xM3lR5URYENjZVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=vo0q=ub=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=vo0q=ub=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTSNR2Q0Rz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 01:49:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861CE5C5A84;
	Thu,  9 Jan 2025 14:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F4DC4CED2;
	Thu,  9 Jan 2025 14:49:04 +0000 (UTC)
Date: Thu, 9 Jan 2025 09:50:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Kees Cook
 <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <20250109095037.0ac3fe09@gandalf.local.home>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 09 Jan 2025 14:16:39 +0100
Joel Granados <joel.granados@kernel.org> wrote:

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 2e113f8b13a2..489cbab3d64c 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -8786,7 +8786,7 @@ ftrace_enable_sysctl(const struct ctl_table *table, int write,
>  	return ret;
>  }
>  
> -static struct ctl_table ftrace_sysctls[] = {
> +static const struct ctl_table ftrace_sysctls[] = {
>  	{
>  		.procname       = "ftrace_enabled",
>  		.data           = &ftrace_enabled,
> diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
> index 17bcad8f79de..97325fbd6283 100644
> --- a/kernel/trace/trace_events_user.c
> +++ b/kernel/trace/trace_events_user.c
> @@ -2899,7 +2899,7 @@ static int set_max_user_events_sysctl(const struct ctl_table *table, int write,
>  	return ret;
>  }
>  
> -static struct ctl_table user_event_sysctls[] = {
> +static const struct ctl_table user_event_sysctls[] = {
>  	{
>  		.procname	= "user_events_max",
>  		.data		= &max_user_events,

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/

-- Steve

