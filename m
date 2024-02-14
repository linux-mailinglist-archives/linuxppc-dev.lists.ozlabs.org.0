Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763058551B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 19:11:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cSe9QANo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZmVG2kZqz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 05:11:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=cSe9QANo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZmTW6pyPz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 05:10:55 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7872bc61fd2so3383085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 10:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1707934251; x=1708539051; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NxJECfpMRF8c2GbwL7RYFmi85n9Gnxdrw1xOB+mHj0=;
        b=cSe9QANoEIQP0i4KzYRnSbigF255zOODTOGvqWMqvi/tT2z1qNdrPVRZE+s2xKc6x2
         FsaOgM9H7Ag8fwd9P0UDjBGh4kjj07xUnGsWFUuwJrhoP60judGkjAUOIPcf6TVR3Lr6
         wMQwdisDe2iXEI2Cvq3pHqnEUqwL9LXz7Cw1HntqcedNMqlumzjmWMd6/8LveETPGAVo
         Nn9B1p9wXyEmPew1AQmHPKq4D/+O6fVgFezAP5mi9blW77hpvoJGdL1d4+k8w8EuZfk4
         YinQRE+PBVAKx7cxyqiTE3hCTg8W5pUwQ0STlK5Nvh4FcUu0BzKRqTLmNnBolH2WupA9
         nqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934251; x=1708539051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NxJECfpMRF8c2GbwL7RYFmi85n9Gnxdrw1xOB+mHj0=;
        b=HIEIwzxsk18E377m6QYFy7yUTFSlVM4oy2mqQztxcbaFvyjjxYvYbPS4imdAKJCS53
         IZLL44BhrDdxU9oH5fRoR/m/USUl9W5KZtj70Uxwd56bWu1vWT1ldBP1UHabK5XlHaul
         N5T/+zxWIMtmBDNFiN3tVXs46EAnSE1us1cDRqu+vwRRtPhq1JX9RoX/j9QjkHgVay2W
         L2rzdIZ4sR+Cy3kk9S+5cRnOnYbuoyVWSOOu+BRbg7zSdURudfHreAhx1ORHJ79wObX0
         +LWdXoU2rkz3zfkxtWhUvbEwhTeS1rPezxoDgpJbWxkfgAH0EBS5r0OF+MPnY08YxbHa
         Jm6A==
X-Forwarded-Encrypted: i=1; AJvYcCU3pe9C24aJG0RxomShXC2JatoTsePJepCb1r9K/2Ya+NzDVrgtlfhDXNf+kHpt2X6NGTJuTGevRkc9oV+QjPW15RvPGnQsjPKu7fkn9Q==
X-Gm-Message-State: AOJu0YxOdwEloLxNCnCI9uFJFwYtTmvyhMqs7nC8oGvQ9CVvgnD3gx1c
	Ta3hMP4OOlhYXj732CNB9NpHupfnf94wRwACz0x0RnCBA2qrgchz4W0tuB4pUws=
X-Google-Smtp-Source: AGHT+IFxJ5Oyh0vuYSwporQYabR5lakJ3bNo5TaWRxTZ4pE3VjQhS2h6z4sU20cMHnc/Nzni0200LA==
X-Received: by 2002:a0c:e1d3:0:b0:68f:487:d26d with SMTP id v19-20020a0ce1d3000000b0068f0487d26dmr1918722qvl.44.1707934250871;
        Wed, 14 Feb 2024 10:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUacb9awFsWp+T7G87yMPADUj7s0lLcZZEQGbM4hxxWBROamLlFhBeh++usHhOAhKn2zu74tLgWkSPtspeTmkpbd3NK79jBpPKiO6TeqA1UdFrhGaPugRpewjCMGnEsjXS/M5DV9w8hxOyieiEpcMQLLjKECDkzUFiUDGIg/HA7S7+0V0F1VnbIO2gMi2sJifTmYGNInzSDmKuFXgusz8PwevnysXATZabqKMZPZ0jG3AiPGE2mIe+iH8ivaqqfD3yk30NY/nwfbrD73lS++9CK+41mnTACxu3Sl8T1eUrNfGdK6Muvfps3TadeNqS6xNqXiMXwcrgpE7Mh1BFrKalwhALWP56H84v1yjPjdRDaksKRYh8RvuUPF66g6eP8rEWxWL/+aEJ3BP5YRzxdcRn1tcuJ+9q6st/z7beWEX+F4Yp8Y3uOOny2oTlXHhxMYaQmSJKv6Ld7Uf1bUSGkElLK4mWEHGb9IFbHV3b7K6FXuSPuINKiPgt0RDS4UBHBvo5M//+I99gt2bTvdt2Onis92hi/71X+DVCUYOZsnT1lBhon
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id me15-20020a0562145d0f00b0068cdbdb8af8sm2490567qvb.119.2024.02.14.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:10:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1raJib-00BonQ-Px;
	Wed, 14 Feb 2024 14:10:49 -0400
