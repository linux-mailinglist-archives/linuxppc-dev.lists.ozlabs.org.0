Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34A5F977A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 06:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm5x432s4z3dsS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 15:47:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GzxAiWFG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GzxAiWFG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm5w541FNz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 15:46:12 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A4XlHE013136;
	Mon, 10 Oct 2022 04:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Txtvtnsp23c6rnDPsnz+cRzfpvGib05/Nydb6O3a9lM=;
 b=GzxAiWFGajK3oyXXJsZxHKFC2wOJbbquuAHdlOs+YeoCDnGLMdYbMszgd+7Cy3e80xux
 83fmFHwz3ei2KN4rHuSHLU1dZ2NmfAwFy9u7XqyEXuo1HbEy1Z14UndHf2lybRbuqKkh
 /608nnSIKAfIOZv3pW2KsHFztZDi6V7DC/VL29lcE8bL80mgV4fMZ5x77sAOoS2w/Nko
 vNsQjB4bj77V21X/0SZNWxsbi4/X0ZLBYYTPE6NE1gChgWb6tHmrmRxRZllAKhln2zqy
 //tykeIAtm9Oui2ur1fjaG3Ap7JxV66rz8XM1I1cKiZ/REXLoO2ek8GgG5NZseauSxi6 MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k4jgd5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 04:45:50 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A4UMFx023216;
	Mon, 10 Oct 2022 04:45:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k4jgd52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 04:45:49 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A4aRw0008578;
	Mon, 10 Oct 2022 04:45:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3k30u9a76h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 04:45:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A4jj4s7733834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 04:45:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 389C011C052;
	Mon, 10 Oct 2022 04:45:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CCFD11C04A;
	Mon, 10 Oct 2022 04:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 04:45:44 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8AFF96010D;
	Mon, 10 Oct 2022 15:45:39 +1100 (AEDT)
Message-ID: <71c92dc05023b235e87489062ff6f23a2af5fd3c.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 10 Oct 2022 15:45:39 +1100
In-Reply-To: <20221010002957.128276-2-bgray@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
	 <20221010002957.128276-2-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mjc4FRhQ2miLrIxpEsBgJSos9UbWoz0Q
X-Proofpoint-ORIG-GUID: 2er4cBaV5BWQohD0aeAKcYYNBAIJj7MF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=731 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100026
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
Cc: peterz@infradead.org, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-10 at 11:29 +1100, Benjamin Gray wrote:
> Adds a generic memory patching mechanism for patches of size int or
> long
> bytes.
> 
> The patch_instruction function is reimplemented in terms of this
> more generic function. This generic implementation allows patching of
> arbitrary long data, such as pointers on 64-bit. As a performance
> optimisation the patch will unconditionally flush the icache, as
> patch_instruction is used significantly more often and in more
> performance sensitive contexts (e.g., ftrace activation).
> 
> On 32-bit patch_int is marked noinline to prevent a mis-optimisation.
> Without noinline, inside patch_branch the compiler may inline all the
> way to do_patch_memory, preventing the compiler from inlining
> do_patch_memory into patch_int. This would needlessly force patch_int
> to be a branch to do_patch_memory.
> 
> The 'IS_ENABLED(CONFIG_PPC64) && ' part of the patch size condition
> helps GCC inline __patch_memory properly. Only 64-bit requires
> doubleword writes anyway, as ints and longs are the same size on 32-
> bit.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

It looks like this needs rebasing.

Otherwise I gave this a read over and didn't spot anything, but I'll
hold off on a reviewed-by tag until it's rebased.

