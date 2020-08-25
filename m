Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9964251735
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 13:14:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbRG66C6fzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 21:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A+PuLPY1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbR7G6qjWzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 21:08:26 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PB3RDo033396; Tue, 25 Aug 2020 07:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NcMX5ZLwonyyuW1UQGnW6NTW1nKey9uwaFJF5lARtTQ=;
 b=A+PuLPY1eY2gIbBLZqEGERdaFmMo8dKeVtHfpA0oSPf6XC3sbLSeGsKRvK7+qlZzV2S4
 uIaYsVfwfJtDhcIDWTwFXTebAD6nOt8Ue11c6ixw4hNPhREvVr3fgvKjGlZMmtIPcHS+
 GlJ7mPgQlwnIIozOL/XR0dsa9+nGAgChsncoRDLolW+XtgqRnRip1kJgqeMhk4hGjzZi
 QaZ+Q4/VMlhIAWLmu2FpLluUZBEyZ5PCv0MlMdxQbox2/zLXp9CFp6TmApA5hBAzpHxa
 /kgH4T6A0c96Mz7NsJ3XeTzXaefI6QLm9wN+6PBzo3sMzKhc9XwyWcwKImcYf1hBf9Jp KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334x7t5x8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 07:08:07 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07PB3wor036503;
 Tue, 25 Aug 2020 07:08:06 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334x7t5x78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 07:08:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PB7sMk014512;
 Tue, 25 Aug 2020 11:08:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 332ujkubn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 11:08:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PB81WZ29884680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 11:08:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B83E42047;
 Tue, 25 Aug 2020 11:08:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BE2F42049;
 Tue, 25 Aug 2020 11:07:58 +0000 (GMT)
Received: from [9.199.33.167] (unknown [9.199.33.167])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 11:07:58 +0000 (GMT)
Subject: Re: [PATCH v5 5/8] powerpc/watchpoint: Fix exception handling for
 CONFIG_HAVE_HW_BREAKPOINT=N
To: Christophe Leroy <christophe.leroy@csgroup.eu>, christophe.leroy@c-s.fr
References: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
 <20200825043617.1073634-6-ravi.bangoria@linux.ibm.com>
 <91d34b89-603a-fddc-ea0f-53a79b287eed@csgroup.eu>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <1e706137-3de9-a713-5a86-48fbc5e6f740@linux.ibm.com>
Date: Tue, 25 Aug 2020 16:37:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <91d34b89-603a-fddc-ea0f-53a79b287eed@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250083
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jniethe5@gmail.com, rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
>> index 57a0ab822334..866597b407bc 100644
>> --- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
>> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
>> @@ -286,11 +286,16 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
>>       }
>>       return ret;
>>   #else /* CONFIG_HAVE_HW_BREAKPOINT */
>> +    if (child->thread.hw_brk[data - 1].flags & HW_BRK_FLAG_DISABLED)
> 
> I think child->thread.hw_brk[data - 1].flags & HW_BRK_FLAG_DISABLED should go around additionnal ()

Not sure I follow.

> 
>> +        goto del;
>> +
>>       if (child->thread.hw_brk[data - 1].address == 0)
>>           return -ENOENT;
> 
> What about replacing the above if by:
>      if (!(child->thread.hw_brk[data - 1].flags) & HW_BRK_FLAG_DISABLED) &&
>          child->thread.hw_brk[data - 1].address == 0)
>          return -ENOENT;
okay.. that's more compact.

But more importantly, what I wanted to know is whether CONFIG_HAVE_HW_BREAKPOINT
is set or not in production/distro builds for 8xx. Because I see it's not set in
8xx defconfigs.

Thanks,
Ravi
