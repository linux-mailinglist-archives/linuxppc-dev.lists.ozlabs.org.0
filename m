Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 451232C8AE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:25:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClBvR5LqQzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 04:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pw8DfjCV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClBr924gxzDq97
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 04:22:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUHJY7Y039595; Mon, 30 Nov 2020 12:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LCS14rAVrx6siTkz3By+UZK64chWUDEhtThWX6d7LTM=;
 b=Pw8DfjCVCBCQdo5nAZtVDdlQo7f3H2SoHelKmFx4Mqp5LIzNQTE0SvqKbsuchawCtczv
 kfd1jVVVbmjFmSbl+ALej83Src4ZyS8wcHg7zHKTIVX1vbYVXi6LAJcwmq229nz7YjQ+
 fLb5XzvATFTNNThWoKN3oNqL9qgWQDwd9XuwEZT3YfFtjd1XoMmSIGC5M3sUGJg9ifAd
 L+Ml97zDA4PtiXzoU1UoO60yvBx5JA9oQR6nlpnWc4+dBvoAZNYkqAfTwU3qj5XOjVtz
 k6C+PAyHVXmHSsetPQLqiduEz3uIhpo+wJLoC9QZaNe9VwV7YhIg93yoVZNswRQIsGnQ tg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35551s83c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 12:22:26 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUHM54O013021;
 Mon, 30 Nov 2020 17:22:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 353e68wm2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 17:22:25 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AUHMOKM56099190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 17:22:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC59811207C;
 Mon, 30 Nov 2020 17:22:24 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1450112075;
 Mon, 30 Nov 2020 17:22:22 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.215.138])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 17:22:22 +0000 (GMT)
Subject: Re: [PATCH 01/13] ibmvfc: add vhost fields and defaults for MQ
 enablement
To: Brian King <brking@linux.vnet.ibm.com>,
 james.bottomley@hansenpartnership.com
References: <20201126014824.123831-1-tyreld@linux.ibm.com>
 <20201126014824.123831-2-tyreld@linux.ibm.com>
 <97e577a0-50f5-3ade-a377-7479f0f1c890@linux.vnet.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <8f637bcf-c9b4-9bf3-08a9-b3fdf3b7cf40@linux.ibm.com>
Date: Mon, 30 Nov 2020 09:22:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <97e577a0-50f5-3ade-a377-7479f0f1c890@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_06:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011300110
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

On 11/27/20 9:45 AM, Brian King wrote:
> On 11/25/20 7:48 PM, Tyrel Datwyler wrote:
>> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvfc.h
>> index 9d58cfd774d3..8225bdbb127e 100644
>> --- a/drivers/scsi/ibmvscsi/ibmvfc.h
>> +++ b/drivers/scsi/ibmvscsi/ibmvfc.h
>> @@ -41,6 +41,11 @@
>>  #define IBMVFC_DEFAULT_LOG_LEVEL	2
>>  #define IBMVFC_MAX_CDB_LEN		16
>>  #define IBMVFC_CLS3_ERROR		0
>> +#define IBMVFC_MQ			0
> 
> Given that IBMVFC_MQ is getting set to 0 here, that means mq_enabled is also
> always zero, so am I correct that a lot of this code being added is not
> yet capable of being executed?

Not with out a direct intervention from a hard coding a different value when
building the code. See comment below.

> 
>> +#define IBMVFC_SCSI_CHANNELS		0
> 
> Similar comment here...
> 
>> +#define IBMVFC_SCSI_HW_QUEUES		1
> 
> I don't see any subsequent patches in this series that would ever result
> in nr_hw_queues getting set to anything other than 1. Is that future work
> planned or am I missing something?

Yes, there is still some changes to EH that need to be included before those
values are safe to be set to anything else by the average user.

-Tyrel

> 
>> +#define IBMVFC_MIG_NO_SUB_TO_CRQ	0
>> +#define IBMVFC_MIG_NO_N_TO_M		0
>>  
>>  /*
>>   * Ensure we have resources for ERP and initialization:
>> @@ -826,6 +831,10 @@ struct ibmvfc_host {
>>  	int delay_init;
>>  	int scan_complete;
>>  	int logged_in;
>> +	int mq_enabled;
>> +	int using_channels;
>> +	int do_enquiry;
>> +	int client_scsi_channels;
>>  	int aborting_passthru;
>>  	int events_to_log;
>>  #define IBMVFC_AE_LINKUP	0x0001
>>
> 
> 

