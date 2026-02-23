Return-Path: <linuxppc-dev+bounces-17066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Fn9C16XnGluJgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 19:07:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E317B3FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 19:07:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKTMt3zwFz30FD;
	Tue, 24 Feb 2026 05:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771870042;
	cv=none; b=kG/qdEohk3kkgVzhyDjKjKFH7ezReJEX6p0li6zrI9DpCkjFkLPdthopn58Wkqrkw+tYBSB0mJuGFByTDcb0BwkTL+PjbN1pF2kt/8JmpIyBqdUNqaJB/LT9LeKnxrF4hmxLYsqEwQX2bLRhOcv6VBf5jgiIRNgPsR5wSPrU4m3gH+ijcIVhqOA3GO0GLziyikz+JiAlumXN/LoZ/RxX5uNmpeiQ6y+Vse0QvswqVu0vqkUhT0EpspZrgRdudKxr1Pz1b+u/5An2FLBLvFIIZ6VxYdMaLH5FAghe6OBGpa6p9WrseNnihuoU3V2L3IWQ61OOtULsr6LG6RkouG10qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771870042; c=relaxed/relaxed;
	bh=cKhwZspfsE/3g/tm0mJhs7GtmYyADwH/u//g1GlMmHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GM1hxi101NQucrhSu5IFg19KniIzmCt88pds2ohQmZS+spbWd0z+r5K/0XbisIkxPZzuOUSyMCjHp1uskX/uNE+GouxMzCLrwc3+QHGsOiHdOwv02xJKlqClvxZ1MsbiTD7dWyH+bAuD585ACs0s6PMboqzf3ajMhrM44Wk7HCtg1kYhBYjcWZ2xG6uG7lTRiqhiujvc//xjUYdF3bEaQYegs2tymdMnPrH2Ed9VwpHehdcTCRuRwnHfaF5b0S9HZo/Y8TZ8S8I6msQQuceKV/4fh5FlNxclCDnjp7RS6ckaxqRdY60vJn9bwM4MmHEVRSohX/4Z8y8UMB9CuYzqYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1996cvn; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I1996cvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKTMs5j4Xz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 05:07:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C75D42E29;
	Mon, 23 Feb 2026 18:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F87C116C6;
	Mon, 23 Feb 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771870039;
	bh=Y8ZggOhtjPfvhM5u5tb3z2THwQZjWLowbM/mTYhyYgg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1996cvnOLOogO+BCDKPS6Vw/54cFUBqB5PotupkijNqwI3xl31gXreUC+Z7tawh6
	 NuFTJZjBOgzpPTUtiZcenj3ZDXB6d4lbt6xc61KZ3gDTXNvepvIqOa/9mCdAZiJzhZ
	 54+OaZ1KWBAWRMBpjeJsUVWxUWDPGGPm5n1122GYj17ZdfzBAX6LoLoHv90iMyEdnb
	 hRsPiQPde018db3OLTMWW4LeX9GIcXSx8PxR3dDN2y+rqRucjr9MCcZByvTDNEJ7Mo
	 XunG4Eka7AnGYXB/oon8sGG7aXEO/ttZliPlzD95wMI850ZNykI0YtULPqCiTLjy5n
	 5sB8Dw8Z/2iKg==
Message-ID: <2d2d4735-04e0-46a0-93c6-654507fe2ae1@kernel.org>
Date: Mon, 23 Feb 2026 19:07:14 +0100
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <2cbd1e19-ac99-29c3-ab89-3c58a9863e5a@xenosoft.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17066-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:keescook@chromium.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 321E317B3FD
X-Rspamd-Action: no action

+Kees

Hello,

Le 23/02/2026 à 17:48, Christian Zigotzky a écrit :
> Hello,
> 
> Compiling issue for e5500 machines for the RC1 of kernel 7.0:
> 
> arch/powerpc/kvm/e500_mmu.c: In function 'kvmppc_e500_tlb_init':
> arch/powerpc/kvm/e500_mmu.c:923:26: error: assignment to 'struct 
> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [- 
> Werror=incompatible-pointer-types]
>    923 |  vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
>        |                          ^
> arch/powerpc/kvm/e500_mmu.c:928:26: error: assignment to 'struct 
> tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [- 
> Werror=incompatible-pointer-types]
>    928 |  vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
> 
> Temporary solution: # CONFIG_VIRTUALIZATION is not set
> 
> Please solve this issue.
> 

Must be one of:

189f164e573e Convert remaining multi-line kmalloc_obj/flex GFP_KERNEL uses
bf4afc53b77a Convert 'alloc_obj' family to use the new default 
GFP_KERNEL argument
69050f8d6d07 treewide: Replace kmalloc with kmalloc_obj for non-scalar types


Christophe

