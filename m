Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7E879C21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 20:09:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rRUaChy0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvNVs5RCWz3dTW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 06:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rRUaChy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvNV65q0vz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 06:09:02 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42CIuxSN002406;
	Tue, 12 Mar 2024 19:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SlihXnpmGmd9lmDDDePxLPY4NbCMyKzYmvjmqDLRl9U=;
 b=rRUaChy0KA5/hHLyo675GDpV0QrUkz62ncB+8fo4SO2nQyKV9JcnT7nZw5h5DbN4vXg4
 +bHMK31vBY45Bz57eQ5Ck6LwtEGoxeNwdDxh1H2by/TXTWvzHz75ZUjWFlwAd0zKl+EO
 psZGNZJ+du6FJSj00g+fKtcVZ0JxMTF7SccxZCFuWjyDzSYJDpBYVgFq3jR6RK7DTpqa
 W40To1xld54p4bsNJgzF28KUWxeP07EhJ6hQj9C8hIhjkI8IPUi+4ybMjHnA+MouASgO
 YqbjETNSB67DoPiyJfmFDrzHfne4b+FZp93Poriqya28Sbzcq1KUCsNbvsCEXm93oSL3 nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtvsa87er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:08:54 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42CIuwWp002332;
	Tue, 12 Mar 2024 19:08:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtvsa87e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:08:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42CIon3c020437;
	Tue, 12 Mar 2024 19:08:52 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ws3km0x86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 19:08:52 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42CJ8nIG17498482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Mar 2024 19:08:51 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE7EE58059;
	Tue, 12 Mar 2024 19:08:48 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23A6558065;
	Tue, 12 Mar 2024 19:08:48 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Mar 2024 19:08:48 +0000 (GMT)
Message-ID: <e1b818ae-c932-4d25-98a5-26b258b63365@linux.ibm.com>
Date: Tue, 12 Mar 2024 15:08:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
 <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
 <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
 <877ci74u0w.fsf@mail.lhotse> <CZRW3GY5O5C0.R5HY5SOFCFJA@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CZRW3GY5O5C0.R5HY5SOFCFJA@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FmkvrwcYsISQ2f9e8fbNFAVaaIupA038
X-Proofpoint-GUID: KbovTr4OsFOA-wqfFNJciTwuXBLAzX0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_12,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403120146
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
Cc: peterhuewe@gmx.de, viparash@in.ibm.com, linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/24 11:50, Jarkko Sakkinen wrote:
> On Tue Mar 12, 2024 at 12:35 PM EET, Michael Ellerman wrote:
>> Stefan Berger <stefanb@linux.ibm.com> writes:
>>> On 3/7/24 15:00, Jarkko Sakkinen wrote:
>>>> On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
>>>>> in short summary: s/Use/use/
>>>>>
>>>>> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
>>>>>> If linux,sml-log is available use it to get the TPM log rather than the
>>>>>> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
>>>>>> on Power where after a kexec the memory pointed to by linux,sml-base may
>>>>>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
>>>>>> linux,sml-size on these two platforms.
>>>>>>
>>>>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>>>>
>>>>> So shouldn't this have a fixed tag, or not?
>>>>
>>>> In English: do we want this to be backported to stable kernel releases or not?
>>>
>>> Ideally, yes. v3 will have 3 patches and all 3 of them will have to be
>>> backported *together* and not applied otherwise if any one of them
>>> fails. Can this be 'guaranteed'?
>>
>> You can use Depends-on: <previous commit SHA> to indicate the relationship.
>>
>> cheers
> 
> Thanks, I've missed depends-on tag.
> 
> Stefan, please add also "Cc: stable@vger.kernel.org" just to make sure
> that I don't forget to add it.

Yeah, once we know whether this is the way forward or not... I posted v2 
as RFC to figure this out.

v2's 2/3 patch will only apply to 6.8. To avoid any inconsistencies 
between code and bindings we cannot even go further back with this 
series (IFF it's the way forward at all). So I am inclined to remove the 
Fixes tags. I also find little under Documentation about the Depends-on 
tag and what it's supposed to be formatted like -- a commit hash of 1/3 
appearing in 2/3 for example? The commit hash is not stable at this 
point so I couldn't created it.

> Right, and since these are so small scoped commits, and bug fixes in
> particular, it is also possible to do PR during the release cycle.
> 
> BR, Jarkko
