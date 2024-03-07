Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89087591F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 22:16:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lOGkYfyf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrMXw45Lbz3vrp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 08:16:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lOGkYfyf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrMX8295Nz3vjn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 08:15:19 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 427L3200009140;
	Thu, 7 Mar 2024 21:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Mmxn/HvJJCpUllyW82EMz/8d3Nc40g5qmcrckDCRmRI=;
 b=lOGkYfyf20dOIiMl8LR1xduKzHdTUkKmL/lMKf1AIFVjLUtiVnprujfe839z4/IdnsT3
 4YyOUxsPZgclLPeiVninKeD7i+q5Aq+DpEV49TODo+Kxnt+Uxc/moNIwVu1f9ELqbRBO
 09phazcYWc0mbqZ8JdD9tZOShFiy0nPbEnd4q8FkVzS/swIF6ZnNuUSfLfSPtFzDavNX
 PDxjxjqFSe/P5gmecoMA2Dv5b7/SSkoe1AG/SExefKfbmw/LZl6iGYDaI7Z/FI1WnHa7
 a89XI5qoOAzObMWpuWHvmxi9fPkYouPwcsDbkpGbRY7cK1T7snRSQFI36lQeSAKcpT2O Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqn59r5u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 21:15:08 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 427LB0LV029916;
	Thu, 7 Mar 2024 21:15:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqn59r5tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 21:15:07 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 427KmJFs031554;
	Thu, 7 Mar 2024 21:15:07 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmgnkfw83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 21:15:07 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 427LF4nP20906368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Mar 2024 21:15:06 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 092D758066;
	Thu,  7 Mar 2024 21:15:04 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A94DC58043;
	Thu,  7 Mar 2024 21:15:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Mar 2024 21:15:02 +0000 (GMT)
Message-ID: <71c151b2-b03a-49a7-87b9-fc902b0cf328@linux.ibm.com>
Date: Thu, 7 Mar 2024 16:15:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com> <87jzmenx2c.fsf@mail.lhotse>
 <768fc5f1-3919-477e-a8e6-16a7e8536add@linux.ibm.com>
 <20240307-cytoplasm-compare-6656aae737ac@spud>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20240307-cytoplasm-compare-6656aae737ac@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gdpm0QswGA8oNLuW9vLW8I1m8Aw4LAcC
X-Proofpoint-ORIG-GUID: pvP8SegNeIzXP_1tgZnv0ven_wP8V5ZH
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_16,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403070150
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
Cc: rnsastry@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, Lukas Wunner <lukas@wunner.de>, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/7/24 15:39, Conor Dooley wrote:
> On Thu, Mar 07, 2024 at 10:11:03AM -0500, Stefan Berger wrote:
>> On 3/7/24 05:41, Michael Ellerman wrote:
>>> Stefan Berger <stefanb@linux.ibm.com> writes:
> 
>>>
>> diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> index 3c1241b2a43f..591c48f8cb74 100644
>> --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> @@ -30,6 +30,11 @@ properties:
>>         size of reserved memory allocated for firmware event log
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>
>> +  linux,sml-log:
>> +    description:
>> +      firmware event log
> 
> Can you provide a more complete description here please as to what the
> different between this and the other property? If I was populating a DT
> I would have absolutely no idea whether or not to use this or the other
> property, nor how to go about actually populating it.
> The "log" in your example doesn't look like an actual log of any sort,
> but I know nothing about TPMs so I'll take your word for it that that's
> what a TPM log looks like.

In the example I cannot give a log but only a part of it. The log is in 
binary format and in case of TPM 2.0 starts with a header followed by 
log entries about what was measured. I don't think it's necessary to 
even give the full log header here. You do need some TPM specific 
knowledge about the 'firmware even log'.


The existing properties are described like this:

   linux,sml-base:
     description:
       base address of reserved memory allocated for firmware event log
     $ref: /schemas/types.yaml#/definitions/uint64

   linux,sml-size:
     description:
       size of reserved memory allocated for firmware event log
     $ref: /schemas/types.yaml#/definitions/uint32

Would this describe the new property 'better' by prefixing it with 
'embedded'?

   linux,sml-log:
     description:
       embedded firmware event log
     $ref: /schemas/types.yaml#/definitions/uint8-array


> 
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +
>>     memory-region:
>>       description: reserved memory allocated for firmware event log
>>       maxItems: 1
>>
>>
>> Is my patch missing something?
> 
> I think you also need the dependantSchema stuff you had in your original
> snippet that makes the linux,* properties mutually exclusive with
> memory-region (or at least something like that).
> 
I modified my new example now like this:

