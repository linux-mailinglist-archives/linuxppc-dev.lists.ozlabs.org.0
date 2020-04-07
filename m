Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 035BA1A0499
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 03:41:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x99Q5rpWzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 11:41:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x97P58RfzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 11:39:29 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0371Xmbx033929
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 Apr 2020 21:39:26 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306nvva78d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 21:39:26 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 7 Apr 2020 02:38:58 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 02:38:55 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0371dKrf59834450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 01:39:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F5F4C046;
 Tue,  7 Apr 2020 01:39:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A4084C040;
 Tue,  7 Apr 2020 01:39:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 01:39:19 +0000 (GMT)
Received: from townsend.localnet (unknown [9.81.195.16])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7D988A01C9;
 Tue,  7 Apr 2020 11:39:13 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
Date: Tue, 07 Apr 2020 11:39:17 +1000
In-Reply-To: <CACzsE9qhUXC3YkLALLrqJvk0vJLru1j4YbTrQvQOaF3rGom=kw@mail.gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <7182352.hY56U9iWWN@townsend>
 <CACzsE9qhUXC3YkLALLrqJvk0vJLru1j4YbTrQvQOaF3rGom=kw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 20040701-0020-0000-0000-000003C2F91C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040701-0021-0000-0000-0000221BB4BE
Message-Id: <40677526.2jpsrtoC1b@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_14:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1034
 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 suspectscore=1 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070008
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, 6 April 2020 8:42:57 PM AEST Jordan Niethe wrote:
> On Mon, 6 Apr 2020, 7:52 pm Alistair Popple, <alistair@popple.id.au> wrote:
> > > diff --git a/arch/powerpc/include/asm/inst.h
> > > b/arch/powerpc/include/asm/inst.h index 70b37a35a91a..7e23e7146c66
> > > 100644
> > > --- a/arch/powerpc/include/asm/inst.h
> > > +++ b/arch/powerpc/include/asm/inst.h
> > > @@ -8,23 +8,67 @@
> > > 
> > >  struct ppc_inst {
> > >  
> > >          u32 val;
> > > 
> > > +#ifdef __powerpc64__
> > > +        u32 suffix;
> > > +#endif /* __powerpc64__ */
> > > 
> > >  } __packed;
> > > 
> > > -#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> > > +static inline int ppc_inst_opcode(struct ppc_inst x)
> > > +{
> > > +     return x.val >> 26;
> > > +}
> > > 
> > >  static inline u32 ppc_inst_val(struct ppc_inst x)
> > >  {
> > >  
> > >       return x.val;
> > >  
> > >  }
> > > 
> > > -static inline bool ppc_inst_len(struct ppc_inst x)
> > > +#ifdef __powerpc64__
> > > +#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
> > > +
> > > +#define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix =
> > 
> > (y)
> > 
> > > }) +
> > > +static inline u32 ppc_inst_suffix(struct ppc_inst x)
> > > 
> > >  {
> > > 
> > > -     return sizeof(struct ppc_inst);
> > > +     return x.suffix;
> > > 
> > >  }
> > > 
> > > -static inline int ppc_inst_opcode(struct ppc_inst x)
> > > +static inline bool ppc_inst_prefixed(struct ppc_inst x) {
> > > +     return ((ppc_inst_val(x) >> 26) == 1) && ppc_inst_suffix(x) !=
> > 
> > 0xff;
> > 
> > > +}
> > > +
> > > +static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > > 
> > >  {
> > > 
> > > -     return x.val >> 26;
> > > +     return ppc_inst_prefix(swab32(ppc_inst_val(x)),
> > > +                            swab32(ppc_inst_suffix(x)));
> > > +}
> > > +
> > > +static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> > > +{
> > > +     u32 val, suffix = 0xff;
> > > +     val = *(u32 *)ptr;
> > > +     if ((val >> 26) == 1)
> > > +             suffix = *((u32 *)ptr + 1);
> > > +     return ppc_inst_prefix(val, suffix);
> > > +}
> > > +
> > > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst
> > 
> > x)
> > 
> > > +{
> > > +     if (ppc_inst_prefixed(x)) {
> > > +             *(u32 *)ptr = x.val;
> > > +             *((u32 *)ptr + 1) = x.suffix;
> > > +     } else {
> > > +             *(u32 *)ptr = x.val;
> > > +     }
> > > +}
> > > +
> > > +#else
> > > +
> > > +#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> > > +
> > > +static inline bool ppc_inst_prefixed(ppc_inst x)
> > > +{
> > > +     return 0;
> > > 
> > >  }
> > >  
> > >  static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> > > 
> > > @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct
> > > ppc_inst x) return ppc_inst(swab32(ppc_inst_val(x)));
> > > 
> > >  }
> > > 
> > > +static inline u32 ppc_inst_val(struct ppc_inst x)
> > > +{
> > > +     return x.val;
> > > +}
> > > +
> > > 
> > >  static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
> > >  {
> > >  
> > >       return *ptr;
> > >  
> > >  }
> > > 
> > > +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst
> > 
> > x)
> > 
> > > +{
> > > +     *ptr = x;
> > > +}
> > > +
> > > +#endif /* __powerpc64__ */
> > > +
> > > 
> > >  static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
> > >  {
> > >  
> > >       return !memcmp(&x, &y, sizeof(struct ppc_inst));
> > >  
> > >  }
> > 
> > Apologies for not picking this up earlier, I was hoping to get to the
> > bottom
> > of the issue I was seeing before you sent out v5. However the above
> > definition
> > of instruction equality does not seem correct because it does not consider
> > the
> > case when an instruction is not prefixed - a non-prefixed instruction
> > should be
> > considered equal if the first 32-bit opcode/value is the same. Something
> > 
> > like:
> >         if (ppc_inst_prefixed(x) != ppc_inst_prefixed(y))
> >         
> >                 return false;
> >         
> >         else if (ppc_inst_prefixed(x))
> >         
> >                 return !memcmp(&x, &y, sizeof(struct ppc_inst));
> >         
> >         else
> >         
> >                 return x.val == y.val;
> > 
> > This was causing failures in ftrace_modify_code() as it would falsely
> > detect
> > two non-prefixed instructions as being not equal due to differences in the
> > suffix.
> 
> Hm I was intending that non prefixed instructions would always have the
> suffix set to the same value. If that's not happening, something must be
> wrong with where the instructions are created.
> 

