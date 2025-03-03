Return-Path: <linuxppc-dev+bounces-6642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEEFA4C126
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 14:02:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5zW73S8hz30W1;
	Tue,  4 Mar 2025 00:02:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741006963;
	cv=none; b=eBwrBq3RQ9hDm83iv41TmOvB9WiQ/332TskSncQjvoKD+k0SRrrrqr4c6W+hkrsFQjSHPVZ4Z6Zgm2RVzmf/AqUmLH/gXuwrosZozJ1WktQhTwXHK8fLXBZZrOdCl3ciru7yR7I3akuFu0kdXTucfyXK6Ik0HQid82z0FE5KXqckEbWrueiMXTjost3RBGygS722kEkY9U0Fl+jdR23vOpGsu7MmANtP7iMqKc76KFCwIwLAddvhdUJitGVAd6h1BFXaQDLdQp1/dUtO2dZ4batIZRyMERRaN9GGViWwFUB3p6cmJ71jxT3fIwlEtcig/GKr331iwE2XXcjgELqRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741006963; c=relaxed/relaxed;
	bh=syPRgyzcLbI1E1e+XAzqIv2JCBRPJKWVrXk95/bw9YE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ck1XqN2AedhFXQiV9xVyWSulFwxDk5bN8/iyX4s1ysqNts/NOt2q59xohU3zMxdIGF3NBJ7TU8P/g5SHeAkVChuTu+YS4JXGOc5ojj6GqTutmrgGVXJnl0JkP0fawtJAaCy7ZNdTI+mAHTQILBrzELKrtgIuCLefTTJxwOkwXRZPoZnBmpFzzPSKHBwUo4oSbxP6n3AbPyzLoeIJNMb36FMALu/4Pm1tLmYageBMf9PXdiB+HPvCpvdJ5vI9uehORkcIXSdsrn6lWqX6+Ng+MC/iwxfwCvlvgOqxegHQRhY5GZKErn18TQGXSwXMqCTNI50CYpyX4Yv/0MqEqt7iwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lmvdKSWN; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lmvdKSWN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5zW637YBz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 00:02:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 014D85C4885;
	Mon,  3 Mar 2025 13:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA019C4CED6;
	Mon,  3 Mar 2025 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741006959;
	bh=Rttuow8++NuWyNjF28v9lZH82K2Lnoue4IUNHvULm1c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lmvdKSWNkNgzcO9NRIqdBXmBa/SbzR8bYTRkR6yMUkkWSDBtJDmFTT4PtJ/GduvRS
	 qAeA4RKsgW8DXhVE0lwdyR7qiyxRNqV1CvFpyoCrPQD7e6tDkpOqVvgP7P4t1vZMFM
	 x5YNsabMHp7S7BI4TUghd+9tbLAHcPlzmUIqCtpSG0u+iPTMWxefhBipSoZ57aLQ4J
	 /qNVSTRn0pwl3L7Ch+XT5hq0QyIzV+oq4jrp7YnefCRn3Uo1XiVDemVcDFIde+yhWQ
	 67iMR9QoY2Y7gWyh4LJ1gEIx2Nm3GI0yVEQcMrcUfRzr5TDr39HcGu02QEkV85tjlF
	 m1vIlheIsMzag==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH] book3s64/radix : Align section vmemmap start address to
 PAGE_SIZE
In-Reply-To: <20250226043426.224494-1-donettom@linux.ibm.com>
References: <20250226043426.224494-1-donettom@linux.ibm.com>
Date: Mon, 03 Mar 2025 18:32:35 +0530
Message-ID: <yq5aeczexo5w.fsf@kernel.org>
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
Content-Type: text/plain
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Donet Tom <donettom@linux.ibm.com> writes:

> A vmemmap altmap is a device-provided region used to provide
> backing storage for struct pages. For each namespace, the altmap
> should belong to that same namespace. If the namespaces are
> created unaligned, there is a chance that the section vmemmap
> start address could also be unaligned. If the section vmemmap
> start address is unaligned, the altmap page allocated from the
> current namespace might be used by the previous namespace also.
> During the free operation, since the altmap is shared between two
> namespaces, the previous namespace may detect that the page does
> not belong to its altmap and incorrectly assume that the page is a
> normal page. It then attempts to free the normal page, which leads
> to a kernel crash.
>
> In this patch, we are aligning the section vmemmap start address
> to PAGE_SIZE. After alignment, the start address will not be
> part of the current namespace, and a normal page will be allocated
> for the vmemmap mapping of the current section. For the remaining
> sections, altmaps will be allocated. During the free operation,
> the normal page will be correctly freed.
>
> Without this patch
> ==================
> NS1 start               NS2 start
>  _________________________________________________________
> |         NS1               |            NS2              |
>  ---------------------------------------------------------
> | Altmap| Altmap | .....|Altmap| Altmap | ...........
> |  NS1  |  NS1   |      | NS2  |  NS2   |
>

                            ^^^ this should be allocated in ram?


>
> In the above scenario, NS1 and NS2 are two namespaces. The vmemmap
> for NS1 comes from Altmap NS1, which belongs to NS1, and the
> vmemmap for NS2 comes from Altmap NS2, which belongs to NS2.
>
> The vmemmap start for NS2 is not aligned, so Altmap NS2 is shared
> by both NS1 and NS2. During the free operation in NS1, Altmap NS2
> is not part of NS1's altmap, causing it to attempt to free an
> invalid page.
>
> With this patch
> ===============
> NS1 start               NS2 start
>  _________________________________________________________
> |         NS1               |            NS2              |
>  ---------------------------------------------------------
> | Altmap| Altmap | .....| Normal | Altmap | Altmap |.......
> |  NS1  |  NS1   |      |  Page  |  NS2   |  NS2   |
>
> If the vmemmap start for NS2 is not aligned then we are allocating
> a normal page. NS1 and NS2 vmemmap will be freed correctly.
>
> Fixes: 368a0590d954("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
> Co-developed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 311e2112d782..b22d5f6147d2 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1120,6 +1120,8 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>  	pmd_t *pmd;
>  	pte_t *pte;
>  
> +	start = ALIGN_DOWN(start, PAGE_SIZE);
> +
>  	for (addr = start; addr < end; addr = next) {
>  		next = pmd_addr_end(addr, end);
>  
> -- 
> 2.43.5

