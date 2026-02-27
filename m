Return-Path: <linuxppc-dev+bounces-17366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN4fHu1VoWk+sQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17366-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:29:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D01B48F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMhMG06Y0z2yFQ;
	Fri, 27 Feb 2026 19:29:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772180969;
	cv=none; b=lODmTZghJ+qq/WjbiL3xFOovYx0iTLN+gq6rs94fA3Sn2UNGVp/uc/7au04pCBj4xsDwskNYXWdrbNurwMVbPl7vDMwdfzF5i+O8Z87OQdVN9XO15vlikjyc2DngAWpbtt4n7RMZ5KpyycTxQAdAUXugCYJfg7T0EJT91UKbIQflGmjWNg4VIUOb98l2LMmvu4TI0twzPT/oNZ2Tr7Ow7pgB5jBG3IpVayEqUGD/FEzCAINhYGrW33lC3wNv942H6kYPUKCmB/mTMPOIS8q03Ysfwk9e8bJXQswxAc6Fc5MklVK0nrAw4806qKjFMTRLEXnCADtR/RoAigZOGvkJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772180969; c=relaxed/relaxed;
	bh=WjUTBMCek3Z8NujeohpUr7Q1Jg5lzgvRg/Kd1H3BpIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vzjngjl8LwY6Yo0iRKb5EYt5uJTGForieLPQPEsIZXfAVO5INu2+YvugCjTjnXjRTsBQ2YVoEC20dDI0etLKIA1K+9toUFPKDe+Oiir5lV0GjOTlu6C785YzuG5vIIJXJ3vLeARVV75krTG/Hbr+QxVOOfyMS4XOFn0LkdN6OlPvj1K1F9xLubFlP+BJRWaNnmOSiQ2bPDOSmA22uqd7JYKNmlsNwyGep7Y42JjfWGoOE1q24cRS2i42y4iK3IuWfPPs2I95sn/LMk8RXu+CZGj94R7EW9EaqhmzqrPV2/c/8NH+kVMIw/61QIIJmZwgWa0zx+pnzCqJ9826g3HL5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rFZwGEED; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rFZwGEED;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMhMD3YmVz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:29:28 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K19s2935076;
	Fri, 27 Feb 2026 08:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WjUTBM
	Cek3Z8NujeohpUr7Q1Jg5lzgvRg/Kd1H3BpIc=; b=rFZwGEEDjDPaB/ANdESy94
	TO6krgNZIskePhF5hj8ZRHLwNrHTk12+nUhWgf0urOtSdCgQrQBl5F6vK2TC49dL
	gO6LniLcOqUQIi00Tb8IV53MEiZ90/6wEdzfy7dv0SmtwMAdV0l8/UDvXFvIat5W
	YTK2jL5fU2majG8iPIiyU7shfJ5/yjmSDb8Z5+4k1ubtwNiRPldkkhLS3B6OHQ1F
	HmHliACN4ZXYFl3bZ4n8Umam7qa6gnJhzp19pwpnm2JSVpzAa39kiy+9F2JTI2DY
	AawzE2MW4nrLFqLcPaTgpmHc1WGfL9g/lCDSkaXxgHIQHtiEmBTvF+bkjT1zFHfQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24gtw60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 08:29:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R7k5tB015983;
	Fri, 27 Feb 2026 08:29:15 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1t17ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 08:29:15 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R8TDps11272704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 08:29:13 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29EAA58059;
	Fri, 27 Feb 2026 08:29:13 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB43F58057;
	Fri, 27 Feb 2026 08:29:08 +0000 (GMT)
Received: from [9.98.107.249] (unknown [9.98.107.249])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 08:29:08 +0000 (GMT)
Message-ID: <5d316ad2-a842-4d29-b155-ecfc47aa1066@linux.ibm.com>
Date: Fri, 27 Feb 2026 13:59:07 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] Extend "trusted" keys to support a new trust
 source named the PowerVM Key Wrapping Module (PKWM)
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        James.Bottomley@HansenPartnership.com, jarkko@kernel.org,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
 <31dfcf7a-5b3d-406d-bdd4-c8b09f7eb1f0@kernel.org>
Content-Language: en-US
From: Srish Srinivasan <ssrish@linux.ibm.com>
In-Reply-To: <31dfcf7a-5b3d-406d-bdd4-c8b09f7eb1f0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=69a155dc cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=zIm8Uhvo-wyo9pAa0GkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ftecudPO92h21O9-uuzMyzd80otBlo3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2OCBTYWx0ZWRfXwpbjmUQTgC4u
 Ehy/QxKdbUadIYYvLL23tes8BFOFwCzmoZL2oIgujluNIS9TTyT42dTdlAesAtHZra4O+IvLIMq
 C351O6sdTT1SRwgUMv8gpRqRS+KbIiy4lIU/yAp+7UQS2I+V7/1aoB2ez8KtTk7nIMERsupJirk
 lxWj7HihPH6iJDTQiabEvunetvZbhg5vWcAmVlTpTRfTzANMjDGvtPMI4LEuvO1SCkypC/j8Kew
 l9xCuW65AvlizjOKMFho4XVmEnkBc2M6JcnrnB6i8Lj5BfuyG5ZjuH9V6i1nZJsF1uvShLk5rFE
 n0+YKBBkVrzTdo/oCUbvinICxhDTjwGIAnB2cADH0q4Lzubmm86IkikYzaE046ujazGhPRx1ZcT
 yi0ComgtwvUyED8oKcBAwq4byetHhVVdazdu0zQ3K2XAaiHWVVZOvrLjUvZ6qxDU5HZq4MGz/Jl
 hyIk/JjKi8SD15tJfRw==
