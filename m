Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B7447B6B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 02:09:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHyyc4VbMz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 12:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xgng8omL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xgng8omL; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHyxr4HCKz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 12:08:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKMNffZ014753; 
 Tue, 21 Dec 2021 01:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GhyJpmEgrbZfUxqk1K2ZkmPrdeku8otSYj9exkm6pjY=;
 b=Xgng8omLc7DZklMdqgOXhWtxjs5qfN5WTF3WgHaTAUg7RsQsTLZhL61mogSbl0W9XUis
 9Y0Daq1dqWatG6wVNBcnnZ1EL3rT+fDQsGqIQcI1VQ3hubtIWrPBXdWsHqO+NF01Sul/
 cckTxj1KaXiG+7yXtcSPKSAUTCe7PWpV3VhrhnuW0Y82O4JoCtq7clg+uehg+gkKNDp6
 jkCl+ZwpFgCyCfGkKOlt+6clYQsaaFs4kti5nsW74/sgtd/Z4VShkSGl31YDLOcioHf1
 cxawPgBsE48Y9wW/IYVMcPXrO3bQP70le/lQ5EbxsP5jlYXS9FvHPJVL9xsKmKxRkxbl lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2u0tc5qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:08:11 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BL18BSm017852;
 Tue, 21 Dec 2021 01:08:11 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2u0tc5q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:08:11 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BL17pJC013101;
 Tue, 21 Dec 2021 01:08:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3d179ah9ht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:08:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BL1876B28246360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 01:08:07 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E13F12406B;
 Tue, 21 Dec 2021 01:08:07 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27A0C124064;
 Tue, 21 Dec 2021 01:08:07 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Dec 2021 01:08:07 +0000 (GMT)
Message-ID: <d9eafa8f-4006-4bc2-c09b-6b02a14c6ef3@linux.ibm.com>
Date: Mon, 20 Dec 2021 20:05:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
Content-Language: en-US
To: Tyrel Datwyler <tyreld@linux.ibm.com>, jarkko@kernel.org,
 peterhuewe@gmx.de, linux-integrity@vger.kernel.org
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <1052cd36-1b85-5d36-045f-5c5bf9f0fc4e@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <1052cd36-1b85-5d36-045f-5c5bf9f0fc4e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hA8Kud4FeW4HcVQZZqTTBh_bBlb--Bwn
X-Proofpoint-ORIG-GUID: iOzLWEsDlo_g8ar4_A3HigHRx0uJefX8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_11,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210002
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
Cc: Korrapati.Likhitha@ibm.com, pavrampu@in.ibm.com,
 linux-kernel@vger.kernel.org, jgg@ziepe.ca,
 linux-security-module@vger.kernel.org, gcwilson@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/20/21 19:39, Tyrel Datwyler wrote:
> On 12/11/21 5:28 PM, Stefan Berger wrote:
>> Fix the following crash on kexec by checking chip->ops for a NULL pointer
>> in tpm_chip_start() and returning an error code if this is the case.
>>
>> BUG: Kernel NULL pointer dereference on read at 0x00000060
>> Faulting instruction address: 0xc00000000099a06c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> ...
>> NIP [c00000000099a06c] tpm_chip_start+0x2c/0x140
>>   LR [c00000000099a808] tpm_chip_unregister+0x108/0x170
>> Call Trace:
>> [c0000000188bfa00] [c000000002b03930] fw_devlink_strict+0x0/0x8 (unreliable)
>> [c0000000188bfa30] [c00000000099a808] tpm_chip_unregister+0x108/0x170
>> [c0000000188bfa70] [c0000000009a3874] tpm_ibmvtpm_remove+0x34/0x130
>> [c0000000188bfae0] [c000000000110dbc] vio_bus_remove+0x5c/0xb0
>> [c0000000188bfb20] [c0000000009bc154] device_shutdown+0x1d4/0x3a8
>> [c0000000188bfbc0] [c000000000196e14] kernel_restart_prepare+0x54/0x70
>>
>> The referenced patch below introduced a function to shut down the VIO bus.
>> The bus shutdown now calls tpm_del_char_device (via tpm_chip_unregister)
>> after a call to tpm_class_shutdown, which already set chip->ops to NULL.
>> The crash occurrs when tpm_del_char_device calls tpm_chip_start with the
>> chip->ops NULL pointer.
> It was unclear to me at first, but IIUC the problem is the ibmvtpm device
> receives two shutdown calls, the first is a class shutdown call for TPM devices,
> followed by a bus shutdown call for VIO devices.
>
> It appears that the class shutdown routines are meant to be a pre-shutdown
> routine as they are defined as class->shutdown_pre(), and it is clearly allowed
> to call class->shutdown_pre() followed by one of but not both of the following
> bus->shutdown() or driver->shutdown(). Even tpm_class_shutdown() mentions in the
> function comment that bus/device shutdown to follow.

