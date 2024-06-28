Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0591C4D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 19:27:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P0zxScd2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9j735fmpz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 03:27:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P0zxScd2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9j6M6d2vz3cYt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2024 03:26:51 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SHQd9t019168;
	Fri, 28 Jun 2024 17:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	VcN3kePM+arjTHsJ0UoPdxnh68JcoVepbhSSbj5f1OM=; b=P0zxScd2ixgpyV1/
	u1p7vZSwalbCpvcj4uoNRzTnN/MZAe1d3dVKggksobdpYGKmdjeOhmVDR/pP1evb
	+NmGfQtbZI54v156L4i0pHXFBuB6WiSmOKnze7IbNwpHWy0LV0qTdV68pxmgzr0b
	g9gTgUu6cLhroaf54X2a6TL2PdMNEHjR3dBHCJO9he0xfQN2hmlzH9pg4JZUj+kH
	gvqCEhR9xf3MICVnSr9GDyliegtNivP0myFHkePzh7lZkU3HRYxSW6Ky9ErTc7ND
	xSGN9wVzlkU66JUZK9C5+2vlE/BDeGGAu1HZpCZOltURKq+zCgxXBjMR2D9cYIiL
	jQHZWQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 401yuhg99u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 17:26:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45SF5GsM032606;
	Fri, 28 Jun 2024 17:21:57 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn3s3b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 17:21:57 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45SHLtaa37618356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 17:21:57 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17B3758060;
	Fri, 28 Jun 2024 17:21:55 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7ACD358043;
	Fri, 28 Jun 2024 17:21:54 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 28 Jun 2024 17:21:54 +0000 (GMT)
Message-ID: <1bca15c7-1e76-49bc-aa6c-368d2bbf2e5c@linux.ibm.com>
Date: Fri, 28 Jun 2024 13:21:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Michael Ellerman <mpe@ellerman.id.au>, regressions@lists.linux.dev
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <87pls1lwe0.fsf@mail.lhotse>
 <4108938158d888cc6ec371bb151e7ac35d3b4cb0.camel@HansenPartnership.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <4108938158d888cc6ec371bb151e7ac35d3b4cb0.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VY9C5Bla9sDiFnRhJOGu09GsMOggn9mh
X-Proofpoint-GUID: VY9C5Bla9sDiFnRhJOGu09GsMOggn9mh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280129
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
Cc: naveen.n.rao@linux.ibm.com, jarkko@kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/28/24 12:39, James Bottomley wrote:
> On Fri, 2024-06-28 at 10:54 +1000, Michael Ellerman wrote:
>> Stefan Berger <stefanb@linux.ibm.com> writes:
>>> Fix the following type of error message caused by a missing call to
>>> tpm2_sessions_init() in the IBM vTPM driver:
>>>
>>> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error
>>> 0x01C4
>>> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>>>
>>> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>> ---
>>>   drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
>>> b/drivers/char/tpm/tpm_ibmvtpm.c
>>> index d3989b257f42..1e5b107d1f3b 100644
>>> --- a/drivers/char/tpm/tpm_ibmvtpm.c
>>> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>>> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
>>> *vio_dev,
>>>                  rc = tpm2_get_cc_attrs_tbl(chip);
>>>                  if (rc)
>>>                          goto init_irq_cleanup;
>>> +
>>> +               rc = tpm2_sessions_init(chip);
>>> +               if (rc)
>>> +                       goto init_irq_cleanup;
>>>          }
>>>   
>>>          return tpm_chip_register(chip);
>>
>> #regzbot ^introduced: d2add27cf2b8
> 
> Could you please test out the patch I proposed for this:
> 
> https://lore.kernel.org/linux-integrity/1302b413a2d7bf3b275133e7fdb04b44bfe2d5e3.camel@HansenPartnership.com/
> 
> Because it's not just tmp_ibmvtpm that doesn't call autostart.  From
> inspection xen-tpmfront, tmp_nsc, tpm_infineon and tpm_atmel also

afaik tpm_infineon is a TPM 1.2 driver; same holds for tpm_atmel and 
tpm_ns. Neither needs this new call from what I understand. The new TPM2 
drivers have the TPM_OPS_AUTO_STARTUP flag set.

$ grep -r AUTO drivers/char/tpm/*.c | grep =
drivers/char/tpm/tpm_crb.c:     .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_ftpm_tee.c:        .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_i2c_atmel.c:       .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_i2c_infineon.c:    .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_i2c_nuvoton.c:     .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_ibmvtpm.c: .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_tis_core.c:        .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_tis_i2c_cr50.c:    .flags = TPM_OPS_AUTO_STARTUP,
drivers/char/tpm/tpm_vtpm_proxy.c:      .flags = TPM_OPS_AUTO_STARTUP,

With xen-tpmfront I am not sure where something like chip->flags |= 
TPM_CHIP_FLAG_TPM2 is done -- tpm2-cmd.c::tpm2_probe is not called from 
this driver but only from tpm_tis_core.c::tpm_tis_core_init and 
otherwise driver set it themselves.

$ grep -r TPM_CHIP_FLAG_TPM2 drivers/char/tpm/*.c | grep =
drivers/char/tpm/tpm2-cmd.c:                    chip->flags |= 
TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm-chip.c:    rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
drivers/char/tpm/tpm_crb.c:     chip->flags = TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm_ftpm_tee.c:        pvt_data->chip->flags |= 
TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm_i2c_nuvoton.c:             chip->flags |= 
TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm_ibmvtpm.c:         chip->flags |= TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm-interface.c:       rc = (chip->flags & 
TPM_CHIP_FLAG_TPM2) != 0;
drivers/char/tpm/tpm_tis_i2c_cr50.c:    chip->flags |= TPM_CHIP_FLAG_TPM2;
drivers/char/tpm/tpm_vtpm_proxy.c:              proxy_dev->chip->flags 
|= TPM_CHIP_FLAG_TPM2;





> don't, so it would be better to fix this for everyone rather than just
> for you and have to do a separate fix for each of them.

I am not sure whether any one of the mentioned drivers actually need 
this call and if they need it they should probably move towards setting 
TPM_OPS_AUTO_STARTUP.

   Stefan
> 
> James
> 
> 
