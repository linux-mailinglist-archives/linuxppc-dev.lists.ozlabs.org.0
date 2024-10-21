Return-Path: <linuxppc-dev+bounces-2454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 838019A5F22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 10:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX8CL6dV6z2xxt;
	Mon, 21 Oct 2024 19:50:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729500622;
	cv=none; b=f/U1fXyWeCoptjPYCEKZkV1bs2Fhk2URwxu+ePFmFN8ierMuu2Fbd4er0MU7EgOEP413qAP//irLGgMYA9wZ+Qm37/S//82E1Ht1b8Obd7r1Cg+VhxA/OfpSGdlMIhz59i1KYE+Powpc2uhdV2XDTv48ii8iNkgfamt9BAOKS7ux6GrebYpeZtpsNPlfI2XwrtP+NvhVNMzGbmt8x2rR7mhKrOz9MkZll7Os35QdH/AeaIbYjbzhrYJ0eH6XaunoG65o1FJF0k6zylhGwnBTJkFlzEcZwN/1R+GLsln6vRuaThXezV9aA9+Ewh+OjyiJfATWrE4eCvk4jRLnW1BBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729500622; c=relaxed/relaxed;
	bh=zV4wxDX1Qa7PkB/5K30LtQhBxEEMmOdT6d6M993cF98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtmlmxI/9Jx5zH+9pd/09dSULKX3e/aBYdHlSIfLanLqFx6IDO3C0KA30MNDlnH3v8KeXEZ430fyYGmvXxwxHu4xT+6aOlTNiA1hw3U3FRKsb0cdbBuHrt6Q136FhaP3/tPmVpBj7pPDAfmE67sBycAUaH6FgUKMBlwv2Pq/FelxEkD5HcCFLVnBjG8fxJkGxYUE+C5TnAsiHmo/Yyiz2/xXRMIK7Fe/Kll3NFma1VWxEpFPlNMLqpuiOs8k3iKyuBS1oPESnVfc3tAUz+sDJcEBL/NiAer3l6gYgoWXB7dzhIzCxOIZXvjyb8nA67QTkND7xg4VyVHI2hO+0Hgo8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX8CC1VTBz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 19:50:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zV4wxDX1Qa7PkB/5K30LtQhBxEEMmOdT6d6M993cF98=; b=D9SCqohrM5rvLbyAuE3c7kihE2
	mVUxeaNJrRiFNdeLgmhmfgXuHcHcaRadELoxOfp92LmnCgQzNL5lG0Py6QoYKzFa+cG+Bwvfy0UHs
	gW5sdGSUK47ukg5fLtHNUfzxPLGvp/qHw5YNgya8aalPjB9nOqjWrRl0p004ExnVVNWQzIHlwqISG
	b2ExLBZC+rMYGLVvfhnPlDi9cKs2BJOc03RYFhjjPauj0lFOxH5enpb7pLnWjGxaEstJzj+j6924S
	oFS8K3/JtfjtpeJgUWSGIKgoeLEStBUrHgr9Czec+PpHLI/zKoBwCPgzhO4uOuUnAURESa0RcKZsV
	3LdRtC3A==;
Received: from fpd2fa7e2a.ap.nuro.jp ([210.250.126.42] helo=[192.168.1.8])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o6v-0000000G5GM-1T3t;
	Mon, 21 Oct 2024 08:49:58 +0000
Message-ID: <85eefbd5-bc90-4cb8-807f-6d1ee195e7f4@infradead.org>
Date: Mon, 21 Oct 2024 17:49:49 +0900
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] powerpc/ps3: replace open-coded sysfs_emit function
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
References: <ZxMV3YvSulJFZ8rk@mail.google.com>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <ZxMV3YvSulJFZ8rk@mail.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Paulo,

On 10/19/24 11:13, Paulo Miguel Almeida wrote:
> sysfs_emit() helper function should be used when formatting the value
> to be returned to user space.
> 
> This patch replaces open-coded sysfs_emit() in sysfs .show() callbacks
> 
> Link: https://github.com/KSPP/linux/issues/105
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  arch/powerpc/platforms/ps3/system-bus.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
> index b9a7d9bae687..afbaabf182d0 100644
> --- a/arch/powerpc/platforms/ps3/system-bus.c
> +++ b/arch/powerpc/platforms/ps3/system-bus.c
> @@ -453,10 +453,9 @@ static ssize_t modalias_show(struct device *_dev, struct device_attribute *a,
>  	char *buf)
>  {
>  	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
> -	int len = snprintf(buf, PAGE_SIZE, "ps3:%d:%d\n", dev->match_id,
> -			   dev->match_sub_id);
>  
> -	return (len >= PAGE_SIZE) ? (PAGE_SIZE - 1) : len;
> +	return sysfs_emit(buf, "ps3:%d:%d\n", dev->match_id,
> +			  dev->match_sub_id);
>  }
>  static DEVICE_ATTR_RO(modalias);

I tested this on PS3 and it seems to work OK.
Thanks for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>



