Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A74788CC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:42:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6sCbjsb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXPMV67CZz30fK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:41:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6sCbjsb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXPLd4m6Hz2yTx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:41:13 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PFWCDJ008488;
	Fri, 25 Aug 2023 15:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JcIo5JUKa9+6LwDC9gKLWOX587JQNNm3/SkDV2X62dU=;
 b=J6sCbjsbbtLqdeMF++P1yhIOLYlIZUUEnyXoGHoB6jU61RXJzjuZ2pnz2ApFASuD5C0k
 jA/EoN3dJ/PKkz4tSupaon6/r4AAbsFgCzE5D9WrApZOQ4Om3hqVfXsMFIZLJspcMdro
 1qrCF/bNBjL0dCkXEQsko5b7JfROEKNQn78WXirGoV3sx9ysrEm8OND51b4rWTqZxqqy
 r5j8bdsAz0RKbj9c66qykI6Xf1VVkxQXXtP8cSC+4YC1On3MaMKUUP/qyUMleakeevLZ
 /FQG8ULoliBrvq7g19jRurHGRBsvI+hvCe8EUE+ga/klJhFOtdTbekvWauIidjXGM4Ta 0w== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3spy18r9p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:40:52 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PEsFQk026120;
	Fri, 25 Aug 2023 15:40:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3snqgtg1qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 15:40:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PFeo4913566496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 15:40:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CEF920040;
	Fri, 25 Aug 2023 15:40:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0899E20043;
	Fri, 25 Aug 2023 15:40:48 +0000 (GMT)
Received: from [9.43.75.97] (unknown [9.43.75.97])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 15:40:47 +0000 (GMT)
Message-ID: <8c1ebb0a-4bba-96be-7085-6d07b9160ffd@linux.ibm.com>
Date: Fri, 25 Aug 2023 21:10:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] powerpc/bpf: use
 bpf_jit_binary_pack_[alloc|finalize|free]
Content-Language: en-US
To: Song Liu <song@kernel.org>
References: <20230309180213.180263-1-hbathini@linux.ibm.com>
 <20230309180213.180263-5-hbathini@linux.ibm.com>
 <CAPhsuW6FvOwXU6m8rPRqGEgV2P=CGN6AYNHsarO1iRmmAjmEMQ@mail.gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAPhsuW6FvOwXU6m8rPRqGEgV2P=CGN6AYNHsarO1iRmmAjmEMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cEp-zR7GfV-QQuqPAj62RZlqebUU1wM3
