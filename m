Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BB60966
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 17:33:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gJlw5mMFzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 01:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gJk93GLKzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 01:32:16 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FVrZl030666
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Jul 2019 11:32:11 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tj80kbdab-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 11:32:11 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nayna@linux.vnet.ibm.com>;
 Fri, 5 Jul 2019 16:32:10 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 5 Jul 2019 16:32:07 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x65FW6ku48234784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 15:32:06 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35957124053;
 Fri,  5 Jul 2019 15:32:06 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B6B7124052;
 Fri,  5 Jul 2019 15:32:05 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.133.199])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jul 2019 15:32:05 +0000 (GMT)
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
To: Stefan Berger <stefanb@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Date: Fri, 5 Jul 2019 11:32:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070515-0060-0000-0000-0000035971F9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011383; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01227839; UDB=6.00646518; IPR=6.01009080; 
 MB=3.00027598; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-05 15:32:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070515-0061-0000-0000-00004A069FD7
Message-Id: <164b9c6e-9b6d-324d-9df8-d2f7d1ac8cfc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050189
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Huewe <peterhuewe@gmx.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/05/2019 10:13 AM, Stefan Berger wrote:
> On 7/3/19 11:32 PM, Nayna Jain wrote:
>> The nr_allocated_banks and allocated banks are initialized as part of
>> tpm_chip_register. Currently, this is done as part of auto startup
>> function. However, some drivers, like the ibm vtpm driver, do not run
>> auto startup during initialization. This results in uninitialized memory
>> issue and causes a kernel panic during boot.
>>
>> This patch moves the pcr allocation outside the auto startup function
>> into tpm_chip_register. This ensures that allocated banks are 
>> initialized
>> in any case.
>>
>> Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms 
>> with
>> PCR read")
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> ---
>>   drivers/char/tpm/tpm-chip.c | 37 +++++++++++++++++++++++++++++++++++++
>>   drivers/char/tpm/tpm.h      |  1 +
>>   drivers/char/tpm/tpm1-cmd.c | 12 ------------
>>   drivers/char/tpm/tpm2-cmd.c |  6 +-----
>>   4 files changed, 39 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
>> index 8804c9e916fd..958508bb8379 100644
>> --- a/drivers/char/tpm/tpm-chip.c
>> +++ b/drivers/char/tpm/tpm-chip.c
>> @@ -550,6 +550,39 @@ static int tpm_add_hwrng(struct tpm_chip *chip)
>>       return hwrng_register(&chip->hwrng);
>>   }
>>
>> +/*
>> + * tpm_pcr_allocation() - initializes the chip allocated banks for PCRs
>> + */
>> +static int tpm_pcr_allocation(struct tpm_chip *chip)
>> +{
>> +    int rc = 0;
>> +
>> +    if (chip->flags & TPM_CHIP_FLAG_TPM2) {
>> +        rc = tpm2_get_pcr_allocation(chip);
>> +        if (rc)
>> +            goto out;
>> +    }
>> +
>> +    /* Initialize TPM 1.2 */
>> +    chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
>> +            GFP_KERNEL);
>> +    if (!chip->allocated_banks) {
>> +        rc = -ENOMEM;
>> +        goto out;
>> +    }
>> +
>> +    chip->allocated_banks[0].alg_id = TPM_ALG_SHA1;
>> +    chip->allocated_banks[0].digest_size = 
>> hash_digest_size[HASH_ALGO_SHA1];
>> +    chip->allocated_banks[0].crypto_id = HASH_ALGO_SHA1;
>> +    chip->nr_allocated_banks = 1;
>> +
>> +    return 0;
>> +out:
>> +    if (rc < 0)
>> +        rc = -ENODEV;
>
>
> The old code where you lifted this from said:
>
> out:
>     if (rc > 0)
>         rc = -ENODEV;
>     return rc;
>
> It would not overwrite -ENOMEM with -ENODEV but yours does.
>
> I think the correct fix would be to use:
>
> if (rc > 0)
>
>     rc = -ENODEV;
>

Yes. I think I misread it. Thanks Stefan. Will fix this..


>
>
>
>
>> +    return rc;
>> +}
>> +
>>   /*
>>    * tpm_chip_register() - create a character device for the TPM chip
>>    * @chip: TPM chip to use.
>> @@ -573,6 +606,10 @@ int tpm_chip_register(struct tpm_chip *chip)
>>       if (rc)
>>           return rc;
>
> Above this is tpm_chip_stop(chip) because (afaik) none of the 
> following function calls in tpm_chip_register() needed the TPM, but 
> now with tpm_pcr_allocation() you will need to send a command to the 
> TPM. So I would say you should move the tpm_chip_stop() into the error 
> branch visible above and also after the tpm_pcr_allocation().
>
>
>> +    rc = tpm_pcr_allocation(chip);
> tpm_chip_stop(chip);

I am not sure of the purpose of tpm_stop_chip(), so I have left it as it 
is. Jarkko, what do you think about the change ?

Thanks & Regards,
          - Nayna


