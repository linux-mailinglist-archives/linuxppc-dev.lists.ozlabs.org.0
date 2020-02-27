Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98386170D94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 02:00:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SZ9K2w5DzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 12:00:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FHqihkE4; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SZ6x2lGvzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 11:58:48 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id r16so1368797otd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 16:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1YVQK7nzOCWA7WAK6oORj2UW5pxlHLZetEbaMq7XrwE=;
 b=FHqihkE4qn2zZvqeGjBrKQssOhUxXl5sg2pJLO7f10Fr7lUazI46UM/Yx9xeANxWtb
 ZJr3x0jeQSCUmvpz6m8jYLVC9Hu2pAxvcx6YlE+o3GPJ3KcmxI/G/ailA9QOZ2Gccef2
 L6RAf/hhgVrR8AtIslOVclE0A1Xv96V/n0h7E55JPM5ospUZwreSgrpUM41JG1/HmHwn
 lRlrLkLBz/REBgaxm65nrfgw2q71RbPZTXD35DBnnQ7Hmbk+R88rH0Wv42RVHdV2BpRm
 NVFMoGXoQYPqlDpWUZ5keAzoA61k+EL/n/ENZFehoPILNkm2jPmiUSWkUT1kgzQQczQi
 sykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1YVQK7nzOCWA7WAK6oORj2UW5pxlHLZetEbaMq7XrwE=;
 b=gbvl1xLqga0uoWm2QAYfLGXPGtTsKlz2DM70VYfSDRC4C+MMnAEw+wLadQkgOqOq7C
 WLMqtJFp1anmXAQrrSOELlvgvP6iQcYZZEqUrRoLxMaxMA1VAg9o0CaV4jGMsq/0d4V/
 0HF29fjkdLNmFOFIqhc4IrQBl+Obj0coL5ukCzz89le3OQjMKgkkmmQPwnfwjubeaZY/
 pxNTCyQW4eTdiLNkiCFuJZtWQfmfGO64s4B95xP1zXpyEfK6RPOTsd9ctN2Fqy0HvkrM
 hTWEkA8TORHQJAmuk+4dLqvX4z2vmvx45dG1eFHWUTqsqBqedwO9qcn1WHvqFWNW9VLe
 /jVw==
X-Gm-Message-State: APjAAAXABKy0P/ePZIW8rJ1jtODeyBKk9PbWujzxV0banMtcGCUtC+XD
 oG1m7V86xU9vvh57XLkkjJs5IpB9jAGuBvZZz8c=
X-Google-Smtp-Source: APXvYqxYUCWJ7Bu1HGlKiUKxaqY4E0XQH4rPCz+JHnmcTXPbkICEjE+1mlYp29M7/ffXujcXlaIvuu6/wNgA7oO1Few=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr1339039oti.155.1582765125318; 
 Wed, 26 Feb 2020 16:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
 <1582700856.cbydlhx2wj.astroid@bobo.none>
