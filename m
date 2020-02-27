Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96E171100
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:29:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SjSW70LrzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SjQm4Zx8zDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:28:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MmiI8e7l; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48SjQm3tghz8tB4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:28:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48SjQm3bMxz9sRY; Thu, 27 Feb 2020 17:28:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MmiI8e7l; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48SjQm2xKBz9sRQ
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Feb 2020 17:27:57 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 2so1064087pfg.12
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Feb 2020 22:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lJ9OhdBDoaYP7NmGYni1MIamaMXtF7ppiTu42VVQ9lk=;
 b=MmiI8e7lHH3KiPg5DaglytboqlM6aKXUCgakty4rPp4+GyR+QcN0pg3LuKOq+eEaiA
 R/lKZ0P0NJvwUBEXGEp6NV7/7rq3P8f28hfq8t1pVvS4A9JN/4LhDigW6GnfBmJim1jA
 et8jybF3fJKtCiCAveISx9VhdZMNc3Z3Z0Xng50XmLM1/NKeA0cnRcPxkF1a9EKBCO6m
 g/9LrfdWGIfCrQcC4++YPL3V+fZalh65TV8zuKjgCN+d4+UXpX06hvYpaDcbsy2xyzgd
 32DxVTCC5DGbqrGgytFDEJpq0TqHitTHb4OoI2y3Qihl8UZZwcdr4KpSI8tBCCbGkf8u
 rcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lJ9OhdBDoaYP7NmGYni1MIamaMXtF7ppiTu42VVQ9lk=;
 b=jcKfdOtnTwxDVMEMe9LrwwbCH1SYgasz+u1pSMxSoVyjfy5Tx+3WAJ2wo4STsea3Cu
 l/Hu4eynuNzBs9IJMnRnqWpDcKcEszyaYe3Okh0irCrdzKA67qod7CVG0D5okZ8LbgnB
 shb/yBFtg7mS6LSnoV2+j3nnvW4kAJVEPIfiBeIL7IVvGpHtPSMSyKcuQSG/OiLyGq+f
 KbcV1DNCwc5z1l4x1WlPE9GEqYQXqll6H+sR2J53ZxuNp2NObz2uBas2U/6n7I1QmI+3
 5VQKn5H3AZ2ElooYvIZ9yB1iHSYHSO7kjW8iXsIHDZda41GVCxkq2P2qMVvjtdNgPwZE
 XlVw==
X-Gm-Message-State: APjAAAXPy4M5yzrPMyCxYPVnbI7sWv591/i45YQfsTNGWfgYUq4i34ks
 NDSEsr2cPxCBJ3/8NZJHEJI=
X-Google-Smtp-Source: APXvYqzx0bpiP9vT0lsZbi1IsY3qpa1JQHvo9rJ/2RFKH68IynGsCqW2vI/VkTm/dMhjqPpixIC/oQ==
X-Received: by 2002:a62:e414:: with SMTP id r20mr2541686pfh.154.1582784874802; 
 Wed, 26 Feb 2020 22:27:54 -0800 (PST)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:f0f9:e27c:1d26:4e5e])
 by smtp.gmail.com with ESMTPSA id f3sm4612610pga.38.2020.02.26.22.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 22:27:54 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id 64C66806B5; Thu, 27 Feb 2020 16:57:50 +1030 (ACDT)
Date: Thu, 27 Feb 2020 16:57:50 +1030
From: Alan Modra <amodra@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/2] powerpc/vmlinux.lds: Discard .interp section
Message-ID: <20200227062750.GD32593@bubble.grove.modra.org>
References: <20200227045933.22967-1-mpe@ellerman.id.au>
 <20200227045933.22967-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227045933.22967-2-mpe@ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 03:59:33PM +1100, Michael Ellerman wrote:
> The .interp section specifies which "interpreter", ie. dynamic loader,
> the kernel requests. But that doesn't make any sense, the kernel is
> not a regular binary that is run with an interpreter.
> 
> The content seems to be some default value, this file doesn't even
> exist on my system:
>   00000000  2f 75 73 72 2f 6c 69 62  2f 6c 64 2e 73 6f 2e 31  |/usr/lib/ld.so.1|
> 
> So the section serves no useful purpose and consumes a small amount of
> space.
> 
> Also Alan Modra says we "likely could discard" it, so do so.

Yes, but you ought to check with the mimimum required binutils.  It is
quite possible that an older linker will blow up.

If the minimum required binutils is at least binutils-2.26 then
passing --no-dynamic-linker to ld is a more elegant solution.

> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 31a0f201fb6f..619ffbaf72ad 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -257,7 +257,6 @@ SECTIONS
>  	}
>  	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
>  	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
> -	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
>  	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
>  	{
>  		__rela_dyn_start = .;
> @@ -370,5 +369,6 @@ SECTIONS
>  		*(.gnu.version*)
>  		*(.gnu.attributes)
>  		*(.eh_frame)
> +		*(.interp)
>  	}
>  }
> -- 
> 2.21.1

-- 
Alan Modra
Australia Development Lab, IBM
