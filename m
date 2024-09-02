Return-Path: <linuxppc-dev+bounces-896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE89968EF0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 22:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyLVJ1HVpz2xdr;
	Tue,  3 Sep 2024 06:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725310200;
	cv=none; b=Fy11bvrt+ltICyc+7Y40x1gHrb5du+fH1gE9B1FB9pnMeJ6Y016ho8MfZTNBy1eZgJzlplMltcUhIyEtsZr4De1hIJp7MvFGsvnG/UX2NvCquzQI/JTIi+NcATwUgJ/vpGtI4bmp2Tq0rDm6tVt0vT41FT++iy7TXTOjLsX36cpFqsfQ0VDnq4j/zDaOOCIceVwqYbOa/DXG0suStPWpuACduWreGyaiplcuaZD+1v/RR9EwZOpuHuH5Hp8xiXSAqAFROMLAHkk4YOgNiRiPsSafF5sfbPYzDXT+D/0GCEBFvgWLBVC3uY4uc3FQW9HvfnscfIw6D61UaiE3eeYBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725310200; c=relaxed/relaxed;
	bh=f9HqqG/S8gNFNXekuYP+0WbktJCC4EyB/r2MZNL9JoE=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:In-Reply-To:
	 References:Mime-Version:Content-Type; b=bADbO+put46tYatnz+bi0TUluTqnalnJw4ZlMaeBDQ5gd21idnKY03E6MFDSyfF63GaRQNwOHfKC/lIEHp9a6oRXUZhl9AuwBByWCtgvby/PrWtoExH9YraMuDTMOA6JX+kFz4NzaUH/mt0aiq/Nqx3uIwlQHU7K7uKJydZ9pKJ8Qc4D8HrgztryIP1mh1TgmWIqYf2kxHeOyWlPefH3Gv+e9JAiB9mz03w/m0DDoKTXzzBI+ldMRfADG5vGCNu3OlWXAl9zxMjF4jVYO78r4CxbWRS/t3r2f13iKLcFg2AVyrTDgf09h6RgpLqmhYEKH8bxuLy56xJS9nuQG7Xypg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gHiMeoWa; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gHiMeoWa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyLVH5fYBz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 06:49:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32465A400C5;
	Mon,  2 Sep 2024 20:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69389C4CEC2;
	Mon,  2 Sep 2024 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1725310195;
	bh=plMpypI6Wercf2AMqEeD8hJy/zS1sMK2nF2Og4ULyOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gHiMeoWa0lzT85g1imdgbajsEHzGCaCYUlk/ONYUe6Zp7GrwM6LszSffkEbLgdXRr
	 dHZltfJQaFh2HH5t9EAQ3UnL3Ixs52lRSxs09kbyRMkq2VD1ynpM5lHjNHH+VRSQRI
	 VYoQuFvj+E/HihP+bWCJ+ELFTH2RSC3ESwGcFY+o=
Date: Mon, 2 Sep 2024 13:49:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 torvalds@linux-foundation.org, christophe.leroy@csgroup.eu,
 jeffxu@google.com, Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com,
 linux-um@lists.infradead.org, linux-s390@vger.kernel.org, Ravi Bangoria
 <ravi.bangoria@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
Message-Id: <20240902134953.e834bc2e57d36b1d3b1397e4@linux-foundation.org>
In-Reply-To: <yt9dy149vprr.fsf@linux.ibm.com>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
	<20240819185253.GA2333884@thelio-3990X>
	<yt9dy149vprr.fsf@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 02 Sep 2024 21:06:48 +0200 Sven Schnelle <svens@linux.ibm.com> wrote:

> So uprobe_clear_state() in the beginning free's the memory area
> containing the vm_special_mapping data, but exit_mmap() uses this
> address later via vma->vm_private_data (which was set in _install_special_mapping().
> 
> The following change fixes this for me, but i'm not sure about any side
> effects:
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index df8e4575ff01..cfcabba36c93 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1340,11 +1340,11 @@ static inline void __mmput(struct mm_struct *mm)
>  {
>         VM_BUG_ON(atomic_read(&mm->mm_users));
>  
> -       uprobe_clear_state(mm);
>         exit_aio(mm);
>         ksm_exit(mm);
>         khugepaged_exit(mm); /* must run before exit_mmap */
>         exit_mmap(mm);
> +       uprobe_clear_state(mm);
>         mm_put_huge_zero_folio(mm);
>         set_mm_exe_file(mm, NULL);
>         if (!list_empty(&mm->mmlist)) {

uprobe_clear_state() is a pretty simple low-level thing.  Side-effects
seem unlikely?  

