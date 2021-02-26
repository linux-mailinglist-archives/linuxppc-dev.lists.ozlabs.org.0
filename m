Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D0325CF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 06:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmyhY3PcVz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 16:22:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=kQTrHw3+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=kQTrHw3+; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmyh76pR0z30H9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 16:21:57 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id f8so4692517plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 21:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=G0n0GtXCnVUgNxEQs6ivYCWrbpuorhBY/DfuohJYFLM=;
 b=kQTrHw3+qJExsopJW13hHe6o+yaiTvQIM8RzPMuNoJHjgIvjpUtfGA/oe7PqlMGzme
 z+Ox71hBclSBFo+9h9hYPRLh2IADsVEDpBVpBzuDlqNqvD00ImAywrIjAwgF40To92ZB
 DiwHtptmkvdHCF6XMB2oK6eJBeGmMKPnngC9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=G0n0GtXCnVUgNxEQs6ivYCWrbpuorhBY/DfuohJYFLM=;
 b=l5zETQQKDipuEYDcYTffG9jfubPLwHziBuDcQKyVzMKrJ8S6ei53MSYqC37tABKSPC
 8MtEqS4DZAlgxfvMnL1wb0U30qIqBrtjlAFHLJ0AlxaoWnhAL0PKHVgQ/W4nI69IVAsi
 WhsHpfC+l0HymguYn7/YtZ1iLQQPXG5SXmH51jNxMZyjSg6iWhF2lXIVQHcFUWXs1vmt
 wvv0N72drUITY1cvJHdQry7CwLiHmRJzbB+b3afB+fSAbuES1YySHQruzHvtGaCRCo4Z
 i3TAhe8zDFrQErkbbZeZf+t62spziS3Bqk+cktiABcql3Uaypn+9UGC4wweq3v2www5e
 BxSg==
X-Gm-Message-State: AOAM532gecu2S3c4ebntj5fFyTgU8dXZiK9I8C57wdcWfbvarO9qJ1hj
 3sB9Zhlc08xOLkZwxGlU8DjR/A==
X-Google-Smtp-Source: ABdhPJwAJ8yfjWTchCphDH+TWvqyIAj8tFTBcC3i25C3OhOMwD2WBbduCpjTqMsT4+0bhS1PDGOHFg==
X-Received: by 2002:a17:90a:66cd:: with SMTP id
 z13mr1597599pjl.171.1614316914006; 
 Thu, 25 Feb 2021 21:21:54 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id 192sm5259559pfx.193.2021.02.25.21.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 21:21:53 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 02/37] KVM: PPC: Book3S HV: Fix
 CONFIG_SPAPR_TCE_IOMMU=n default hcalls
In-Reply-To: <20210225134652.2127648-3-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-3-npiggin@gmail.com>
Date: Fri, 26 Feb 2021 16:21:50 +1100
Message-ID: <875z2f9zf5.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> This config option causes the warning in init_default_hcalls to fire
> because the TCE handlers are in the default hcall list but not
> implemented.

I checked that the TCE handlers are indeed not defined unless
CONFIG_SPAPR_TCE_IOMMU=y, and so I can see how you would hit the
warning.

This seems like the right solution to me.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 13bad6bf4c95..895090636295 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5369,8 +5369,10 @@ static unsigned int default_hcall_list[] = {
>  	H_READ,
>  	H_PROTECT,
>  	H_BULK_REMOVE,
> +#ifdef CONFIG_SPAPR_TCE_IOMMU
>  	H_GET_TCE,
>  	H_PUT_TCE,
> +#endif
>  	H_SET_DABR,
>  	H_SET_XDABR,
>  	H_CEDE,
> -- 
> 2.23.0
