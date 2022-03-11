Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D74D6633
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 17:28:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFWZC21Zzz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 03:28:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFWYl0Wd5z2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 03:27:36 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFWYc1v7dz9sSC;
 Fri, 11 Mar 2022 17:27:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ts7oKc9F7hUz; Fri, 11 Mar 2022 17:27:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFWYc11Nvz9sS8;
 Fri, 11 Mar 2022 17:27:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 123938B78F;
 Fri, 11 Mar 2022 17:27:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fVF_Ve7bbx3F; Fri, 11 Mar 2022 17:27:32 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A00648B763;
 Fri, 11 Mar 2022 17:27:31 +0100 (CET)
Message-ID: <dc8ec654-ab15-0c34-e9af-7f9c4c430f16@csgroup.eu>
Date: Fri, 11 Mar 2022 17:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/tm: fix live state of vs0/32 in tm_reclaim
Content-Language: fr-FR
To: Gustavo Romero <gromero@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Cyril Bur <cyrilbur@gmail.com>
References: <1499127540.8033.3.camel@gmail.com>
 <1499201115-22967-1-git-send-email-gromero@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1499201115-22967-1-git-send-email-gromero@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Breno Leitao <leitao@debian.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/07/2017 à 22:45, Gustavo Romero a écrit :
> Currently tm_reclaim() can return with a corrupted vs0 (fp0) or vs32 (v0)
> due to the fact vs0 is used to save FPSCR and vs32 is used to save VSCR.
> 
> Later, we recheckpoint trusting that the live state of FP and VEC are ok
> depending on the MSR.FP and MSR.VEC bits, i.e. if MSR.FP is enabled that
> means the FP registers checkpointed when we entered in TM are correct and
> after a treclaim. we can trust the FP live state. Similarly to VEC regs.
> However if tm_reclaim() does not return a sane state then tm_recheckpoint()
> will recheckpoint a corrupted state from live state back to the checkpoint
> area.
> 
> That commit fixes the corruption by restoring vs0 and vs32 from the
> ckfp_state and ckvr_state after they are used to save FPSCR and VSCR,
> respectively.
> 
> The effect of the issue described above is observed, for instance, once a
> VSX unavailable exception is caught in the middle of a transaction with
> MSR.FP = 1 or MSR.VEC = 1. If MSR.FP = 1, then after getting back to user
> space FP state is corrupted. If MSR.VEC = 1, then VEC state is corrupted.
> 
> The issue does not occur if MSR.FP = 0 and MSR.VEC = 0 because ckfp_state
> and ckvr_state are both copied from fp_state and vr_state, respectively,
> and on recheckpointing both states will be restored from these thread
> structures and not from the live state.
> 
> The issue does not occur also if MSR.FP = 1 and MSR.VEC = 1 because it
> implies MSR.VSX = 1 and in that case the VSX unavailable exception does not
> happen in the middle of the transactional block.
> 
> Finally, that commit also fixes the MSR used to check if FP and VEC bits
> are enabled once we are in tm_reclaim_thread(). ckpt_regs.msr is valid only
> if giveup_all() is called *before* using ckpt_regs.msr for checks because
> check_if_tm_restore_required() in giveup_all() will copy regs->msr to
> ckpt_regs.msr and so ckpt_regs.msr reflects exactly the MSR that the thread
> had when it came off the processor.
> 
> No regression was observed on powerpc/tm selftests after this fix.
> 
> Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

This patch is still flaged as "New" in patchwork 
(https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1499201115-22967-1-git-send-email-gromero@linux.vnet.ibm.com/)

I don't know why but the discussion that happened on this patch don't 
appear in patchwork.

I see two commit touching the same area of code done in the following 
monthes the same year:

eb5c3f1c8647 ("powerpc: Always save/restore checkpointed regs during 
treclaim/trecheckpoint")
91381b9cb1c3 ("powerpc: Force reload for recheckpoint during tm {fp, 
vec, vsx} unavailable exception")

So I'll mark this patch as "changes requested". Please raise hand if I'm 
wrong.

Christophe
