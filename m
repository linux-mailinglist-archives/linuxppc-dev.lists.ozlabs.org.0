Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E931D0FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Feb 2021 20:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dg9zm0D6Jz3cVB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 06:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VSUZDZmu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VSUZDZmu; dkim-atps=neutral
X-Greylist: delayed 2788 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 06:30:02 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dg9zG1NG6z3cGq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 06:30:00 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GIWDlZ173635; Tue, 16 Feb 2021 13:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V1xU+saz9w4xiE659/nYzU7asqdKegzxMTqU8mFL/EU=;
 b=VSUZDZmuDejsM9+YVG+Q1nR+xPVfbS3+TRCWqLYBb0Um4A8GTLO5Co0D50p6VCTYqOGW
 BJl4Be8LnfIrCV6UuxzWNtPnRN6dtr5Nkz9Ha2otr88hWwZR7OL1irT8x1MSlpX+nzsw
 foSyBHz45yR3Sz0+++/C6/VdQVdNzKz6mYCAPrTTSotpYUIJ1NlbOHq4x9C2BAl5MoFk
 /ITuT3b3B58mXwvsDMJfG+nkHQ3fFWyH3L37p9l8lWPI1KHLOh93ndfcGkhMyssdqncD
 2i4sAfoWysZIZu9qZMIfxLMpja9wgOPeJ62bM1DLeb2++pZTPy5mCvIgL67m7RxvxnNX LQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rhtdusc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 13:43:30 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GIaX6F016141;
 Tue, 16 Feb 2021 18:43:29 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 36p6d9pf0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 18:43:29 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GIhTAJ7799706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Feb 2021 18:43:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02B7328066;
 Tue, 16 Feb 2021 18:43:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D7D428058;
 Tue, 16 Feb 2021 18:43:26 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.70.200])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Feb 2021 18:43:25 +0000 (GMT)
Subject: Re: [PATCH 4/4] ibmvfc: store return code of H_FREE_SUB_CRQ during
 cleanup
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20210211185742.50143-1-tyreld@linux.ibm.com>
 <20210211185742.50143-5-tyreld@linux.ibm.com>
 <94321ded-7970-258c-cee9-222f7b2b511f@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <f5821413-f390-f759-a8a4-764c7f69537c@linux.ibm.com>
Date: Tue, 16 Feb 2021 10:43:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <94321ded-7970-258c-cee9-222f7b2b511f@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_08:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160153
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/16/21 6:58 AM, Brian King wrote:
> On 2/11/21 12:57 PM, Tyrel Datwyler wrote:
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
>> index ba6fcf9cbc57..23b803ac4a13 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
>> @@ -5670,7 +5670,7 @@ static int ibmvfc_register_scsi_channel(struct ibmvfc_host *vhost,
>>  
>>  irq_failed:
>>  	do {
>> -		plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
>> +		rc = plpar_hcall_norets(H_FREE_SUB_CRQ, vdev->unit_address, scrq->cookie);
>>  	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
> 
> Other places in the driver where we get a busy return code back we have an msleep(100).
> Should we be doing that here as well?

Indeed, and actually even better would be to use rtas_busy_delay() which will
perform the sleep with the correct ms delay, and marks itself with the
might_sleep() macro.

-Tyrel

> 
> Thanks,
> 
> Brian
> 

