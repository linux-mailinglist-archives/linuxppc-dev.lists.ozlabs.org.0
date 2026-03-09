Return-Path: <linuxppc-dev+bounces-17905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LQhDh3YrmlhJAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:24:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A851923A78A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 15:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTzm84Yycz3bnm;
	Tue, 10 Mar 2026 01:24:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773066264;
	cv=none; b=aemAitCUyp5YU0YKQJ1S6AydbKq3+R868UZbwuJ5NcbFLD3S43gfDQzAjWb9L1/WxR/+0cjiiDylobNBDhV06OdH6IS9IOvWETBxXA214TVk+NGHUOw4M33Skr0VQppLr/CDPIKXYuzBAyZfYGRD13cl4wmdeO3DF6IaeT89+1A+lSKAnr9olkVTVuIIE35AxQLtuul8JmGpZh3jhd0OYInq6aFr8odVr5Y2R2X/g9mODauVgk3XrTp1vrJ7PsVHxqkdsCNfThPIWmUUjxLHUGNYJfQ9NNOMLDTbJAbLl1TgS0Bs2MpOXpFBqQGc1+tMv4FJwXhU+YnyO8l+ek437Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773066264; c=relaxed/relaxed;
	bh=lc/UuwyaWO6KCnC3rL42cIerK3ZFsb1f2U0ZgQgyuoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hOKfNfqDn2skkWOHxsSIzGHO5ffA3LWDDmKUxTDW16KKuU8YhH24115mpbfzSxkfKe8zHn9AmY28MddPQkOGfj+HRdF5b3Vq95oO8WBIHK785TY4KwUubCADVRR+BhvmlMBPwdRvME3Uo3fe7Po1M+4CF0vJ74FR+DC/OwMsnTfADmezx6U+gQgR//eBH8GD7kwbR+3JzyaxPxGUUPOJ0WoZQvbgzSUxVwfyjCbK7NAjgjHyU0fYnhdZQ1xSO2gBnBpSVCG70DoMawN2fXSPx8ek+MtTDKttx8ZswSE43l0311YHaS0MEzAoUXfaw1S8LhPFTl1GkuI5eukKRNyMKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqXMVbWu; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UqXMVbWu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTzm739r3z2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 01:24:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CC8F40482;
	Mon,  9 Mar 2026 14:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23E4C4CEF7;
	Mon,  9 Mar 2026 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773066261;
	bh=oa4RRj1MEmah1cQS47aOJoe0nWsaTGjlqRdSOhg0FW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UqXMVbWuyO1mKN8QmPOeNP9hOTaqcAM60IFp9IDeplVsfMyDVjK+ypTiw204BDvc1
	 wrEQhKDpTA407OK+JUGl47yuBAcfWuonoe8eOqOmjYbebinWXYH/zPFmT8fwPM+pwg
	 orLj52+gU8HOgwSC4EbRNQgF62R03ZlXx00hKBm6gbdnx2YjUJrMKHDPsskFWB056P
	 9HZJtjXiyNllbvDDZRatOa62Aw9M3jx3oE3kxW2gy3zMdWzDaHDzxDHVVZOQTJB13D
	 n3QHiUfuN99wRtlghHyu4+JMhqAZJlidbitxIQtk86S0oFdf4vEpnXhx9rsez+lTMS
	 1zQ+DOrVQ/hjA==
Message-ID: <ef8732cc-ba6b-4577-a1c0-c99234e6aebe@kernel.org>
Date: Mon, 9 Mar 2026 15:24:15 +0100
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
Subject: Re: [PATCH v2 1/2] drivers/vfio_pci_core: Change PXD_ORDER check from
 switch case to if/else block
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linux-mm@kvack.org,
 kvm@vger.kernel.org, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>
References: <b155e19993ee1f5584c72050192eb468b31c5029.1773058761.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <b155e19993ee1f5584c72050192eb468b31c5029.1773058761.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A851923A78A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17905-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:alex@shazbot.org,m:peterx@redhat.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url]
X-Rspamd-Action: no action



Le 09/03/2026 à 13:38, Ritesh Harjani (IBM) a écrit :
> Architectures like PowerPC uses runtime defined values for
> PMD_ORDER/PUD_ORDER. This is because it can use either RADIX or HASH MMU
> at runtime using kernel cmdline. So the pXd_index_size is not known at
> compile time. Without this fix, when we add huge pfn support on powerpc
> in the next patch, vfio_pci_core driver compilation can fail with the
> following errors.
> 
>    CC [M]  drivers/vfio/vfio_main.o
>    CC [M]  drivers/vfio/group.o
>    CC [M]  drivers/vfio/container.o
>    CC [M]  drivers/vfio/virqfd.o
>    CC [M]  drivers/vfio/vfio_iommu_spapr_tce.o
>    CC [M]  drivers/vfio/pci/vfio_pci_core.o
>    CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
>    CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
>    CC [M]  drivers/vfio/pci/vfio_pci_config.o
>    CC [M]  drivers/vfio/pci/vfio_pci.o
>    AR      kernel/built-in.a
> ../drivers/vfio/pci/vfio_pci_core.c: In function ‘vfio_pci_vmf_insert_pfn’:
> ../drivers/vfio/pci/vfio_pci_core.c:1678:9: error: case label does not reduce to an integer constant
>   1678 |         case PMD_ORDER:
>        |         ^~~~
> ../drivers/vfio/pci/vfio_pci_core.c:1682:9: error: case label does not reduce to an integer constant
>   1682 |         case PUD_ORDER:
>        |         ^~~~
> make[6]: *** [../scripts/Makefile.build:289: drivers/vfio/pci/vfio_pci_core.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> make[5]: *** [../scripts/Makefile.build:546: drivers/vfio/pci] Error 2
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [../scripts/Makefile.build:546: drivers/vfio] Error 2
> make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2
> 
> Fixes: f9e54c3a2f5b7 ("vfio/pci: implement huge_fault support")
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
> v1 -> v2:
> 1. addressed review comments from Christophe [1]
> [1]: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinuxppc-dev%2F0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list%40gmail.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C2525bc52e4e645e2fb0208de7dd8d236%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639086567353080039%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=DZuZX3hss7yYqBwYz61VgEY6J%2F7OuLViaTMYP43VoBY%3D&reserved=0
> 
>   drivers/vfio/pci/vfio_pci_core.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index d43745fe4c84..0967307235b8 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1670,21 +1670,16 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
>   	if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
>   		return VM_FAULT_SIGBUS;
> 
> -	switch (order) {
> -	case 0:
> +	if (!order)
>   		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
> -#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> -	case PMD_ORDER:
> +
> +	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
>   		return vmf_insert_pfn_pmd(vmf, pfn, false);
> -#endif
> -#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> -	case PUD_ORDER:
> +
> +	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PUD_ORDER)
>   		return vmf_insert_pfn_pud(vmf, pfn, false);
> -		break;
> -#endif
> -	default:
> -		return VM_FAULT_FALLBACK;
> -	}
> +
> +	return VM_FAULT_FALLBACK;
>   }
>   EXPORT_SYMBOL_GPL(vfio_pci_vmf_insert_pfn);
> 
> --
> 2.39.5
> 


