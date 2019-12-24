Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A898129C99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 03:09:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hfmG4JTTzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 13:09:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="E6kVU9g2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hfkW2pCMzDqMH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 13:07:46 +1100 (AEDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3107720643
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577153264;
 bh=nuWZ8yhnitZpPr2h+5PU5xzGudc3XC10lX5Ec91GR+s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E6kVU9g202rFhym4tXVVBYm1fF7zrf4imuKY1UsLFAoqO0HfSsUASADU8FpcnUTFX
 au8dQB0MMEwRaITZ7AkOA+CdDJ26kZ865Lo1+fULgI1ZCLw1Y/TN1ZP2AMm5x/siU4
 pk8YakrCG+Ck+yePKWOcsbZyKUUeS+p1lIRxmwIs=
Received: by mail-wr1-f47.google.com with SMTP id q6so18560540wro.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 18:07:44 -0800 (PST)
X-Gm-Message-State: APjAAAWJo8HXt56M/DLXQUPl8XvIKx/QiIVJmdEsLLK1DABz6HV0mzg6
 CVO7d0jGbjzbSHviG9lxEU7BNXixm8y2UwaZkr0P3Q==
X-Google-Smtp-Source: APXvYqykVrvy0YjrN0kH0ZW9RItFuTqBfOCiQcjlBJoCQ0o5yZwU56b/UhrC0QUXlKV7VRHUBN0rn8CMmknayBiXVnU=
X-Received: by 2002:adf:eb09:: with SMTP id s9mr34073707wrn.61.1577153262733; 
 Mon, 23 Dec 2019 18:07:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Dec 2019 18:07:30 -0800
X-Gmail-Original-Message-ID: <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
Message-ID: <CALCETrULuV5iAU3kSjMdcpV6DFGEw1z2so0DfDca6hoLB4X4cA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit
 fallback
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
> In order to simplify next step which moves fallback call at arch
> level, ensure all arches have a 32bit fallback instead of handling
> the lack of 32bit fallback in the common code based
> on VDSO_HAS_32BIT_FALLBACK

I don't like this.  You've implemented what appear to be nonsensical
fallbacks (the 32-bit fallback for a 64-bit vDSO build?  There's no
such thing).

How exactly does this simplify patch 2?

--Andy
