Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A4608A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 17:04:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gJ6B527lzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 01:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gH1G6s3QzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 00:15:08 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65EClo5011417; Fri, 5 Jul 2019 10:14:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tj5bhf26p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2019 10:14:01 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x65EDkYp014399;
 Fri, 5 Jul 2019 10:14:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tj5bhf262-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2019 10:14:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x65EDt6k024551;
 Fri, 5 Jul 2019 14:13:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2tdym7mhvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:13:59 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x65EDvvm52560328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 14:13:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1E816A063;
 Fri,  5 Jul 2019 14:13:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0CAB6A04F;
 Fri,  5 Jul 2019 14:13:56 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jul 2019 14:13:56 +0000 (GMT)
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
Date: Fri, 5 Jul 2019 10:13:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-MW
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050173
X-Mailman-Approved-At: Sat, 06 Jul 2019 01:02:52 +1000
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
 Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Peter Huewe <peterhuewe@gmx.de>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/3/19 11:32 PM, Nayna Jain wrote:
> The nr_allocated_banks and allocated banks are initialized as part of
> tpm_chip_register. Currently, this is done as part of auto startup
> function. However, some drivers, like the ibm vtpm driver, do not run
> auto startup during initialization. This results in uninitialized memory
> issue and causes a kernel panic during boot.
>
> This patch moves the pcr allocation outside the auto startup function
> into tpm_chip_register. This ensures that allocated banks are initialized
> in any case.
>
> Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms with
> PCR read")
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>   drivers/char/tpm/tpm-chip.c | 37 +++++++++++++++++++++++++++++++++++++
>   drivers/char/tpm/tpm.h      |  1 +
>   drivers/char/tpm/tpm1-cmd.c | 12 ------------
>   drivers/char/tpm/tpm2-cmd.c |  6 +-----
>   4 files changed, 39 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index 8804c9e916fd..958508bb8379 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -550,6 +550,39 @@ static int tpm_add_hwrng(struct tpm_chip *chip)
>   	return hwrng_register(&chip->hwrng);
>   }
>
> +/*
> + * tpm_pcr_allocation() - initializes the chip allocated banks for PCRs
> + */
> +static int tpm_pcr_allocation(struct tpm_chip *chip)
> +{
> +	int rc = 0;
> +
> +	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> +		rc = tpm2_get_pcr_allocation(chip);
> +		if (rc)
> +			goto out;
> +	}
> +
> +	/* Initialize TPM 1.2 */
> +	chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
> +			GFP_KERNEL);
> +	if (!chip->allocated_banks) {
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	chip->allocated_banks[0].alg_id = TPM_ALG_SHA1;
> +	chip->allocated_banks[0].digest_size = hash_digest_size[HASH_ALGO_SHA1];
> +	chip->allocated_banks[0].crypto_id = HASH_ALGO_SHA1;
> +	chip->nr_allocated_banks = 1;
> +
> +	return 0;
> +out:
> +	if (rc < 0)
> +		rc = -ENODEV;


The old code where you lifted this from said:

out:
     if (rc > 0)
         rc = -ENODEV;
     return rc;

It would not overwrite -ENOMEM with -ENODEV but yours does.

I think the correct fix would be to use:

if (rc > 0)

     rc = -ENODEV;





> +	return rc;
> +}
> +
>   /*
>    * tpm_chip_register() - create a character device for the TPM chip
>    * @chip: TPM chip to use.
> @@ -573,6 +606,10 @@ int tpm_chip_register(struct tpm_chip *chip)
>   	if (rc)
>   		return rc;

Above this is tpm_chip_stop(chip) because (afaik) none of the following 
function calls in tpm_chip_register() needed the TPM, but now with 
tpm_pcr_allocation() you will need to send a command to the TPM. So I 
would say you should move the tpm_chip_stop() into the error branch 
visible above and also after the tpm_pcr_allocation().


> +	rc = tpm_pcr_allocation(chip);
tpm_chip_stop(chip);
> +	if (rc)
> +		return rc;
> +
>   	tpm_sysfs_add_device(chip);
>
>   	rc = tpm_bios_log_setup(chip);


   Stefan

