Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A047B6D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 02:32:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHzTZ6HSKz3bjW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 12:32:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GTlBWVSo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GTlBWVSo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHzSm2L0Rz2xsN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 12:31:35 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKMXnGp022063; 
 Tue, 21 Dec 2021 01:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=esHj3kYXWZ1lBSmdCOGo+Qhb/eF4178jJnfYkc5j9To=;
 b=GTlBWVSo9gdnvVadgQgwUb8qxCgkuVlh2+ymiS102oXJn5RQJq6RDt1ZDeNYiEA0auxT
 g8D66KlKYjTQaZwmIphf69DG2X5lwIgcDLkimuhb2/0SjJbs5h7Nulf0Raf1hUoKhI4D
 eF1e+ZVw544Xo8XLS250XaLNyOq4E9fuB7wNVowzkiTGVfFAp+I2SVj2t0XOCDyjsWsG
 o/8TMXtTzwvZLxA0RmrAvavWfFi7bjk4sJoJ8Lvy8r0jotoclJqBo2DFI0Dedj7PMEpY
 VAQ4AaajTQTDqh7Dw3nQBY+z+8KusbsL48RtOC6q/qrTEsYOU5yNdhI0DWt7Sle20nkj aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1skes3cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:31:31 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BL1VUYj020533;
 Tue, 21 Dec 2021 01:31:30 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1skes3cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:31:30 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BL1NjGa016312;
 Tue, 21 Dec 2021 01:31:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3d1799qu6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:31:30 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BL1VRQA17695138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 01:31:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B71BB112061;
 Tue, 21 Dec 2021 01:31:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69A8D112065;
 Tue, 21 Dec 2021 01:31:27 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Dec 2021 01:31:27 +0000 (GMT)
Message-ID: <f80e33d2-948d-f885-b063-245eb37de8c1@linux.ibm.com>
Date: Mon, 20 Dec 2021 20:31:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <1052cd36-1b85-5d36-045f-5c5bf9f0fc4e@linux.ibm.com>
 <d9eafa8f-4006-4bc2-c09b-6b02a14c6ef3@linux.ibm.com>
 <20211221011320.GM6467@ziepe.ca>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20211221011320.GM6467@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZmV61b529U1oHj1p_UAkKG7QajVz5iVe
X-Proofpoint-GUID: 6TCUo1k1sZyJ216sRqHqJ8aW9jUtD1KN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_11,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=933
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210004
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
Cc: Korrapati.Likhitha@ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 pavrampu@in.ibm.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, jarkko@kernel.org, gcwilson@us.ibm.com,
 peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/20/21 20:13, Jason Gunthorpe wrote:
> On Mon, Dec 20, 2021 at 08:05:58PM -0500, Stefan Berger wrote:
>
>> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
>> index ddaeceb7e109..4cb908349b31 100644
>> +++ b/drivers/char/tpm/tpm-chip.c
>> @@ -473,15 +473,8 @@ static void tpm_del_char_device(struct tpm_chip *chip)
>>          mutex_unlock(&idr_lock);
>>
>>          /* Make the driver uncallable. */
>> -       down_write(&chip->ops_sem);
>> -       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
>> -               if (!tpm_chip_start(chip)) {
>> -                       tpm2_shutdown(chip, TPM2_SU_CLEAR);
>> -                       tpm_chip_stop(chip);
>> -               }
>> -       }
>> -       chip->ops = NULL;
>> -       up_write(&chip->ops_sem);
>> +       if (chip->ops)
> ops cannot be read without locking

This here could be an alternative:

diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index ddaeceb7e109..7772b475ebc0 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -474,7 +474,7 @@ static void tpm_del_char_device(struct tpm_chip *chip)

         /* Make the driver uncallable. */
         down_write(&chip->ops_sem);
-       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
+       if (chip->ops && chip->flags & TPM_CHIP_FLAG_TPM2) {
                 if (!tpm_chip_start(chip)) {
                         tpm2_shutdown(chip, TPM2_SU_CLEAR);
                         tpm_chip_stop(chip);

    Stefan


>
> Jason
