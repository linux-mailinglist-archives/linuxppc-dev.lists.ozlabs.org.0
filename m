Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2D10EBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 23:49:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vX9R6t5RzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 07:49:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OcHYTYyM"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vX7x5bGFzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 07:48:13 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id l2so332045wrb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 May 2019 14:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ISxFsNQTTZgb94Y+nE3oZI+k8F70LS/7cW4W/9uLa7U=;
 b=OcHYTYyMKiyld7evqlH2vdeCYcF6+pxC+w2hlQ6NSntJcjs0NMlozgV+dTlEL/aDOq
 1avpIR9qmwl7frnX6lGtFw28I/4yE0YIOzJ2L2zKHB4j4UKA8bOT12WDD7veT4UF1ghp
 +FDT3woAmbc/CncNlT/fZrWHrjkAheIS48VwSyK1mKF0Jla4P72Sqc4A7V2PHfSvZviI
 GkV5J/y2jdeWoIqUqAYJuhUj2+c5LDYpWz/uhfgeEBjhbmYn1q9ukrlNyJ7PuB8Kbw9P
 kfNcfc4h5RVllMCyxoPCh+LNvl5FoW1nTCXRkMZ7m677AVsP1LY36az1L1ULuODoYZv/
 jCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ISxFsNQTTZgb94Y+nE3oZI+k8F70LS/7cW4W/9uLa7U=;
 b=DxUx81P9aO96PFU21uIM2IP9IeHmW9HvR3S7+YYzS6aQcwAuCIFWTERW5RaRLfbFbd
 dxZjAkydYuSmp2xZOy7hu7X4WWAsa/tY0J4Z4xvLCx81w2gLyjUY/WeCF7XTe0vMWk8u
 aEhA8oCjW1PbMPVD6R1n5GptfgX4pxXkW0Vu6KsRmjStbnzpXo5+4rl68tf9PZGX1dLF
 3SCVcwL0DyGh/y7q97caaH9yWeHu8C3zqwAuwROc6Dpkp7Xh8Q7nshsmgl1MAim+rt67
 YGHp9w9u0lcBVYtqrkcL3Vw4DJJ6AaFPNkO5V9qEnwpFdCTVliOsidz0uwkh78GUbIQg
 Rzqg==
X-Gm-Message-State: APjAAAXU4eX+uoaz2EqAOBZdBBT6s+xmJUETcBxCOEMX9jkpHxK8aMIQ
 fb0m+IsyF1+Vt9seJlSZ7ho=
X-Google-Smtp-Source: APXvYqzWng3pdPQ2BP2fhMvQnPtjtHCcqRh/94dsv2GLRx9Y0hUc1T0Qby9lY2ggvwI9sBUOqXKlVA==
X-Received: by 2002:adf:e6c6:: with SMTP id y6mr195674wrm.225.1556747289408;
 Wed, 01 May 2019 14:48:09 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id d16sm34471858wrs.68.2019.05.01.14.48.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 14:48:08 -0700 (PDT)
Date: Wed, 1 May 2019 23:48:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/5] x86: don't use asm-generic/ptrace.h
Message-ID: <20190501214805.GA54736@gmail.com>
References: <20190501173943.5688-1-hch@lst.de>
 <20190501173943.5688-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501173943.5688-5-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 Oleg Nesterov <oleg@redhat.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Christoph Hellwig <hch@lst.de> wrote:

> Doing the indirection through macros for the regs accessors just
> makes them harder to read, so implement the helpers directly.
> 
> Note that only the helpers actually used are implemented now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/include/asm/ptrace.h | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
> index 8a7fc0cca2d1..9b81ef539eb3 100644
> --- a/arch/x86/include/asm/ptrace.h
> +++ b/arch/x86/include/asm/ptrace.h
> @@ -98,7 +98,6 @@ struct cpuinfo_x86;
>  struct task_struct;
>  
>  extern unsigned long profile_pc(struct pt_regs *regs);
> -#define profile_pc profile_pc
>  
>  extern unsigned long
>  convert_ip_to_linear(struct task_struct *child, struct pt_regs *regs);
> @@ -175,11 +174,31 @@ static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
>  }
>  #endif
>  
> -#define GET_IP(regs) ((regs)->ip)
> -#define GET_FP(regs) ((regs)->bp)
> -#define GET_USP(regs) ((regs)->sp)
> +static inline unsigned long instruction_pointer(struct pt_regs *regs)
> +{
> +	return regs->ip;
> +}
> +static inline void instruction_pointer_set(struct pt_regs *regs,

Nit: missing newline between inline functions.

> +		unsigned long val)
> +{
> +	regs->ip = val;
> +}
> +
> +static inline unsigned long frame_pointer(struct pt_regs *regs)
> +{
> +	return regs->bp;
> +}
>  
> -#include <asm-generic/ptrace.h>
> +static inline unsigned long user_stack_pointer(struct pt_regs *regs)
> +{
> +	return regs->sp;
> +}
> +
> +static inline void user_stack_pointer_set(struct pt_regs *regs,
> +		unsigned long val)
> +{
> +	regs->sp = val;
> +}

Other than that:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
