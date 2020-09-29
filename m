Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DCA27CEFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 15:22:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C10Rn20JfzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 23:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qtvfrl8r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C10Lj1tR7zDqM4;
 Tue, 29 Sep 2020 23:18:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TDCK6U086539; Tue, 29 Sep 2020 09:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hSrA3832gLlyyGCjDvw+VhwhvhQtefsMCjL6IVVCBds=;
 b=qtvfrl8rQepSv/NI5ir00a9pVr6JlBsWxUsg48BZEhw65Gphq2fWeNuvSLGb5pQj8B+8
 CqNCyU0luJ00xi7gUwvfEieNCjfKveykkQi8/W7+JOyJMMhaFw7Cfnpc0vz/END9wkVj
 TC9qMLPuJ68L2d0s18PLUYoqxBovNC5Pm+mUCLUcXHDQRQafGtvDi6o320TSa1O/XgWQ
 vpraAlpC5TmcMK+X3z13nL5Q/C8Ibiiw9i1wF3/8EOGBU2apxLGKOKr+eA8dg5diVhVq
 f0QyA+I5HZmObtK9rXgHi8C5YKimv9E8KXfOeni2WVxTHgJcwi5djhpIfg6BNyBYW5SE WA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33v5ksr6xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 09:17:58 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08TDCMHp012139;
 Tue, 29 Sep 2020 13:17:57 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 33sw994ax5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Sep 2020 13:17:57 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08TDHvIb50201024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Sep 2020 13:17:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 150D2AE067;
 Tue, 29 Sep 2020 13:17:57 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56865AE063;
 Tue, 29 Sep 2020 13:17:56 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.163.55.48])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 29 Sep 2020 13:17:56 +0000 (GMT)
Subject: Re: [PATCH] linux: configure CONFIG_I2C_OPAL as in-built.
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <1600885506-18734-1-git-send-email-nayna@linux.ibm.com>
 <8dc1ad002dcdc02122725dcc3ba27e1fd8c78b78.camel@linux.ibm.com>
 <CACPK8XdeAzbXcm2w6kJuAQzckdyFQ2P9h+fC36ZArpkubqC1mg@mail.gmail.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <58d7250b-e5ff-2dd6-38e4-a7ca0ec69681@linux.vnet.ibm.com>
Date: Tue, 29 Sep 2020 09:17:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdeAzbXcm2w6kJuAQzckdyFQ2P9h+fC36ZArpkubqC1mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_04:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290111
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
Cc: openpower-firmware@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 klaus@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/29/20 2:14 AM, Joel Stanley wrote:
> On Fri, 25 Sep 2020 at 18:19, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> Hi Nayna,
>>
>> On Wed, 2020-09-23 at 14:25 -0400, Nayna Jain wrote:
>>> Currently, skiroot_defconfig CONFIG_I2C_OPAL is built as a loadable
>>> module rather than builtin, even if CONFIG_I2C=y is defined. This
>>> results in a delay in the TPM initialization, causing IMA to go into
>>> TPM bypass mode. As a result, the IMA measurements are added to the
>>> measurement list, but do not extend the TPM. Because of this, it is
>>> impossible to verify or attest to the system's integrity, either from
>>> skiroot or the target Host OS.
>> The patch description is good, but perhaps we could provide a bit more
>> context before.
>>
>> The concept of trusted boot requires the measurement to be added to the
>> measurement list and extend the TPM, prior to allowing access to the
>> file. By allowing access to a file before its measurement is included
>> in the measurement list and extended into the TPM PCR, a malicious file
>> could potentially prevent its own measurement from being added. As the
>> PCRs are tamper proof, measuring and extending the TPM prior to giving
>> access to the file, guarantees that all file measurements are included
>> in the measurement list, including the malicious file.
>>
>> IMA needs to be enabled before any files are accessed in order to
>> verify a file's integrity and extend the TPM with the file
>> measurement.  Queueing file measurements breaks the measure and extend,
>> before usage, trusted boot paradigm.
>>
>> The ima-evm-utils package includes a test for walking the IMA
>> measurement list, calculating the expected TPM PCRs, and comparing the
>> calculated PCR values with the physical TPM.  Testing is important to
>> ensure the TPM is initialized prior to IMA.  Failure to validate the
>> IMA measurement list may indicate IMA went into TPM bypass mode, like
>> in this case.
> Thanks for the explanation Mimi. It's lucky that the TPM drivers can
> be loaded early enough!
>
> Should we add something like this to security/integrity/ima/Kconfig?
>
> select I2C_OPAL if PPC_POWERNV
>
> It's generally frowned upon to select user visible symbols, but IMA
> does this for the TCG options already.


I think yes, but in drivers/i2c/Kconfig and not in IMA Kconfig.

IMA is dependent on TPM, and it is specified in IMA Kconfig.

TPM NUVOTON driver has its dependency on I2C, which is taken care in 
drivers/char/tpm/Kconfig

It is I2C driver which is dependent on I2C_OPAL for its functioning on 
POWERNV Systems.

Thanks & Regards,

    - Nayna