> ---
>  arch/powerpc/include/asm/code-patching.h | 29 ++++++++++
>  arch/powerpc/lib/code-patching.c         | 73 ++++++++++++++++++----
> --
>  2 files changed, 85 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h
> b/arch/powerpc/include/asm/code-patching.h
> index 3f881548fb61..170bfa848c7c 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -72,7 +72,36 @@ static inline int create_branch(ppc_inst_t *instr,
> const u32 *addr,
>  int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
>                        unsigned long target, int flags);
>  int patch_branch(u32 *addr, unsigned long target, int flags);
> +
> +/* patch_uint and patch_ulong must only be called on addresses where
> the patch
> + * does not cross a cacheline, otherwise it may not be flushed
> properly and
> + * mixes of new and stale data may be observed.
> + *
> + * patch_instruction and other instruction patchers automatically
> satisfy this
> + * requirement due to instruction alignment requirements.
> + */
> +
> +int patch_uint(void *addr, unsigned int val);
> +
> +#ifdef CONFIG_PPC64
> +
> +int patch_ulong(void *addr, unsigned long val);
>  int patch_instruction(u32 *addr, ppc_inst_t instr);
> +
> +#else
> +
> +static inline int patch_ulong(void *addr, unsigned long val)
> +{
> +       return patch_uint(addr, val);
> +}
> +
> +static inline int patch_instruction(u32 *addr, ppc_inst_t instr)
> +{
> +       return patch_uint(addr, ppc_inst_val(instr));
> +}
> +
> +#endif
> +
>  int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
>  
>  static inline unsigned long patch_site_addr(s32 *site)
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c
> index 125c55e3e148..e41c0ccec79f 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -15,20 +15,24 @@
>  #include <asm/code-patching.h>
>  #include <asm/inst.h>
>  
> -static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32
> *patch_addr)
> +static int __patch_memory(void *patch_addr, unsigned long val, void
> *exec_addr,
> +                         bool is_dword)
>  {
> -       if (!ppc_inst_prefixed(instr)) {
> -               u32 val = ppc_inst_val(instr);
> -
> -               __put_kernel_nofault(patch_addr, &val, u32, failed);
> -       } else {
> -               u64 val = ppc_inst_as_ulong(instr);
> +       /* Prefixed instruction may cross cacheline if cacheline
> smaller than 64 bytes */
> +       BUILD_BUG_ON(IS_ENABLED(CONFIG_PPC64) && L1_CACHE_BYTES <
> 64);
>  
> +       if (IS_ENABLED(CONFIG_PPC64) && unlikely(is_dword))
>                 __put_kernel_nofault(patch_addr, &val, u64, failed);
> -       }
> +       else
> +               __put_kernel_nofault(patch_addr, &val, u32, failed);
>  
> -       asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> (patch_addr),
> -                                                           "r"
> (exec_addr));
> +       /* Assume data is inside a single cacheline */
> +       dcbst(patch_addr);
> +       mb(); /* sync */
> +       /* Flush on the EA that may be executed in case of a non-
> coherent icache */
> +       icbi(exec_addr);
> +       mb(); /* sync */
> +       isync();
>  
>         return 0;
>  
> @@ -38,7 +42,10 @@ static int __patch_instruction(u32 *exec_addr,
> ppc_inst_t instr, u32 *patch_addr
>  
>  int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
>  {
> -       return __patch_instruction(addr, instr, addr);
> +       if (ppc_inst_prefixed(instr))
> +               return __patch_memory(addr, ppc_inst_as_ulong(instr),
> addr, true);
> +       else
> +               return __patch_memory(addr, ppc_inst_val(instr),
> addr, false);
>  }
>  
>  static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> @@ -149,7 +156,7 @@ static void unmap_patch_area(unsigned long addr)
>         flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  }
>  
> -static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
> +static int __do_patch_memory(void *addr, unsigned long val, bool
> is_dword)
>  {
>         int err;
>         u32 *patch_addr;
> @@ -166,7 +173,7 @@ static int __do_patch_instruction(u32 *addr,
> ppc_inst_t instr)
>         if (radix_enabled())
>                 asm volatile("ptesync": : :"memory");
>  
> -       err = __patch_instruction(addr, instr, patch_addr);
> +       err = __patch_memory(patch_addr, val, addr, is_dword);
>  
>         pte_clear(&init_mm, text_poke_addr, pte);
>         flush_tlb_kernel_range(text_poke_addr, text_poke_addr +
> PAGE_SIZE);
> @@ -174,7 +181,7 @@ static int __do_patch_instruction(u32 *addr,
> ppc_inst_t instr)
>         return err;
>  }
>  
> -int patch_instruction(u32 *addr, ppc_inst_t instr)
> +static int do_patch_memory(void *addr, unsigned long val, bool
> is_dword)
>  {
>         int err;
>         unsigned long flags;
> @@ -186,15 +193,47 @@ int patch_instruction(u32 *addr, ppc_inst_t
> instr)
>          */
>         if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
>             !static_branch_likely(&poking_init_done))
> -               return raw_patch_instruction(addr, instr);
> +               return __patch_memory(addr, val, addr, is_dword);
>  
>         local_irq_save(flags);
> -       err = __do_patch_instruction(addr, instr);
> +       err = __do_patch_memory(addr, val, is_dword);
>         local_irq_restore(flags);
>  
>         return err;
>  }
> -NOKPROBE_SYMBOL(patch_instruction);
> +
> +#ifdef CONFIG_PPC64
> +
> +int patch_uint(void *addr, unsigned int val)
> +{
> +       return do_patch_memory(addr, val, false);
> +}
> +NOKPROBE_SYMBOL(patch_uint)
> +
> +int patch_ulong(void *addr, unsigned long val)
> +{
> +       return do_patch_memory(addr, val, true);
> +}
> +NOKPROBE_SYMBOL(patch_ulong)
> +
> +int patch_instruction(u32 *addr, ppc_inst_t instr)
> +{
> +       if (ppc_inst_prefixed(instr))
> +               return patch_ulong(addr, ppc_inst_as_ulong(instr));
> +       else
> +               return patch_uint(addr, ppc_inst_val(instr));
> +}
> +NOKPROBE_SYMBOL(patch_instruction)
> +
> +#else
> +
> +noinline int patch_uint(void *addr, unsigned int val)
> +{
> +       return do_patch_memory(addr, val, false);
> +}
> +NOKPROBE_SYMBOL(patch_uint)
> +
> +#endif
>  
>  int patch_branch(u32 *addr, unsigned long target, int flags)
>  {

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

