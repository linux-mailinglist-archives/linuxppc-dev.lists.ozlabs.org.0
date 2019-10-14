Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9122D5C95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 09:43:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s9Xf2fL3zDqc1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 18:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c41; helo=mail-yw1-xc41.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ULg0x+kV"; 
 dkim-atps=neutral
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s9VD2fn6zDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 18:41:20 +1100 (AEDT)
Received: by mail-yw1-xc41.google.com with SMTP id q7so5790279ywe.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 00:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEN7o3yuO56xvPDuUwKgUiAGNAgWvdh9IYFyMwir9eg=;
 b=ULg0x+kVwo2eT+iIl7xEqgOGbAzw68nEs+Tf1EX6WbkwD6JZiL1PJq9RZFvkDJEthU
 ocfdC+Pu3HU8yKboyYft824CwBNxjIEzx8zyCCvt9khKX2P3rnlv1B/RrEDuwgE/1mG/
 dO9bqvuIwHg7kYFJ6cR8Rxh98z5xxnACgBkXR6UU0aSIjsvAx7CLSTrvS1W1Yc6B2hbM
 xVKkvAsHm4h5LvwOcL7O3xZNwPSbX/1EH8Ha7BFbRmH59L7FLoc17rAHr/p/fi2/0aQd
 XhR8EuPvAa5rR0cGHGbuZEBAsY6jzipW6b/VsB7pAItTeOGbyHWLGnGRGwAir0skqH6K
 QqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEN7o3yuO56xvPDuUwKgUiAGNAgWvdh9IYFyMwir9eg=;
 b=kAhI+ql4L+OhtpELoYQyvMAF/ER6vAcMJ2/yT6pdXWpDPzKCkJjhshCFXVc0vudz12
 F4WU/yvCfUJ3Vuf1I0dFmjvRwrBzzVU/oIy8TE3oKXh5xhjY6GGVhYbA46DRFoP1gviK
 xtMiR5rrkx1CoHq6XsTNN5/2df26XODQ/0B+jHAkttZ4bgeIZg1ampD04C5eEgdYi8DW
 ms+GxU++wtOQ83vqHvGG3ruWtfHjaetqJwVgHGkk/+1VB88t9HOQDuA0WogrUkNaq7xO
 vhbu6to8Q0fnlJJ2lv3DB/eilWf5YKP4NvrYeYXaqPsnX73qMSg0hzQxm8wptopupXeA
 9nXQ==
X-Gm-Message-State: APjAAAVbXjdC6MVmdIWlAVn0QRnz4TD7LZg4uA4En6wK9UG0z882+jFk
 /70tfxS+70jHUVQ29UJbtbpJbB5A72kS/iize1w=
X-Google-Smtp-Source: APXvYqw4VB+FAxVRs0lcX+ZIr7P8ykk483BJkOe9a1ta9sipUpx8Dmb1cwz7VKpxf94e6Vopzx6wAvxttFQCwsQ1L0I=
X-Received: by 2002:a81:254d:: with SMTP id l74mr12130385ywl.409.1571038877410; 
 Mon, 14 Oct 2019 00:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-26-keescook@chromium.org>
In-Reply-To: <20191011000609.29728-26-keescook@chromium.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 14 Oct 2019 00:41:06 -0700
Message-ID: <CAMo8BfKexMmMusB3XOeaMOZHdU4ccz+PMGA=Jy+KQhgD8H_8UQ@mail.gmail.com>
Subject: Re: [PATCH v2 25/29] xtensa: Move EXCEPTION_TABLE to RO_DATA segment
To: Kees Cook <keescook@chromium.org>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Borislav Petkov <bp@alien8.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 10, 2019 at 5:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/xtensa/kernel/vmlinux.lds.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
