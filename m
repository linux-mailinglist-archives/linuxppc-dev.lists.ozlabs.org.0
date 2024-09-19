Return-Path: <linuxppc-dev+bounces-1467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C796697CBF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 18:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8gHb3lVnz2yJ9;
	Fri, 20 Sep 2024 02:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726761691;
	cv=none; b=oRXOCpcf/FsOi75MytYXBjJ+ZORNQrX3hYYLoeBE6w2ujb5hwxopshQVG3fqUQpqxdSXTbwe129keejgnRFIfbldSDwkrsfbrKlCbl8jSlJ76JzUOwD34jx1sSa3MDOg9f8t583rVSyojOqh9gWViESLhWdrwaXv4P2wVqTdeHk+91Xl9CPC/3hLVcxN8pyhsNEPImo319GijQZ76dPPTsdOqsamDv7qtLcXUr1GbPUq6Gs1tHfwSIfzRymA1kfmzheVxl1pkIALswY+1ih+NWHGon8ue74YWP8r+HAsygqADjC4PzmA/ACV758Izd/MtzRR5xbO1DgEvJxTbRNAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726761691; c=relaxed/relaxed;
	bh=qFsRcTH4dqvFwHspAU/RYsmB8cUfGUGMr6LZVGKB7g4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=YryXDpbbBDCNKk4mSWAMCKU9bvZJIks3LKbEIbtiGd3SyM7yzlF5n+dF5m2B33KiqHxVfHqalGmZwTvfohPBr2Daws/e6qtxFzyrIqsHdHzpkDck24S7bEKNd/84Yj54/xKWBofvKSJLqtZlPAMBIlzipcmKSITpRd8/lclyuktbHe4oekRszErbUpeTxN+iVYVgTzgviHORemW824opSdWJFYr9AVDxbFxWbRoww40O72vk96ZszLko638GC+1FFIimD7i1gA2SWNMvLfp0qiTCVAQrmiwTgoACuHlAvMYSKhc1ZJ/sUqxZMHqsnNVUNWgzUEplduHoNCkIxXRFCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVMysakL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KVMysakL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8gHb00Nkz2xjh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 02:01:29 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so692699a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726761687; x=1727366487; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qFsRcTH4dqvFwHspAU/RYsmB8cUfGUGMr6LZVGKB7g4=;
        b=KVMysakLTmVJ00HxRWfScW1AxYq6k672cI8vxn8nM8IVcENZQUviDCo2CgUEULtI91
         8YA5gxw7R6clgm7AmypJ4xbE4Va1TKrE3ZJWviol+PX4+62z57DTJPDPwgmrqOb5dK0U
         tsc5dHVGxG7XnhLP9HZrlCv5KoezSUzIAp/0lJDWg5ki9ajuien44rgfLXZeZSL+D935
         66yyBj7Vb1lO6IQVsMyaYlhKdcQdizuvy6tU0YX2CS5XZ6h8p+nKtbq+n8W6Q7Su4Bfi
         ywo5xt9MTWyFRiG+0dIH2QdcC7wwThO7lZa8xA3FvhPwFrbTM02LKbrrFKYWhWVxsIZN
         psVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726761687; x=1727366487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFsRcTH4dqvFwHspAU/RYsmB8cUfGUGMr6LZVGKB7g4=;
        b=JSZo6H8ZMTgi57YTCLCpIILuppH6U++3VtyDazliRF6HSxPabp2pixUHqADwSRbOWU
         LZMamJPkdS9TROLypi2turDtPVALr8Sa6+e+RvDIE3JEDEoFs4B+pnvew/ih4la899a/
         V/k+cnz16vZpAyBFVg9GXWq+jedilLQclD9THKU1WHwxMLgjWy/Rc1uIs3ZjUC1zgD5C
         oXM6utvg+Q+8g3fneviGzVheRmpcwjXEC3fDXLUDbyuHF2jrGR7QmjCJ1S7D9iJIsE3N
         CX53/eJc+e2KU0msuadk/9PX8IywBCOWleo+s3/9QojuZxQZSp2QBKgr1qTGbSeFlNDC
         q/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8wBSwacdpIFYskDTzwhxhmWBW0gyS6OE7tLNfw0fMH3ivPS6JM3f5M4DFzNch0zk69mhcfSnJd2oUvSo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1h5yuMUNK+2ZF1VPg85zx9Kar9SW8sQR40xnXT+oA6MfXkdmO
	h3yeBdxhftsu+cwXi2ALMDglS7OoTcL/7BImF0UbY79vyDBmus/X
