Return-Path: <linuxppc-dev+bounces-4457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D88229FB30C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 17:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH3gB5M1sz3029;
	Tue, 24 Dec 2024 03:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734972054;
	cv=none; b=iw1i84UUxZf3hlRSPdcneBQuobP2SvdvKRBaq4Ur0h4rm65ARE2LtZnzhdgPMh8NUdPdqw1alZ66FgoAOSrJlcz6JzE8Vc+VoapfQ6HHpd4M+DQlrT8wLIiq/nZf+P2mkFkomycvhEBoNkfeJOGGVGEFnCbYDMDQu4BddlsfQ2TML44tvQyihPobulpuCTPm9ikcKinW3n4OWfB0Ngif5uxIQ92y/JL2Fu13RcMWagjVxJvayO16hkdZn7nzsKruSDg2Ur6B+wvNA+/ckXYB5yE7oKCtihFIRosgwJsX6Gh4Kf7uG0PdDD0U76lqj9RtlncdiIcvTgGydxW0GngASw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734972054; c=relaxed/relaxed;
	bh=uo0MWwx2TONSie6j7dPCTx555fuTAXJlHre5U2yl5+4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNaBHMqhtLIqJee9TKZKyK+QCMN3VH6/AR4JcLybbgz+hEVCxmq1no5bUrIbT+JYNJko1Egj6cejT4wIjZdVuLq9ReXepIcX4FVCrhzkevtSGQ7HCSZNF/PX4GWbo1EyiYSjAiURh/Kg712Gf/u+AgEs/xSmcp7VTrmPNL4xKySSBbPJ1+BN7NKh25C3/mWCwhPY4yLZhxgc+yzd6PKaFabOSTnuWs5JQ9kqL0tIZDJvAP/oLSUQlt/x10ZJ0UQXhqofEdK9Ml6pO4jRArYlWANKQjgX/KX5c1BDhdxNn5/mtX3qBI4/fpGNJuCbjxztvsVUJPSp7ZiZ55BFvN/ygQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH3g9665Pz301x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 03:40:53 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3Zh5yRRz6K9Vv;
	Tue, 24 Dec 2024 00:37:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 53CFD140B2F;
	Tue, 24 Dec 2024 00:40:51 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:40:50 +0100
Date: Mon, 23 Dec 2024 16:40:48 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
Message-ID: <20241223164048.00007a26@huawei.com>
In-Reply-To: <20241220075313.51502-5-yangyicong@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-5-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Dec 2024 15:53:13 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Enable HOTPLUG_SMT for SMT control.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
FWIW LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..1ee926e2252e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -246,6 +246,7 @@ config ARM64
>  	select HAVE_KRETPROBES
>  	select HAVE_GENERIC_VDSO
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> +	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select KASAN_VMALLOC if KASAN


