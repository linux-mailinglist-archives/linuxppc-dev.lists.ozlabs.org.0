Return-Path: <linuxppc-dev+bounces-17079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBtAA3fXnGkJLAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 23:40:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36917E7A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 23:40:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKbRQ37HTz3c5c;
	Tue, 24 Feb 2026 09:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771886450;
	cv=none; b=lDYoLMh0aslCtMdz2N8qVznaadf1wAPdO5Wmc1gK2Tbqi81NUi8Gb5wh/kjB5xJ4ZHgHwtAHdGFPtbG/7QRYYqEIPHliIxJlpPxogvGOXhQWka7UCf5dxjZ8sEZFto6gSqCYwy0r/Rupye/OfXkiSa91uhXWTxLvZoTWMZU9eCPxyedkAyB3VG3jHNVb53feOkETHXT8oBMAY/BGM2mP5P33XQISoLXJArpJdMfC43EETQqDVHk9ejXyL0PlG6QlpQqOj077Wsdkk2f+vw3Nx4FOKnKPd5xIF4pyYiMXWRAixXEdqd5L22SiXLzA53lspk4/h1O/mhTAgfrMmvR4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771886450; c=relaxed/relaxed;
	bh=YNXrGZPA5YjeEHL/sfW4z6PLx/zCO+JxSUqaDNph08g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvDHtEEfR9mVuFXRtq1BJBUxoeNNViEowOPTx6SBL0zSRfbqYSTgSEDtG6MB0nK2uwLWnphSa7GJfQ8B385TGg/eKFpCGueyfX81Z6WlhVKRDJr+0dcJtXlkRXKfuIVGTmY24Qcjxs18cqNCPen81Gs+rwgrGSkUnueig1dw2jUtUoNI7EhiITUxOLPHjuGh0WgpzNenIVICNaHq8LA0SMdRfD3+vYpqtB7lzLvFccRpGDWTExRylTcCOmM9LFa8iLeYutLPvQ8T/jxYKuBU5lCS8vHV7jm+E6ohjnb7O+H3iitHaAV3E92WDXCId9PDD1QFrAW1YyZPeiqrvUSKqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwPG7+Gk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PwPG7+Gk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKbRP33C1z3c2R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 09:40:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5301943923;
	Mon, 23 Feb 2026 22:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C83C116C6;
	Mon, 23 Feb 2026 22:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771886447;
	bh=v7dIF2sR1xPyXX+s2jRIq/YG6FuN2xu9iYCVRyamKdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwPG7+GkGkSw8rYPwPMXLNmY8oBL8RYAkaERFbzBVu/vF2fRQsytzKus952Y/h731
	 H10SMYgGmZr8EPlahIk5q+ZjoenOAlXZWrUTyOywGVRQTHlFpcdRIKL+b4RC+9aQtp
	 J4LDIFSVYkH6HzAqZD91b0+bykpjrKzZfNagr4IbqfPMLYaYMhUFtpWKo7kPEmdsQc
	 wuMKsHhq2lNZAtPAnyAWpPDgpnghqtjUFKsZH3UwClmHURsehwNcdzsTogMyGLLe2z
	 uKWsPael+mKMfBeZf9GezpvtCGTdOeBKsavntMahSc5SqYZqMT6ZTV3Ymh8Q2da5zI
	 p0rPRSEJsyztQ==
Date: Mon, 23 Feb 2026 14:40:46 -0800
From: Kees Cook <kees@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	"kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
	mad skateman <madskateman@gmail.com>,
	Christian Zigotzky <info@xenosoft.de>
Subject: Re: [Linux PPC] 7.0-rc1: e500_mmu.c:923:26: error: assignment to
 'struct tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *'
Message-ID: <202602231439.FFDA50B@keescook>
References: <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
 <d0342f0e-633f-4299-966a-27e4c0050da3@linux.ibm.com>
 <2cbd1e19-ac99-29c3-ab89-3c58a9863e5a@xenosoft.de>
 <2d2d4735-04e0-46a0-93c6-654507fe2ae1@kernel.org>
 <2536c3e7-18d2-47cb-88c6-36f94c61c1c6@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2536c3e7-18d2-47cb-88c6-36f94c61c1c6@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17079-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kees@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xenosoft.de,linux.ibm.com,lists.ozlabs.org,vger.kernel.org,xtra.co.nz,yahoo.com.au,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1D36917E7A5
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:38:29PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 23/02/2026 à 19:07, Christophe Leroy (CS GROUP) a écrit :
> > +Kees
> > 
> > Hello,
> > 
> > Le 23/02/2026 à 17:48, Christian Zigotzky a écrit :
> > > Hello,
> > > 
> > > Compiling issue for e5500 machines for the RC1 of kernel 7.0:
> > > 
> > > arch/powerpc/kvm/e500_mmu.c: In function 'kvmppc_e500_tlb_init':
> > > arch/powerpc/kvm/e500_mmu.c:923:26: error: assignment to 'struct
> > > tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [-
> > > Werror=incompatible-pointer-types]
> > >    923 |  vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
> > >        |                          ^
> > > arch/powerpc/kvm/e500_mmu.c:928:26: error: assignment to 'struct
> > > tlbe_priv *' from incompatible pointer type 'struct tlbe_ref *' [-
> > > Werror=incompatible-pointer-types]
> > >    928 |  vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
> > > 
> > > Temporary solution: # CONFIG_VIRTUALIZATION is not set
> > > 
> > > Please solve this issue.
> > > 
> > 
> > Must be one of:
> > 
> > 189f164e573e Convert remaining multi-line kmalloc_obj/flex GFP_KERNEL uses
> > bf4afc53b77a Convert 'alloc_obj' family to use the new default
> > GFP_KERNEL argument
> > 69050f8d6d07 treewide: Replace kmalloc with kmalloc_obj for non-scalar
> > types
> > 
> 
> Can you try following change:
> 
> diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
> index 48580c85f23b..75ed1496ead5 100644
> --- a/arch/powerpc/kvm/e500_mmu.c
> +++ b/arch/powerpc/kvm/e500_mmu.c
> @@ -920,12 +920,12 @@ int kvmppc_e500_tlb_init(struct kvmppc_vcpu_e500
> *vcpu_e500)
>  	vcpu_e500->gtlb_offset[0] = 0;
>  	vcpu_e500->gtlb_offset[1] = KVM_E500_TLB0_SIZE;
> 
> -	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_ref,
> +	vcpu_e500->gtlb_priv[0] = kzalloc_objs(struct tlbe_priv,
>  					       vcpu_e500->gtlb_params[0].entries);
>  	if (!vcpu_e500->gtlb_priv[0])
>  		goto free_vcpu;
> 
> -	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_ref,
> +	vcpu_e500->gtlb_priv[1] = kzalloc_objs(struct tlbe_priv,
>  					       vcpu_e500->gtlb_params[1].entries);
>  	if (!vcpu_e500->gtlb_priv[1])
>  		goto free_vcpu;

That looks like the correct fix to me. The old type was the correct size,
but was just the wrong type. Sorry I missed it when doing my tree-wide
multi-arch builds! What build target (or Kconfig) was needed to reach
this code?

Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
Reviewed-by: Kees Cook <kees@kernel.org>

Thanks!

-- 
Kees Cook

