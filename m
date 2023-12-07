Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1597807E15
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 02:44:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slxsf1RHRz3dK0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 12:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=jiangyunshui@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slxs51pLzz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 12:44:24 +1100 (AEDT)
X-UUID: 5aa9ead4bf7f45ebb64da22b7e64f6e2-20231207
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:8fb5be05-f92e-467d-8ff9-69eadee6c510,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:1,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-INFO: VERSION:1.1.33,REQID:8fb5be05-f92e-467d-8ff9-69eadee6c510,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:1,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:364b77b,CLOUDID:6768e760-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:2312070943101BF84CQB,BulkQuantity:0,Recheck:0,SF:100|66|24|72|19|42|
	101|74|64|102,TC:nil,Content:1,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 5aa9ead4bf7f45ebb64da22b7e64f6e2-20231207
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 733524998; Thu, 07 Dec 2023 09:43:08 +0800
From: jiangyunshui <jiangyunshui@kylinos.cn>
To: christophe.leroy@csgroup.eu
Subject: Re: [PATCH] ocxl: fix driver function comment typo
Date: Thu,  7 Dec 2023 09:43:07 +0800
Message-Id: <20231207014307.12256-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2f2aca95-f5a6-45fa-9e3b-37aecf657299@csgroup.eu>
References: <2f2aca95-f5a6-45fa-9e3b-37aecf657299@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, kernel-bot@kylinos.cn, linux-kernel@vger.kernel.org, jiangyunshui@kylinos.cn, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Date: Tue, 5 Dec 2023 11:00:16 +0000	[thread overview]
> Message-ID: <2f2aca95-f5a6-45fa-9e3b-37aecf657299@csgroup.eu> (raw)
> In-Reply-To: <20231205094319.32114-1-jiangyunshui@kylinos.cn>

> Please add a description explaining why you want to do that change.

> When I grep I see cxlflash driver, I don't know what ocxlflash driver is:

> $ git grep ocxl_config_read_afu
> ...
> drivers/scsi/cxlflash/ocxl_hw.c:        rc = ocxl_config_read_afu(pdev, 
> fcfg, acfg, 0);
> drivers/scsi/cxlflash/ocxl_hw.c:                dev_err(dev, "%s: 
> ocxl_config_read_afu failed rc=%d\n",
> include/misc/ocxl.h:int ocxl_config_read_afu(struct pci_dev *dev,

> Christophe

I checked my commit again and found I'd mismatched the driver's name with other things.
As you said it doesn't make sense to change cxlflash to ocxlflash.
Sorry for the inconvenience, you could just drop my commit please.
Thanks,

Yunshui

> ---
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
> ---
>   include/misc/ocxl.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 3ed736da02c8..ef7d26009a36 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -324,7 +324,7 @@ int ocxl_global_mmio_clear32(struct ocxl_afu *afu, size_t offset,
>   int ocxl_global_mmio_clear64(struct ocxl_afu *afu, size_t offset,
>                               enum ocxl_endian endian, u64 mask);
>
> -// Functions left here are for compatibility with the cxlflash driver
> +// Functions left here are for compatibility with the ocxlflash driver
>
>   /*
>    * Read the configuration space of a function for the AFU specified by
> --
> 2.25.1
>
