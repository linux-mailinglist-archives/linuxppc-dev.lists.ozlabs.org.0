Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B285A7E8816
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 03:08:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTwQuqf2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRzcx4Xcyz3clB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 13:08:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LTwQuqf2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRzc43Yb7z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 13:07:46 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b20a48522fso2394234b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699668462; x=1700273262; darn=lists.ozlabs.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us4PH3hYSKV8M14QXIBOyvA+4JqUtwc0XH3JtG4nmDY=;
        b=LTwQuqf2hJbhl2H9gl9hLJL5R/bdTUKaAe6rnrhwbK9aMelAds1Z4NozIXq23vbZiF
         uCBL6lwp54IpG1uBXYoKMuEkHc2+7fW8LWXHvQYYdPlN0N3jlDCYqmCNfyI5dNAMg8V3
         KTtlb4VCjKnIiuDOVofKEB57uUomFSdpnq/E4DYAjdxU/Ce6Mo9A4OJh6aDS8PatQcqg
         VqdhDRSmoO3QNAYOeImUCRdzyOfQJrTMbuYnPZmyS4YlR0/sEnN30jgFKYiHGx2jWF/d
         t1TfBPApC/B2GFrbVAeiqhjKBZDwmQXpd9NFnLKE93p3FqVnLhm5Wu5JhTKj3WT68lEE
         h6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699668462; x=1700273262;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=us4PH3hYSKV8M14QXIBOyvA+4JqUtwc0XH3JtG4nmDY=;
        b=qH7MR/zX30piBx0wIT/gopgHoaZX3iEKHdNZMOwMVGN4FySqPCeFoxJLX78VRMCBZg
         olsFwSjw3hL2DhSPV71AHPbhs0XaTOD1oiD1sxbDtjEeCNXBf6nxkBdNkn4oE83PDAaj
         5BcQV9k1SpvRk7TAPfEmo+Ud/NXp543gERttMSqvRC1uvtgrQtKYM4N+gTW2+vBl1+A0
         Ozmbnjp897Myf/A/piosMzukujwx3+AheB4J69TZ1L9uMf154a6HjPNOAQSNlwq20uK1
         0w9kEYfPKtHfV07KRfDubJhyFfqbpv9VUrLvnmDwIZsiQZb3i3swNNAs7/+VQwGtttWo
         udzw==
X-Gm-Message-State: AOJu0YyV3wjE1E13OwUS7IgtwpfzEypGK3tAzP5VcwMnlJsXMIqoIqWA
	vvo/RfIRbVTpr/+9OcdNVuI=
X-Google-Smtp-Source: AGHT+IHNBBW3BK8jyaoUi7xXcxcZdBpSdb0qc7l3zTckarw97gd+X2tbBj1Oc1EwReuZ3Rk530zP9g==
X-Received: by 2002:a05:6a20:ce83:b0:131:b3fa:eaaa with SMTP id if3-20020a056a20ce8300b00131b3faeaaamr588855pzb.61.1699668462452;
        Fri, 10 Nov 2023 18:07:42 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001a9b29b6759sm308895pll.183.2023.11.10.18.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 18:07:41 -0800 (PST)
Message-ID: <60585667-70ca-4ace-8d8f-dbdd8d4428a6@gmail.com>
Date: Sat, 11 Nov 2023 09:07:35 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: The PCIe AER error flood between PCIe bridge and Realtek's
 RTL8723BE makes system hang
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Ping-Ke Shih <pkshih@realtek.com>, Oliver O'Halloran <oohall@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Jian-Hong Pan <jhp@endlessos.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> We have an ASUS X555UQ laptop equipped with Intel i7-6500U CPU and Realtek RTL8723BE PCIe Wireless adapter.
> 
> We tested it with kernel 6.6.  System keeps showing AER error message flood, even hangs up, until rtl8723be's ASPM is disabled.
> 
> kernel: pcieport 0000:00:1c.5: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
> kernel: pcieport 0000:00:1c.5:   device [8086:9d15] error status/mask=00000001/00002000
> kernel: pcieport 0000:00:1c.5:    [ 0] RxErr                  (First)
> kernel: pcieport 0000:00:1c.5: AER: Corrected error received: 0000:00:1c.5
> kernel: pcieport 0000:00:1c.5: AER: can't find device of ID00e5
> kernel: pcieport 0000:00:1c.5: AER: Corrected error received: 0000:00:1c.5
> kernel: pcieport 0000:00:1c.5: AER: can't find device of ID00e5
> kernel: pcieport 0000:00:1c.5: AER: Multiple Corrected error received: 0000:00:1c.5
> kernel: pcieport 0000:00:1c.5: AER: can't find device of ID00e5
> 
> Here is the PCI tree:
> $ lspci -tv
> -[0000:00]-+-00.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers
>            +-02.0  Intel Corporation Skylake GT2 [HD Graphics 520]
>            +-04.0  Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
>            +-14.0  Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
>            +-14.2  Intel Corporation Sunrise Point-LP Thermal subsystem
>            +-15.0  Intel Corporation Sunrise Point-LP Serial IO I2C Controller #0
>            +-15.1  Intel Corporation Sunrise Point-LP Serial IO I2C Controller #1
>            +-16.0  Intel Corporation Sunrise Point-LP CSME HECI #1
>            +-17.0  Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode]
>            +-1c.0-[01]----00.0  NVIDIA Corporation GM108M [GeForce 940MX]
>            +-1c.4-[02]----00.0  Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
>            +-1c.5-[03]----00.0  Realtek Semiconductor Co., Ltd. RTL8723BE PCIe Wireless Network Adapter
>            +-1f.0  Intel Corporation Sunrise Point-LP LPC Controller
>            +-1f.2  Intel Corporation Sunrise Point-LP PMC
>            +-1f.3  Intel Corporation Sunrise Point-LP HD Audio
>            \-1f.4  Intel Corporation Sunrise Point-LP SMBus

And then the reporter found that it was ASPM bug:

> Notice a long time ago discussion mail: Dmesg filled with "AER: Corrected error received" [1]
> 
> So, I force write 1 to clear Receiver Error Status bit of Correctable Error Status Register, like
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9c8fd69ae5ad..39faedd2ec8e 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1141,8 +1160,9 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>                         e_info.multi_error_valid = 0;
>                 aer_print_port_info(pdev, &e_info);
>  
> -               if (find_source_device(pdev, &e_info))
> -                       aer_process_err_devices(&e_info);
> +               //if (find_source_device(pdev, &e_info))
> +               //      aer_process_err_devices(&e_info);
> +               pci_write_config_dword(pdev, pdev->aer_cap + PCI_ERR_COR_STATUS, 0x1);
>         }
>  
>         if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> 
> Then, system should clear the error right away.  However, system still get the AER flood ...
> 
> Seems that we still have to disable rtl8723be's ASPM.

See Bugzilla for the full thread and attached full kernel logs.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218127

-- 
An old man doll... just what I always wanted! - Clara
