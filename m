Return-Path: <linuxppc-dev+bounces-2269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4F099DE9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 08:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSPfs6DD8z3c4D;
	Tue, 15 Oct 2024 17:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728974565;
	cv=none; b=OE40jLdti/HSyp8VijCNcnRtJePyZoPDm6euL3bG/Z4vQoZwwsZt/qLM9naVlKO9Uv7AT62SOiHRBZ49F1ZGZ7BbYTHMUq40eMcp1Weh7cLdEu6CMsfKyMRo7+YyA5ZSXCPS0kWYk/81TZ+HJrE5uYl8mr0+8/6kYo2XEm6QToZZkn930nbkQtmiSPgWPwle4vxhYjbBg9dt9JhDcfrrQOLi6rq38N0in9+NYHV4cws4MZgmuF+cCEq/KfDobRUyJK2/7zuEu+pxlWc5H4OX7q2R2VCNRqUs7dVdR7GPRtXkt3wqbnwgB0x6UZHjNmvd2zncRzok259BOqFTiYu43A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728974565; c=relaxed/relaxed;
	bh=yZY8Q+WVwnCzpj20CVghuUX3o6Hwo32dGoF20noZK+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kda14VqQE4iv60lK8dr47dFJQcy1baavKvMYPpffJQ59EkBHE5CYsbfd7mODHVG7ADEWUGZJ05M15MK3SB601CAesl6yIGboFfUwtjL3/kGWYrRvE49M4HRTwMqIxB5Nc+bRCPrnPUk8VRzwHt61Qk1SMHFDmL2+3V70eSBVsr/lOD7R1EUJJl3FFaH5O7593K4yTnqXnIC6pRI2WcRXQBTRdlKgqx1phx8zuLv9Qg+jpdfFvSToHEr3jxrLFTMUaXLOrkVuZGDpcMtWyk0MR5S/DM5za0z5Txxsq6dcFujfsyJy34bQGJs5/24o+9+HkJa0U1ZTOld0HkMriQGPUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSPfr5P9yz3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 17:42:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XSPfk3bvFz9sPd;
	Tue, 15 Oct 2024 08:42:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWUMtT-TFO-Y; Tue, 15 Oct 2024 08:42:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XSPfk2bjlz9rvV;
	Tue, 15 Oct 2024 08:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 456068B766;
	Tue, 15 Oct 2024 08:42:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id haU307l0a_y8; Tue, 15 Oct 2024 08:42:38 +0200 (CEST)
Received: from [192.168.233.13] (unknown [192.168.233.13])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D1568B764;
	Tue, 15 Oct 2024 08:42:37 +0200 (CEST)
Message-ID: <660a2cf7-24f9-4558-87df-5e4c13362380@csgroup.eu>
Date: Tue, 15 Oct 2024 08:42:36 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v2 02/13] powerpc: mm: Fix kfence page fault
 reporting
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>,
 Heiko Carstens <hca@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Disha Goel <disgoel@linux.ibm.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
 <6bf523aa03e72d701d24aca49b51864331eed2d5.1728954719.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6bf523aa03e72d701d24aca49b51864331eed2d5.1728954719.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 15/10/2024 à 03:33, Ritesh Harjani (IBM) a écrit :
> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
> /proc/kcore can have some unmapped kfence objects which when read via
> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
> functions define their own fixup table for handling fault, use that
> instead of asking kfence to handle such faults.
> 
> Hence we search the exception tables for the nip which generated the
> fault. If there is an entry then we let the fixup table handler handle the
> page fault by returning an error from within ___do_page_fault().
> 
> This can be easily triggered if someone tries to do dd from /proc/kcore.
> dd if=/proc/kcore of=/dev/null bs=1M
> 
> <some example false negatives>
> ===============================
> BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
> Invalid read at 0x000000004f749d2e:
>   copy_from_kernel_nofault+0xb0/0x1c8
>   0xc0000000057f7950
>   read_kcore_iter+0x41c/0x9ac
>   proc_reg_read_iter+0xe4/0x16c
>   vfs_read+0x2e4/0x3b0
>   ksys_read+0x88/0x154
>   system_call_exception+0x124/0x340
>   system_call_common+0x160/0x2c4
> 
> BUG: KFENCE: use-after-free read in copy_from_kernel_nofault+0xb0/0x1c8
> Use-after-free read at 0x000000008fbb08ad (in kfence-#0):
>   copy_from_kernel_nofault+0xb0/0x1c8
>   0xc0000000057f7950
>   read_kcore_iter+0x41c/0x9ac
>   proc_reg_read_iter+0xe4/0x16c
>   vfs_read+0x2e4/0x3b0
>   ksys_read+0x88/0x154
>   system_call_exception+0x124/0x340
>   system_call_common+0x160/0x2c4
> 
> Guessing the fix should go back to when we first got kfence on PPC32.
> 
> Fixes: 90cbac0e995d ("powerpc: Enable KFENCE for PPC32")
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/fault.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 81c77ddce2e3..fa825198f29f 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -439,9 +439,17 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>   	/*
>   	 * The kernel should never take an execute fault nor should it
>   	 * take a page fault to a kernel address or a page fault to a user
> -	 * address outside of dedicated places
> +	 * address outside of dedicated places.
> +	 *
> +	 * Rather than kfence reporting false negatives, let the fixup table
> +	 * handler handle the page fault by returning SIGSEGV, if the fault
> +	 * has come from functions like copy_from_kernel_nofault().
>   	 */
>   	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
> +
> +		if (search_exception_tables(instruction_pointer(regs)))
> +			return SIGSEGV;

This is a heavy operation. It should at least be done only when KFENCE 
is built-in.

kfence_handle_page_fault() bails out immediately when 
is_kfence_address() returns false, and is_kfence_address() returns 
always false when KFENCE is not built-in.

So you could check that before calling the heavy weight 
search_exception_tables().

		if (is_kfence_address(address) &&
		    !search_exception_tables(instruction_pointer(regs)) &&
		    kfence_handle_page_fault(address, is_write, regs))
			return 0;



 > +			return SIGSEGV;

> +
>   		if (kfence_handle_page_fault(address, is_write, regs))
>   			return 0;
>   

