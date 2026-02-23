Return-Path: <linuxppc-dev+bounces-17073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P7NEsGsnGlyJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:38:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F117C75B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:38:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKWP951Qzz3bf8;
	Tue, 24 Feb 2026 06:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771875517;
	cv=none; b=mUsKb5bt1OAUiPRel72xsFY0jhN+4eC3zmamRPlhuODPFq04ss9ijcUIrd0eLRlbH4rd0vsTfQ9Y2dOpNHLsVI/sjnwyVpIUmSBe08h8toS46ddolYWhxqJXB/MT/ZCT+i9AuNZp9wyvEcslTpIZ1zKHCK7jK4+Hvjx6zMBcKSJ3URObE6DKxAPEQOFNYljdyLwngfz6uHRanjsomshS9lIYkbWwEczFW/KIfSKgvXoHK74QY6tXKqZfzEFQYVTC73Z33F2UYq7H8SAhLXeZB7wKnoQOZ/f9eL2I4iYhfE1Fhlgauok9G50hSqwXLM1NcjH5c1VI21ihKYPO+EAyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771875517; c=relaxed/relaxed;
	bh=frmOihMdlevhvbIRfSO4T5TgcRqEXXD2lVTybbuUx3g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=E3bG8fTu5MUUYLSbo03JyPd6Pxk0GCyOT5wPQE+7A7EuRYOx9cAnnEdeHcHE2zs0/EoKvijjkSiRqPTovt3XFKC9zGxrGqVoa+De86T/Q+bWXFY+axioetSD76wFvytGK1PEypC76hea1v5HXPPR4MES2fkk/Au5k5Zc5oS8WbR6hQStIuIotjflOmE+M2nurRGmTDtTuKNvZkQr4wB+1/h8Si7Wx/NEdh/UI+0BBC9DUHZdZEYznguEpcvoZqDy+Fyzl1bfErvPIwOr+caEsG964Zy9qAgMXnpeK89fHU8qEeXi+Qv4GtiWKr60qfkJcZP/yj+WIYde2x/AkyeG2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ll3WpHA+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ll3WpHA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKWP84R82z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:38:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73AA64075C;
	Mon, 23 Feb 2026 19:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0928EC116C6;
	Mon, 23 Feb 2026 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771875514;
	bh=0liSLOp6O8LEmoBc+kVOuEi4d/b1OtVGMfSEM2HKyxs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ll3WpHA+az0TrUwt/tb1x5lQmtK9ncSnpChC5MZjsXQ1ggTuESy1eQmoDyR0pOXm6
	 vhyU67p+3MoLkCwZ+WwmbZuA6ELVBoctCPaUGF2+6xUSTQB9jRt+Dr6fruq14aru2n
	 G2thhx7MAaHvePD6HZLUM65tYXq9NHV75TzOolmLq8au0owD98yyQPdO2CSMkSVU35
	 4ROW/8YBXCBfA+90Hc0Vlyb1kIcsEUrk5KkHg3dj83sGhh5PZueC5l6jydDyYF9ufH
	 tH2Fzv9MDN9bF1gJbPRDH7o8llBD52knx7vKxbblV130ux8CxX32I6jhymj6Dk3Lpp
	 z3CPjIoRVGZIQ==
Message-ID: <2536c3e7-18d2-47cb-88c6-36f94c61c1c6@kernel.org>
Date: Mon, 23 Feb 2026 20:38:29 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux PPC] 7.0-rc1: e500_mmu.c:923:26: error: assignment to
 'struct tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *'
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Kees Cook <keescook@chromium.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
 <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
 <2cbd1e19-ac99-29c3-ab89-3c58a9863e5a@xenosoft.de>
 <2d2d4735-04e0-46a0-93c6-654507fe2ae1@kernel.org>
Content-Language: fr-FR
In-Reply-To: <2d2d4735-04e0-46a0-93c6-654507fe2ae1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17073-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:keescook@chromium.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5F7F117C75B
X-Rspamd-Action: no action



Le 23/02/2026 à 19:07, Christophe Leroy (CS GROUP) a écrit :
> +Kees
> 
> Hello,
> 
> Le 23/02/2026 à 17:48, Christian Zigotzky a écrit :
>> Hello,
>>
>> Compiling issue for e5500 machines for the RC1 of kernel 7.0:
>>
>> arch/powerpc/kvm/e500_mmu.c: In function 'kvmppc_e500_tlb_init':
>> arch/powerpc/kvm/e500_mmu.c:923:26: error: assignment to 'struct 
>> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [- 
>> Werror=incompatible-pointer-types]
>>    923 |  vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
>>        |                          ^
>> arch/powerpc/kvm/e500_mmu.c:928:26: error: assignment to 'struct 
>> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [- 
>> Werror=incompatible-pointer-types]
>>    928 |  vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
>>
>> Temporary solution: # CONFIG_VIRTUALIZATION is not set
>>
>> Please solve this issue.
>>
> 
> Must be one of:
> 
> 189f164e573e Convert remaining multi-line kmalloc_obj/flex GFP_KERNEL uses
> bf4afc53b77a Convert 'alloc_obj' family to use the new default 
> GFP_KERNEL argument
> 69050f8d6d07 treewide: Replace kmalloc with kmalloc_obj for non-scalar 
> types
> 

Can you try following change:

diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index 48580c85f23b..75ed1496ead5 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -920,12 +920,12 @@ int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500 
*vcpu_e500)
  	vcpu_e500->gtlb_offset[0] = 0;
  	vcpu_e500->gtlb_offset[1] = KVM_E500_TLB0_SIZE;

-	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
+	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_priv,
  					       vcpu_e500->gtlb_params[0].entries);
  	if (!vcpu_e500->gtlb_priv[0])
  		goto free_vcpu;

-	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
+	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_priv,
  					       vcpu_e500->gtlb_params[1].entries);
  	if (!vcpu_e500->gtlb_priv[1])
  		goto free_vcpu;

---
Christophe

