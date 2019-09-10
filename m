Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E430FAEF4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:13:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SVSG2vX1zF1Ps
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 02:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SVPx4r9lzF15B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46SVPw5S7gz8t7L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:11:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46SVPw4Gqvz9sNf; Wed, 11 Sep 2019 02:11:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46SVPw02lSz9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 02:10:59 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8AG811Y122848
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 12:10:55 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uxe2baq23-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 12:10:54 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 10 Sep 2019 17:10:52 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 17:10:49 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8AGAlRO32309624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 16:10:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5190A4059;
 Tue, 10 Sep 2019 16:10:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 161E9A4053;
 Tue, 10 Sep 2019 16:10:46 +0000 (GMT)
Received: from [9.204.130.183] (unknown [9.204.130.183])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 16:10:45 +0000 (GMT)
Subject: Re: [PATCH v5 21/31] powernv/fadump: process architected register
 state data provided by firmware
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Oliver O'Halloran" <oohall@gmail.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
 <87sgpcp80n.fsf@mpe.ellerman.id.au>
 <b7c46267-92d8-9202-b657-7cb8e37451fe@linux.ibm.com>
 <CAOSf1CHjV5PM-rYJ_5-XHmZyBNO_H=Nw8X7+HoOZnL+D7pM-sg@mail.gmail.com>
 <af1c8b69-7340-005e-12b1-5e7228b9ea3a@linux.ibm.com>
 <87sgp4z1ov.fsf@mpe.ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 10 Sep 2019 21:40:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87sgp4z1ov.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091016-4275-0000-0000-000003640588
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091016-4276-0000-0000-000038765A92
Message-Id: <8b26238d-d8f6-c9a5-714e-b4682b94f8a5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100153
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/09/19 7:35 PM, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
>> On 09/09/19 9:03 PM, Oliver O'Halloran wrote:
>>> On Mon, Sep 9, 2019 at 11:23 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>>> On 04/09/19 5:50 PM, Michael Ellerman wrote:
>>>>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>>> [...]
>>>>
>>>>>> +/*
>>>>>> + * CPU state data is provided by f/w. Below are the definitions
>>>>>> + * provided in HDAT spec. Refer to latest HDAT specification for
>>>>>> + * any update to this format.
>>>>>> + */
>>>>>
>>>>> How is this meant to work? If HDAT ever changes the format they will
>>>>> break all existing kernels in the field.
>>>>>
>>>>>> +#define HDAT_FADUMP_CPU_DATA_VERSION                1
>>>>
>>>> Changes are not expected here. But this is just to cover for such scenario,
>>>> if that ever happens.
>>>
>>> The HDAT spec doesn't define the SPR numbers for NIA, MSR and the CR.
>>> As far as I can tell the values you've assumed here are chip-specific,
>>> non-architected SPR numbers that come from an array buried somewhere
>>> in the SBE codebase. I don't believe you for a second when you say
>>> that this will never change.
>>
>> At least, the understanding is that this numbers not change across processor
>> generations. If something changes, it is supposed to be handled in SBE. Also,
>> I am told this numbers would be listed in the HDAT Spec. Not sure if that
>> happened yet though. Vasant, you have anything to add?
> 
> That doesn't help much because the HDAT spec is not public.
> 
> The point is with the code written the way it is, these values *must
> not* change, or else all existing kernels will be broken, which is not
> acceptable.

Yeah. It is absurd to error out just by looking at version number...

> 
>>>> Also, I think it is a bit far-fetched to error out if versions mismatch.
>>>> Warning and proceeding sounds worthier because the changes are usually
>>>> backward compatible, if and when there are any. Will update accordingly...
>>>
>>> Literally the only reason I didn't drop the CPU DATA parts of the OPAL
>>> MPIPL series was because I assumed the kernel would do the sensible
>>> thing and reject or ignore the structure if it did not know how to
>>> parse the data.
>>
>> I think, the changes if any, would have to be backward compatible for the sake
>> of sanity.
> 
> People need to understand that this is an ABI between firmware and
> in-the-field distribution kernels which are only updated at customer
> discretion, or possibly never.
> 
> Any changes *must be* backward compatible.
> 
> Looking at the header struct:
> 
> +struct hdat_fadump_thread_hdr {
> +	__be32  pir;
> +	/* 0x00 - 0x0F - The corresponding stop state of the core */
> +	u8      core_state;
> +	u8      reserved[3];
> 
> You have those 3 reserved bytes, so a future revision could repurpose
> one of those as a flag to indicate a new format. And/or the hdr could be
> made bigger and new kernels could be taught to look for new things in
> the space after the hdr but before the reg entries.
> 
> So I think there is a reasonable mechanism for extending the format in
> future, but my point is people must understand that this is an ABI and
> changes must be made accordingly.

True. The folks who make the changes to this format should be aware that
breaking kernel ABI is not going to be pretty and I think they are :)

> 
>> Even if they are not, we are better off exporting the /proc/vmcore
>> with a warning and some crazy CPU register data (if parsing goes alright) than
>> no dump at all? 
> 
> If it's just a case of reg entries that we don't recognise then yes I
> think it would be OK to just skip them and continue exporting. But if
> there's any deeper misunderstanding of the format then we should bail
> out.

Sure. Will try and fix that by first trying to do a sanity check on the
fields that are needed for parsing the data and proceed with a warning if
nothing weird is detected and fallback to just appending crashing cpu as
done in patch 16/31, if anything weird is observed. That should hopefully
take care of all cases in the best possible way..

> 
> I notice now that you don't do anything in opal_fadump_set_regval_regnum()
> if you are passed a register we don't understand, so that probably needs
> fixing.

f/w provides about 100 odd registers in the CPU state data. Most of them
pt_regs doesn't care about. So, opal_fadump_set_regval_regnum is happy as
long as it find the registers listed in it. Unless, pt_regs changes, we
can stick to this and ignore the rest of them?

- Hari

