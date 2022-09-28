Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A05ED3D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 06:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcjww2xPmz3bWB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 14:21:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hooLisGa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hooLisGa;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McjwD2JvMz2xkV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 14:20:41 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 78so11137745pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 21:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yFiQRqenBnP9hKkiD46tWPwfT0QDu8/bSPBGZoBlzgg=;
        b=hooLisGajE4+4MwjNaS+l0+/mZZQz4+CXmfDaAvTbcp9Vb50hZQ8aJX/wZVVTmklb8
         n6kAK0pb7T39ni+nyQij+Z33mFANX2gP59HOmQ2XVe9TpjPpvoK1f31TcXv/n0YN4Bbg
         oS0dvXxSAH+KGgT83rhf206mzkxGsmpGkXwP3xhud1dynDIW1Yi7bNpwtojs8D5EWod6
         3xDmV6JqIpMjZ3OETd+JUcNTA6KSjVFhr1gGxbBi0ltsZvxy/Lu2xv4k9gusJ2nJ0p2J
         1TEuv26ILz7fv5H1uHRQbi5VKSiuCyR7YSF24qohAlC1hw9HPvEcGBSYype8ptPffYj2
         W0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yFiQRqenBnP9hKkiD46tWPwfT0QDu8/bSPBGZoBlzgg=;
        b=xNNJVHe6ek8T55HvcyfnofCIRSYU/Duo82txqQ6Io6da0a6LWHIq1vuBlUNU7EfGCk
         YGa4ffjvfoR1F1lhvsuIcILvAeDFT5Pub5LkLlI6ygsthESCu7G8Ubuts/tk7b0S1MEu
         +hwEnHzkYt8cWFR/5yEh/TV9J36s9TnlvsUj+umkF0be4GM25+le9GQ+7hI/ltJJ90Fg
         DdcBibt68GMht5ZKRH6DtIAjpyDsdmMW+NfYRTvKr9G4CORcEy1A4GmrIHy+H53pDDWe
         lbup2O85/8Q7oLIDGgY5AAwmW3BBIlPJoAUNim9GIWw4oxAu6YmdwkqeeAoOsbH1TSQz
         mK+A==
X-Gm-Message-State: ACrzQf2F7dcfRvgh5MmXvN8V7PMwqtvAbLtG8AdIYcytWKqdMCqrQuF5
	lIcU1lSCYu37u41VF55xctL3Sw==
X-Google-Smtp-Source: AMsMyM50itfQ0DRAQQIEThIt2ysECjrFQ4ghVKeFxS0QdAhHPdJh+YEyANskKckc0yUejONhTF50Sg==
X-Received: by 2002:a65:644c:0:b0:43c:e614:ae0e with SMTP id s12-20020a65644c000000b0043ce614ae0emr7481081pgv.491.1664338839008;
        Tue, 27 Sep 2022 21:20:39 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:f:181d:9138:3f2b:d59e? ([2400:8800:1f02:83:4000::7])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902680800b0017a018221e2sm324111plk.70.2022.09.27.21.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 21:20:38 -0700 (PDT)
Message-ID: <1d62d0ac-b47c-94b5-dd75-b7df71817d0d@bytedance.com>
Date: Wed, 28 Sep 2022 12:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [External] Re: [PATCH v2 3/9] NTB: Change to use
 pci_aer_clear_uncorrect_error_status()
Content-Language: en-US
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 bhelgaas@google.com, ruscur@russell.cc, oohall@gmail.com,
 fancer.lancer@gmail.com, jdmason@kudzu.us, dave.jiang@intel.com,
 allenbh@gmail.com, james.smart@broadcom.com, dick.kennedy@broadcom.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-4-chenzhuo.1@bytedance.com>
 <d8123aa3-a5e0-6131-bd0d-109f67923ff2@linux.intel.com>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <d8123aa3-a5e0-6131-bd0d-109f67923ff2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/28/22 3:39 AM, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 9/27/22 8:35 AM, Zhuo Chen wrote:
>> Status bits for ERR_NONFATAL errors only are cleared in
>> pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
>> error status in idt_init_pci(), so we change to use
>> pci_aer_clear_uncorrect_error_status().
> 
> You mean currently driver does not clear fatal errors now, and it is
> a problem? Any error reported?
> 
Hi Sathyanarayanan,

No error reports yet, I just changes the behavior back to what it was 
before commit e7b0b847de6d ("PCI/AER: Clear only ERR_NONFATAL bits 
during non-fatal recovery"), because this commit change the original 
function in commit bf2a952d31d2 ("NTB: Add IDT 89HPESxNTx PCIe-switches 
support").

> Also, I am wondering why is it required to clear errors during init
> code. Is it a norm?
> 
I think there is no need to clear errors during init code.
>>
>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>> ---
>>   drivers/ntb/hw/idt/ntb_hw_idt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
>> index 0ed6f809ff2e..d5f0aa87f817 100644
>> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
>> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
>> @@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>>   	ret = pci_enable_pcie_error_reporting(pdev);
>>   	if (ret != 0)
>>   		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
>> -	else /* Cleanup nonfatal error status before getting to init */
>> -		pci_aer_clear_nonfatal_status(pdev);
>> +	else /* Cleanup uncorrectable error status before getting to init */
>> +		pci_aer_clear_uncorrect_error_status(pdev);
>>   
>>   	/* First enable the PCI device */
>>   	ret = pcim_enable_device(pdev);
> 

-- 
Thanks,
Zhuo Chen