Date: Wed, 14 Feb 2024 14:10:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/iommu: Fix the iommu group reference leak
 during platform domain attach
Message-ID: <20240214181049.GB1299735@ziepe.ca>
References: <170793401503.7491.9431631474642074097.stgit@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170793401503.7491.9431631474642074097.stgit@linux.ibm.com>
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
Cc: venkat88@linux.vnet.ibm.com, jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 12:09:24PM -0600, Shivaprasad G Bhat wrote:
> The function spapr_tce_platform_iommu_attach_dev() is missing to call
> iommu_group_put() when the domain is already set. This refcount leak
> shows up with BUG_ON() during DLPAR remove operation as,
> 
>   KernelBug: Kernel bug in state 'None': kernel BUG at arch/powerpc/platforms/pseries/iommu.c:100!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=8192 NUMA pSeries
>   <snip>
>   Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_016) hv:phyp pSeries
>   NIP:  c0000000000ff4d4 LR: c0000000000ff4cc CTR: 0000000000000000
>   REGS: c0000013aed5f840 TRAP: 0700   Tainted: G          I         (6.8.0-rc3-autotest-g99bd3cb0d12e)
>   MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44002402  XER: 20040000
>   CFAR: c000000000a0d170 IRQMASK: 0
>   GPR00: c0000000000ff4cc c0000013aed5fae0 c000000001512700 c0000013aa362138
>   GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000119c8afd0
>   GPR08: 0000000000000000 c000001284442b00 0000000000000001 0000000000001003
>   GPR12: 0000000300000000 c0000018ffff2f00 0000000000000000 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: c0000013aed5fc40 0000000000000002 0000000000000000 c000000002757d90
>   GPR28: c0000000000ff440 c000000002757cb8 c00000183799c1a0 c0000013aa362b00
>   NIP [c0000000000ff4d4] iommu_reconfig_notifier+0x94/0x200
>   LR [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200
>   Call Trace:
>   [c0000013aed5fae0] [c0000000000ff4cc] iommu_reconfig_notifier+0x8c/0x200 (unreliable)
>   [c0000013aed5fb10] [c0000000001a27b0] notifier_call_chain+0xb8/0x19c
>   [c0000013aed5fb70] [c0000000001a2a78] blocking_notifier_call_chain+0x64/0x98
>   [c0000013aed5fbb0] [c000000000c4a898] of_reconfig_notify+0x44/0xdc
>   [c0000013aed5fc20] [c000000000c4add4] of_detach_node+0x78/0xb0
>   [c0000013aed5fc70] [c0000000000f96a8] ofdt_write.part.0+0x86c/0xbb8
>   [c0000013aed5fce0] [c00000000069b4bc] proc_reg_write+0xf4/0x150
>   [c0000013aed5fd10] [c0000000005bfeb4] vfs_write+0xf8/0x488
>   [c0000013aed5fdc0] [c0000000005c0570] ksys_write+0x84/0x140
>   [c0000013aed5fe10] [c000000000033358] system_call_exception+0x138/0x330
>   [c0000013aed5fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>   --- interrupt: 3000 at 0x20000433acb4
>   <snip>
>   ---[ end trace 0000000000000000 ]---
> 
> The patch makes the iommu_group_get() call only when using it there by
> avoiding the leak.
> 
> Fixes: a8ca9fc9134c ("powerpc/iommu: Do not do platform domain attach atctions after probe")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/all/274e0d2b-b5cc-475e-94e6-8427e88e271d@linux.vnet.ibm.com
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
> Changelog:
> v1: https://lore.kernel.org/all/170784021983.6249.10039296655906636112.stgit@linux.ibm.com/
>  - Minor refactor to call the iommu_group_get() only if required.
>  - Updated the title, description and signature(Closes/Reported-by).
> 
>  arch/powerpc/kernel/iommu.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks again,
Jason
