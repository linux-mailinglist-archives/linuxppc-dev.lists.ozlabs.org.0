Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6F21A0FC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:35:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2ccj4Lq6zDqVr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 23:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=hFI1/gof; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2cZF2fHqzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:33:24 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 295322874B2;
 Thu,  9 Jul 2020 09:33:19 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9IWcHfoPOYvy; Thu,  9 Jul 2020 09:33:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id B0BFA2871EB;
 Thu,  9 Jul 2020 09:33:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B0BFA2871EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594301598;
 bh=6O37I+s8mJ/TGzUJ9xz8tYWI2QXNKfxpO1/8v2v/gNU=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=hFI1/gofvSvEqSIE7dgZrPFTRAGcfoeh/9uJxdV+8SIDADRHxuiTV75QmgYuMdGOF
 xzYk5FLQamshypGUCpSx4pPwEaxK8H67L0UUi3L9pP49OgqmSFu+yq4cLNy3RnriDj
 bUfvHvlSMfXAn8VJGyGnj1pNlJ/hzWRfrfkkudIHT+v41xEB7sDG1sZ65sq8ihGCR0
 x3C7nFPFyhEoXNR+GlBoWbiPVIZJK973Moqu20Ob2eLpBhKnh5DJUnP2H1XwYgUuMg
 7WekeUHDY/GRNQ3OknelC0p6mEwq+HQjsBILL2mjIAq0K1VTHgP7s5oBsKgir0Rzbq
 uPictiWYKYRAw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cM3VRQ6HP3dl; Thu,  9 Jul 2020 09:33:18 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id A4DC72871EA;
 Thu,  9 Jul 2020 09:33:18 -0400 (EDT)
Date: Thu, 9 Jul 2020 09:33:18 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <429958629.6348.1594301598584.JavaMail.zimbra@efficios.com>
In-Reply-To: <20200709001003.GB3598@gate.crashing.org>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org>
 <841816533.1735.1594211583710.JavaMail.zimbra@efficios.com>
 <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
 <20200709001003.GB3598@gate.crashing.org>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: ftMGuAIpjiHhC82GKDkP+XliiNN/4Q==
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 8, 2020, at 8:10 PM, Segher Boessenkool segher@kernel.crashing.org wrote:

> Hi!
> 
> On Wed, Jul 08, 2020 at 10:00:01AM -0400, Mathieu Desnoyers wrote:
[...]
> 
>> -#define STORE_WORD     "std "
>> -#define LOAD_WORD      "ld "
>> -#define LOADX_WORD     "ldx "
>> +#define STORE_WORD(arg)        "std%U[" __rseq_str(arg) "]%X[" __rseq_str(arg)
>> "] "    /* To memory ("m" constraint) */
>> +#define LOAD_WORD(arg) "lwd%U[" __rseq_str(arg) "]%X[" __rseq_str(arg) "] "
>> /* From memory ("m" constraint) */
> 
> That cannot work (you typoed "ld" here).

Indeed, I noticed it before pushing to master (lwd -> ld).

> 
> Some more advice about this code, pretty generic stuff:

Let's take an example to support the discussion here. I'm taking it from
master branch (after a cleanup changing e.g. LOAD_WORD into RSEQ_LOAD_LONG).
So for powerpc32 we have (code edited to remove testing instrumentation):

#define __rseq_str_1(x) #x
#define __rseq_str(x)           __rseq_str_1(x)

#define RSEQ_STORE_LONG(arg)    "stw%U[" __rseq_str(arg) "]%X[" __rseq_str(arg) "] "    /* To memory ("m" constraint) */
#define RSEQ_STORE_INT(arg)     RSEQ_STORE_LONG(arg)                                    /* To memory ("m" constraint) */
#define RSEQ_LOAD_LONG(arg)     "lwz%U[" __rseq_str(arg) "]%X[" __rseq_str(arg) "] "    /* From memory ("m" constraint) */
#define RSEQ_LOAD_INT(arg)      RSEQ_LOAD_LONG(arg)                                     /* From memory ("m" constraint) */
#define RSEQ_LOADX_LONG         "lwzx "                                                 /* From base register ("b" constraint) */
#define RSEQ_CMP_LONG           "cmpw "

#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags,                          \
                        start_ip, post_commit_offset, abort_ip)                 \
                ".pushsection __rseq_cs, \"aw\"\n\t"                            \
                ".balign 32\n\t"                                                \
                __rseq_str(label) ":\n\t"                                       \
                ".long " __rseq_str(version) ", " __rseq_str(flags) "\n\t"      \
                /* 32-bit only supported on BE */                               \
                ".long 0x0, " __rseq_str(start_ip) ", 0x0, " __rseq_str(post_commit_offset) ", 0x0, " __rseq_str(abort_ip) "\n\t" \
                ".popsection\n\t"                                       \
                ".pushsection __rseq_cs_ptr_array, \"aw\"\n\t"          \
                ".long 0x0, " __rseq_str(label) "b\n\t"                 \
                ".popsection\n\t"

