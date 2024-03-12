Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C30CE879C4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 20:37:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IzMtufyi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvP7R4DwTz3dd4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 06:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IzMtufyi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvP6j451yz3dRp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 06:37:16 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42CIus7Y012523;
	Tue, 12 Mar 2024 19:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=80wPmnITO8gQWN+zUxQmSA2ZI8Fawb2/8IYwf+7K3Eg=;
 b=IzMtufyiFM/OdIcCkMkaKiA8BgSUs0K1/85+EtVOt7mwUJ3KS8AsWLpSpPJj35cTAcQ2
 AAtomTwt6pMCSyxcifJwjvXcrEEWlei2AyaAXJTef8ahfGdk/XcNe2pldBIDtreG3Vbl
 wJckCl5ufl/XCRbSx27kKTkoUaCjDovFkTJpqAKtir2J531YtbipeZ1icqg2DEiMwlel
 aj4qNov4U2NjlJWRKz3eU2A0T0dmn7415ocCk0+Y7QJnFCjFMgdCktZ+pDgDGASSmwoE
 9JKbQLV/kLoU1LeI5BmKyrIVQUyi3ZUmMOlejvZhzE1xwBKFv6GBQ/KpnLRPPoszMDzq mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtvs90hd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:37:09 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42CJRFxI017257;
	Tue, 12 Mar 2024 19:37:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtvs90hcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:37:08 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42CJNleX018581;
	Tue, 12 Mar 2024 19:37:07 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t20pw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:37:07 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42CJb4mf47251884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Mar 2024 19:37:06 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CDB558063;
	Tue, 12 Mar 2024 19:37:04 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA3D35804B;
	Tue, 12 Mar 2024 19:37:03 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Mar 2024 19:37:03 +0000 (GMT)
Message-ID: <81cd893e-46c3-4d38-aa93-8ab410a770ea@linux.ibm.com>
Date: Tue, 12 Mar 2024 15:37:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/3] tpm: of: If available use linux,sml-log to get
 the log and its size
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>, mpe@ellerman.id.au,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-4-stefanb@linux.ibm.com>
 <CZR7B45P71XS.53XNZD9FWZSL@kernel.org>
 <916fb19b-daf8-4c1b-bc25-f071d2b3ae33@linux.ibm.com>
 <CZRVXE96ZZA8.33VFES8S07YS9@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CZRVXE96ZZA8.33VFES8S07YS9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uYpch5nFxdfwWQwYQw4GeJGEeaWxQcn8
X-Proofpoint-ORIG-GUID: B-r6TN2dDjIyVKTP_5HXBJqJIT_DYiuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_12,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403120150
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/24 11:43, Jarkko Sakkinen wrote:
> On Mon Mar 11, 2024 at 10:33 PM EET, Stefan Berger wrote:
>>
>>
>> On 3/11/24 16:25, Jarkko Sakkinen wrote:
>>> On Mon Mar 11, 2024 at 3:20 PM EET, Stefan Berger wrote:
>>>> If linux,sml-log is available use it to get the TPM log rather than the
>>>> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
>>>> on Power where after a kexec the memory pointed to by linux,sml-base may
>>>> have become inaccessible or corrupted. Also, linux,sml-log has replaced
>>>> linux,sml-base and linux,sml-size on these two platforms.
>>>>
>>>> Keep the handling of linux,sml-base/sml-size for powernv platforms that
>>>> provide the two properties via skiboot.
>>>>
>>>> Fixes: c5df39262dd5 ("drivers/char/tpm: Add securityfs support for event log")
>>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>>
>>> I'm worried about not being up to date and instead using "cached" values
>>> when verifying anything from a security chip. Does this guarantee that
>>> TPM log is corrupted and will not get updated somehow?
>>
>>
>> What do you mean 'guarantee that TPM log is corrupted'?
> 
> I presume that this is for power architecture but I have no idea what

Yes it is for Power. From commit message above: "This resolves an issue 
on PowerVM and KVM on Power where after a kexec the memory pointed to by 
linux,sml-base may have become inaccessible or corrupted."

> leads log being corrupted, and is the scope all of that that arch or
> some subset of CPUs.

Every CPU will see a corrupted log.

> 
> The commit message is not very detailed on kexec scenario. It more like

I guess what is missing in the message that the buffer was not properly 
protected during the kexec and may have been overwritten for example 
since it was mistakenly assumed to be free memory?

> assumes that reader knows all the detail beforehand. So probably this
> will start to make sense once the backing story is improved, that's
> all.
> 
>> The TPM was handed over from the firmware to Linux and the firmware then
>> freed all memory associated with the log and will then not create a new
>> log or touch the TPM or do anything that would require an update to the
>> handed-over log. Linux also does not append to the firmware log. So
>> whatever we now find in linux,sml-log would be the latest firmware log
>> and the state of the 'firmware PCRs' computed from it should correspond
>> to the current state of the 'firmware PCRs'.
> 
> So on what CPU this happens and is there any bigger picture for that
> design choice in the firmware?

The firmware provides a call sml-handover, which hands over the TPM log 
to the caller and at the same time frees the log. You cannot call the 
firmware a 2nd time for the log.

> 
> If it is a firmware bug, this should emit FW_BUG log message. If not,
> then this commit message should provide the necessary context.

It's not a firmware bug. The issue is that the buffer holding the TPM 
log is not properly carried across a kexec soft reboot and may for 
example have been overwritten since it was assumed to be free memory.

> 
> BR, Jarkko
> 