...
             ibm,loc-code = "U9080.HEX.134CA08-V7-C3";
             linux,sml-log = <00 00 00 00 03 00 00>;
             linux,sml-size = <0xbce10200>;   <-- added

The check fails like this:

# make dt_binding_check dtbs_check DT_SCHEMA_FILES=tpm/ibm,vtpm.yaml
   LINT    Documentation/devicetree/bindings
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTEX    Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dts
   DTC_CHK Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb
/root/linux/Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb: 
tpm@30000003: 'linux,sml-base' is a dependency of 'linux,sml-size'
         from schema $id: http://devicetree.org/schemas/tpm/tpm-common.yaml#
/root/linux/Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb: 
tpm@30000003: 'linux,sml-base' is a dependency of 'linux,sml-size'
         from schema $id: http://devicetree.org/schemas/tpm/ibm,vtpm.yaml#
/root/linux/Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb: 
tpm@30000003: Unevaluated properties are not allowed ('interrupts', 
'linux,sml-log', 'linux,sml-size' were unexpected)
         from schema $id: http://devicetree.org/schemas/tpm/ibm,vtpm.yaml#



When I modify the existing example like this:

             ibm,loc-code = "U8286.41A.10082DV-V3-C3";
             linux,sml-base = <0xc60e 0x0>;
             linux,sml-size = <0xbce10200>;
             linux,sml-log = <00 00 00 00 03 00 00>;   <- added

The check fails like this:

# make dt_binding_check dtbs_check DT_SCHEMA_FILES=tpm/ibm,vtpm.yaml
   LINT    Documentation/devicetree/bindings
   CHKDT   Documentation/devicetree/bindings/processed-schema.json
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTEX    Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dts
   DTC_CHK Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb
/root/linux/Documentation/devicetree/bindings/tpm/ibm,vtpm.example.dtb: 
tpm@30000003: More than one condition true in oneOf schema:
         {'$filename': 
'/root/linux/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml',
          '$id': 'http://devicetree.org/schemas/tpm/ibm,vtpm.yaml#',
          '$schema': 'http://devicetree.org/meta-schemas/core.yaml#',
          'allOf': [{'$ref': 'tpm-common.yaml#'}],
          'oneOf': [{'required': ['linux,sml-base', 'linux,sml-size']},
                    {'required': ['linux,sml-log']}],
          'patternProperties': {'pinctrl-[0-9]+': True},
          'properties': {'$nodename': True,
                         'bootph-all': True,
                         'bootph-pre-ram': True,
                         'bootph-pre-sram': True,
                         'bootph-some-ram': True,
                         'bootph-verify': True,
                         'compatible': {'items': [{'enum': ['IBM,vtpm',
                                                            'IBM,vtpm20']}],
                                        'maxItems': 1,
                                        'minItems': 1,
                                        'type': 'array'},
                         'device_type': {'items': [{'enum': ['IBM,vtpm',
 
'IBM,vtpm20']}],
                                         'maxItems': 1,
                                         'minItems': 1,
                                         'type': 'array'},
                         'ibm,#dma-address-cells': {'$ref': 
'/schemas/types.yaml#/definitions/uint32-array'},
                         'ibm,#dma-size-cells': {'$ref': 
'/schemas/types.yaml#/definitions/uint32-array'},
                         'ibm,loc-code': {'$ref': 
'/schemas/types.yaml#/definitions/string'},
                         'ibm,my-dma-window': {'$ref': 
'/schemas/types.yaml#/definitions/uint32-array',
                                               'items': {'maxItems': 5,
                                                         'minItems': 5},
                                               'maxItems': 1,
                                               'type': 'array'},
                         'ibm,my-drc-index': {'$ref': 
'/schemas/types.yaml#/definitions/uint32'},
                         'phandle': True,
                         'pinctrl-names': True,
                         'reg': {'maxItems': 1, 'minItems': 1},
                         'secure-status': True,
                         'status': True},
          'required': ['compatible',
                       'device_type',
                       'reg',
                       'interrupts',
                       'ibm,#dma-address-cells',
                       'ibm,#dma-size-cells',
                       'ibm,my-dma-window',
                       'ibm,my-drc-index',
                       'ibm,loc-code'],
          'select': {'properties': {'compatible': {'contains': {'enum': 
['IBM,vtpm',
 
'IBM,vtpm20']}}},
                     'required': ['compatible']},
          'title': 'IBM Virtual Trusted Platform Module (vTPM)',
          'type': 'object',
          'unevaluatedProperties': False}
         from schema $id: http://devicetree.org/schemas/tpm/ibm,vtpm.yaml#


It errors out on bad examples, which is good.


> Please make sure you CC the DT maintainers and list on the v2 and Lukas
> Wunner too.

Yes, I have them already cc'ed here.

> 
> Thanks,
> Conor.