In-Reply-To: <1582700856.cbydlhx2wj.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 27 Feb 2020 11:58:34 +1100
Message-ID: <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 6:18 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on February 26, 2020 2:07 pm:
> > @@ -136,11 +148,14 @@ int arch_prepare_kprobe(struct kprobe *p)
> >       }
> >
> >       if (!ret) {
> > -             patch_instruction(p->ainsn.insn, *p->addr);
> > +             patch_instruction(&p->ainsn.insn[0], p->addr[0]);
> > +             if (IS_PREFIX(insn))
> > +                     patch_instruction(&p->ainsn.insn[1], p->addr[1]);
> >               p->opcode = *p->addr;
>
> Not to single out this hunk or this patch even, but what do you reckon
> about adding an instruction data type, and then use that in all these
> call sites rather than adding the extra arg or doing the extra copy
> manually in each place depending on prefix?
>
> instrs_are_equal, get_user_instr, analyse_instr, patch_instruction,
> etc., would all take this new instr. Places that open code a memory
> access like your MCE change need some accessor
>
>                instr = *(unsigned int *)(instr_addr);
> -               if (!analyse_instr(&op, &tmp, instr, PPC_NO_SUFFIX)) {
> +               if (IS_PREFIX(instr))
> +                       suffix = *(unsigned int *)(instr_addr + 4);
>
> Becomes
>                read_instr(instr_addr, &instr);
>                if (!analyse_instr(&op, &tmp, instr)) ...
>
> etc.
Daniel Axtens also talked about this and my reasons not to do so were
pretty unconvincing, so I started trying something like this. One
thing I have been wondering is how pervasive should the new type be.
Below is data type I have started using, which I think works
reasonably for replacing unsigned ints everywhere (like within
code-patching.c). In a few architecture independent places such as
uprobes which want to do ==, etc the union type does not work so well.
I will have the next revision of the series start using a type.

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
new file mode 100644
index 000000000000..50adb3dbdeb4
--- /dev/null
+++ b/arch/powerpc/include/asm/inst.h
@@ -0,0 +1,87 @@
+
+#ifndef _ASM_INST_H
+#define _ASM_INST_H
+
+#ifdef __powerpc64__
+
+/* 64  bit Instruction */
+
+typedef struct {
+    unsigned int prefix;
+    unsigned int suffix;
+} __packed ppc_prefixed_inst;
+
+typedef union ppc_inst {
+    unsigned int w;
+    ppc_prefixed_inst p;
+} ppc_inst;
+
+#define PPC_INST_IS_PREFIXED(inst) (((inst).w >> 26) == 1)
+#define PPC_INST_LEN(inst) (PPC_INST_IS_PREFIXED((inst)) ?
sizeof((inst).p) : sizeof((inst).w))
+
+#define PPC_INST_NEW_WORD(x) ((ppc_inst) { .w = (x) })
+#define PPC_INST_NEW_WORD_PAD(x) ((ppc_inst) { .p.prefix = (x),
.p.suffix = (0x60000000) })
+#define PPC_INST_NEW_PREFIXED(x, y) ((ppc_inst) { .p.prefix = (x),
.p.suffix = (y) })
+
+#define PPC_INST_WORD(x) ((x).w)
+#define PPC_INST_PREFIX(x) (x.p.prefix)
+#define PPC_INST_SUFFIX(x) (x.p.suffix)
+#define PPC_INST_EMPTY(x) (PPC_INST_WORD(x) == 0)
+
+#define DEREF_PPC_INST_PTR(ptr)                \
+({                            \
+    ppc_inst __inst;                \
+    __inst.w = *(unsigned int *)(ptr);        \
+    if (PPC_INST_IS_PREFIXED(__inst))        \
+        __inst.p = *(ppc_prefixed_inst *)(ptr);    \
+    __inst;                        \
+})
+
+#define PPC_INST_NEXT(ptr) ((ptr) += PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
+#define PPC_INST_PREV(ptr) ((ptr) -= PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
+
+#define PPC_INST_EQ(x, y)                \
+({                            \
+    long pic_ret = 0;                \
+    pic_ret = (PPC_INST_PREFIX(x) == PPC_INST_PREFIX(y));    \
+    if (pic_ret) {                    \
+        if (PPC_INST_IS_PREFIXED(x) && PPC_INST_IS_PREFIXED(y)) {    \
+            pic_ret = (PPC_INST_SUFFIX(x) == PPC_INST_SUFFIX(y));    \
+        } else {                \
+            pic_ret = 0;            \
+        }                    \
+    }                        \
+    pic_ret;                    \
+})
+
+#else /* !__powerpc64__ */
+
+/* 32 bit Instruction */
+
+typedef unsigned int ppc_inst;
+
+#define PPC_INST_IS_PREFIXED(inst) (0)
+#define PPC_INST_LEN(inst) (4)
+
+#define PPC_INST_NEW_WORD(x) (x)
+#define PPC_INST_NEW_WORD_PAD(x) (x)
+#define PPC_INST_NEW_PREFIXED(x, y) (x)
+
+#define PPC_INST_WORD(x) (x)
+#define PPC_INST_PREFIX(x) (x)
+#define PPC_INST_SUFFIX(x) (0)
+#define PPC_INST_EMPTY(x) (PPC_INST_WORD(x) == 0)
+
+#define DEREF_PPC_INST_PTR(ptr)    (*ptr)
+
+#define PPC_INST_NEXT(ptr) ((ptr) += 4)
+#define PPC_INST_PREV(ptr) ((ptr) -= 4)
+
+#define PPC_INST_EQ(x, y) ((x) == (y))
+
+#endif /* __powerpc64__ */
+
+
+#endif /* _ASM_INST_H */

>
> Thanks,
> Nick
