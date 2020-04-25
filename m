Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D11B858D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 12:13:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498RhY3HxTzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 20:13:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=hK17/an3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498RfY5ZtLzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 20:12:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 498RfR00FDz9twsf;
 Sat, 25 Apr 2020 12:11:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hK17/an3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EaRh8D-AoUJt; Sat, 25 Apr 2020 12:11:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 498RfQ5xP3z9twsd;
 Sat, 25 Apr 2020 12:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587809518; bh=Ycqm++sE6wseu8ZnZ6WJ/gChHwwR1Hj6R8+Q5MvRdgU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hK17/an3/OUj6aRL4Hw4feBOS8rABTc64AoHcEWPW2wNB+eHzKAEXJ4hstErOQzey
 TJ8w5cvASQhVtOB5i86kwNEBZAkKDK8rjsdvWDrDgqYybdkN+yoZu6HWhXk8Hm6qHh
 xDWcoY0yYlWoMMgiFk67CXzSpXGhnQLFgF+0T18c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 251DB8B773;
 Sat, 25 Apr 2020 12:12:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lPc8G7LqWoVi; Sat, 25 Apr 2020 12:12:00 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9847A8B752;
 Sat, 25 Apr 2020 12:11:59 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
 <20200424092202.71cfc549@gandalf.local.home>
 <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e743c9db-847a-2612-bf36-c23a57a056c5@c-s.fr>
Date: Sat, 25 Apr 2020 10:11:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1587751684.agx3nt8uvf.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/24/2020 06:26 PM, Naveen N. Rao wrote:
> Steven Rostedt wrote:
>> On Thu, 23 Apr 2020 17:41:52 +0200
>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>> > diff --git a/arch/powerpc/kernel/optprobes.c 
>>> b/arch/powerpc/kernel/optprobes.c
>>> > index 024f7aad1952..046485bb0a52 100644
>>> > --- a/arch/powerpc/kernel/optprobes.c
>>> > +++ b/arch/powerpc/kernel/optprobes.c
>>> > @@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct 
>>> optimized_kprobe *op)
>>> >       }
>>> >   }
>>> > > +#define PATCH_INSN(addr, instr)                             \
>>> > +do {                                         \
>>> > +    int rc = patch_instruction((unsigned int *)(addr), 
>>> instr);         \
>>> > +    if (rc) {                                 \
>>> > +        pr_err("%s:%d Error patching instruction at 0x%pK (%pS): 
>>> %d\n", \
>>> > +                __func__, __LINE__,                 \
>>> > +                (void *)(addr), (void *)(addr), rc);         \
>>> > +        return rc;                             \
>>> > +    }                                     \
>>> > +} while (0)
>>> > +
>>> I hate this kind of macro which hides the "return".
>>>
>>> What about keeping the return action in the caller ?
>>>
>>> Otherwise, what about implementing something based on the use of 
>>> goto, on the same model as unsafe_put_user() for instance ?
> 
> Thanks for the review.
> 
> I noticed this as a warning from checkpatch.pl, but this looked compact 
> and correct for use in the two following functions. You'll notice that I 
> added it just before the two functions this is used in.
> 
> I suppose 'goto err' is usable too, but the ftrace code (patch 2) will 
> end up with more changes. I'm also struggling to see how a 'goto' is 
> less offensive. I think Steve's suggestion below would be the better way 
> to go, to make things explicit.
> 

Sure it's be more explicit, but then more lines also. 3 lines for only 
one really usefull.

With goto, I would look like:

diff --git a/arch/powerpc/kernel/optprobes.c 
b/arch/powerpc/kernel/optprobes.c
index 046485bb0a52..938208f824da 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -139,14 +139,14 @@ void arch_remove_optimized_kprobe(struct 
optimized_kprobe *op)
  	}
  }

-#define PATCH_INSN(addr, instr)						     \
+#define PATCH_INSN(addr, instr, label)						     \
  do {									     \
  	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
  	if (rc) {							     \
  		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
  				__func__, __LINE__,			     \
  				(void *)(addr), (void *)(addr), rc);	     \
-		return rc;						     \
+		goto label;						     \
  	}								     \
  } while (0)