X-Proofpoint-ORIG-GUID: L_WJThrLdBOahqN_YT_rFmFPZnfrogXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270068
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17366-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,HansenPartnership.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9B0D01B48F0
X-Rspamd-Action: no action

Hi Christophe,

On 2/27/26 1:21 PM, Christophe Leroy (CS GROUP) wrote:
>
>
> Le 01/02/2026 à 14:59, Srish Srinivasan a écrit :
>> Power11 has introduced a feature called the PowerVM Key Wrapping Module
>> (PKWM), where PowerVM in combination with Power LPAR Platform KeyStore
>> (PLPKS) [1] supports a new feature called "Key Wrapping" [2] to protect
>> user secrets by wrapping them using a hypervisor generated wrapping key.
>> This wrapping key is an AES-GCM-256 symmetric key that is stored as an
>> object in the PLPKS. It has policy based protections that prevents it 
>> from
>> being read out or exposed to the user. This wrapping key can then be 
>> used
>> by the OS to wrap or unwrap secrets via hypervisor calls.
>>
>> This patchset intends to add the PKWM, which is a combination of IBM
>> PowerVM and PLPKS, as a new trust source for trusted keys. The 
>> wrapping key
>> does not exist by default and its generation is requested by the 
>> kernel at
>> the time of PKWM initialization. This key is then persisted by the 
>> PKWM and
>> is used for wrapping any kernel provided key, and is never exposed to 
>> the
>> user. The kernel is aware of only the label to this wrapping key.
>>
>> Along with the PKWM implementation, this patchset includes two 
>> preparatory
>> patches: one fixing the kernel-doc inconsistencies in the PLPKS code and
>> another reorganizing PLPKS config variables in the sysfs.
>>
>> Changelog:
>>
>> v6:
>
> Seems like v5 was applied, if needed can you send followup patch ?
>
> Christophe


I had sent out a patch on top of v5 to take care of this, and it has 
been applied.

thanks,
Srish.


>
>>
>> * Patch 1 to Patch 3:
>>    - Add Nayna's Tested-by tag
>> * Patch 4
>>    - Fix build error reported by kernel test robot <lkp@intel.com>
>>    - Add Nayna's Tested-by tag
>> * Patch 5
>>    - Add Nayna's Tested-by tag
>>
>> v5:
>>
>> * Patch 1 to Patch 3:
>>    - Add Nayna's Reviewed-by tag
>> * Patch 4:
>>    - Fix build error identified by chleroy@kernel.org
>>    - Add Nayna's Reviewed-by tag
>> * Patch 5:
>>    - Add Reviewed-by tags from Nayna and Jarkko
>>
>> v4:
>>
>> * Patch 5:
>>    - Add a per-backend private data pointer in trusted_key_options
>>      to store a pointer to the backend-specific options structure
>>    - Minor clean-up
>>
>> v3:
>>
>> * Patch 2:
>>    - Add Mimi's Reviewed-by tag
>> * Patch 4:
>>    - Minor tweaks to some print statements
>>    - Fix typos
>> * Patch 5:
>>    - Fix typos
>>    - Add Mimi's Reviewed-by tag
>> * Patch 6:
>>    - Add Mimi's Reviewed-by tag
>>
>> v2:
>>
>> * Patch 2:
>>    - Fix build warning detected by the kernel test bot
>> * Patch 5:
>>    - Use pr_debug inside dump_options
>>    - Replace policyhande with wrap_flags inside dump_options
>>    - Provide meaningful error messages with error codes
>>
>> Nayna Jain (1):
>>    docs: trusted-encryped: add PKWM as a new trust source
>>
>> Srish Srinivasan (5):
>>    pseries/plpks: fix kernel-doc comment inconsistencies
>>    powerpc/pseries: move the PLPKS config inside its own sysfs directory
>>    pseries/plpks: expose PowerVM wrapping features via the sysfs
>>    pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
>>    keys/trusted_keys: establish PKWM as a trusted source
>>
>>   .../ABI/testing/sysfs-firmware-plpks          |  58 ++
>>   Documentation/ABI/testing/sysfs-secvar        |  65 --
>>   .../admin-guide/kernel-parameters.txt         |   1 +
>>   Documentation/arch/powerpc/papr_hcalls.rst    |  43 ++
>>   .../security/keys/trusted-encrypted.rst       |  50 ++
>>   MAINTAINERS                                   |   9 +
>>   arch/powerpc/include/asm/hvcall.h             |   4 +-
>>   arch/powerpc/include/asm/plpks.h              |  95 +--
>>   arch/powerpc/include/asm/secvar.h             |   1 -
>>   arch/powerpc/kernel/secvar-sysfs.c            |  21 +-
>>   arch/powerpc/platforms/pseries/Makefile       |   2 +-
>>   arch/powerpc/platforms/pseries/plpks-secvar.c |  29 -
>>   arch/powerpc/platforms/pseries/plpks-sysfs.c  |  96 +++
>>   arch/powerpc/platforms/pseries/plpks.c        | 688 +++++++++++++++++-
>>   include/keys/trusted-type.h                   |   7 +-
>>   include/keys/trusted_pkwm.h                   |  33 +
>>   security/keys/trusted-keys/Kconfig            |   8 +
>>   security/keys/trusted-keys/Makefile           |   2 +
>>   security/keys/trusted-keys/trusted_core.c     |   6 +-
>>   security/keys/trusted-keys/trusted_pkwm.c     | 190 +++++
>>   20 files changed, 1207 insertions(+), 201 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
>>   create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
>>   create mode 100644 include/keys/trusted_pkwm.h
>>   create mode 100644 security/keys/trusted-keys/trusted_pkwm.c
>>
>

