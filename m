Return-Path: <linuxppc-dev+bounces-899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C7968F74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 00:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyN9m5yq9z2xdX;
	Tue,  3 Sep 2024 08:05:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725304035;
	cv=none; b=RY0C4ijyennHcBG0Sd4uoDVQFzsxY1ggarXfj+2MyJjUZuMINPIghQjsJtnxfIwax/e1yTJHuz8SF8TGuFavfVGil/44QYTmicNaPPWsQ/5a6DKbJVkCtZViNm4xSBZWUxkP5VO6Du36kqJBPCCdcuJMZBkNXG/w/tpKIIaCWrKvedpyxouO6ir9hngdxhhJvLUgveJTbql3GiFX1Qxhv8YLDcY5gZhQFyPjNh/R41dyJJWB0PFbMixjhhVuJAsVPYPqA2KxEpqkyv8u23XmS/r8SDJ3atnXbndLNWVzKfEYH+vG4foXm0PXpPZMvCo84GqYunyd8Y2WBE8xccNPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725304035; c=relaxed/relaxed;
	bh=TDLWHOgFa39hzeST9WCzOqKuY4GJiAQ83qX40rWjgpc=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:Content-Type:MIME-Version; b=mRPEfssReHggJSaodXj/64e62Z2JRUi9+VcIj0GU9AfUfJiAUEeSg3AtAMho60VkDk2xI+RSkaM030JXcX2sHW3rnICbKTmC/9kBNoh5fdgAcvigqzlQCmZTbR6Y8TiaOMg+PMXWv3F5FObPQQV8eb6AiPzR27jovJsy6Rtwv9x8MJBnN8HkT+khb4oAvI6LSvn648wHPvgn+WBOz5K6aEmY6cHacSEF3CNH15IJTneNXpmOPCy4+a+EK2eXBYvu19KGbh0lhu/+Yws/j9jKkvoKNaP4yZhnkP8/VfwN4iQJarSxwF1BFmrW3+VACCxXhta/PT9QbXek+U8KqhyF5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPqSyD8M; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPqSyD8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyJCk4TK6z2xbF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 05:07:14 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482HrJgu005683;
	Mon, 2 Sep 2024 19:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=pp1; bh=TDLWHOgFa39hzeST9WCzOqKuY4
	GJiAQ83qX40rWjgpc=; b=aPqSyD8MIEk24hysCVxXQFcBr528odFWBwLepWRD/u
	ICJ4d7GQmvrzKLtLUj/iASywH4+EWaHT5eOsAngG0hK4tbz0bXGhxTRimb/LdHJ2
	pyZsEtFLzcXcK13aEAuB1zRbOK3JyUinMa2sZ+k1A/0ZlJMJBwW/yhVCQ9pAiJJX
	8dc1azQDos0xCpnv+0BTFkg0Rh9lwmncAKI+DUoSD4X38AK9DnGZdf/rFiZWAYvD
	znRTXnBwJ/sk9HBiwObvLwWc5fetfADTAHuHLQ+61i1KmO7U3Iqhtmjtur+qf2s5
	cRIAf7K/tTs2BtqrWTKWKI9YzfIjDA4jhfMhX5WYojcw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41btwat91x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 19:06:53 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 482J6qSD020334;
	Mon, 2 Sep 2024 19:06:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41btwat91t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 19:06:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 482GVTRN012052;
	Mon, 2 Sep 2024 19:06:51 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41cegpqdnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 19:06:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 482J6nTu54854040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Sep 2024 19:06:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 147062004D;
	Mon,  2 Sep 2024 19:06:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE20D20043;
	Mon,  2 Sep 2024 19:06:48 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  2 Sep 2024 19:06:48 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org,
        akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        jeffxu@google.com, Liam.Howlett@oracle.com,
        linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
        pedro.falcato@gmail.com, linux-um@lists.infradead.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
In-Reply-To: <20240819185253.GA2333884@thelio-3990X> (Nathan Chancellor's
	message of "Mon, 19 Aug 2024 11:52:53 -0700")
References: <20240812082605.743814-1-mpe@ellerman.id.au>
	<20240819185253.GA2333884@thelio-3990X>
Date: Mon, 02 Sep 2024 21:06:48 +0200
Message-ID: <yt9dy149vprr.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ig9nWOFROrXxhMnkacRWjO6cjHpu3JiF
X-Proofpoint-GUID: UEMIupna5As0SbvxPRXsLjdC9M9WjhTf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_04,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020152

