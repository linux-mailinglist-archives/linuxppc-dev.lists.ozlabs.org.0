Return-Path: <linuxppc-dev+bounces-7975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F1A9BF0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 08:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkNxN6zpQz2y8t;
	Fri, 25 Apr 2025 16:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745564360;
	cv=none; b=mJ9Jk7IS+MSJhwxHvav6mkTUKEK4C4iE/UoEjgHaPwtjIgBuZw1ZBXIgMy7EzHCHetyn/JTZ4oN5fsFUAg9sT3dWAISNiJqGoxRapQ/1vZz9YpjJhKM9zJyIlsDtSpc3PsyokX3MDGI07PlAa5KtM0TG69M11Ms5ZJxzGGFCIt5fzD3CEyXyZx598pMV6ndXvFiN0t7sBZOLHrUKIaLRN89WzBWPzqREBHg2Drck1cxAcYXA7xdwU+okIUvKtYlEI/GRgOrqt6QmND1qN2WYNeS8X43Y0bxm7MWt6Jae+lOCnb/tY0eIpqq1H+r2Kobu3cTQ9tnoLBUCyLXml+KUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745564360; c=relaxed/relaxed;
	bh=TRhqbD67z9XvmRFQN2yKg1Ib2zMzYiTPqDsaG9k6XLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eo41/XMt6kg2+YNy1GsKT8Jy2ArKQnj+yRUNNDsO9JR7Gl3VIDgtYFARWTZO26Yp5EjeO6H+6DIZ1dF3on076BK+VpZ09MMPjOACYJJIJOiZf8uwpPpk8JqtUHsFUy5wQvX9kQobJBvlwdJC9cJLPizhYwGR1GCtUCExD8oLgKXRqdU11kxKlA2OGUQbC5kZrbGEdrrhvie3h0+zNORexnuNuX+L/xbAE3WuFTP/sb/ymXhkjMxjqOvRHa+YMkhRSqgGMQ1oafqwaFy67409meChwYPQ9mb9qj59F0ExaFIRFMpvedysJMU2tYwN+ZHeZY/9j3A5qNiM5ALUlDMFdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8q9qI7R; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8q9qI7R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkNxM5K7Nz2xqJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 16:59:18 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OL4NtM002532;
	Fri, 25 Apr 2025 06:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TRhqbD
	67z9XvmRFQN2yKg1Ib2zMzYiTPqDsaG9k6XLg=; b=m8q9qI7RmWtdn6jhYibpFj
	rUqVlJ0akLjbuVqVQQCFJaSCBYWgei6uEWPm8AN9tCpiaW+swqD0Ef3HEHFsJd62
	76rNHc4QQF2oQeUNPA2JWeRRNB3Mhrc39YeqDxa3zO967gD3kSQLlh8V07Qku7i7
	l2zD+W/AhZe0xjeFogaIlpfdO83MD8/pzFcKSD0HGJbg5U66xDnIcKNKGix1cce3
	kwRRrmMytYLnCeByaP3W7MGf4WTKFmWn/vFBupV5prXop6YK+B9BPMYvfSJKTV57
	J1SiOyNlRhvN6eGSB7+ghfIwAj+7mD7bxW8Q+Q1g4PQylxCRirilfJyvMJaBN87Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvkswkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 06:58:56 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53P6wtse022579;
	Fri, 25 Apr 2025 06:58:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 467vvkswka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 06:58:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P3xI5a028447;
	Fri, 25 Apr 2025 06:58:54 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfvv01d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 06:58:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53P6wpje30868164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 06:58:52 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9C7758055;
	Fri, 25 Apr 2025 06:58:51 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6696F5804B;
	Fri, 25 Apr 2025 06:58:45 +0000 (GMT)
Received: from [9.61.252.26] (unknown [9.61.252.26])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 06:58:45 +0000 (GMT)
Message-ID: <d11b2740-d484-4fcf-8296-80e93ef534f2@linux.ibm.com>
Date: Fri, 25 Apr 2025 12:28:43 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Add tools/arch/x86/include/asm/amd/ibs.h to
 sync the headers