X-Google-Smtp-Source: AGHT+IGSQoGV/dFPSfyt6DFt+8Gjr3FqkXJ6TCEHVhdpHE/Gfg42Mlj3KP9xkMxWihDLlukD954wuQ==
X-Received: by 2002:a17:90b:1e0a:b0:2da:8730:5683 with SMTP id 98e67ed59e1d1-2dba006a195mr28204989a91.39.1726761686528;
        Thu, 19 Sep 2024 09:01:26 -0700 (PDT)
Received: from dw-tp ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6eee0965sm2069560a91.42.2024.09.19.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:01:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block
In-Reply-To: <87bk0jbsdb.fsf@vajain21.in.ibm.com>
Date: Thu, 19 Sep 2024 21:11:27 +0530
Message-ID: <875xqrzm54.fsf@gmail.com>
References: <20240917132445.3868016-1-nnmlinux@linux.ibm.com> <871q1hbsh7.fsf@gmail.com> <87bk0jbsdb.fsf@vajain21.in.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Hi Ritesh,
>
> Thanks for looking into this patch. My responses your review inline
> below:
>
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>>
>>> Makes pseries_eeh_err_inject() available even when debugfs
>>> is disabled (CONFIG_DEBUG_FS=n). It moves eeh_debugfs_break_device()
>>> and eeh_pe_inject_mmio_error() out of the CONFIG_DEBUG_FS block
>>> and renames it as eeh_break_device().
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/
>>> Fixes: b0e2b828dfca ("powerpc/pseries/eeh: Fix pseries_eeh_err_inject")
>>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>>> ---
>>>  arch/powerpc/kernel/eeh.c | 198 +++++++++++++++++++-------------------
>>>  1 file changed, 99 insertions(+), 99 deletions(-)
>>
>> Ok, so in your original patch you implemented eeh_inject ops for pseries
>> using mmio based eeh error injection (eeh_pe_inject_mmio_error()), which
>> uses the functions defined under debugfs -> eeh_debugfs_break_device(). 
>>
>> This was failing when CONFIG_DEBUGFS is not defined, thus referring to
>> undefined function definition. 
>>
>> Minor nit below.
>>
>>>
>>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>>> index 49ab11a287a3..0fe25e907ea6 100644
>>> --- a/arch/powerpc/kernel/eeh.c
>>> +++ b/arch/powerpc/kernel/eeh.c
>>> @@ -1574,6 +1574,104 @@ static int proc_eeh_show(struct seq_file *m, void *v)
>>>  }
>>>  #endif /* CONFIG_PROC_FS */
>>>  
>>> +static int eeh_break_device(struct pci_dev *pdev)
>>> +{
>>> +	struct resource *bar = NULL;
>>> +	void __iomem *mapped;
>>> +	u16 old, bit;
>>> +	int i, pos;
>>> +
>>> +	/* Do we have an MMIO BAR to disable? */
>>> +	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
>>> +		struct resource *r = &pdev->resource[i];
>>> +
>>> +		if (!r->flags || !r->start)
>>> +			continue;
>>> +		if (r->flags & IORESOURCE_IO)
>>> +			continue;
>>> +		if (r->flags & IORESOURCE_UNSET)
>>> +			continue;
>>> +
>>> +		bar = r;
>>> +		break;
>>> +	}
>>> +
>>> +	if (!bar) {
>>> +		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	pci_err(pdev, "Going to break: %pR\n", bar);
>>> +
>>> +	if (pdev->is_virtfn) {
>>> +#ifndef CONFIG_PCI_IOV
>>> +		return -ENXIO;
>>> +#else
>>> +		/*
>>> +		 * VFs don't have a per-function COMMAND register, so the best
>>> +		 * we can do is clear the Memory Space Enable bit in the PF's
>>> +		 * SRIOV control reg.
>>> +		 *
>>> +		 * Unfortunately, this requires that we have a PF (i.e doesn't
>>> +		 * work for a passed-through VF) and it has the potential side
>>> +		 * effect of also causing an EEH on every other VF under the
>>> +		 * PF. Oh well.
>>> +		 */
>>> +		pdev = pdev->physfn;
>>> +		if (!pdev)
>>> +			return -ENXIO; /* passed through VFs have no PF */
>>> +
>>> +		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
>>> +		pos += PCI_SRIOV_CTRL;
>>> +		bit  = PCI_SRIOV_CTRL_MSE;
>>> +#endif /* !CONFIG_PCI_IOV */
>>> +	} else {
>>> +		bit = PCI_COMMAND_MEMORY;
>>> +		pos = PCI_COMMAND;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Process here is:
>>> +	 *
>>> +	 * 1. Disable Memory space.
>>> +	 *
>>> +	 * 2. Perform an MMIO to the device. This should result in an error
>>> +	 *    (CA  / UR) being raised by the device which results in an EEH
>>> +	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
>>> +	 *    so the freeze hook so the EEH Detection machinery won't be
>>> +	 *    triggered here. This is to match the usual behaviour of EEH
>>> +	 *    where the HW will asynchronously freeze a PE and it's up to
>>> +	 *    the kernel to notice and deal with it.
>>> +	 *
>>> +	 * 3. Turn Memory space back on. This is more important for VFs
>>> +	 *    since recovery will probably fail if we don't. For normal
>>> +	 *    the COMMAND register is reset as a part of re-initialising
>>> +	 *    the device.
>>> +	 *
>>> +	 * Breaking stuff is the point so who cares if it's racy ;)
>>> +	 */
>>> +	pci_read_config_word(pdev, pos, &old);
>>> +
>>> +	mapped = ioremap(bar->start, PAGE_SIZE);
>>> +	if (!mapped) {
>>> +		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
>>> +		return -ENXIO;
>>> +	}
>>> +
>>> +	pci_write_config_word(pdev, pos, old & ~bit);
>>> +	in_8(mapped);
>>> +	pci_write_config_word(pdev, pos, old);
>>> +
>>> +	iounmap(mapped);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
>>> +{
>>> +	return eeh_break_device(pdev);
>>> +}
>>> +
>>
>> Why have an extra eeh_pe_inject_mmio_error() function which only calls
>> eeh_break_device()?
>>
>> Maybe we can rename eeh_break_device() to eeh_mmio_break_device() and use
>> this function itself at both call sites?
>
> Fair suggestion,
>
> However we want to keep the method debugfs interface uses
> to inject EEH (thats ppc platform agonistic), decoupled from what pseries
> uses. Right now to support as initial work VFIO EEH injection on
> pseries, we are piggy backing on eeh_debugfs_break_device().

Right. 

>
> This will change in future as we add more capabilities to pseries EEH
> injection and this will change working of eeh_pe_inject_mmio_error()
> without impacting the semantics of existing eeh_break_device().

Thanks Vaibhav for the context. 

The debugfs interface "eeh_break_device()" is defined here in
"arch/powerpc/kernel/eeh.c". Those "future pseries changes" could remain
in arch/powerpc/platforms/pseries/eeh_pseries.c using the generic
functions defined from <>/kernel/eeh.c, right. And today
eeh_pe_inject_mmio_error() has nothing pseries specific anyway.

But I get it that this is a minor compile fix for the patch that has
already landed in 6.12 now. As I said earlier too, this was just a minor
nit.

Maybe we could get rid of this redundant function later when we add
pseries specific capabilities (if we still find this extra function has
no use).

So - 

Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