/*
 * Exit points of a rseq critical section consist of all instructions outside
 * of the critical section where a critical section can either branch to or
 * reach through the normal course of its execution. The abort IP and the
 * post-commit IP are already part of the __rseq_cs section and should not be
 * explicitly defined as additional exit points. Knowing all exit points is
 * useful to assist debuggers stepping over the critical section.
 */
#define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)                           \
                ".pushsection __rseq_exit_point_array, \"aw\"\n\t"              \
                /* 32-bit only supported on BE */                               \
                ".long 0x0, " __rseq_str(start_ip) ", 0x0, " __rseq_str(exit_ip) "\n\t" \
                ".popsection\n\t"

#define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs)                        \
                "lis %%r17, (" __rseq_str(cs_label) ")@ha\n\t"                  \
                "addi %%r17, %%r17, (" __rseq_str(cs_label) ")@l\n\t"           \
                RSEQ_STORE_INT(rseq_cs) "%%r17, %[" __rseq_str(rseq_cs) "]\n\t" \
                __rseq_str(label) ":\n\t"

#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip)        \
                __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,              \
                                        (post_commit_ip - start_ip), abort_ip)

#define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label)                      \
                RSEQ_LOAD_INT(current_cpu_id) "%%r17, %[" __rseq_str(current_cpu_id) "]\n\t" \
                "cmpw cr7, %[" __rseq_str(cpu_id) "], %%r17\n\t"                \
                "bne- cr7, " __rseq_str(label) "\n\t"

#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)                               \
                ".pushsection __rseq_failure, \"ax\"\n\t"                       \
                ".long " __rseq_str(RSEQ_SIG) "\n\t"                            \
                __rseq_str(label) ":\n\t"                                       \
                "b %l[" __rseq_str(abort_label) "]\n\t"                         \
                ".popsection\n\t"

#define RSEQ_ASM_OP_CMPEQ(var, expect, label)                                   \
                RSEQ_LOAD_LONG(var) "%%r17, %[" __rseq_str(var) "]\n\t"         \
                RSEQ_CMP_LONG "cr7, %%r17, %[" __rseq_str(expect) "]\n\t"               \
                "bne- cr7, " __rseq_str(label) "\n\t"

#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)                  \
                RSEQ_STORE_LONG(var) "%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n\t" \
                __rseq_str(post_commit_label) ":\n\t"

static inline __attribute__((always_inline))
int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
{
        __asm__ __volatile__ goto (
                RSEQ_ASM_DEFINE_TABLE(3, 1f, 2f, 4f) /* start, commit, abort */
                RSEQ_ASM_DEFINE_EXIT_POINT(1f, %l[cmpfail])

                /* Start rseq by storing table entry pointer into rseq_cs. */
                RSEQ_ASM_STORE_RSEQ_CS(1, 3b, rseq_cs)
                /* cmp cpuid */
                RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
                /* cmp @v equal to @expect */
                RSEQ_ASM_OP_CMPEQ(v, expect, %l[cmpfail])

                /* final store */
                RSEQ_ASM_OP_FINAL_STORE(newv, v, 2)
                RSEQ_ASM_DEFINE_ABORT(4, abort)

                : /* gcc asm goto does not allow outputs */
                : [cpu_id]              "r" (cpu),
                  [current_cpu_id]      "m" (__rseq_abi.cpu_id),
                  [rseq_cs]             "m" (__rseq_abi.rseq_cs),
                  [v]                   "m" (*v),
                  [expect]              "r" (expect),
                  [newv]                "r" (newv)
                : "memory", "cc", "r17"
                : abort, cmpfail
        );
        return 0;
abort:
        RSEQ_INJECT_FAILED
        return -1;
cmpfail:
        return 1;
}

> 
> The way this all uses r17 will likely not work reliably.

r17 is only used as a temporary register within the inline assembler, and it is
in the clobber list. In which scenario would it not work reliably ?

> The way multiple asm statements are used seems to have missing
> dependencies between the statements.

I'm not sure I follow here. Note that we are injecting the CPP macros into
a single inline asm statement as strings.

> 
> Don't try to work *against* the compiler.  You will not win.
> 
> Alternatively, write assembler code, if that is what you actually want
> to do?  Not C code.
>
> And done macro-mess this, you want to be able to debug it, and you need
> other people to be able to read it!

I understand that looking at macros can be cumbersome from the perspective
of a reviewer only interested in a single architecture,

However, from my perspective, as a maintainer who must maintain similar code
for x86 32/64, powerpc 32/64, arm, aarch64, s390, s390x, mips 32/64, and likely
other architectures in the future, the macros abstracting 32-bit and 64-bit
allow to eliminate code duplication for each architecture with 32-bit and 64-bit
variants, which is better for maintainability.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
