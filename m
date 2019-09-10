Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A1AE612
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 10:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SJgR2SK4zDqc8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:52:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SJc10LPhzDqqD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:49:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46SJc044Whz8tCx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 18:49:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46SJc03S0xz9sP4; Tue, 10 Sep 2019 18:49:04 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46SJbz757dz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 18:49:03 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8A8l2fx029662
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 04:49:01 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ux6ck4jtr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Sep 2019 04:49:01 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 10 Sep 2019 09:48:59 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Sep 2019 09:48:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8A8mUXv39977248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Sep 2019 08:48:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24DCE11C04A;
 Tue, 10 Sep 2019 08:48:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF2D311C04C;
 Tue, 10 Sep 2019 08:48:51 +0000 (GMT)
Received: from [9.204.130.183] (unknown [9.204.130.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Sep 2019 08:48:51 +0000 (GMT)
Subject: Re: [PATCH v5 21/31] powernv/fadump: process architected register
 state data provided by firmware
To: "Oliver O'Halloran" <oohall@gmail.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
 <87sgpcp80n.fsf@mpe.ellerman.id.au>
 <b7c46267-92d8-9202-b657-7cb8e37451fe@linux.ibm.com>
 <CAOSf1CHjV5PM-rYJ_5-XHmZyBNO_H=Nw8X7+HoOZnL+D7pM-sg@mail.gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Tue, 10 Sep 2019 14:18:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHjV5PM-rYJ_5-XHmZyBNO_H=Nw8X7+HoOZnL+D7pM-sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091008-0016-0000-0000-000002A96986
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091008-0017-0000-0000-00003309EF01
Message-Id: <af1c8b69-7340-005e-12b1-5e7228b9ea3a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909100088
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
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/09/19 9:03 PM, Oliver O'Halloran wrote:
> On Mon, Sep 9, 2019 at 11:23 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>> On 04/09/19 5:50 PM, Michael Ellerman wrote:
>>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>>
>>
>> [...]
>>
>>>> +/*
>>>> + * CPU state data is provided by f/w. Below are the definitions
>>>> + * provided in HDAT spec. Refer to latest HDAT specification for
>>>> + * any update to this format.
>>>> + */
>>>
>>> How is this meant to work? If HDAT ever changes the format they will
>>> break all existing kernels in the field.
>>>
>>>> +#define HDAT_FADUMP_CPU_DATA_VERSION                1
>>
>> Changes are not expected here. But this is just to cover for such scenario,
>> if that ever happens.
> 
> The HDAT spec doesn't define the SPR numbers for NIA, MSR and the CR.
> As far as I can tell the values you've assumed here are chip-specific,
> non-architected SPR numbers that come from an array buried somewhere
> in the SBE codebase. I don't believe you for a second when you say
> that this will never change.

At least, the understanding is that this numbers not change across processor
generations. If something changes, it is supposed to be handled in SBE. Also,
I am told this numbers would be listed in the HDAT Spec. Not sure if that
happened yet though. Vasant, you have anything to add?

>> Also, I think it is a bit far-fetched to error out if versions mismatch.
>> Warning and proceeding sounds worthier because the changes are usually
>> backward compatible, if and when there are any. Will update accordingly...
> 
> Literally the only reason I didn't drop the CPU DATA parts of the OPAL
> MPIPL series was because I assumed the kernel would do the sensible
> thing and reject or ignore the structure if it did not know how to
> parse the data.

I think, the changes if any, would have to be backward compatible for the sake
of sanity. Even if they are not, we are better off exporting the /proc/vmcore
with a warning and some crazy CPU register data (if parsing goes alright) than
no dump at all? 

- Hari