@@ -159,14 +159,17 @@ static int patch_imm32_load_insns(unsigned int 
val, kprobe_opcode_t *addr)
  {
  	/* addis r4,0,(insn)@h */
  	PATCH_INSN(addr, PPC_INST_ADDIS | ___PPC_RT(4) |
-			  ((val >> 16) & 0xffff));
+			  ((val >> 16) & 0xffff), failed);
  	addr++;

  	/* ori r4,r4,(insn)@l */
  	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(4) |
-			  ___PPC_RS(4) | (val & 0xffff));
+			  ___PPC_RS(4) | (val & 0xffff), failed);

  	return 0;
+
+failed:
+	return -EFAULT;
  }

  /*
@@ -177,29 +180,32 @@ static int patch_imm64_load_insns(unsigned long 
val, kprobe_opcode_t *addr)
  {
  	/* lis r3,(op)@highest */
  	PATCH_INSN(addr, PPC_INST_ADDIS | ___PPC_RT(3) |
-			  ((val >> 48) & 0xffff));
+			  ((val >> 48) & 0xffff), failed);
  	addr++;

  	/* ori r3,r3,(op)@higher */
  	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 32) & 0xffff));
+			  ___PPC_RS(3) | ((val >> 32) & 0xffff), failed);
  	addr++;

  	/* rldicr r3,r3,32,31 */
  	PATCH_INSN(addr, PPC_INST_RLDICR | ___PPC_RA(3) |
-			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31));
+			  ___PPC_RS(3) | __PPC_SH64(32) | __PPC_ME64(31), failed);
  	addr++;

  	/* oris r3,r3,(op)@h */
  	PATCH_INSN(addr, PPC_INST_ORIS | ___PPC_RA(3) |
-			  ___PPC_RS(3) | ((val >> 16) & 0xffff));
+			  ___PPC_RS(3) | ((val >> 16) & 0xffff), failed);
  	addr++;

  	/* ori r3,r3,(op)@l */
  	PATCH_INSN(addr, PPC_INST_ORI | ___PPC_RA(3) |
-			  ___PPC_RS(3) | (val & 0xffff));
+			  ___PPC_RS(3) | (val & 0xffff), failed);

  	return 0;
+
+failed:
+	return -EFAULT;
  }

  int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct 
kprobe *p)
@@ -291,23 +297,8 @@ int arch_prepare_optimized_kprobe(struct 
optimized_kprobe *op, struct kprobe *p)
  		goto error;
  	}

-	rc = patch_instruction(buff + TMPL_CALL_HDLR_IDX, branch_op_callback);
-	if (rc) {
-		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
-				__func__, __LINE__,
-				(void *)(buff + TMPL_CALL_HDLR_IDX), rc);
-		rc = -EFAULT;
-		goto error;
-	}
-
-	rc = patch_instruction(buff + TMPL_EMULATE_IDX, branch_emulate_step);
-	if (rc) {
-		pr_err("%s:%d: Error patching instruction at 0x%pK: %d\n",
-				__func__, __LINE__,
-				(void *)(buff + TMPL_EMULATE_IDX), rc);
-		rc = -EFAULT;
-		goto error;
-	}
+	PATCH_INSN(buff + TMPL_CALL_HDLR_IDX, branch_op_callback, efault);
+	PATCH_INSN(buff + TMPL_EMULATE_IDX, branch_emulate_step, efault);

  	/*
  	 * 3. load instruction to be emulated into relevant register, and
@@ -336,6 +327,8 @@ int arch_prepare_optimized_kprobe(struct 
optimized_kprobe *op, struct kprobe *p)

  	return 0;

+efault:
+	rc = -EFAULT;
  error:
  	free_ppc_optinsn_slot(buff, 0);
  	return rc;


Christophe
