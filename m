Return-Path: <linuxppc-dev+bounces-12357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D68B82AD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 04:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS0Np2pgWz30Pg;
	Thu, 18 Sep 2025 12:45:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758163514;
	cv=none; b=itOHksAS3XhInwdWZR5jUBZnQdLYUQPqUjyYrdq5kPRtj2h17SGrBmcFGlWm7i6N3OQRwefpnsDOYDih4IzpUzhWoK/6drzwTnxcqGuYoazUGY9k2A+7BRTCs9rNUav8tXx6g6M88TdUqpORMNMErarl6Q6MYKDAk7lhT9yp3soTMZTR6R6W6dsbHeZ5ywqI/27VUEdJ3goDeB/6a3ARXFBIfRdGxGOe9GJxgSFN1mwSD5DOQpSBBUeBrG9C8qt0zEV4y1BY/nyNdYAMxzM/lmc4hBBb8mkm4fx7K3DiVgK99K9dqDgYBbgEOKoY4G/h4FCmYPd89KwsI89KVehkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758163514; c=relaxed/relaxed;
	bh=JPFeju941uQjjpYAR2xl+DKTC6UMtim0pjMt7+wMivk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqQbnf7BdFNroz+6KNtjhBpOwqR+Y3iElavfY2YZ7oKArtTRQJXub7+2nqFg6lmTBh0UnrmyzvIC36sP1LKbWZ2q3AjHkeic5E1vx/IoTGyvmsalzVYf2p3BkZkGLAh20jEhkt5J5Q7sw2sAaHxF1/nC15QqXmjlZwdVDHmqBARiVCpC3kj4CsAP5jmQH0q3Ym5oaZe5B4MQA8pvFUU63DaBgkLwAtk6VEZp6sRV0UicZH4rKLMG7Vu9Ska1qhg1sdDA39JiwNgi7MNvoBSChQdR9vxDGorvAn5k2DkKL10Quek0vwP0ZI25ZpxX6kMUGKY/qLGjy0VrHemB2IFtMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=B+ASsvqf; dkim-atps=neutral; spf=pass (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=B+ASsvqf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS0Nm184Jz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 12:45:10 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758163506; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JPFeju941uQjjpYAR2xl+DKTC6UMtim0pjMt7+wMivk=;
	b=B+ASsvqfYsuFgj66Uctcx8Ga9imeMS9ONZUzJuAIYoPqnb4dLBR7fZrm7Rr9Xu65665wLF28MR3l1NzIpGWMZ/XNhL/9zMoCqt+SBKq6KsWX17zCCY+XIVThl3z0R/8dR8zlwiZP6yHFnNVwR78Y74YAUCM+ZSnylWZDNAdfJxU=
Received: from 30.246.178.33(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WoECel4_1758163504 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 18 Sep 2025 10:45:05 +0800
Message-ID: <67f8beb8-faef-42c4-aae8-72ce4a441533@linux.alibaba.com>
Date: Thu, 18 Sep 2025 10:45:03 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 bhelgaas@google.com, mahesh@linux.ibm.com, mani@kernel.org,
 Jonathan.Cameron@huawei.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250917063352.19429-1-xueshuai@linux.alibaba.com>
 <20250917063352.19429-4-xueshuai@linux.alibaba.com>
 <2712a56a-1e2f-4ad8-8ad9-8b7825f4eefd@linux.intel.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <2712a56a-1e2f-4ad8-8ad9-8b7825f4eefd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/9/18 03:09, Kuppuswamy Sathyanarayanan 写道:
> 
> On 9/16/25 23:33, Shuai Xue wrote:
>> The AER driver has historically avoided reading the configuration space of
>> an endpoint or RCiEP that reported a fatal error, considering the link to
>> that device unreliable. Consequently, when a fatal error occurs, the AER
>> and DPC drivers do not report specific error types, resulting in logs like:
>>
>>     pcieport 0015:00:00.0: EDR: EDR event received
>>     pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>>     pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>>     pcieport 0015:00:00.0: AER: broadcast error_detected message
>>     pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>>     pcieport 0015:00:00.0: AER: broadcast resume message
>>     pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>>     pcieport 0015:00:00.0: AER: device recovery successful
>>     pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>>     pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>>
>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>> after hot reset, we can still safely access AER status and TLP header of the
>> error device. In such case, report fatal errors which helps to figure out the
>> error root case.
>>
>> After this patch, the logs like:
>>
>>     pcieport 0015:00:00.0: EDR: EDR event received
>>     pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
>>     pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
>>     pcieport 0015:00:00.0: AER: broadcast error_detected message
>>     vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
>>     pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
>>     vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
>>     vfio-pci 0015:01:00.0:    [12] TLP                    (First)
>>     vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
>>     pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
>>     pcieport 0015:00:00.0: AER: broadcast resume message
>>     pcieport 0015:00:00.0: AER: device recovery successful
>>     pcieport 0015:00:00.0: EDR: DPC port successfully recovered
>>     pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80
>>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   drivers/pci/pci.h      |  3 ++-
>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>   drivers/pci/pcie/dpc.c |  2 +-
>>   drivers/pci/pcie/err.c | 11 +++++++++++
>>   4 files changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index de2f07cefa72..b8d364545e7d 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -629,7 +629,8 @@ struct aer_err_info {
>>       struct pcie_tlp_log tlp;    /* TLP Header */
>>   };
>> -int aer_get_device_error_info(struct aer_err_info *info, int i);
>> +int aer_get_device_error_info(struct aer_err_info *info, int i,
>> +                  bool link_healthy);
>>   void aer_print_error(struct aer_err_info *info, int i);
>>   int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index e286c197d716..157ad7fb44a0 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -1351,12 +1351,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>    * aer_get_device_error_info - read error status from dev and store it to info
>>    * @info: pointer to structure to store the error record
>>    * @i: index into info->dev[]
>> + * @link_healthy: link is healthy or not
>>    *
>>    * Return: 1 on success, 0 on error.
>>    *
>>    * Note that @info is reused among all error devices. Clear fields properly.
>>    */
>> -int aer_get_device_error_info(struct aer_err_info *info, int i)
>> +int aer_get_device_error_info(struct aer_err_info *info, int i,
>> +                  bool link_healthy)
>>   {
>>       struct pci_dev *dev;
>>       int type, aer;
>> @@ -1387,7 +1389,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
>>       } else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>              type == PCI_EXP_TYPE_RC_EC ||
>>              type == PCI_EXP_TYPE_DOWNSTREAM ||
>> -           info->severity == AER_NONFATAL) {
>> +           info->severity == AER_NONFATAL ||
>> +           (info->severity == AER_FATAL && link_healthy)) {
>>           /* Link is still healthy for IO reads */
>>           pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>> @@ -1420,11 +1423,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>       /* Report all before handling them, to not lose records by reset etc. */
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info, i))
>> +        if (aer_get_device_error_info(e_info, i, false))
>>               aer_print_error(e_info, i);
>>       }
>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>> -        if (aer_get_device_error_info(e_info, i))
>> +        if (aer_get_device_error_info(e_info, i, false))
>>               handle_error_source(e_info->dev[i], e_info);
>>       }
>>   }
>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>> index f6069f621683..21c4e8371279 100644
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -284,7 +284,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>           pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
>>                status);
>>           if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
>> -            aer_get_device_error_info(&info, 0)) {
>> +            aer_get_device_error_info(&info, 0, false)) {
>>               aer_print_error(&info, 0);
>>               pci_aer_clear_nonfatal_status(pdev);
>>               pci_aer_clear_fatal_status(pdev);
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index de6381c690f5..744d77ee7271 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       struct pci_dev *bridge;
>>       pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>>       struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>> +    struct aer_err_info info;
>>       /*
>>        * If the error was detected by a Root Port, Downstream Port, RCEC,
>> @@ -223,6 +224,15 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>               pci_warn(bridge, "subordinate device reset failed\n");
>>               goto failed;
>>           }
>> +
>> +        info.dev[0] = dev;
>> +        info.level = KERN_ERR;
>> +        info.severity = AER_FATAL;
>> +        /* Link recovered, report fatal errors of RCiEP or EP */
>> +        if ((type == PCI_EXP_TYPE_ENDPOINT ||
>> +             type == PCI_EXP_TYPE_RC_END) &&
>> +            aer_get_device_error_info(&info, 0, true))
>> +            aer_print_error(&info, 0);
>>       } else {
>>           pci_walk_bridge(bridge, report_normal_detected, &status);
>>       }
>> @@ -259,6 +269,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>       if (host->native_aer || pcie_ports_native) {
>>           pcie_clear_device_status(dev);
>>           pci_aer_clear_nonfatal_status(dev);
>> +        pci_aer_clear_fatal_status(dev);
> 
> Above change looks unrelated to dumping the error info. It would be better if
> you move it to a separate patch.
> 

Hi, Kuppuswamy,

Thanks for quick reply and valueable comments.
Sure, I will add two new separate patches.

The first is to use pcie_aer_is_native() to check for native AER control.

--------- patch 1 start ------

Subject: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for native AER control

Replace the manual checks for native AER control with the
pcie_aer_is_native() helper, which provides a more robust way
to determine if we have native control of AER.

No functional changes intended.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
  drivers/pci/pcie/err.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 1397f62f13dc..86624ae61cb6 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -195,7 +195,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
  	int type = pci_pcie_type(dev);
  	struct pci_dev *bridge;
  	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
-	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
  	struct aer_err_info info;

  	/*
@@ -266,7 +265,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
  	 * it is responsible for clearing this status.  In that case, the
  	 * signaling device may not even be visible to the OS.
  	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (pcie_aer_is_native(dev)) {
  		pcie_clear_device_status(dev);
  		pci_aer_clear_nonfatal_status(dev);
  	}
-- 

--------- patch 1 end ------

The second is clear AER fatal status for err_dev:

--------- patch 2 start ------

Subject: [PATCH v6 5/5] PCI/AER: Clear both AER fatal and non-fatal status

The DPC driver clears AER fatal status for the port that reported the
error, but not for the downstream device that deteced the error.  The
current recovery code only clears non-fatal AER status, leaving fatal
status bits set in the error device.

Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
status in the error device, ensuring all AER status bits are properly
cleared after recovery.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
  drivers/pci/pcie/err.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 86624ae61cb6..96d99eaf13d2 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -267,7 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
  	 */
  	if (pcie_aer_is_native(dev)) {
  		pcie_clear_device_status(dev);
-		pci_aer_clear_nonfatal_status(dev);
+		pci_aer_raw_clear_status(dev);
  	}

  	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
-- 
2.39.3

--------- patch 2 end ------

I can also squash these two patches into one. Which way do you prefer?

Thanks.
Shuai




