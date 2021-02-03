Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891A30E50A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:40:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWFTC4fgCzDx10
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 08:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lSBj4fK1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWFS10YRpzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 08:38:53 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 113L64ad098768; Wed, 3 Feb 2021 16:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=rSmnZ+pTrS41HUQlDCXhS72uaBorjtAu6XJbT1xE8i8=;
 b=lSBj4fK1H0jk3ycmnwjfnPGzQy78HgOy78WJE93rtvd//45lP72ha3NYcHFcdTuYqifA
 K/r/XglHSnZNth2HSTHONbOgkWiwHiApEIqj9742qB1XuKx5IwfbYNFkneExNa8MLgyu
 zZW/+/EqKj6mMLno+97csFiM756S9tY1Fce278fYZQL6a7xPoUaSMXBWIRjmb3vxmZnk
 0DXPAyoeb1uI3ypaig1aWBJq4gXp1LamrkYqARRSdQfwnRx0t7s6Vk3NTSuFkHmXH8K9
 qDy8QSAmc59YbOlZ2W0mFIA03NX4OL7cs8WJGItOPp0Tm2s263ziaURDTq9O8SfWtb2K oA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36g22x4hyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 16:38:44 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 113LXOcj010641;
 Wed, 3 Feb 2021 21:38:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf1w60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 21:38:42 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 113LcVgb33030494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 21:38:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6AFEA405F;
 Wed,  3 Feb 2021 21:38:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 762D3A4054;
 Wed,  3 Feb 2021 21:38:38 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.160.100.112])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Feb 2021 21:38:38 +0000 (GMT)
Date: Wed, 3 Feb 2021 13:38:35 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pkeys: Remove unused code
Message-ID: <20210203213835.GA4047@ram-ibm-com.ibm.com>
References: <20210202150050.75335-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210202150050.75335-1-sandipan@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_08:2021-02-03,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030126
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 08:30:50PM +0530, Sandipan Das wrote:
> This removes arch_supports_pkeys(), arch_usable_pkeys() and
> thread_pkey_regs_*() which are remnants from the following:
> 
> commit 06bb53b33804 ("powerpc: store and restore the pkey state across context switches")
> commit 2cd4bd192ee9 ("powerpc/pkeys: Fix handling of pkey state across fork()")
> commit cf43d3b26452 ("powerpc: Enable pkey subsystem")
> 
> arch_supports_pkeys() and arch_usable_pkeys() were unused
> since their introduction while thread_pkey_regs_*() became
> unused after the introduction of the following:
> 
> commit d5fa30e6993f ("powerpc/book3s64/pkeys: Reset userspace AMR correctly on exec")
> commit 48a8ab4eeb82 ("powerpc/book3s64/pkeys: Don't update SPRN_AMR when in kernel mode")
> 
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/mmu_context.h | 3 ---
>  arch/powerpc/include/asm/pkeys.h       | 6 ------
>  2 files changed, 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
> index d5821834dba9..652ce85f9410 100644
> --- a/arch/powerpc/include/asm/mmu_context.h
> +++ b/arch/powerpc/include/asm/mmu_context.h
> @@ -282,9 +282,6 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
>  }
> 
>  #define pkey_mm_init(mm)
> -#define thread_pkey_regs_save(thread)
> -#define thread_pkey_regs_restore(new_thread, old_thread)
> -#define thread_pkey_regs_init(thread)
>  #define arch_dup_pkeys(oldmm, mm)
> 
>  static inline u64 pte_to_hpte_pkey_bits(u64 pteflags, unsigned long flags)
> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
> index a7951049e129..59a2c7dbc78f 100644
> --- a/arch/powerpc/include/asm/pkeys.h
> +++ b/arch/powerpc/include/asm/pkeys.h
> @@ -169,10 +169,4 @@ static inline bool arch_pkeys_enabled(void)
>  }
> 
>  extern void pkey_mm_init(struct mm_struct *mm);
> -extern bool arch_supports_pkeys(int cap);
> -extern unsigned int arch_usable_pkeys(void);
> -extern void thread_pkey_regs_save(struct thread_struct *thread);
> -extern void thread_pkey_regs_restore(struct thread_struct *new_thread,
> -				     struct thread_struct *old_thread);
> -extern void thread_pkey_regs_init(struct thread_struct *thread);
>  #endif /*_ASM_POWERPC_KEYS_H */

Looking at this code after a long time. Though I do not entirely understand,
the reason to change the logic for save and restore of the
AMR/IAMR register, I do understand that with those changes these three
function-prototypes became unnecessary.

Reviewed-by: Ram Pai <linuxram@us.ibm.com>


RP