Ok, based on your comment I found the problem. Your last patch series defined 
read_inst() in  ftrace.c and ended that function with:

	ppc_inst_write(p, inst);
	return 0;

This is called from ftrace_modify_code(), where p is uninitialised. In the 
last series ppc_inst_write() function would only write/initialise the suffix if 
it was a prefixed instruction, hence leaving it uninitialised in this instance 
which lead to the problems checking equality.

I suspect read_instr() should have finished with this instead:

	*p = inst;
	return 0;

However your new patch series replaces it with probe_kernel_read_inst() which 
looks to do the right thing:

+       *inst = ppc_inst_prefix(val, suffix);
+
+       return 0;

As the suffix in *inst will always get written now, so my previous comment 
appears invalid.

- Alistair

> > - Alistair
> > 
> > > +static inline int ppc_inst_len(struct ppc_inst x)
> > > +{
> > > +     return (ppc_inst_prefixed(x)) ? 8  : 4;
> > > +}
> > > +
> > > 
> > >  #endif /* _ASM_INST_H */
> > > 
> > > diff --git a/arch/powerpc/include/asm/kprobes.h
> > > b/arch/powerpc/include/asm/kprobes.h index 66b3f2983b22..4fc0e15e23a5
> > > 100644
> > > --- a/arch/powerpc/include/asm/kprobes.h
> > > +++ b/arch/powerpc/include/asm/kprobes.h
> > > @@ -43,7 +43,7 @@ extern kprobe_opcode_t optprobe_template_ret[];
> > > 
> > >  extern kprobe_opcode_t optprobe_template_end[];
> > >  
> > >  /* Fixed instruction size for powerpc */
> > > 
> > > -#define MAX_INSN_SIZE                1
> > > +#define MAX_INSN_SIZE                2
> > > 
> > >  #define MAX_OPTIMIZED_LENGTH sizeof(kprobe_opcode_t) /* 4 bytes */
> > >  #define MAX_OPTINSN_SIZE     (optprobe_template_end -
> > 
> > optprobe_template_entry)
> > 
> > >  #define RELATIVEJUMP_SIZE    sizeof(kprobe_opcode_t) /* 4 bytes */
> > > 
> > > diff --git a/arch/powerpc/include/asm/uaccess.h
> > > b/arch/powerpc/include/asm/uaccess.h index c0a35e4586a5..5a3f486ddf02
> > > 100644
> > > --- a/arch/powerpc/include/asm/uaccess.h
> > > +++ b/arch/powerpc/include/asm/uaccess.h
> > > @@ -105,11 +105,34 @@ static inline int __access_ok(unsigned long addr,
> > > unsigned long size, #define __put_user_inatomic(x, ptr) \
> > > 
> > >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> > > 
> > > -#define __get_user_instr(x, ptr) \
> > > -     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > > +#define __get_user_instr(x, ptr)                     \
> > > +({                                                   \
> > > +     long __gui_ret = 0;                             \
> > > +     unsigned int prefix, suffix;                    \
> > > +     __gui_ret = __get_user(prefix, (unsigned int __user *)ptr);
> > > 
> >      \
> > > 
> > > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > > +             __gui_ret = __get_user(suffix, (unsigned int __user *)ptr
> > 
> > + 1); \
> > 
> > > +             (x) = ppc_inst_prefix(prefix, suffix);  \
> > > +     } else {                                        \
> > > +             (x) = ppc_inst(prefix);                 \
> > > +     }                                               \
> > > +     __gui_ret;                                      \
> > > +})
> > > +
> > > +#define __get_user_instr_inatomic(x, ptr)            \
> > > +({                                                   \
> > > +     long __gui_ret = 0;                             \
> > > +     unsigned int prefix, suffix;                    \
> > > +     __gui_ret = __get_user_inatomic(prefix, (unsigned int __user
> > 
> > *)ptr);            \
> > 
> > > +     if (!__gui_ret && (prefix >> 26) == 1) {        \
> > > +             __gui_ret = __get_user_inatomic(suffix, (unsigned int
> > 
> > __user *)ptr +
> > 
> > > 1);   \ +             (x) = ppc_inst_prefix(prefix, suffix);  \
> > > +     } else {                                        \
> > > +             (x) = ppc_inst(prefix);                 \
> > > +     }                                               \
> > > +     __gui_ret;                                      \
> > > +})
> > > 
> > > -#define __get_user_instr_inatomic(x, ptr) \
> > > -     __get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
> > > 
> > >  extern long __put_user_bad(void);
> > >  
> > >  /*
> > > 
> > > diff --git a/arch/powerpc/include/asm/uprobes.h
> > > b/arch/powerpc/include/asm/uprobes.h index 7e3b329ba2d3..5bf65f5d44a9
> > > 100644
> > > --- a/arch/powerpc/include/asm/uprobes.h
> > > +++ b/arch/powerpc/include/asm/uprobes.h
> > > @@ -15,7 +15,7 @@
> > > 
> > >  typedef ppc_opcode_t uprobe_opcode_t;
> > > 
> > > -#define MAX_UINSN_BYTES              4
> > > +#define MAX_UINSN_BYTES              8
> > > 
> > >  #define UPROBE_XOL_SLOT_BYTES        (MAX_UINSN_BYTES)
> > >  
> > >  /* The following alias is needed for reference from arch-agnostic code
> > 
> > */
> > 
> > > diff --git a/arch/powerpc/kernel/optprobes.c
> > > b/arch/powerpc/kernel/optprobes.c index 684640b8fa2e..689daf430161
> > > 100644
> > > --- a/arch/powerpc/kernel/optprobes.c
> > > +++ b/arch/powerpc/kernel/optprobes.c
> > > @@ -159,38 +159,38 @@ void patch_imm32_load_insns(unsigned int val,
> > > kprobe_opcode_t *addr)
> > > 
> > >  /*
> > >  
> > >   * Generate instructions to load provided immediate 64-bit value
> > > 
> > > - * to register 'r3' and patch these instructions at 'addr'.
> > > + * to register 'reg' and patch these instructions at 'addr'.
> > > 
> > >   */
> > > 
> > > -void patch_imm64_load_insns(unsigned long val, kprobe_opcode_t *addr)
> > > +void patch_imm64_load_insns(unsigned long val, int reg, kprobe_opcode_t
> > > *addr) {
> > > -     /* lis r3,(op)@highest */
> > > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS
> > > 
> > > ___PPC_RT(3) | +      /* lis reg,(op)@highest */
> > > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ADDIS
> > > 
> > > ___PPC_RT(reg) | ((val >> 48) & 0xffff)));
> > > 
> > >       addr++;
> > > 
> > > -     /* ori r3,r3,(op)@higher */
> > > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > > ___PPC_RA(3) | -                        ___PPC_RS(3) | ((val >> 32) &
> > 
> > 0xffff)));
> > 
> > > +     /* ori reg,reg,(op)@higher */
> > > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | ((val >> 32) &
> > 
> > 0xffff)));
> > 
> > >       addr++;
> > > 
> > > -     /* rldicr r3,r3,32,31 */
> > > -     patch_instruction((struct ppc_inst *)addr,
> > 
> > ppc_inst(PPC_INST_RLDICR |
> > 
> > > ___PPC_RA(3) | -                        ___PPC_RS(3) | __PPC_SH64(32) |
> > 
> > __PPC_ME64(31)));
> > 
> > > +     /* rldicr reg,reg,32,31 */
> > > +     patch_instruction((struct ppc_inst *)addr,
> > 
> > ppc_inst(PPC_INST_RLDICR |
> > 
> > > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | __PPC_SH64(32)
> > 
> > __PPC_ME64(31)));
> > 
> > >       addr++;
> > > 
> > > -     /* oris r3,r3,(op)@h */
> > > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS
> > > |
> > > ___PPC_RA(3) | -                        ___PPC_RS(3) | ((val >> 16) &
> > 
> > 0xffff)));
> > 
> > > +     /* oris reg,reg,(op)@h */
> > > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORIS
> > > |
> > > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | ((val >> 16) &
> > 
> > 0xffff)));
> > 
> > >       addr++;
> > > 
> > > -     /* ori r3,r3,(op)@l */
> > > -     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > > ___PPC_RA(3) | -                        ___PPC_RS(3) | (val & 0xffff)));
> > > +     /* ori reg,reg,(op)@l */
> > > +     patch_instruction((struct ppc_inst *)addr, ppc_inst(PPC_INST_ORI |
> > > ___PPC_RA(reg) | +                      ___PPC_RS(reg) | (val &
> > 
> > 0xffff)));
> > 
> > >  }
> > >  
> > >  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct
> > > 
> > > kprobe *p) {
> > > -     struct ppc_inst branch_op_callback, branch_emulate_step;
> > > +     struct ppc_inst branch_op_callback, branch_emulate_step, temp;
> > > 
> > >       kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
> > >       long b_offset;
> > >       unsigned long nip, size;
> > > 
> > > @@ -240,7 +240,7 @@ int arch_prepare_optimized_kprobe(struct
> > > optimized_kprobe *op, struct kprobe *p) * Fixup the template with
> > > 
> > > instructions to:
> > >        * 1. load the address of the actual probepoint
> > >        */
> > > 
> > > -     patch_imm64_load_insns((unsigned long)op, buff + TMPL_OP_IDX);
> > > +     patch_imm64_load_insns((unsigned long)op, 3, buff + TMPL_OP_IDX);
> > > 
> > >       /*
> > >       
> > >        * 2. branch to optimized_callback() and emulate_step()
> > > 
> > > @@ -271,7 +271,11 @@ int arch_prepare_optimized_kprobe(struct
> > > optimized_kprobe *op, struct kprobe *p) /*
> > > 
> > >        * 3. load instruction to be emulated into relevant register, and
> > >        */
> > > 
> > > -     patch_imm32_load_insns(*p->ainsn.insn, buff + TMPL_INSN_IDX);
> > > +     temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> > > +     patch_imm64_load_insns(ppc_inst_val(temp) |
> > > +                            ((u64)ppc_inst_suffix(temp) << 32),
> > > +                            4,
> > > +                            buff + TMPL_INSN_IDX);
> > > 
> > >       /*
> > >       
> > >        * 4. branch back from trampoline
> > > 
> > > diff --git a/arch/powerpc/kernel/optprobes_head.S
> > > b/arch/powerpc/kernel/optprobes_head.S index cf383520843f..ff8ba4d3824d
> > > 100644
> > > --- a/arch/powerpc/kernel/optprobes_head.S
> > > +++ b/arch/powerpc/kernel/optprobes_head.S
> > > 
> > > @@ -94,6 +94,9 @@ optprobe_template_insn:
> > >       /* 2, Pass instruction to be emulated in r4 */
> > >       nop
> > >       nop
> > > 
> > > +     nop
> > > +     nop
> > > +     nop
> > > 
> > >       .global optprobe_template_call_emulate
> > >  
> > >  optprobe_template_call_emulate:
> > > diff --git a/arch/powerpc/kernel/trace/ftrace.c
> > > b/arch/powerpc/kernel/trace/ftrace.c index e78742613b36..16041a5c86d5
> > > 100644
> > > --- a/arch/powerpc/kernel/trace/ftrace.c
> > > +++ b/arch/powerpc/kernel/trace/ftrace.c
> > > @@ -41,11 +41,35 @@
> > > 
> > >  #define      NUM_FTRACE_TRAMPS       8
> > >  static unsigned long ftrace_tramps[NUM_FTRACE_TRAMPS];
> > > 
> > > +#ifdef __powerpc64__
> > > 
> > >  static long
> > >  probe_kernel_read_inst(struct ppc_inst *inst, const void *src)
> > >  {
> > > 
> > > -     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE);
> > > +     u32 val, suffix = 0;
> > > +     long err;
> > > +
> > > +     err = probe_kernel_read((void *)&val,
> > > +                             src, sizeof(val));
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     if ((val >> 26) == 1)
> > > +             err = probe_kernel_read((void *)&suffix,
> > > +                                     src + 4, MCOUNT_INSN_SIZE);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     *inst = ppc_inst_prefix(val, suffix);
> > > +
> > > +     return 0;
> > > 
> > >  }
> > > 
> > > +#else
> > > +static long
> > > +probe_kernel_read_inst(struct ppc_inst *inst, const void *src)
> > > +{
> > > +     return probe_kernel_read((void *)inst, src, MCOUNT_INSN_SIZE)
> > > +}
> > > +#endif
> > > 
> > >  static struct ppc_inst
> > >  ftrace_call_replace(unsigned long ip, unsigned long addr, int link)
> > > 
> > > diff --git a/arch/powerpc/lib/code-patching.c
> > > b/arch/powerpc/lib/code-patching.c index c329ad657302..b4007e03d8fa
> > 
> > 100644
> > 
> > > --- a/arch/powerpc/lib/code-patching.c
> > > +++ b/arch/powerpc/lib/code-patching.c
> > > @@ -24,12 +24,19 @@ static int __patch_instruction(struct ppc_inst
> > > *exec_addr, struct ppc_inst instr {
> > > 
> > >       int err = 0;
> > > 
> > > -     __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
> > > -     if (err)
> > > -             return err;
> > > -
> > > -     asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> > 
> > (patch_addr),
> > 
> > > -                                                         "r"
> > 
> > (exec_addr));
> > 
> > > +     if (!ppc_inst_prefixed(instr)) {
> > > +             __put_user_asm(ppc_inst_val(instr), patch_addr, err,
> > 
> > "stw");
> > 
> > > +             if (err)
> > > +                     return err;
> > > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> > 
> > (patch_addr),
> > 
> > > +                                                                 "r"
> > 
> > (exec_addr));
> > 
> > > +     } else {
> > > +             __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
> > 
> > ppc_inst_val(instr),
> > 
> > > patch_addr, err, "std"); +            if (err)
> > > +                     return err;
> > > +             asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r"
> > 
> > (patch_addr),
> > 
> > > +                                                                 "r"
> > 
> > (exec_addr));
> > 
> > > +     }
> > > 
> > >       return 0;
> > >  
> > >  }
> > > 
> > > diff --git a/arch/powerpc/lib/feature-fixups.c
> > > b/arch/powerpc/lib/feature-fixups.c index f00dd13b1c3c..5519cec83cc8
> > 
> > 100644
> > 
> > > --- a/arch/powerpc/lib/feature-fixups.c
> > > +++ b/arch/powerpc/lib/feature-fixups.c
> > > @@ -84,12 +84,13 @@ static int patch_feature_section(unsigned long
> > > value,
> > > struct fixup_entry *fcur) src = alt_start;
> > > 
> > >       dest = start;
> > > 
> > > -     for (; src < alt_end; src++, dest++) {
> > > +     for (; src < alt_end; src = (void *)src +
> > > ppc_inst_len(ppc_inst_read(src)), +        (dest = (void *)dest +
> > > ppc_inst_len(ppc_inst_read(dest)))) { if (patch_alt_instruction(src,
> > 
> > dest,
> > 
> > > alt_start, alt_end))
> > > 
> > >                       return 1;
> > >       
> > >       }
> > > 
> > > -     for (; dest < end; dest++)
> > > +     for (; dest < end; dest = (void *)dest +
> > > ppc_inst_len(ppc_inst(PPC_INST_NOP))) raw_patch_instruction(dest,
> > > ppc_inst(PPC_INST_NOP));
> > > 
> > >       return 0;
> > > 
> > > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > > index 52ddd3122dc8..8b285bf11218 100644
> > > --- a/arch/powerpc/lib/sstep.c
> > > +++ b/arch/powerpc/lib/sstep.c
> > > @@ -1169,10 +1169,12 @@ int analyse_instr(struct instruction_op *op,
> > 
> > const
> > 
> > > struct pt_regs *regs, unsigned long int imm;
> > > 
> > >       unsigned long int val, val2;
> > >       unsigned int mb, me, sh;
> > > 
> > > -     unsigned int word;
> > > +     unsigned int word, suffix;
> > > 
> > >       long ival;
> > >       
> > >       word = ppc_inst_val(instr);
> > > 
> > > +     suffix = ppc_inst_suffix(instr);
> > > +
> > > 
> > >       op->type = COMPUTE;
> > >       
> > >       opcode = word >> 26;
> > > 
> > > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > > index 6f3bcdcfc9c7..b704aebb099a 100644
> > > --- a/arch/powerpc/xmon/xmon.c
> > > +++ b/arch/powerpc/xmon/xmon.c
> > > @@ -761,8 +761,8 @@ static int xmon_bpt(struct pt_regs *regs)
> > > 
> > >       /* Are we at the trap at bp->instr[1] for some bp? */
> > >       bp = in_breakpoint_table(regs->nip, &offset);
> > > 
> > > -     if (bp != NULL && offset == 4) {
> > > -             regs->nip = bp->address + 4;
> > > +     if (bp != NULL && (offset == 4 || offset == 8)) {
> > > +             regs->nip = bp->address + offset;
> > > 
> > >               atomic_dec(&bp->ref_count);
> > >               return 1;
> > >       
> > >       }
> > > 
> > > @@ -863,7 +863,7 @@ static struct bpt *in_breakpoint_table(unsigned long
> > > nip, unsigned long *offp) if (off >= sizeof(bpt_table))
> > > 
> > >               return NULL;
> > >       
> > >       *offp = off % BPT_SIZE;
> > > 
> > > -     if (*offp != 0 && *offp != 4)
> > > +     if (*offp != 0 && *offp != 4 && *offp != 8)
> > > 
> > >               return NULL;
> > >       
> > >       return bpts + (off / BPT_SIZE);
> > >  
> > >  }
> > > 
> > > diff --git a/arch/powerpc/xmon/xmon_bpts.S
> > 
> > b/arch/powerpc/xmon/xmon_bpts.S
> > 
> > > index ebb2dbc70ca8..09058eb6abbd 100644
> > > --- a/arch/powerpc/xmon/xmon_bpts.S
> > > +++ b/arch/powerpc/xmon/xmon_bpts.S
> > > @@ -3,6 +3,8 @@
> > > 
> > >  #include <asm/asm-compat.h>
> > >  #include "xmon_bpts.h"
> > > 
> > > +/* Prefixed instructions can not cross 64 byte boundaries */
> > > +.align 6
> > > 
> > >  .global bpt_table
> > > 
> > >  bpt_table:
> > > -     .space NBPTS * 8
> > > +     .space NBPTS * 16




