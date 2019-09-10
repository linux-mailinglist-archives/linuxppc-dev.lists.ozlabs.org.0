Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB058AE1CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 03:07:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S6MC4w4MzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S6D04lzRzDqPc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 11:01:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A0v8LB024998
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Sep 2019 21:01:03 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uwys6399j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 21:01:02 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 10 Sep 2019 02:01:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 02:00:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8A10vAg61669458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 01:00:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EB2252057;
 Tue, 10 Sep 2019 01:00:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C21FA52065;
 Tue, 10 Sep 2019 01:00:56 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8D14AA01D3;
 Tue, 10 Sep 2019 11:00:55 +1000 (AEST)
Subject: Re: [PATCH 09/11] pci/hotplug/pnv-php: Relax check when disabling slot
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
Date: Tue, 10 Sep 2019 11:00:55 +1000
In-Reply-To: <20190909154600.19917-10-fbarrat@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-10-fbarrat@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091001-0020-0000-0000-0000036A33D3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091001-0021-0000-0000-000021BFB6FA
Message-Id: <14004d6ca963ece9f0f1ab844c899035b6e970bb.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100005
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
Cc: groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-09 at 17:45 +0200, Frederic Barrat wrote:
> The driver only allows to disable a slot in the POPULATED
> state. However, if an error occurs while enabling the slot, say
> because the link couldn't be trained, then the POPULATED state may
> not
> be reached, yet the power state of the slot is on. So allow to
> disable
> a slot in the REGISTERED state. Removing the devices will do nothing
> since it's not populated, and we'll set the power state of the slot
> back to off.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c
> b/drivers/pci/hotplug/pnv_php.c
> index f0a7360154e7..5ca51d67db4b 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -523,7 +523,13 @@ static int pnv_php_disable_slot(struct
> hotplug_slot *slot)
>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
>  	int ret;
>  
> -	if (php_slot->state != PNV_PHP_STATE_POPULATED)
> +	/*
> +	 * Allow to disable a slot already in the registered state to
> +	 * cover cases where the slot couldn't be enabled and never
> +	 * reached the populated state
> +	 */
> +	if (php_slot->state != PNV_PHP_STATE_POPULATED &&
> +	    php_slot->state != PNV_PHP_STATE_REGISTERED)
>  		return 0;
>  
>  	/* Remove all devices behind the slot */

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