Nathan Chancellor <nathan@kernel.org> writes:

> Hi Michael,
>
> On Mon, Aug 12, 2024 at 06:26:02PM +1000, Michael Ellerman wrote:
>> Add an optional close() callback to struct vm_special_mapping. It will
>> be used, by powerpc at least, to handle unmapping of the VDSO.
>>
>> Although support for unmapping the VDSO was initially added
>> for CRIU[1], it is not desirable to guard that support behind
>> CONFIG_CHECKPOINT_RESTORE.
>>
>> There are other known users of unmapping the VDSO which are not related
>> to CRIU, eg. Valgrind [2] and void-ship [3].
>>
>> The powerpc arch_unmap() hook has been in place for ~9 years, with no
>> ifdef, so there may be other unknown users that have come to rely on
>> unmapping the VDSO. Even if the code was behind an ifdef, major distros
>> enable CHECKPOINT_RESTORE so users may not realise unmapping the VDSO
>> depends on that configuration option.
>>
>> It's also undesirable to have such core mm behaviour behind a relatively
>> obscure CONFIG option.
>>
>> Longer term the unmap behaviour should be standardised across
>> architectures, however that is complicated by the fact the VDSO pointer
>> is stored differently across architectures. There was a previous attempt
>> to unify that handling [4], which could be revived.
>>
>> See [5] for further discussion.
>>
>> [1]: commit 83d3f0e90c6c ("powerpc/mm: tracking vDSO remap")
>> [2]: https://sourceware.org/git/?p=valgrind.git;a=commit;h=3a004915a2cbdcdebafc1612427576bf3321eef5
>> [3]: https://github.com/insanitybit/void-ship
>> [4]: https://lore.kernel.org/lkml/20210611180242.711399-17-dima@arista.com/
>> [5]: https://lore.kernel.org/linuxppc-dev/shiq5v3jrmyi6ncwke7wgl76ojysgbhrchsk32q4lbx2hadqqc@kzyy2igem256
>>
>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> ---
>>  include/linux/mm_types.h | 3 +++
>>  mm/mmap.c                | 6 ++++++
>>  2 files changed, 9 insertions(+)
>>
>> v2:
>> - Add some blank lines as requested.
>> - Expand special_mapping_close() comment.
>> - Add David's reviewed-by.
>> - Expand change log to capture review discussion.
>>
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 485424979254..78bdfc59abe5 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -1313,6 +1313,9 @@ struct vm_special_mapping {
>>
>>  	int (*mremap)(const struct vm_special_mapping *sm,
>>  		     struct vm_area_struct *new_vma);
>> +
>> +	void (*close)(const struct vm_special_mapping *sm,
>> +		      struct vm_area_struct *vma);
>>  };
>>
>>  enum tlb_flush_reason {
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index d0dfc85b209b..af4dbf0d3bd4 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -3620,10 +3620,16 @@ void vm_stat_account(struct mm_struct *mm, vm_flags_t flags, long npages)
>>  static vm_fault_t special_mapping_fault(struct vm_fault *vmf);
>>
>>  /*
>> + * Close hook, called for unmap() and on the old vma for mremap().
>> + *
>>   * Having a close hook prevents vma merging regardless of flags.
>>   */
>>  static void special_mapping_close(struct vm_area_struct *vma)
>>  {
>> +	const struct vm_special_mapping *sm = vma->vm_private_data;
>> +
>> +	if (sm->close)
>> +		sm->close(sm, vma);
>>  }
>>
>>  static const char *special_mapping_name(struct vm_area_struct *vma)
>> --
>> 2.45.2
>>
>
> This change is now in -next and I bisected a crash that our CI sees with
> ARCH=um to it:

I see another crash on s390, which seems related, but rather an issue in
uprobe. This can be reproduced by

# cd linux-next/tools/testing/selftests/ftrace
# ./ftracetest ./test.d/dynevent/add_remove_uprobe.tc

The 'mm: Add optional close() to struct vm_special_mapping' patch just
makes it visible. I enabled KASAN, and that shows me:

[   44.505448] ==================================================================                                                                      20:37:27 [3421/145075]
[   44.505455] BUG: KASAN: slab-use-after-free in special_mapping_close+0x9c/0xc8
[   44.505471] Read of size 8 at addr 00000000868dac48 by task sh/1384
[   44.505479]
[   44.505486] CPU: 51 UID: 0 PID: 1384 Comm: sh Not tainted 6.11.0-rc6-next-20240902-dirty #1496
[   44.505503] Hardware name: IBM 3931 A01 704 (z/VM 7.3.0)
[   44.505508] Call Trace:
[   44.505511]  [<000b0324d2f78080>] dump_stack_lvl+0xd0/0x108
[   44.505521]  [<000b0324d2f5435c>] print_address_description.constprop.0+0x34/0x2e0
[   44.505529]  [<000b0324d2f5464c>] print_report+0x44/0x138
[   44.505536]  [<000b0324d1383192>] kasan_report+0xc2/0x140
[   44.505543]  [<000b0324d2f52904>] special_mapping_close+0x9c/0xc8
[   44.505550]  [<000b0324d12c7978>] remove_vma+0x78/0x120
[   44.505557]  [<000b0324d128a2c6>] exit_mmap+0x326/0x750
[   44.505563]  [<000b0324d0ba655a>] __mmput+0x9a/0x370
[   44.505570]  [<000b0324d0bbfbe0>] exit_mm+0x240/0x340
[   44.505575]  [<000b0324d0bc0228>] do_exit+0x548/0xd70
[   44.505580]  [<000b0324d0bc1102>] do_group_exit+0x132/0x390
[   44.505586]  [<000b0324d0bc13b6>] __s390x_sys_exit_group+0x56/0x60
[   44.505592]  [<000b0324d0adcbd6>] do_syscall+0x2f6/0x430
[   44.505599]  [<000b0324d2f78434>] __do_syscall+0xa4/0x170
[   44.505606]  [<000b0324d2f9454c>] system_call+0x74/0x98
[   44.505614]
[   44.505616] Allocated by task 1384:
[   44.505621]  kasan_save_stack+0x40/0x70
[   44.505630]  kasan_save_track+0x28/0x40
[   44.505636]  __kasan_kmalloc+0xa0/0xc0
[   44.505642]  __create_xol_area+0xfa/0x410
[   44.505648]  get_xol_area+0xb0/0xf0
[   44.505652]  uprobe_notify_resume+0x27a/0x470
[   44.505657]  irqentry_exit_to_user_mode+0x15e/0x1d0
[   44.505664]  pgm_check_handler+0x122/0x170
[   44.505670]
[   44.505672] Freed by task 1384:
[   44.505676]  kasan_save_stack+0x40/0x70
[   44.505682]  kasan_save_track+0x28/0x40
[   44.505687]  kasan_save_free_info+0x4a/0x70
[   44.505693]  __kasan_slab_free+0x5a/0x70
[   44.505698]  kfree+0xe8/0x3f0
[   44.505704]  __mmput+0x20/0x370
[   44.505709]  exit_mm+0x240/0x340
[   44.505713]  do_exit+0x548/0xd70
[   44.505718]  do_group_exit+0x132/0x390
[   44.505722]  __s390x_sys_exit_group+0x56/0x60
[   44.505727]  do_syscall+0x2f6/0x430
[   44.505732]  __do_syscall+0xa4/0x170
[   44.505738]  system_call+0x74/0x98

The problem is that uprobe_clear_state() kfree's struct xol_area, which
contains struct vm_special_mapping *xol_mapping. This one is passed to
_install_special_mapping() in xol_add_vma().

__mput reads:

static inline void __mmput(struct mm_struct *mm)
{
	VM_BUG_ON(atomic_read(&mm->mm_users));

	uprobe_clear_state(mm);
	exit_aio(mm);
	ksm_exit(mm);
	khugepaged_exit(mm); /* must run before exit_mmap */
	exit_mmap(mm);
	...
}

So uprobe_clear_state() in the beginning free's the memory area
containing the vm_special_mapping data, but exit_mmap() uses this
address later via vma->vm_private_data (which was set in _install_special_mapping().

The following change fixes this for me, but i'm not sure about any side
effects:

diff --git a/kernel/fork.c b/kernel/fork.c
index df8e4575ff01..cfcabba36c93 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1340,11 +1340,11 @@ static inline void __mmput(struct mm_struct *mm)
 {
        VM_BUG_ON(atomic_read(&mm->mm_users));
 
-       uprobe_clear_state(mm);
        exit_aio(mm);
        ksm_exit(mm);
        khugepaged_exit(mm); /* must run before exit_mmap */
        exit_mmap(mm);
+       uprobe_clear_state(mm);
        mm_put_huge_zero_folio(mm);
        set_mm_exe_file(mm, NULL);
        if (!list_empty(&mm->mmlist)) {


Any thoughts?