Content-Language: en-GB
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, jolsa@kernel.org,
        adrian.hunter@intel.com, irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        jiang.peng9@zte.com.cn, Tejas.Manhas1@ibm.com, sshegde@linux.ibm.com,
        sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, mingo@redhat.com,
        ravi.bangoria@amd.com, bp@alien8.de
References: <20250424163033.6601-1-atrajeev@linux.ibm.com>
 <16bee348-2b41-4337-85c8-8a6d2719e99b@linux.ibm.com> <aAqB6kI5mDp4bxY9@x1>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <aAqB6kI5mDp4bxY9@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA0NyBTYWx0ZWRfXxKioVV0C0UhC TAqyHKuAWOuw71w+ovLckblGdA69anb68RWrig9PQWCdkma9B/+As6dR82LavF3T8lphzn8+LR8 7CHb+6syPkyaix10Ka/CsErmPd8h6JaIOAND9kO0WNch9/fplReqeKd39t8w3ZCwsC8P0FhmV0v
 btu8qjiFTMzDkMAJrnJ90LqhuVzra/XeX2Lf2MsD2RBrK78Rj4tzSbOtak55iUWcgyxUkuarEzl OENk5jkjffZi44kjSejFE1EgUA8fsYZSKtDXlVwj9DSEJvl/l/bHF9CTOh6sBMbmHDRYA0TmO0+ /ruVaNxaSLJL2+ggFWVrW/lz5VWPsYMnsNdOFXRFxZ4NZl3IdE+3M/RpOer4JE5in6RncVY8hZ2
 vVzYw/HJkOAK9pmBaDrTqRv+IiYCK3ErhEjSbHrYdRNE7uxMsQ1ivhUDJAlziwFhc8NbQ7f4
X-Proofpoint-ORIG-GUID: bA5O8ybd1YYa84ySleW6v5WOi1z1V4vV
X-Proofpoint-GUID: pmgqd089mNEFfh4hnCCxUkWvw90Bwq1-
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=680b32b0 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=Oh2cFVv5AAAA:8 a=VnNF1IyMAAAA:8 a=LpQ4EuG3LMeFR_QAhVYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250047
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 24/04/25 11:54 pm, Arnaldo Carvalho de Melo wrote:
> On Thu, Apr 24, 2025 at 10:39:56PM +0530, Venkat Rao Bagalkote wrote:
>> On 24/04/25 10:00 pm, Athira Rajeev wrote:
>> Tested this patch by applying on tip HEAD:
>> 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d and it fixes the reported issue.
> This is just a long list of characters, can you please next time provide
> something like, humm, tip/head, not really:
>
> ⬢ [acme@toolbx perf-tools-next]$ git remote -v | grep tip
> tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (fetch)
> tip	https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git (push)
> ⬢ [acme@toolbx perf-tools-next]$ git remote update tip
> Fetching tip
> ⬢ [acme@toolbx perf-tools-next]$ git show 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> fatal: bad object 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d
> ⬢ [acme@toolbx perf-tools-next]$
>
> So please add the summary, that way we can try to figure out if this is
> a rebase and they look for the description instead of this sha1 that I'm
> not finding even after doing a 'git remore update tip'.

Apolozies for the confusion.

The commit ID I shared was from the repo: 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/tip/tip.

# git log
commit 7ab869c799fc0fb22f9b4c2f36aaa603d9c7cc9d (HEAD -> master)
Merge: 1e4babe52c11 e396dd85172c
Author: Ingo Molnar <mingo@kernel.org>
Date:   Tue Apr 22 14:42:13 2025 +0200

     Merge branch into tip/master: 'x86/sev'

      # New commits in x86/sev:
         e396dd85172c ("x86/sev: Register tpm-svsm platform device")
         93b7c6b3ce91 ("tpm: Add SNP SVSM vTPM driver")
         b2849b072366 ("svsm: Add header with SVSM_VTPM_CMD helpers")
         770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command 
functions")

     Signed-off-by: Ingo Molnar <mingo@kernel.org>


I have freshly cloned the repo from 
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/ and issue 
is seen here also. I have applied the patch on top of this, and issue is 
resolved.


Additional info regarding the environment:


git log

