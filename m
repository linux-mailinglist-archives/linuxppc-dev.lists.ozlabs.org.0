Return-Path: <linuxppc-dev+bounces-545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585695F863
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 19:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsyhG0hdjz2yHj;
	Tue, 27 Aug 2024 03:43:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724694206;
	cv=none; b=mexQ9IqtraFpbvpeg8IWtlB21oBTuQKVyHWqAET1/AWFLuE2UW+2ZYoARWmC03lGJn3VDWpVwU93A6pt6MlzOxK2qVihwNgDlg7IiJLoV7OdVlaFYFVoo14haiZ07VAqYMHiJNC6tG0PNb1EAqOC1alI1G40OWAnRlHamdHbTOxuVRfoZFEzNBFntApPaUbTcuboaRWf95NTTn9OUrBFFR23ttpblhCpRmHlEquvrchnHLgC41FnKI1vSzHrMBaOWUA13KFx11BeAFXHuQEX8BBUmzTqiujYWEyv7RFq03xbfKHGarnn6RFrLVtP5UkL45ZcEPL+3jL1atnMCH5lBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724694206; c=relaxed/relaxed;
	bh=2cYcPfsQvYrWOYRNotFV80V7OqznzMTPLh51ZxZLp6I=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=F6nmuwN6b+vNBo6MNaAlxAPsIiaDkq7EstCtyRAPNLv0F/l3kGDD60Xkgr72wbj62+gAEwiDL0M4ulfNeqs5hxOOBruPK1UkzmoyMFWFFbgHCQZydle5oa5sDIgm1m5hyJQKwXYcFimWjRVpj26A5NaPhtydTHGgR4+Pa5kkxYg7RufB5QgMigRt1B5pOgBq0lTS1KLgtYX/GP0QE6FhaH6NldHmbuR+EtgAaAOxgccomjdd/p40dPxpMu6zWbHZnCDP8kmJWogcDEMiEIoZ6IJx/6r5OY2atEUTWhsrMSCEUKl67n6gKNd439GhsPqLrYDggW+Th5GZbOtZqMK9ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsyhF5Lfzz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 03:43:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wsyh94Vn5z9sPd;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHAjDb9YYVls; Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wsyh93Lnbz9rvV;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D7778B77B;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mU-Q-zwNOehp; Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from [192.168.233.119] (unknown [192.168.233.119])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D456C8B763;
	Mon, 26 Aug 2024 19:43:20 +0200 (CEST)
Message-ID: <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
Date: Mon, 26 Aug 2024 19:43:20 +0200
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
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, djwong@kernel.org,
 ritesh.list@gmail.com, linuxppc-dev@lists.ozlabs.org
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240826154818.hzqnvofdmaxvuwrh@quentin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> pseries_le_defconfig) produced this warning:
> 
> iomap dio calls set_memory_ro() on the page that is used for sub block
> zeroing.
> 
> But looking at powerpc code, they don't support set_memory_ro() for
> memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> 
> /*
>   * On hash, the linear mapping is not in the Linux page table so
>   * apply_to_existing_page_range() will have no effect. If in the future
>   * the set_memory_* functions are used on the linear map this will need
>   * to be updated.
>   */
> if (!radix_enabled()) {
>          int region = get_region_id(addr);
> 
>          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>                  return -EINVAL;
> }
> 
> We call set_memory_ro() on the zero page as a extra security measure.
> I don't know much about powerpc, but looking at the comment, is it just
> adding the following to support it in powerpc:
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index ac22bf28086fa..e6e0b40ba6db4 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>          if (!radix_enabled()) {
>                  int region = get_region_id(addr);
>   
> -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> +                                region != IO_REGION_ID &&
> +                                region != LINEAR_MAP_REGION_ID))
>                          return -EINVAL;
>          }
>   #endif

By doing this you will just hide the fact that it didn't work.

See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") 
for details. The linear memory region is not mapped using page tables so 
set_memory_ro() will have no effect on it.

You can either use vmalloc'ed pages, or do a const static allocation at 
buildtime so that it will be allocated in the kernel static rodata area.

By the way, your code should check the value returned by 
set_memory_ro(), there is some work in progress to make it mandatory, 
see https://github.com/KSPP/linux/issues/7

Christophe

> 
>   If it involves changing more things and this feature will be added to
>   powerpc in the future, we could drop the set_memory_ro() call from
>   iomap.
> 
>   CC: Darrick(as he suggested set_memory_ro() on zero page), Leroy,
>   Ritesh, ppc list
> 

