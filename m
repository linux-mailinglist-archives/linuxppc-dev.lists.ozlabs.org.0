Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402308752CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:12:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8F91ScA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrCSy737rz3dXL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:12:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8F91ScA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrCSF533Jz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 02:11:25 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 427F1LYx008788;
	Thu, 7 Mar 2024 15:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=euuEeJjXnpV9EfcF+g1Rid2F4dUJ5mf3sXTllA3YfJM=;
 b=N8F91ScAgemvne6GJtQshOw6+R2JgJWh3z0GkteecEFB9sChgGvo0j52KwvDHSJpEphV
 aG6RZI1ECJFiX4rD4yj2HZPTdMRGfh59xKzrW5oSqyNHENRYPOvdYVBUgsyDFLbyztA8
 ky+qM0+bK4Z8c/ZdM6eC8+Xjq0S1jQmbaX1HNaQzPRmD+RQdEpwsRKxA/ptaN70abkg/
 vXLZ4b8jmSexz6u7dsUGbKGKWmzwNdgjLgl61cOfS1TfBR/Pk9j16SoDOG0Sx45SWaK6
 jbuV7w9l4MA7CZVNHjHb3HfU1uF86ndBaAEvDeCl6plST/5c/EtMC6YEXNPfTiUvXrXZ ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqfup0gp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:11:10 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 427F1R5p009217;
	Thu, 7 Mar 2024 15:11:10 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqfup0gnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:11:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 427CDSnw031575;
	Thu, 7 Mar 2024 15:11:09 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmgnkdysy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:11:09 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 427FB52b17891964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Mar 2024 15:11:07 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B16B58067;
	Thu,  7 Mar 2024 15:11:05 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 415055806C;
	Thu,  7 Mar 2024 15:11:04 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Mar 2024 15:11:04 +0000 (GMT)
Message-ID: <768fc5f1-3919-477e-a8e6-16a7e8536add@linux.ibm.com>
Date: Thu, 7 Mar 2024 10:11:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, conor.dooley@microchip.com,
        nayna@linux.ibm.com, Lukas Wunner <lukas@wunner.de>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com> <87jzmenx2c.fsf@mail.lhotse>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <87jzmenx2c.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WG70hV3g-X3LsEer3ntyisB7PM9L6BHp
X-Proofpoint-GUID: SN9INhSckFwDHrQ84Ri7zLvgWPujb7qZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403070087
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
Cc: jarkko@kernel.org, viparash@in.ibm.com, linux-kernel@vger.kernel.org, peterhuewe@gmx.de, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/7/24 05:41, Michael Ellerman wrote:
> Stefan Berger <stefanb@linux.ibm.com> writes:
>> linux,sml-base holds the address of a buffer with the TPM log. This
>> buffer may become invalid after a kexec and therefore embed the whole TPM
>> log in linux,sml-log. This helps to protect the log since it is properly
>> carried across a kexec with both of the kexec syscalls.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/prom_init.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
>> index e67effdba85c..41268c30de4c 100644
>> --- a/arch/powerpc/kernel/prom_init.c
>> +++ b/arch/powerpc/kernel/prom_init.c
>> @@ -1956,12 +1956,8 @@ static void __init prom_instantiate_sml(void)
>>   
>>   	reserve_mem(base, size);
>>   
>> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
>> -		     &base, sizeof(base));
>> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
>> -		     &size, sizeof(size));
>> -
>> -	prom_debug("sml base     = 0x%llx\n", base);
>> +	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-log",
>> +		     (void *)base, size);
> 
> As we discussed via chat, doing it this way sucks the full content of
> the log back into Open Firmware.
> 
> That relies on OF handling such big properties, and also means more
> memory will be consumed, which can cause problems early in boot.
> 
> A better solution is to explicitly add the log to the FDT in the
> flattening phase.

Done.

> 
> Also adding the new linux,sml-log property should be accompanied by a
> change to the device tree binding.


See my proposal below.

> 
> The syntax is not very obvious to me, but possibly something like?
> 
> diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> index 50a3fd31241c..cd75037948bc 100644
> --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
> @@ -74,8 +74,6 @@ required:
>     - ibm,my-dma-window
>     - ibm,my-drc-index
>     - ibm,loc-code
> -  - linux,sml-base
> -  - linux,sml-size
>   
>   allOf:
>     - $ref: tpm-common.yaml#
> diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> index 3c1241b2a43f..616604707c95 100644
> --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
> @@ -25,6 +25,11 @@ properties:
>         base address of reserved memory allocated for firmware event log
>       $ref: /schemas/types.yaml#/definitions/uint64
>   
> +  linux,sml-log:
> +    description:
> +      Content of firmware event log
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +
>     linux,sml-size:
>       description:
>         size of reserved memory allocated for firmware event log
> @@ -53,15 +58,22 @@ dependentRequired:
>     linux,sml-base: ['linux,sml-size']
>     linux,sml-size: ['linux,sml-base']
>   
> -# must only have either memory-region or linux,sml-base
> +# must only have either memory-region or linux,sml-base/size or linux,sml-log
>   # as well as either resets or reset-gpios
>   dependentSchemas:
>     memory-region:
>       properties:
>         linux,sml-base: false
> +      linux,sml-log: false
>     linux,sml-base:
>       properties:
>         memory-region: false
> +      linux,sml-log: false
> +  linux,sml-log:
> +    properties:
> +      memory-region: false
> +      linux,sml-base: false
> +      linux,sml-size: false
>     resets:
>       properties:
>         reset-gpios: false
> 
> 

I have been working with this patch here now and it passes the following 
test:

make dt_binding_check dtbs_check DT_SCHEMA_FILES=tpm/ibm,vtpm.yaml


diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml 
b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
index 50a3fd31241c..cacf6c3082de 100644
--- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
+++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
@@ -74,8 +74,12 @@ required:
    - ibm,my-dma-window
    - ibm,my-drc-index
    - ibm,loc-code
-  - linux,sml-base
-  - linux,sml-size
+oneOf:
+  - required:
+      - linux,sml-base
+      - linux,sml-size
+  - required:
+      - linux,sml-log

  allOf:
    - $ref: tpm-common.yaml#
@@ -102,3 +106,21 @@ examples:
              linux,sml-size = <0xbce10200>;
          };
      };
+  - |
+    soc {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tpm@30000003 {
+            compatible = "IBM,vtpm";
+            device_type = "IBM,vtpm";
+            reg = <0x30000003>;
+            interrupts = <0xa0003 0x0>;
+            ibm,#dma-address-cells = <0x2>;
+            ibm,#dma-size-cells = <0x2>;
+            ibm,my-dma-window = <0x10000003 0x0 0x0 0x0 0x10000000>;
+            ibm,my-drc-index = <0x30000003>;
+            ibm,loc-code = "U8286.41A.10082DV-V3-C3";
+            linux,sml-log = <00 00 00 00 03 00 00>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml 
b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
index 3c1241b2a43f..591c48f8cb74 100644
--- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
+++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
@@ -30,6 +30,11 @@ properties:
        size of reserved memory allocated for firmware event log
      $ref: /schemas/types.yaml#/definitions/uint32

+  linux,sml-log:
+    description:
+      firmware event log
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
    memory-region:
      description: reserved memory allocated for firmware event log
      maxItems: 1


Is my patch missing something?
