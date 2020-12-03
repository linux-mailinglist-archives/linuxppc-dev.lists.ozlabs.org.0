Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C22CD4A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 12:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmtyZ22X0zDrNL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 22:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cmtq96DnlzDrM1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 22:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fZP6igB0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cmtq71dWPz9sW0;
 Thu,  3 Dec 2020 22:27:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606994852;
 bh=DhZJx6VS2S3i6rp5eGQb6lMVR2DlQIxOHgVG1xjGFrE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fZP6igB0dffXJpVPcdAMjoblQ8MgiPxVagbU9j32aVvdtENZ340u7asmb/zevIMam
 0Zljjs9YIrqkIlnKZNVdDT3NCKBiIziUjE/G02oMM1J4m1sbKNebe4IpqGKedl8RAl
 wU3n3OS6J1yqIJPH3Bqdx9iUtYQbs6Os7HVLNgJnO3GdxCQq3KYZC6ZG8wehxxixcr
 JXHk6z0kY89GyKR60cUw2IYC7ReC5nPHHRs4ESewl/BBx98TlPWJvt21tXRj3BqsPy
 THBPRrHyz/KN9pSs65pYUw6EGble1woG2YzV7nYVM6C9R1AvLrCykcMzvNV+MlRVnU
 V7fkwXYOLHmfg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] EDAC,
 mv64x60: Fix error return code in mv64x60_pci_err_probe()
In-Reply-To: <20201202112515.GC2951@zn.tnic>
References: <20201124063009.1529-1-bobo.shaobowang@huawei.com>
 <20201202112515.GC2951@zn.tnic>
Date: Thu, 03 Dec 2020 22:27:25 +1100
Message-ID: <87pn3ruo2q.fsf@mpe.ellerman.id.au>
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
Cc: cj.chengjian@huawei.com, linux-kernel@vger.kernel.org,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, james.morse@arm.com,
 huawei.libin@huawei.com, mchehab@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@alien8.de> writes:
> On Tue, Nov 24, 2020 at 02:30:09PM +0800, Wang ShaoBo wrote:
>> Fix to return -ENODEV error code when edac_pci_add_device() failed instaed
>> of 0 in mv64x60_pci_err_probe(), as done elsewhere in this function.
>> 
>> Fixes: 4f4aeeabc061 ("drivers-edac: add marvell mv64x60 driver")
>> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
>> ---
>>  drivers/edac/mv64x60_edac.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/edac/mv64x60_edac.c b/drivers/edac/mv64x60_edac.c
>> index 3c68bb525d5d..456b9ca1fe8d 100644
>> --- a/drivers/edac/mv64x60_edac.c
>> +++ b/drivers/edac/mv64x60_edac.c
>> @@ -168,6 +168,7 @@ static int mv64x60_pci_err_probe(struct platform_device *pdev)
>>  
>>  	if (edac_pci_add_device(pci, pdata->edac_idx) > 0) {
>>  		edac_dbg(3, "failed edac_pci_add_device()\n");
>> +		res = -ENODEV;
>>  		goto err;
>>  	}
>
> That driver depends on MV64X60 and I don't see anything in the tree
> enabling it and I can't select it AFAICT:
>
> config MV64X60
>         bool
>         select PPC_INDIRECT_PCI
>         select CHECK_CACHE_COHERENCY

It was selected by PPC_C2K, but that was dropped in:

  92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")

> PPC folks, what do we do here?
>
> If not used anymore, I'd love to have one less EDAC driver.

It's dead code, so drop it.

I can send a patch if no one else wants to.

cheers
