Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187D581F8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 07:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt2Zz0M5vz3c1f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 15:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rXMYA6Yp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rXMYA6Yp;
	dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt2ZK1gqLz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 15:36:08 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id q16so15026242pgq.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 22:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=MtmX0s8i4cNE7xExfXRCYeHMOOSpKYgD35C7D1141sc=;
        b=rXMYA6YpckLQ7Md7MwHHskIesm3XD7YZSBd75z21WpAASuPYeeksPydQsM3ZEqQF8f
         uhGygijSmwcjS4XmM8u/vzqTO0ieJ+oFf6qmZkkBbbawoGfSN8sZRSi9ss+QkQuq/C4l
         xovBCQDq0STP3FI7+Iu1H2oh+nokrkF7MoRG2JDXKrkrQv/VssghHvrTfM/+hgvF+ygJ
         QjFLbBGh7MPWxzrFu1xMqVDiDP/Mr1q5E1h1XjFgVIg7heJrfFpm78t3KBSis41FI+58
         Mf2q3SNLFuvlXVynUKJyEbhgI7hhhC6xa8TUeh+6zYfXkS9ykk/u0kd5D5CeTG1T5I/E
         B1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MtmX0s8i4cNE7xExfXRCYeHMOOSpKYgD35C7D1141sc=;
        b=hL34Fp1iHw4tN4cmNUimNgJ992cGqgv4XzENqIyu1t3oB4UmfFk0KlVSYTjewGz2Yt
         2q9SaZvLQMn7M1Oblp5pRVqCL7uuHF9gXpCc70GgTCLgmzv4NKA63ZsTIawIIg/3yfXf
         4AVRfsFWjA2FETfu888x2n9I6m7rcdMjxp3QYnGxmsLy4x9b7ZyaNNjor7r1ntQ7Q6kE
         NxltDZXbv0TYoczamVyiJQhs7CgeIncCG75xgWTMvZVEbQ555LVTFrOtXTPjLoaFlDAx
         5TLUotosLiycWAaqheLYJzJ7ubA2+OTI0qcKK1Zxgj3UEoCCwvL4aQDc31V0jfwLLRkO
         JTPA==
X-Gm-Message-State: AJIora/fI0tFYCqMOsKXz1eXiUPmIJwwGHBVBCS8LZlgXwmhKIXPoQNO
	gcXMhqo/6YRj0xqB7ZVWIzaGQA==
X-Google-Smtp-Source: AGRyM1sww+5c5488gml38dTzt0romodCAJQ3E98eXIudTuGyEPO3lDyKiMFc9bedEHP4yh/1tnW4lQ==
X-Received: by 2002:a63:180e:0:b0:41b:42d0:7d59 with SMTP id y14-20020a63180e000000b0041b42d07d59mr2010864pgl.160.1658900165003;
        Tue, 26 Jul 2022 22:36:05 -0700 (PDT)
Received: from [10.2.192.95] ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902d4d000b0016bdc98730bsm12707960plg.151.2022.07.26.22.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 22:36:04 -0700 (PDT)
Message-ID: <cfd44d9c-453b-e498-2630-9057947cf3cd@bytedance.com>
Date: Wed, 27 Jul 2022 13:35:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 ruscur@russell.cc, oohall@gmail.com, bhelgaas@google.com
References: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
 <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
From: =?UTF-8?B?6ZmI5Y2T?= <chenzhuo.1@bytedance.com>
In-Reply-To: <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, lukas@wunner.de, jan.kiszka@siemens.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/26/22 9:02 PM, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 7/26/22 8:53 PM, Zhuo Chen wrote:
>> Use pcie_aer_is_native() in place of "host->native_aer ||
>> pcie_ports_native" to judge whether OS has native control of AER
>> in pcie_do_recovery().
>>
>> Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
>> get_port_device_capability() with pcie_aer_is_native(), which has no
>> functional changes.
>>
>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>> ---
> 
> Patch looks better now. It looks like following two changes
> can also be replaced with pcie_aer_is_native() check.
> 
> drivers/pci/pcie/aer.c:1407:	if ((host->native_aer || pcie_ports_native) && aer) {
> drivers/pci/pcie/aer.c:1426:	if ((host->native_aer || pcie_ports_native) && aer) {

Good advice. But I wonder is there a scenario that dev->rcec ("root") is 
NULL meanwhile dev->aer_cap is not NULL? If so, replace 
"(host->native_aer || pcie_ports_native) && aer" with 
pcie_aer_is_native() will change original function.

> 
> 
> 
>> Changelog:
>> v3:
>> - Simplify why we use pcie_aer_is_native().
>> - Revert modification of pci_aer_clear_nonfatal_status() and comments.
>> v2:
>> - Add details and note in commit log.
>> ---
>>   drivers/pci/pcie/err.c          | 3 +--
>>   drivers/pci/pcie/portdrv_core.c | 3 +--
>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index 0c5a143025af..121a53338e44 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -184,7 +184,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   	int type = pci_pcie_type(dev);
>>   	struct pci_dev *bridge;
>>   	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>> -	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>>   
>>   	/*
>>   	 * If the error was detected by a Root Port, Downstream Port, RCEC,
>> @@ -243,7 +242,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   	 * it is responsible for clearing this status.  In that case, the
>>   	 * signaling device may not even be visible to the OS.
>>   	 */
>> -	if (host->native_aer || pcie_ports_native) {
>> +	if (pcie_aer_is_native(dev)) {
>>   		pcie_clear_device_status(dev);
>>   		pci_aer_clear_nonfatal_status(dev);
>>   	}
>> diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
>> index 604feeb84ee4..98c18f4a01b2 100644
>> --- a/drivers/pci/pcie/portdrv_core.c
>> +++ b/drivers/pci/pcie/portdrv_core.c
>> @@ -221,8 +221,7 @@ static int get_port_device_capability(struct pci_dev *dev)
>>   	}
>>   
>>   #ifdef CONFIG_PCIEAER
>> -	if (dev->aer_cap && pci_aer_available() &&
>> -	    (pcie_ports_native || host->native_aer)) {
>> +	if (pcie_aer_is_native(dev) && pci_aer_available()) {
>>   		services |= PCIE_PORT_SERVICE_AER;
>>   
>>   		/*
> 

Thanks,
Zhuo Chen
