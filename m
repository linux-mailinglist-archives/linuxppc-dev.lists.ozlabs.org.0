Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4859E6135B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 02:27:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45h8Xm5ZrFzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 10:27:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45h8WM6yKMzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2019 10:25:50 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x670LVCR050730
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 6 Jul 2019 20:25:48 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tjt04gxp7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 20:25:48 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nayna@linux.vnet.ibm.com>;
 Sun, 7 Jul 2019 01:25:47 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 7 Jul 2019 01:25:43 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x670Pglg61866240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Jul 2019 00:25:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40D20BE054;
 Sun,  7 Jul 2019 00:25:42 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14528BE051;
 Sun,  7 Jul 2019 00:25:39 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.232.154])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun,  7 Jul 2019 00:25:39 +0000 (GMT)
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
 <164b9c6e-9b6d-324d-9df8-d2f7d1ac8cfc@linux.vnet.ibm.com>
 <1270cd6ab2ceae1ad01e4b83b75fc4c6fc70027d.camel@linux.intel.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Date: Sat, 6 Jul 2019 20:25:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1270cd6ab2ceae1ad01e4b83b75fc4c6fc70027d.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070700-0036-0000-0000-00000AD46E87
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011389; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01228488; UDB=6.00646913; IPR=6.01009737; 
 MB=3.00027615; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-07 00:25:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070700-0037-0000-0000-00004C7EBA69
Message-Id: <bd961ef2-baed-8fc3-7f21-566bbcf9da8b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=971 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907070004
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
 Peter Huewe <peterhuewe@gmx.de>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/05/2019 01:50 PM, Jarkko Sakkinen wrote:
> On Fri, 2019-07-05 at 11:32 -0400, Nayna wrote:
>> I am not sure of the purpose of tpm_stop_chip(), so I have left it as it
>> is. Jarkko, what do you think about the change ?
> Stefan right. Your does not work, or will randomly work or not work
> depending on the chip.
>
> You need to turn the TPM on with tpm_chip_start() and turn it off with
> tpm_chip_stop() once you are done. This is done in tpm_chip_register()
> before calling tpm_auto_startup().
>
> TPM power management was once in tpm_transmit() but not anymore after my
> patch set that removed nested tpm_transmit() calls.
>
> While you're on it please take into account my earlier feedback.
>
> Also, short summary could be "tpm: tpm_ibm_vtpm: Fix unallocated banks"
>
> Some oddballs in your patch that I have to ask.
>
> if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> 	rc = tpm2_get_pcr_allocation(chip);
> 	if (rc)
> 		goto out;
> }
>
> chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
> 		GFP_KERNEL);
> if (!chip->allocated_banks) {
> 	rc = -ENOMEM;
> 	goto out;
> }
>
> Why you don't return on site and instead jump somewhere? Also the
> 2nd line for kcalloc() is misaligned.
>
> out:
> 	if (rc < 0)
> 		rc = -ENODEV;
>
> This will cause a new regression i.e. you let TPM error codes
> through.
>
> To summarize this patch fixes one regression and introduces two
> completely new ones...

Thanks Jarkko. I just now posted the v2 version that includes your and 
Stefan's feedbacks.

Thanks & Regards,
        - Nayna