I suppose you are referring to this here:

/**
  * tpm_class_shutdown() - prepare the TPM device for loss of power.
  * @dev: device to which the chip is associated.
  *
  * Issues a TPM2_Shutdown command prior to loss of power, as required 
by the
  * TPM 2.0 spec. Then, calls bus- and device- specific shutdown code.
  *
  * Return: always 0 (i.e. success)
  */

I think this comment still refers to the ancient code here:

https://elixir.bootlin.com/linux/v4.4.295/source/drivers/char/tpm/tpm-chip.c#L161

     if (dev->bus && dev->bus->shutdown)
         dev->bus->shutdown(dev);
     else if (dev->driver && dev->driver->shutdown)
         dev->driver->shutdown(dev);



>> Fixes: 39d0099f9439 ("powerpc/pseries: Add shutdown() to vio_driver and vio_bus")
> This patch left implementing each vio driver shutdown routine as an exercise for
> the respective maintainers, and instead just big hammers anything that doesn't
> have a shutdown routine by calling the driver->remove().
>
> If tpm_class_shutdown() quiecses ibmvtpm enough implementing a no-op
> ibmvtpm->shutdown() with a comment saying so suffices.
>
> However, the generic TPM code is still introducing a bug that an attempt to call
> tpm_chip_unregister() after tpm_class_shutdown() will crash as mentioned above.


An alternative solution may be this here:

diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index ddaeceb7e109..4cb908349b31 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -473,15 +473,8 @@ static void tpm_del_char_device(struct tpm_chip *chip)
         mutex_unlock(&idr_lock);

         /* Make the driver uncallable. */
-       down_write(&chip->ops_sem);
-       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
-               if (!tpm_chip_start(chip)) {
-                       tpm2_shutdown(chip, TPM2_SU_CLEAR);
-                       tpm_chip_stop(chip);
-               }
-       }
-       chip->ops = NULL;
-       up_write(&chip->ops_sem);
+       if (chip->ops)
+               tpm_class_shutdown(&chip->dev);
  }

  static void tpm_del_legacy_sysfs(struct tpm_chip *chip)


I could post this as v2 ?! Let me know...

    Stefan


>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   drivers/char/tpm/tpm-chip.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
>> index ddaeceb7e109..cca1bde296ee 100644
>> --- a/drivers/char/tpm/tpm-chip.c
>> +++ b/drivers/char/tpm/tpm-chip.c
>> @@ -101,6 +101,9 @@ int tpm_chip_start(struct tpm_chip *chip)
>>   {
>>   	int ret;
>>
>> +	if (!chip->ops)
>> +		return -EINVAL;
>> +
> I wonder if a better fix would to have tpm_del_char_device() check for valid
> chip->ops and call tpm_class_shutdown() when the ops are still valid. Calling
> tpm_class_shutdown() allows for some code deduplication in tpm_del_char_device().
>
> -Tyrel
>
>>   	tpm_clk_enable(chip);
>>
>>   	if (chip->locality == -1) {
>>
