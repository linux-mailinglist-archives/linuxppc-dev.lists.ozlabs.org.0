Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C701710E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:23:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SjKY5CjXzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SjHq14t6zDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M3oEQPLw; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48SjHp3J3yz8t9r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:21:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48SjHp2yF2z9sRY; Thu, 27 Feb 2020 17:21:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=M3oEQPLw; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48SjHn6gLzz9sRQ
 for <linuxppc-dev@ozlabs.org>; Thu, 27 Feb 2020 17:21:55 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id q39so725348pjc.0
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Feb 2020 22:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AytcpjMa4szE6v18w8tuGsQdIawtb/PmspCSGkIEa8k=;
 b=M3oEQPLwVYC9z5W/7CpzLHgmRFZjud69z192rFEwtEYf3zs3BtCwcj2+8IEfN8o89l
 L5CJ7HiyTcJkC+dfXeDHkdOj145yYjNWnxl9lON/F1YIDaqD6GxclpknnNss4YP3T3cJ
 TCOKKc8VbevkuqQ7o2gtIoQ1/1N7MRZBIW2sdfrgComczDP4M/zW/Fi15HwpF7LG7lQX
 u+5fDpFFjxgGpFemX/+4odPdbf/mfMF87Ky8lG8TI6hMtXl3WXvC+WQ6WcGVbki0BkoH
 tlsFJZ93orGA6tf/3B0yGHec9/ZW0xFALrsyQHp0a+l8nR/HFCFl7UdxQH2QOZWEY+9w
 v6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AytcpjMa4szE6v18w8tuGsQdIawtb/PmspCSGkIEa8k=;
 b=FTlYzfl6gN7ulI1wgf9iu+uQVyu80sZtSwbiXV6cvimnG3KwmUwPsxJ9i8ZdbVCaiq
 Yj5I1l20bNTyzzfow8RaaN/4H/oqOBUPIPeeBBxqjncO6y9a4l91sTlKNyk4jFg7jWfW
 ytg3XSadPpl/zECbCcdyiHq/FzyzF4xdGyU10JOwKHLgF4MPSZQ5gMwo8zQnB/6ueuej
 7hqKte1RC4hyPsfJJms3L7S2p3+dRmXtvpYLZQQlokQtjl27LI/BlyrI+sN/JvY7o3o/
 OX2YJV84808uSWrJNkq+ysqhHg/VydAdwl+zYhorodaPsf1WXDNSdlQExFUCC8JDOHHX
 Leyg==
X-Gm-Message-State: APjAAAVGqUjkDzeIHe4AWWPPiZzBuSOgnM/XOjmOWGbLojruS67maRfT
 TEzYCTSig4PNeUiDZ261HPw=
X-Google-Smtp-Source: APXvYqz2K8s+0iXB4KmoSOB9Ckb1Def0kTgBqqYQSspX1QXYIk1wqCgh0n+vxsZq1wf/yacSUniS5A==
X-Received: by 2002:a17:902:9a08:: with SMTP id
 v8mr2848183plp.251.1582784512558; 
 Wed, 26 Feb 2020 22:21:52 -0800 (PST)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:f0f9:e27c:1d26:4e5e])
 by smtp.gmail.com with ESMTPSA id d23sm5346065pfo.176.2020.02.26.22.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 22:21:51 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id DDBE7806B5; Thu, 27 Feb 2020 16:51:47 +1030 (ACDT)
Date: Thu, 27 Feb 2020 16:51:47 +1030
From: Alan Modra <amodra@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Explicitly retain .gnu.hash
Message-ID: <20200227062147.GC32593@bubble.grove.modra.org>
References: <20200227045933.22967-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227045933.22967-1-mpe@ellerman.id.au>
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

On Thu, Feb 27, 2020 at 03:59:32PM +1100, Michael Ellerman wrote:
> Relocatable kernel builds produce a warning about .gnu.hash being an
> orphan section:
> 
>   ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'
> 
> If we try to discard it the build fails:
> 
>   ld -EL -m elf64lppc -pie --orphan-handling=warn --build-id -o
>     .tmp_vmlinux1 -T ./arch/powerpc/kernel/vmlinux.lds --whole-archive
>     arch/powerpc/kernel/head_64.o arch/powerpc/kernel/entry_64.o
>     ...
>     sound/built-in.a net/built-in.a virt/built-in.a --no-whole-archive
>     --start-group lib/lib.a --end-group
>   ld: could not find section .gnu.hash
> 
> So add an entry to explicitly retain it, as we do for .hash.

Looks fine to me.  You can also pass --hash-style=sysv to ld (since
binutils-2.18) to disable generation of .gnu.hash.

> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index b4c89a1acebb..31a0f201fb6f 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -256,6 +256,7 @@ SECTIONS
>  		*(.dynamic)
>  	}
>  	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
> +	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
>  	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
>  	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
>  	{
> -- 
> 2.21.1

-- 
Alan Modra
Australia Development Lab, IBM
