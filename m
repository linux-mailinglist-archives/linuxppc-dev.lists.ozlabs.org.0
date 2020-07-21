Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CB227A58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 10:17:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9s0b2sgKzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 18:17:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9rys2JvKzDqMV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 18:16:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06L82PW7010886; Tue, 21 Jul 2020 04:16:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0qtw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 04:16:08 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06L851h7021841;
 Tue, 21 Jul 2020 04:16:08 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0qtuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 04:16:07 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06L8G68f014775;
 Tue, 21 Jul 2020 08:16:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 32brq81u9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 08:16:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06L8G2VP27918632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 08:16:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC96D4C050;
 Tue, 21 Jul 2020 08:16:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AEEE4C04A;
 Tue, 21 Jul 2020 08:15:59 +0000 (GMT)
Received: from [9.199.47.202] (unknown [9.199.47.202])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 08:15:59 +0000 (GMT)
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
 <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
 <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
 <CACzsE9q5YtT_bXOpw9cri_UCxziW_FRbCpcViANaZwui0hjDqw@mail.gmail.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <a439dff1-2a61-8378-d510-af754ed746ec@linux.ibm.com>
Date: Tue, 21 Jul 2020 13:45:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9q5YtT_bXOpw9cri_UCxziW_FRbCpcViANaZwui0hjDqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210052
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, miltonm@us.ibm.com,
 mikey@neuling.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 peterz@infradead.org, oleg@redhat.com, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 jolsa@kernel.org, fweisbec@gmail.com, pedromfc@br.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>>> @@ -46,7 +47,7 @@ struct arch_hw_breakpoint {
>>>>
>>>>    static inline int nr_wp_slots(void)
>>>>    {
>>>> -       return HBP_NUM_MAX;
>>>> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_TWO : HBP_NUM_ONE;
>>> So it'd be something like:
>>> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_MAX : 1;
>>> But thinking that there might be more slots added in the future, it
>>> may be better to make the number of slots a variable that is set
>>> during the init and then have this function return that.
>>
>> Not sure I follow. What do you mean by setting number of slots a
>> variable that is set during the init?
> Sorry I was unclear there.
> I was just looking and saw arm also has a variable number of hw breakpoints.
> If we did something like how they handle it, it might look something like:
> 
> static int num_wp_slots __ro_after_init;
> 
> int nr_wp_slots(void) {
>      return num_wp_slots;
> }
> 
> static int __init arch_hw_breakpoint_init(void) {
>      num_wp_slots = work out how many wp_slots
> }
> arch_initcall(arch_hw_breakpoint_init);
> 
> Then we wouldn't have to calculate everytime nr_wp_slots() is called.
> In the future if more wp's are added nr_wp_slots() will get more complicated.
> But just an idea, feel free to ignore.

Ok I got the idea. But ARM arch_hw_breakpoint_init() is much more complex
compared to our nr_wp_slots(). I don't see any benefit by making our code
like ARM.

Thanks for the idea though :)
Ravi
