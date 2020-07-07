Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E136C216B7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 13:29:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Kvd1ZVszDq8g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 21:29:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1KqY5BkGzDqpq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 21:25:29 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067B1Nt5119162; Tue, 7 Jul 2020 07:25:22 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 324fdh5tmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 07:25:21 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067BKIxr027793;
 Tue, 7 Jul 2020 11:25:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 324qfur6u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 11:25:20 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067BPJDm40763696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 11:25:19 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84C29B2064;
 Tue,  7 Jul 2020 11:25:19 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E901EB205F;
 Tue,  7 Jul 2020 11:25:17 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.102.0.187])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 11:25:17 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 23/26] powerpc/book3s64/kuap: Move UAMOR setup to key
 init function
In-Reply-To: <87fta35084.fsf@mpe.ellerman.id.au>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-24-aneesh.kumar@linux.ibm.com>
 <87fta35084.fsf@mpe.ellerman.id.au>
Date: Tue, 07 Jul 2020 16:55:15 +0530
Message-ID: <87d057k1no.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_06:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 cotscore=-2147483648 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007070081
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>  
.....

>> @@ -232,8 +246,9 @@ void __init setup_kuap(bool disabled)
>>  		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
>>  	}
>>  
>> -	/* Make sure userspace can't change the AMR */
>> -	mtspr(SPRN_UAMOR, 0);
>
> Why not just leave it there. It's extra insurance and it's good
> documentation.

We can't se the value to 0, because with hash kuap it is derived
from what other keys are used for. Are you suggesting to keep it as

if (radix_enabled())
	mtspr(SPRN_UAMOR, 0);

That would confuse w.r.t what happens with hash.

I can add a comment there explaining details? 

>
>> +	/*
>> +	 * Set the default kernel AMR values on all cpus.
>> +	 */
>>  	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>>  	isync();
>>  }
>> @@ -278,11 +293,6 @@ static inline u64 read_uamor(void)
>>  	return mfspr(SPRN_UAMOR);
>>  }
>>  
>> -static inline void write_uamor(u64 value)
>> -{
>> -	mtspr(SPRN_UAMOR, value);
>> -}
>> -
>>  static bool is_pkey_enabled(int pkey)
>>  {
>>  	u64 uamor = read_uamor();
>> @@ -353,7 +363,6 @@ void thread_pkey_regs_save(struct thread_struct *thread)
>>  	 */
>>  	thread->amr = read_amr();
>>  	thread->iamr = read_iamr();
>> -	thread->uamor = read_uamor();
>>  }
>>  
>>  void thread_pkey_regs_restore(struct thread_struct *new_thread,
>> @@ -366,8 +375,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
>>  		write_amr(new_thread->amr);
>>  	if (old_thread->iamr != new_thread->iamr)
>>  		write_iamr(new_thread->iamr);
>> -	if (old_thread->uamor != new_thread->uamor)
>> -		write_uamor(new_thread->uamor);
>>  }
>>  
>>  void thread_pkey_regs_init(struct thread_struct *thread)
>> @@ -377,11 +384,9 @@ void thread_pkey_regs_init(struct thread_struct *thread)
>>  
>>  	thread->amr   = default_amr;
>>  	thread->iamr  = default_iamr;
>> -	thread->uamor = default_uamor;
>>  
>>  	write_amr(default_amr);
>>  	write_iamr(default_iamr);
>> -	write_uamor(default_uamor);
>>  }
>>  
>>  int execute_only_pkey(struct mm_struct *mm)
>
> cheers

-aneesh