X-Proofpoint-ORIG-GUID: cEp-zR7GfV-QQuqPAj62RZlqebUU1wM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_13,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250138
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/03/23 4:05 am, Song Liu wrote:
> On Thu, Mar 9, 2023 at 10:03 AM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
>> writes the program to the rw buffer. When the jit is done, the program
>> is copied to the final location with bpf_jit_binary_pack_finalize.
>> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
>> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
>> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
>> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
>> if necessary. While here, correct the misnomer powerpc64_jit_data to
>> powerpc_jit_data as it is meant for both ppc32 and ppc64.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/net/bpf_jit.h        |   7 +-
>>   arch/powerpc/net/bpf_jit_comp.c   | 104 +++++++++++++++++++++---------
>>   arch/powerpc/net/bpf_jit_comp32.c |   4 +-
>>   arch/powerpc/net/bpf_jit_comp64.c |   6 +-
>>   4 files changed, 83 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>> index d767e39d5645..a8b7480c4d43 100644
>> --- a/arch/powerpc/net/bpf_jit.h
>> +++ b/arch/powerpc/net/bpf_jit.h
>> @@ -168,15 +168,16 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
>>
>>   void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
>>   int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
>> -int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
>> +int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
>>                         u32 *addrs, int pass, bool extra_pass);
>>   void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
>>   void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>>   void bpf_jit_realloc_regs(struct codegen_context *ctx);
>>   int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg, long exit_addr);
>>
>> -int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
>> -                         int insn_idx, int jmp_off, int dst_reg);
>> +int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
>> +                         struct codegen_context *ctx, int insn_idx,
>> +                         int jmp_off, int dst_reg);
>>
>>   #endif
>>
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index d1794d9f0154..ece75c829499 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
>> @@ -42,10 +42,11 @@ int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int tmp_reg,
>>          return 0;
>>   }
>>
>> -struct powerpc64_jit_data {
>> -       struct bpf_binary_header *header;
>> +struct powerpc_jit_data {
>> +       struct bpf_binary_header *hdr;
>> +       struct bpf_binary_header *fhdr;
>>          u32 *addrs;
>> -       u8 *image;
>> +       u8 *fimage;
>>          u32 proglen;
>>          struct codegen_context ctx;
>>   };
> 
> Some comments about the f- prefix will be helpful. (Yes, I should have done
> better job adding comments for the x86 counterpart..)
> 
>> @@ -62,15 +63,18 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>          u8 *image = NULL;
>>          u32 *code_base;
>>          u32 *addrs;
>> -       struct powerpc64_jit_data *jit_data;
>> +       struct powerpc_jit_data *jit_data;
>>          struct codegen_context cgctx;
>>          int pass;
>>          int flen;
>> -       struct bpf_binary_header *bpf_hdr;
>> +       struct bpf_binary_header *fhdr = NULL;
>> +       struct bpf_binary_header *hdr = NULL;
>>          struct bpf_prog *org_fp = fp;
>>          struct bpf_prog *tmp_fp;
>>          bool bpf_blinded = false;
>>          bool extra_pass = false;
>> +       u8 *fimage = NULL;
>> +       u32 *fcode_base;
>>          u32 extable_len;
>>          u32 fixup_len;
>>
>> @@ -100,9 +104,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>          addrs = jit_data->addrs;
>>          if (addrs) {
>>                  cgctx = jit_data->ctx;
>> -               image = jit_data->image;
>> -               bpf_hdr = jit_data->header;
>> +               fimage = jit_data->fimage;
>> +               fhdr = jit_data->fhdr;
>>                  proglen = jit_data->proglen;
>> +               hdr = jit_data->hdr;
>> +               image = (void *)hdr + ((void *)fimage - (void *)fhdr);
>>                  extra_pass = true;
>>                  goto skip_init_ctx;
>>          }
>> @@ -120,7 +126,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>          cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
>>
>>          /* Scouting faux-generate pass 0 */
>> -       if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
>> +       if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
>>                  /* We hit something illegal or unsupported. */
>>                  fp = org_fp;
>>                  goto out_addrs;
>> @@ -135,7 +141,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>           */
>>          if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
>>                  cgctx.idx = 0;
>> -               if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
>> +               if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
>>                          fp = org_fp;
>>                          goto out_addrs;
>>                  }
>> @@ -157,17 +163,19 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>          proglen = cgctx.idx * 4;
>>          alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
>>
>> -       bpf_hdr = bpf_jit_binary_alloc(alloclen, &image, 4, bpf_jit_fill_ill_insns);
>> -       if (!bpf_hdr) {
>> +       fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
>> +                                             bpf_jit_fill_ill_insns);
>> +       if (!fhdr) {
>>                  fp = org_fp;
>>                  goto out_addrs;
>>          }
>>
>>          if (extable_len)
>> -               fp->aux->extable = (void *)image + FUNCTION_DESCR_SIZE + proglen + fixup_len;
>> +               fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE + proglen + fixup_len;
>>
>>   skip_init_ctx:
>>          code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
>> +       fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
>>
>>          /* Code generation passes 1-2 */
>>          for (pass = 1; pass < 3; pass++) {
>> @@ -175,8 +183,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>                  cgctx.idx = 0;
>>                  cgctx.alt_exit_addr = 0;
>>                  bpf_jit_build_prologue(code_base, &cgctx);
>> -               if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, pass, extra_pass)) {
>> -                       bpf_jit_binary_free(bpf_hdr);
>> +               if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass, extra_pass)) {
>> +                       bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
>> +                       bpf_jit_binary_pack_free(fhdr, hdr);
>>                          fp = org_fp;
>>                          goto out_addrs;
>>                  }
>> @@ -192,21 +201,23 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>                   * Note that we output the base address of the code_base
>>                   * rather than image, since opcodes are in code_base.
>>                   */
> Maybe update the comment above with fcode_base to avoid
> confusion.
> 
>> -               bpf_jit_dump(flen, proglen, pass, code_base);
>> +               bpf_jit_dump(flen, proglen, pass, fcode_base);
>>
>>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>>          /* Function descriptor nastiness: Address + TOC */
>> -       ((u64 *)image)[0] = (u64)code_base;
>> +       ((u64 *)image)[0] = (u64)fcode_base;
>>          ((u64 *)image)[1] = local_paca->kernel_toc;
>>   #endif
>>
>> -       fp->bpf_func = (void *)image;
>> +       fp->bpf_func = (void *)fimage;
>>          fp->jited = 1;
>>          fp->jited_len = proglen + FUNCTION_DESCR_SIZE;
>>
>> -       bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + bpf_hdr->size);
>>          if (!fp->is_func || extra_pass) {
>> -               bpf_jit_binary_lock_ro(bpf_hdr);
>> +               if (bpf_jit_binary_pack_finalize(fp, fhdr, hdr)) {
>> +                       fp = org_fp;
>> +                       goto out_addrs;
>> +               }
>>                  bpf_prog_fill_jited_linfo(fp, addrs);
>>   out_addrs:
>>                  kfree(addrs);
>> @@ -216,8 +227,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>                  jit_data->addrs = addrs;
>>                  jit_data->ctx = cgctx;
>>                  jit_data->proglen = proglen;
>> -               jit_data->image = image;
>> -               jit_data->header = bpf_hdr;
>> +               jit_data->fimage = fimage;
>> +               jit_data->fhdr = fhdr;
>> +               jit_data->hdr = hdr;
>>          }
>>
>>   out:
>> @@ -231,12 +243,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>    * The caller should check for (BPF_MODE(code) == BPF_PROBE_MEM) before calling
>>    * this function, as this only applies to BPF_PROBE_MEM, for now.
>>    */
>> -int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct codegen_context *ctx,
>> -                         int insn_idx, int jmp_off, int dst_reg)
>> +int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, u32 *fimage, int pass,
>> +                         struct codegen_context *ctx, int insn_idx, int jmp_off,
>> +                         int dst_reg)
>>   {
>>          off_t offset;
>>          unsigned long pc;
>> -       struct exception_table_entry *ex;
>> +       struct exception_table_entry *ex, *ex_entry;
>>          u32 *fixup;
>>
>>          /* Populate extable entries only in the last pass */
>> @@ -247,9 +260,16 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
>>              WARN_ON_ONCE(ctx->exentry_idx >= fp->aux->num_exentries))
>>                  return -EINVAL;
>>
>> +       /*
>> +        * Program is firt written to image before copying to the
> s/firt/first/
> 
>> +        * final location (fimage). Accordingly, update in the image first.
>> +        * As all offsets used are relative, copying as is to the
>> +        * final location should be alright.
>> +        */
>>          pc = (unsigned long)&image[insn_idx];
>> +       ex = (void *)fp->aux->extable - (void *)fimage + (void *)image;
>>
>> -       fixup = (void *)fp->aux->extable -
>> +       fixup = (void *)ex -
>>                  (fp->aux->num_exentries * BPF_FIXUP_LEN * 4) +
>>                  (ctx->exentry_idx * BPF_FIXUP_LEN * 4);
>>
>> @@ -260,17 +280,17 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *image, int pass, struct code
>>          fixup[BPF_FIXUP_LEN - 1] =
>>                  PPC_RAW_BRANCH((long)(pc + jmp_off) - (long)&fixup[BPF_FIXUP_LEN - 1]);
>>
>> -       ex = &fp->aux->extable[ctx->exentry_idx];
>> +       ex_entry = &ex[ctx->exentry_idx];
>>
>> -       offset = pc - (long)&ex->insn;
>> +       offset = pc - (long)&ex_entry->insn;
>>          if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
>>                  return -ERANGE;
>> -       ex->insn = offset;
>> +       ex_entry->insn = offset;
>>
>> -       offset = (long)fixup - (long)&ex->fixup;
>> +       offset = (long)fixup - (long)&ex_entry->fixup;
>>          if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
>>                  return -ERANGE;
>> -       ex->fixup = offset;
>> +       ex_entry->fixup = offset;
>>
>>          ctx->exentry_idx++;
>>          return 0;
>> @@ -308,3 +328,27 @@ int bpf_arch_text_invalidate(void *dst, size_t len)
>>
>>          return ret;
>>   }
>> +
>> +void bpf_jit_free(struct bpf_prog *fp)
>> +{
>> +       if (fp->jited) {
>> +               struct powerpc_jit_data *jit_data = fp->aux->jit_data;
>> +               struct bpf_binary_header *hdr;
>> +
>> +               /*
>> +                * If we fail the final pass of JIT (from jit_subprogs),
>> +                * the program may not be finalized yet. Call finalize here
>> +                * before freeing it.
>> +                */
>> +               if (jit_data) {
>> +                       bpf_jit_binary_pack_finalize(fp, jit_data->fhdr, jit_data->hdr);
> 
> I just realized x86 is the same. But I think we only need the following
> here?
> 
> bpf_arch_text_copy(&jit_data->fhdr->size, &jit_data->hdr->size,
> sizeof(jit_data->hdr->size));
> 
> Right?

Thanks for reviewing.
Better off with bpf_jit_binary_pack_finalize, probably?
Kept it that way for v3. Posted v3. Please review.

Thanks
Hari
