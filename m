Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE185CA03
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 09:37:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dGLF1btnzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 17:37:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dGJJ3wxWzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 17:36:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x627YkAX092916
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jul 2019 03:36:13 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tg1p6u6pd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 03:36:13 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Tue, 2 Jul 2019 08:36:11 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 08:36:08 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x627a6B139649734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 07:36:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8124D42045;
 Tue,  2 Jul 2019 07:36:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DBB44203F;
 Tue,  2 Jul 2019 07:36:06 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 07:36:06 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 14D8FA01EB;
 Tue,  2 Jul 2019 17:36:05 +1000 (AEST)
Subject: Re: [RFC 09/11] pci/hotplug/pnv-php: Relax check when disabling slot
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
 <20190619132840.27634-10-fbarrat@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Tue, 2 Jul 2019 17:36:04 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190619132840.27634-10-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070207-4275-0000-0000-000003484741
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070207-4276-0000-0000-000038585D00
Message-Id: <a856253c-85ca-ab72-91ba-15fe20e460e9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=927 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020086
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
Cc: aik@ozlabs.ru, arbab@linux.ibm.com, oohall@gmail.com, groug@kaod.org,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/6/19 11:28 pm, Frederic Barrat wrote:
> The driver only allows to disable a slot in the POPULATED
> state. However, if an error occurs while enabling the slot, say
> because the link couldn't be trained, then the POPULATED state may not
> be reached, yet the power state of the slot is on. So allow to disable
> a slot in the REGISTERED state. Removing the devices will do nothing
> since it's not populated, and we'll set the power state of the slot
> back to off.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   drivers/pci/hotplug/pnv_php.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index f9c624334ef7..74b62a8e11e7 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -523,7 +523,13 @@ static int pnv_php_disable_slot(struct hotplug_slot *slot)
>   	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>   	int ret;
>   
> -	if (php_slot->state != PNV_PHP_STATE_POPULATED)
> +	/*
> +	 * Allow to disable a slot already in the registered state to
> +	 * cover cases where the slot couldn't be enabled and never
> +	 * reached the populated state
> +	 */
> +	if (php_slot->state != PNV_PHP_STATE_POPULATED &&
> +		php_slot->state != PNV_PHP_STATE_REGISTERED)
>   		return 0;
>   
>   	/* Remove all devices behind the slot */
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

