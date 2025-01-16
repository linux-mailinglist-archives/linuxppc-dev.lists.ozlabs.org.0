Return-Path: <linuxppc-dev+bounces-5331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94EA1335E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 07:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYYQR0m3Fz2yZ6;
	Thu, 16 Jan 2025 17:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737010207;
	cv=none; b=UI30rx3tBHL6mpge3YHMC4OigSWvQwZUXgYhFL9Fnks5ZRdEDQoQNEmc77vKnbddCbZ0hyqYHcExgsn21GfTV4J8Lpjtibvn2haWlz0Z2IF6oiqD1VO5flvPrtWNuNJ2z8wdfQMAwdfPYLaCUVehGsSQWnSWo8CaIAVj5JK2cbUZiurOM+Eui1BpsOadyiKd4rh5Rm0vds8ZNCwj6YunGEbZ0qkMJa1a3d4UTdAKPPPfrU39msOzq2j4IsgSeIwnjQzp3d+bRWEM2wnqpQfjvAWGPI9ljOmwPbcjVnEn+M9UOh2PzZ5A9lV54NuXCZFtawJqcSsoS9s53WstkOo80w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737010207; c=relaxed/relaxed;
	bh=HFjyinabaOtlqsU+Lm2cFP0JEmPbIQufSX7vUuvFPMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMYIKumIQLzzv0GAubao4gYAyHpoyVtXUqk2mBIz0RW/AUJNA3xZ3xbICWQYn03RIx8Vo1Dsj7bw2aF/WTef9BPOIVUejS1NELT92hPB3eCz9zwEhsDe7O4yqdrQeoLGQkFHo9Z8FDJ2g5gCFox7K1RQtHuiy9ab1KeeeGvILoCgj0Mi9z8ado5u9n57ttBDcwYP02Zfh4hCm/+X2T+c/2ZNkt2L4nyBLL55RPfzCMy9nN5KwJpOG5sK8hd4TxN59zR6gPfkXiDfZKYrshX3aB6ySxCDLFVPqHLMt3EHHCIivFvDjm8kd+vgFwxXvlC6qxWCOdzVu2zo+BPKcRyZOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYYQQ0Qtcz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 17:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYXtB4PM7z9sST;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvu0bE32cUqa; Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYXtB3VX0z9sSS;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6497E8B77A;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KeEUKWueXOwO; Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C4B78B774;
	Thu, 16 Jan 2025 07:25:37 +0100 (CET)
Message-ID: <92e889d2-b883-41fe-b75f-1909ac23f5e2@csgroup.eu>
Date: Thu, 16 Jan 2025 07:25:35 +0100
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
Subject: Re: [PATCH v5 00/15] powerpc/objtool: uaccess validation for PPC32
 (v5)
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Julien Thierry <jthierry@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Raphael Gault <raphael.gault@arm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 15/01/2025 à 23:42, Christophe Leroy a écrit :
> This series adds UACCESS validation for PPC32. It includes
> a dozen of changes to objtool core.
> 
> It applies on top of series "Cleanup/Optimise KUAP (v3)"
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*

I forgot to remove that sentence. That was merged long time ago so the 
series doesn't have any dependency anymore, it applies as standalone on 
top of git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git branch 
tip/objtool/core (HEAD 41a1e976623e ("x86/mm: Convert unreachable() to 
BUG()"))

> 
> It is almost mature, performs code analysis for all PPC32.
> 
> In this version objtool switch table lookup has been enhanced to
> handle nested switch tables.
> 
> Most object files are correctly decoded, only a few
> 'unreachable instruction' warnings remain due to more complex
> fonctions which include back and forth jumps or branches. Two types
> of switch tables are missed at the time being:
> - When switch table address is temporarily saved in the stack before
> being used.
> - When there are backwards jumps in the path.
> 
> It allowed to detect some UACCESS mess in a few files. They've been
> fixed through other patches.
> 
> Changes in v5:
> - Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git branch tip/objtool/core
> - Use generic annotation infrastructure to annotate uaccess begin and end instructions
> 

