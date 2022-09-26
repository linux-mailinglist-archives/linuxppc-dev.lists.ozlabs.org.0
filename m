Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB65EA82A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MblFK1xMzz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zbi+yH6o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zbi+yH6o;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MblDg4F2Lz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:16:34 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id w10so6346502pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=f9x4Js9aJ8GGYBn29EvIVTQooQM7+4F6Gd+zw2Mc6M8=;
        b=zbi+yH6owkuseZsPd8cID/9/WJR+WXOO72huZu1wJYjkboy+f0MsZabCpreRAfu0Sf
         3BZmYRBcwpD7wi8A/IOpfuJVOl1A8rCJFaIcGSG0jKTrF8oCvuPQ+RBCTLvziQZNwC1g
         Jd9oklGK6EvDETceCFaUoZePQcW8L05Zcov7bvOd0XZhHHpbvz9QNXl7DZPgxMgKI0QQ
         vLCHPHYSGblBh6eb+LQZr1TrgBNIz+T+/FWuQZnJCYJQz7wXYaPUaM7LuExyVVf5TwXJ
         ct7K8VAqw2t9I2n0tte3U2h0Rk0Ver57AT66B18Yzk80ZWyfj9mzyHlAE/JXkq2hSxLS
         3r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=f9x4Js9aJ8GGYBn29EvIVTQooQM7+4F6Gd+zw2Mc6M8=;
        b=bFP/kw84k/EQ+t0zPap/waYeiMj/+gDMexedd9NLQ7fPk6/7r+lnqOB2E7x/33PrUA
         5TmVhm5Di344sbDY6f5KKKWhpwV5B03wd6JTyIpFdfaAQ1lcJbhK7zcMqxjXeB4Zrn7A
         HSvS+LK+Ao3/W2mkEuSnLKUhCPxzCqwJecMwq1tWghPuzxZZ/kWXlG2LrA4yU9Rw6vSl
         PYe1jD7GUfjpDsnuG78+QjWtenLeE+OsdrnG8wbADA1tTeAMh4ICvp2GM3pXqtVn0k4M
         63qAKaYSgMnEDcys4LL98Y9Egu4PyVsNDOcHvO60E7fe8GvUaag70+ogkxpkHLrAKfA0
         NvvA==
X-Gm-Message-State: ACrzQf3gxo9pOf3J+tSe3C2SpErJdElpPoWPx/UKLo/T146D8QBTNtDN
	5XXk1Q1Dxm28QonTN3mpF4gq+g==
X-Google-Smtp-Source: AMsMyM5TPoPvq12bpXj85IzcoD1FO5FB0fyyNhOKXktO0s3dtYc0w3EMmyW5x+a7mrmCCw2DD9kjgw==
X-Received: by 2002:a17:902:6b0a:b0:178:9a17:5b89 with SMTP id o10-20020a1709026b0a00b001789a175b89mr21933535plk.113.1664201791912;
        Mon, 26 Sep 2022 07:16:31 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b11-20020a170903228b00b001781cad59e3sm11362897plh.108.2022.09.26.07.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 07:16:31 -0700 (PDT)
Message-ID: <3e025745-06af-c5c6-aa70-6ff1f9ad0962@bytedance.com>
Date: Mon, 26 Sep 2022 22:16:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH 3/3] PCI/AER: Use pci_aer_raw_clear_status() to clear root
 port's AER error status
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220922215030.GA1341314@bhelgaas>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220922215030.GA1341314@bhelgaas>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, jdmason@kudzu.us, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/23/22 5:50 AM, Bjorn Helgaas wrote:
> On Fri, Sep 02, 2022 at 02:16:34AM +0800, Zhuo Chen wrote:
>> Statements clearing AER error status in aer_enable_rootport() has the
>> same function as pci_aer_raw_clear_status(). So we replace them, which
>> has no functional changes.
>>
>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>> ---
>>   drivers/pci/pcie/aer.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index d2996afa80f6..eb0193f279f2 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1287,12 +1287,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
>>   				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
>>   
>>   	/* Clear error status */
>> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
>> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
>> -	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
>> -	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
>> -	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
>> -	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
>> +	pci_aer_raw_clear_status(pdev);
> 
> It's true that this is functionally equivalent.
> 
> But 20e15e673b05 ("PCI/AER: Add pci_aer_raw_clear_status() to
> unconditionally clear Error Status") says pci_aer_raw_clear_status()
> is only for use in the EDR path (this should have been included in the
> function comment), so I think we should preserve that property and use
> pci_aer_clear_status() here.
> 
> pci_aer_raw_clear_status() is the same as pci_aer_clear_status()
> except it doesn't check pcie_aer_is_native().  And I'm pretty sure we
> can't get to aer_enable_rootport() *unless* pcie_aer_is_native(),
> because get_port_device_capability() checks the same thing, so they
> should be equivalent here.
> 
> Bjorn
Thanks Bjorn, this very detailed correction is helpful. By the way, 
'only for use in the EDR path' obviously written in the function 
comments may be better. So far only commit log has included these.

I will change to use pci_aer_clear_status() in next patch.

-- 
Thanks,
Zhuo Chen
