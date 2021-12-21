Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1C47B6EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 02:38:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHzcd6066z3c57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 12:38:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OKNjO4NI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OKNjO4NI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHzbv2kzBz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 12:37:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKN0Fum032274; 
 Tue, 21 Dec 2021 01:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vAJMULVGi8WaTYbSRYEoDY2Vsw7HqOBaMDSREXIkSG4=;
 b=OKNjO4NIr9xhb4x8tY9IA/xbyMdqpkIUyJtON2n1S/FLphBoLb5TSTFQSpEcAJpZ9BU/
 LHlWvsJX8s0Xvrwc1XlrQMOZqJxhbzqK9yvowk5vumwbPIkCCii6eSbb/TOV/JW/ND8O
 5efsg1PPjtEjuAMWXaUGpj7P2+52dBDjrwWtAsSuCRPEg4o6DjfL6UxpTelojGNLsmpi
 eNMFZTK4DumxnSfBGUcNCPF+QYw59PLjeRV9591SEZmHQfwZekMxLbGSrIrC2ywGR75n
 ACJqoFr5+LAiJ8HUpGlpThTY01JNeRO2Nbw0cc2Jz5ie5rWnHBEMs+2lLMM8LYL11rp2 eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s3y1sb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:37:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BL1E7M8040440;
 Tue, 21 Dec 2021 01:37:43 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s3y1sb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:37:43 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BL1YVTi013356;
 Tue, 21 Dec 2021 01:37:41 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3d179hqxt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 01:37:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BL1bdQ531588740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 01:37:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A95678081;
 Tue, 21 Dec 2021 01:37:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E97147808F;
 Tue, 21 Dec 2021 01:37:37 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.210.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 Dec 2021 01:37:37 +0000 (GMT)
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
To: Stefan Berger <stefanb@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <1052cd36-1b85-5d36-045f-5c5bf9f0fc4e@linux.ibm.com>
 <d9eafa8f-4006-4bc2-c09b-6b02a14c6ef3@linux.ibm.com>
 <20211221011320.GM6467@ziepe.ca>
 <f80e33d2-948d-f885-b063-245eb37de8c1@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bad84f8a-9e07-0920-5c07-475e30e710e9@linux.ibm.com>
Date: Mon, 20 Dec 2021 17:37:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f80e33d2-948d-f885-b063-245eb37de8c1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uksTC0_AMmmKfuVY-UAZnxy4ozK4GVxq
X-Proofpoint-GUID: 5S80dxjSxipysCG2cdF2ATh9tqjk9l8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_11,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=991 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Korrapati.Likhitha@ibm.com, pavrampu@in.ibm.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 jarkko@kernel.org, gcwilson@us.ibm.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/20/21 5:31 PM, Stefan Berger wrote:
> 
> On 12/20/21 20:13, Jason Gunthorpe wrote:
>> On Mon, Dec 20, 2021 at 08:05:58PM -0500, Stefan Berger wrote:
>>
>>> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
>>> index ddaeceb7e109..4cb908349b31 100644
>>> +++ b/drivers/char/tpm/tpm-chip.c
>>> @@ -473,15 +473,8 @@ static void tpm_del_char_device(struct tpm_chip *chip)
>>>          mutex_unlock(&idr_lock);
>>>
>>>          /* Make the driver uncallable. */
>>> -       down_write(&chip->ops_sem);
>>> -       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
>>> -               if (!tpm_chip_start(chip)) {
>>> -                       tpm2_shutdown(chip, TPM2_SU_CLEAR);
>>> -                       tpm_chip_stop(chip);
>>> -               }
>>> -       }
>>> -       chip->ops = NULL;
>>> -       up_write(&chip->ops_sem);
>>> +       if (chip->ops)
>> ops cannot be read without locking
> 
> This here could be an alternative:

I still think code de-duplication is a good thing. Maybe combine the two
approaches. Call tpm_class_shutdown from tpm_del_char_device and add a chip->ops
check in tpm_class_shutdown to ensure we only do the shutdown when chip->ops is
valid.

-Tyrel

> 
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index ddaeceb7e109..7772b475ebc0 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -474,7 +474,7 @@ static void tpm_del_char_device(struct tpm_chip *chip)
> 
>         /* Make the driver uncallable. */
>         down_write(&chip->ops_sem);
> -       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> +       if (chip->ops && chip->flags & TPM_CHIP_FLAG_TPM2) {
>                 if (!tpm_chip_start(chip)) {
>                         tpm2_shutdown(chip, TPM2_SU_CLEAR);
>                         tpm_chip_stop(chip);
> 
>    Stefan
> 
> 
>>
>> Jason