commit 0c6ae66ef164c408daeab6a61aace4b86010369a (HEAD -> master, 
origin/master, origin/HEAD)
Merge: b6e62c063f84 e396dd85172c
Author: Ingo Molnar <mingo@kernel.org>
Date:   Thu Apr 24 20:20:18 2025 +0200

     Merge branch into tip/master: 'x86/sev'

      # New commits in x86/sev:
         e396dd85172c ("x86/sev: Register tpm-svsm platform device")
         93b7c6b3ce91 ("tpm: Add SNP SVSM vTPM driver")
         b2849b072366 ("svsm: Add header with SVSM_VTPM_CMD helpers")
         770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command 
functions")

     Signed-off-by: Ingo Molnar <mingo@kernel.org>


git branch
* master


git remote show origin
* remote origin
   Fetch URL: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/
   Push  URL: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/
   HEAD branch: master
   Remote branches:
     auto-latest           tracked
     core/build            tracked
     core/core             tracked
     core/debugobjects     tracked
     core/documentation    tracked
     core/entry            tracked
     core/headers          tracked
     core/kprobes          tracked
     core/merge            tracked
     core/mm               tracked
     core/rcu              tracked
     core/static_call      tracked
     core/urgent           tracked
     efi/core              tracked
     efi/urgent            tracked
     irq/core              tracked
     irq/drivers           tracked
     irq/msi               tracked
     irq/urgent            tracked
     locking/core          tracked
     locking/debug         tracked
     locking/futex         tracked
     locking/header        tracked
     locking/kcsan         tracked
     locking/nmi           tracked
     locking/rcuref        tracked
     locking/rwsem         tracked
     locking/urgent        tracked
     locking/wwmutex       tracked
     master                tracked
     objtool/core          tracked
     objtool/urgent        tracked
     perf/core             tracked
     perf/kprobes          tracked
     perf/merge            tracked
     perf/urgent           tracked
     perf/vlbr             tracked
     ras/core              tracked
     ras/merge             tracked
     ras/urgent            tracked
     rcu/urgent            tracked
     sched/arm64           tracked
     sched/core            tracked
     sched/eevdf           tracked
     sched/fifo            tracked
     sched/migrate-disable tracked
     sched/psi             tracked
     sched/rt              tracked
     sched/smp             tracked
     sched/urgent          tracked
     smp/core              tracked
     smp/urgent            tracked
     timers/cleanups       tracked
     timers/clocksource    tracked
     timers/core           tracked
     timers/merge          tracked
     timers/nohz           tracked
     timers/ptp            tracked
     timers/urgent         tracked
     timers/vdso           tracked
     tip/tip               tracked
     tip/urgent            tracked
     x86/acpi              tracked
     x86/alternatives      tracked
     x86/apic              tracked
     x86/asm               tracked
     x86/boot              tracked
     x86/bugs              tracked
     x86/build             tracked
     x86/cache             tracked
     x86/cc                tracked
     x86/cleanups          tracked
     x86/core              tracked
     x86/cpu               tracked
     x86/entry             tracked
     x86/fpu               tracked
     x86/fred              tracked
     x86/fsgsbase          tracked
     x86/headers           tracked
     x86/hyperv            tracked
     x86/irq               tracked
     x86/kaslr             tracked
     x86/kconfig           tracked
     x86/kdump             tracked
     x86/merge             tracked
     x86/microcode         tracked
     x86/misc              tracked
     x86/mm                tracked
     x86/msr               tracked
     x86/mtrr              tracked
     x86/nmi               tracked
     x86/paravirt          tracked
     x86/pasid             tracked
     x86/percpu            tracked
     x86/platform          tracked
     x86/sev               tracked
     x86/seves             tracked
     x86/sgx               tracked
     x86/shstk             tracked
     x86/splitlock         tracked
     x86/tdx               tracked
     x86/timers            tracked
     x86/urgent            tracked
     x86/vdso              tracked
     x86/vmware            tracked
   Local branch configured for 'git pull':
     master merges with remote master
   Local ref configured for 'git push':

     master pushes to master (fast-forwardable)


Regards,

Venkat.

>   
>> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
> Thanks,
>
> - Arnaldo

