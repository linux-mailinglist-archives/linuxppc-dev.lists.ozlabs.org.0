Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991D846067
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 19:53:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CQgqR/4H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQp2V0l0Rz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 05:53:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CQgqR/4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQp1j4KBwz3c89
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 05:52:39 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-42a029c8e62so8125381cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 10:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706813553; x=1707418353; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7eTCfSpE8BSX3w2muEo/jhEsigVfUc1eYeRG/TfFs0A=;
        b=CQgqR/4HKOpWmzG2ndHa23Q+ieQLaqFdIHENExnaIZxtFNMjw9DR1+w7WNXPo/dt2M
         Qa3Eqr+cNlXspSFF8tAmumLPipk7sdNnX85Awa74Y/F0gYzhtu5Lnm37JEq96ZHEY0Ij
         M0R+BuxoX7axMvNdxzMsSxfPIFM3AscNn85cXrAL/wtImIOE1uK42APTSZmERkBbsF82
         DUGNMLn97Z6Vt3+OguwrZvvr2ThsIcD4slDgUtGEezNhQUAgct/lHyqYvQRziaxJg4NH
         DZiNagZzt+c6Gd+c5nJHJTZ3+EPA7tZdMw4YChfRQrwMHiWB2asyq4dOj802vhReOvCx
         Ahvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706813553; x=1707418353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eTCfSpE8BSX3w2muEo/jhEsigVfUc1eYeRG/TfFs0A=;
        b=AfgGyWKYKFBSLvOqKVCnVucQcFViabQ+b2BEZcj0cQzT3zE2HNiC0QX0mfLk1nfSnI
         GxSyJ311lQ1+FiAZ14xP4Ijknhw2gE5VNyVKLyw61Wxb0tP+1qh35L5wXska68xFYBAk
         SHIrf+G6IfMXjsvE2upQSSoKfePhwPiMeshwhfF2b+CMRT1SQbaQ9T6BROLeHA8bX5/7
         DBemFnvnA5kcXWAJpU+ZgiPDPEGUba1e+TQn4TiNCH0MGiuRVPp15qhsqJemC+tdSuEw
         09xUyl83Melk5HUX/qRAts2iCD5j8GQxRrxVl5z0iPGT7gakiSJvxEstvL1eliPm4ZEA
         GaYA==
X-Gm-Message-State: AOJu0YwT1FwBUGrRpHENeCbqNaeiBYekqp+gjV0RdU7L5avplpfX9age
	Q/VHCcHupEZlAuSmb+AAQ1sEH5sXFOhFDiSDhKU6ooacicMMA0iEnZa7MV4mhxw=
X-Google-Smtp-Source: AGHT+IFgJjDZxGoU+AfH6P+MRx9vRucn+J7TQs9/JS1FLA6fwYCChoHxRRKWYO6S0i3pCkO2ELKixA==
X-Received: by 2002:a05:622a:1b16:b0:42a:b346:4e10 with SMTP id bb22-20020a05622a1b1600b0042ab3464e10mr6579555qtb.39.1706813552851;
        Thu, 01 Feb 2024 10:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWvSVnDQ95l7NoA6swosk450Ra3893m7dUOxMRLKXwIczYcRr98wDcEaSiaXjPZGbqgqjb9aOVo8tKTXjI6QLEbWkFTCNQzlFGOelvNhYrOPQt1rMPtbQj2oAlPY2ChcstNH2lvjXfoR7NnIx236XeajzyDy5QwmCHJ6XIM+6+Y2EMxnjWjAyzLu98dsRXPqjdZh9k18rSZEOrWbGf1NZv/6yGuCdla1KhCfNuMYyoSM7O09WPAb6c/G6w4U7gg8cYF5BX80/cL0ReHSabR2tUund0W2x280+7ECvcV7bj4DSFENmWtAStsICp0G77sdMQqXGK283bQtfHQc5w+pnNiVFXcaTBzdy1ABf8s1PrkKSECFbXkXsO+o7MEScGfGLvsZDq8nkTcyiMLpm+VTb4/XmTfHJHldNvoYDI+Ly2OaMa/pAKVMRit1oM0dw9rDZQDp+Zlu0WhyTxdnFV/d40VsjpgvMYZhY8ws3MpssDL2SbgqxmokUlNVB4ds5lQUYAE+F02PQ==
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id bs26-20020ac86f1a000000b0042a992d8289sm43838qtb.19.2024.02.01.10.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 10:52:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rVcAp-00AnuA-Ka;
	Thu, 01 Feb 2024 14:52:31 -0400
Date: Thu, 1 Feb 2024 14:52:31 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc: iommu: Bring back table group
 release_ownership() call
Message-ID: <20240201185231.GP50608@ziepe.ca>
References: <170628173462.3742.18330000394415935845.stgit@ltcd48-lp2.aus.stglab.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170628173462.3742.18330000394415935845.stgit@ltcd48-lp2.aus.stglab.ibm.com>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 26, 2024 at 09:09:18AM -0600, Shivaprasad G Bhat wrote:
> The commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and
> remove set_platform_dma_ops") refactored the code removing the
> set_platform_dma_ops(). It missed out the table group
> release_ownership() call which would have got called otherwise
> during the guest shutdown via vfio_group_detach_container(). On
> PPC64, this particular call actually sets up the 32-bit TCE table,
> and enables the 64-bit DMA bypass etc. Now after guest shutdown,
> the subsequent host driver (e.g megaraid-sas) probe post unbind
> from vfio-pci fails like,
> 
> megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0x7fffffffffffffff, table unavailable
> megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0xffffffff, table unavailable
> megaraid_sas 0031:01:00.0: Failed to set DMA mask
> megaraid_sas 0031:01:00.0: Failed from megasas_init_fw 6539
> 
> The patch brings back the call to table_group release_ownership()
> call when switching back to PLATFORM domain from BLOCKED, while
> also separates the domain_ops for both.
> 
> Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
> Changelog:
> v1: https://lore.kernel.org/linux-iommu/170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com/
>  - Split the common attach_dev call to platform and blocked attach_dev
>    calls as suggested.
> 
>  arch/powerpc/kernel/iommu.c |   37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> @@ -1312,13 +1312,32 @@ static struct iommu_domain spapr_tce_platform_domain = {
>  	.ops = &spapr_tce_platform_domain_ops,
>  };
> 
> -static struct iommu_domain spapr_tce_blocked_domain = {
> -	.type = IOMMU_DOMAIN_BLOCKED,
> +static int
> +spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,

It was my typo but this should be "struct iommu_domain *blocked_domain"

Jason
