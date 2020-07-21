Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD76228108
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 15:35:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB030165TzDql9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 23:35:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB00p09x4zDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:33:29 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LDWKmR091526; Tue, 21 Jul 2020 09:33:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32d5h5t7bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 09:33:16 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LDWLko091576;
 Tue, 21 Jul 2020 09:33:14 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32d5h5t7aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 09:33:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LDV9nw005318;
 Tue, 21 Jul 2020 13:33:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7kxat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 13:33:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LDX95K16843144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 13:33:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96ECBAE045;
 Tue, 21 Jul 2020 13:33:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78BA4AE053;
 Tue, 21 Jul 2020 13:33:05 +0000 (GMT)
Received: from [9.199.35.129] (unknown [9.199.35.129])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 13:33:05 +0000 (GMT)
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
 <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
 <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
 <87k0yxrtex.fsf@mpe.ellerman.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <d3e9bcc9-d73e-6726-edb5-cfdb771b1d61@linux.ibm.com>
Date: Tue, 21 Jul 2020 19:03:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0yxrtex.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_08:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007210094
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org,
 Jordan Niethe <jniethe5@gmail.com>, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/21/20 5:06 PM, Michael Ellerman wrote:
> Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:
>> On 7/20/20 9:12 AM, Jordan Niethe wrote:
>>> On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
>>> <ravi.bangoria@linux.ibm.com> wrote:
>>>>
>>>> So far Book3S Powerpc supported only one watchpoint. Power10 is
>>>> introducing 2nd DAWR. Enable 2nd DAWR support for Power10.
>>>> Availability of 2nd DAWR will depend on CPU_FTR_DAWR1.
>>>>
>>>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/include/asm/cputable.h      | 4 +++-
>>>>    arch/powerpc/include/asm/hw_breakpoint.h | 5 +++--
>>>>    2 files changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
>>>> index 3445c86e1f6f..36a0851a7a9b 100644
>>>> --- a/arch/powerpc/include/asm/cputable.h
>>>> +++ b/arch/powerpc/include/asm/cputable.h
>>>> @@ -633,7 +633,9 @@ enum {
>>>>     * Maximum number of hw breakpoint supported on powerpc. Number of
>>>>     * breakpoints supported by actual hw might be less than this.
>>>>     */
>>>> -#define HBP_NUM_MAX    1
>>>> +#define HBP_NUM_MAX    2
>>>> +#define HBP_NUM_ONE    1
>>>> +#define HBP_NUM_TWO    2
> 
>>> I wonder if these defines are necessary - has it any advantage over
>>> just using the literal?
>>
>> No, not really. Initially I had something like:
>>
>> #define HBP_NUM_MAX    2
>> #define HBP_NUM_P8_P9  1
>> #define HBP_NUM_P10    2
>>
>> But then I thought it's also not right. So I made it _ONE and _TWO.
>> Now the function that decides nr watchpoints dynamically (nr_wp_slots)
>> is in different file, I thought to keep it like this so it would be
>> easier to figure out why _MAX is 2.
> 
> I don't think it makes anything clearer.
> 
> I had to stare at it thinking there was some sort of mapping or
> indirection going on, before I realised it's just literally the number
> of breakpoints.
> 
> So please just do:
> 
> static inline int nr_wp_slots(void)
> {
>         return cpu_has_feature(CPU_FTR_DAWR1) ? 2 : 1;
> }
> 
> If you think HBP_NUM_MAX needs explanation then do that with a comment,
> it can refer to nr_wp_slots() if that's helpful.

Agreed. By adding a comment, we can remove those macros. Will change it.

Thanks,
Ravi
