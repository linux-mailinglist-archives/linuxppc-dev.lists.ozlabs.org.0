Return-Path: <linuxppc-dev+bounces-5227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 602ECA10692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 13:24:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSws0rSFz30K6;
	Tue, 14 Jan 2025 23:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736857453;
	cv=none; b=VeDPBgjFPGw72xegOwl3A4v5arCG5EQt9nOqPKzbgWujrhbA27hpPaYclOmlwNZc84+ddD+k+3EtbzGP6t+8IqyXuIJAXwTcwafgRD4shJH1nFgfBio6JCSHx6+B+asu5H4T3Wd3jxA8AIuHwjzR9dz5yJpb4w+gQPn8gtmoWWABciD0F14I9MhAnBxCxc8KehJj129CQz26aPst3VgCEyTXZ54Wthn/fb+8W88Xv4DyRs4bONhT3fulrejfFrn9taEA29zf318FjX6jQeuC+5O4/fMI82of6AY6iMDogNMFZzsoX9vIhtIjaCNrThErk1cmARkRWG73DzkBoAW2DA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736857453; c=relaxed/relaxed;
	bh=QgRj0BYJSuOYyejBeg4xTNx/mVIDbkxJCUcL08dHvZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afzTLHV75CP8aE75LbzXMlIwmhAKPGIBqx86mBMbpM9fYofINtzTN8DPi6yTB06qlxO79wekH0D/Xr4B1ejP9zuoxlwWwPVHEiSGx1cMfsXqhGfDorDx+CvWn2hGEESYRPUv28Uk/q8TcKcN4CVt4vIhubfc4ioBSonZiuyxlpzcBEZqe+j5sH5nCQ+UNfEi1T63shF0o3hMrHEN+LAd87wjAev9Y5syFg6kLsdVFj7VARbGJUKKKtRgiJRjZYQPgRjTMlJHA86BXr3d9Qr8Hx0aoweeMUtC9k0HJ+7cmoA+cuUwEvA87rBFpt86G/kn5YLNfkP9NEb1Hz+YQ3EhHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSwr22Dtz30HP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:24:12 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66F412FC;
	Tue, 14 Jan 2025 04:24:09 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 257BF3F66E;
	Tue, 14 Jan 2025 04:23:39 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:36 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, binutils@sourceware.org,
	devel@daynix.com
Subject: Re: [PATCH v4 6/6] crash: Remove KEXEC_CORE_NOTE_NAME
Message-ID: <Z4ZXSGk2XpE4H6lQ@e133380.arm.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
 <20250111-elf-v4-6-b3841fa0dcd9@daynix.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111-elf-v4-6-b3841fa0dcd9@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sat, Jan 11, 2025 at 02:48:49PM +0900, Akihiko Odaki wrote:
> KEXEC_CORE_NOTE_NAME is no longer used.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

> ---
>  include/linux/kexec.h       | 2 --
>  include/linux/vmcore_info.h | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index f0e9f8eda7a3..c840431eadda 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -68,8 +68,6 @@ extern note_buf_t __percpu *crash_notes;
>  #define KEXEC_CRASH_MEM_ALIGN PAGE_SIZE
>  #endif
>  
> -#define KEXEC_CORE_NOTE_NAME	CRASH_CORE_NOTE_NAME
> -
>  /*
>   * This structure is used to hold the arguments that are used when loading
>   * kernel binaries.
> diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
> index 1672801fd98c..37e003ae5262 100644
> --- a/include/linux/vmcore_info.h
> +++ b/include/linux/vmcore_info.h
> @@ -6,7 +6,6 @@
>  #include <linux/elfcore.h>
>  #include <linux/elf.h>
>  
> -#define CRASH_CORE_NOTE_NAME	   "CORE"
>  #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
>  #define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
>  #define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)
> 
> -- 
> 2.47.1
> 
> 

