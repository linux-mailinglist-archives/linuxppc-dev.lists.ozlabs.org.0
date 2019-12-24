Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D6129CC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:31:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hgG55GZ9zDqKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:31:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mBOamR3e"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hgD4084BzDqH1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 13:29:55 +1100 (AEDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D1E52075E
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577154593;
 bh=DSQS0uHBNC9Ui3z1SA4ieLxiBxYjVLA1pvOoujpbOvo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mBOamR3e8+z/oxuQ1j6arsjUSXZzjlhMM4HvwMIBzxIH0PnwI3vD0y6J79ccnKo8X
 DVK+NzbOAuvhO9t9AREqK8/n+jmOBhUq+hrD4x5Lzu4meIgw/Aq56f9vXJtZCiBv6N
 w94bwVmE4Fl4guBclpw34hSD8o5Dpk5G3lj9oiXU=
Received: by mail-wr1-f52.google.com with SMTP id q6so18588527wro.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 18:29:53 -0800 (PST)
X-Gm-Message-State: APjAAAWes2dVJnLcO4l8/IVfa2162fnvXJORK+8Z9mgldC3yUMTd04gk
 97taXsuvvZxIehuaNHwncThFa1ynsAskYmPuKpM5pg==
X-Google-Smtp-Source: APXvYqz5QXY27AstGyElWlUnUHM0Y/Cls6krR6JAY/F6G6Ra4+oArxsi2W6pHlVu1RWJHAU5CqdrqYSugVUavqgLJoc=
X-Received: by 2002:adf:eb09:: with SMTP id s9mr34152116wrn.61.1577154591966; 
 Mon, 23 Dec 2019 18:29:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 18:29:39 -0800
X-Gmail-Original-Message-ID: <CALCETrWyek-xatdsUFbFvHzT+bps_bjtQoVq8MAFsS1rcZCtEA@mail.gmail.com>
Message-ID: <CALCETrWyek-xatdsUFbFvHzT+bps_bjtQoVq8MAFsS1rcZCtEA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> do_hres() is called from several places, so GCC doesn't inline
> it at first.
>
> do_hres() takes a struct __kernel_timespec * parameter for
> passing the result. In the 32 bits case, this parameter corresponds
> to a local var in the caller. In order to provide a pointer
> to this structure, the caller has to put it in its stack and
> do_hres() has to write the result in the stack. This is suboptimal,
> especially on RISC processor like powerpc.
>
> By making GCC inline the function, the struct __kernel_timespec
> remains a local var using registers, avoiding the need to write and
> read stack.
>
> The improvement is significant on powerpc.

I'm okay with it, mainly because I don't expect many workloads to have
more than one copy of the code hot at the same time.
