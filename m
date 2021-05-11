Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29C37B597
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 07:48:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg3jw0xWLz309L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:48:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=QG7HcZsq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QG7HcZsq; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fff1g69J5z2yWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 23:30:28 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so324259pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=TMkyCU3xEE//swwTt+8ovMpUkBNd5F1bX6i4khQ7i/4=;
 b=QG7HcZsqAWoaCj3S0h6xFR6FjP5W5SFzVi2iJncDGccPe6ofY15kFu3quvER2fKrnG
 9lvt16HkYS9aK8rJ/eeRHTYCFce2z6WQ9eGt6CnRqkPCxS5ecuDbw/Xa382JV/wuLwiu
 v45OxaManIs7X4fQQlNUF7zqQkdU+U9Ule6jxO3kcPnRJGPPs850YMA7iAFc5WnxrcJe
 nQlfbVkC0+kX0MlEVEbkfOysJoiAfGLBxL3SPcRm8dGStRHig+/CTVcxN6R65T6VbgE/
 oyq0FunMRYCJElVOhUQGoC1d6JEGVVJ5GILW/7sqBird6duCaIrBkRohlTMz4IZhmTu2
 xuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=TMkyCU3xEE//swwTt+8ovMpUkBNd5F1bX6i4khQ7i/4=;
 b=d+TM+eYOALsykpJKyGNNniKf7DWyk67ekuvW94ITdsQWTHPHguJVgauBrSMUNgCswQ
 LOtF2Y9CRwCI1o5lzbFaK4OhuV3AcltAxoQB8/13qf0Aw99sBQ9K576hgmNIaSxXCLvr
 F5tzREU4R60KYw02b2FlULiJHofnN2NpDv0dLOu4Z6I+gcTMpG9zwLbAYzzWrrO3wsom
 dgycTs9ucUwX42iVGHM0xeuDbIXq/s/lPVHCjbBMig+dnCJYwapLC2SdsPSTqkyrrGbM
 vUXHN751yf6AGm2rRN858aUyCazKz/UP+JerU4dBLw4MDbaYEXDvegeMHUYlwhEJnLCI
 N4tg==
X-Gm-Message-State: AOAM532kVwywEvKY21SYuRUa4E6btXcV7glpbkVpjuTgOtFk6Z95lvp6
 3Bn9nVOFNxW72sKtQm1uJv8mQg==
X-Google-Smtp-Source: ABdhPJw2dIHevnRCTw6DrzL7smP/E+jxmUw1zXUTFUuuVWXxoHDHCvmYhTir8uqRDWerB6fDGWOH0w==
X-Received: by 2002:a17:90a:4b0e:: with SMTP id
 g14mr5055331pjh.48.1620739823420; 
 Tue, 11 May 2021 06:30:23 -0700 (PDT)
Received: from [192.168.10.95]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with ESMTPSA id ms2sm14027460pjb.8.2021.05.11.06.30.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 May 2021 06:30:22 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue, 11 May 2021 23:30:17 +1000
Message-ID: <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
In-Reply-To: <20210511112019.GK10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru>
 <20210511112019.GK10366@gate.crashing.org>
User-Agent: AquaMail/1.27.0-1705 (build: 102700004)
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----------1795b9efe921a4027bb955e6ea"
X-Mailman-Approved-At: Wed, 12 May 2021 15:47:53 +1000
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
------------1795b9efe921a4027bb955e6ea
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit



On 11 May 2021 21:24:55 Segher Boessenkool <segher@kernel.crashing.org> wrote:

> Hi!
>
> On Tue, May 11, 2021 at 02:48:12PM +1000, Alexey Kardashevskiy wrote:
>> --- a/arch/powerpc/kernel/vdso32/Makefile
>> +++ b/arch/powerpc/kernel/vdso32/Makefile
>> @@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
>>
>> obj-y += vdso32_wrapper.o
>> targets += vdso32.lds
>> -CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>> +CPPFLAGS_vdso32.lds += -C
>>
>> # link rule for the .so file, .lds has to be first
>> $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) 
>> $(obj)/vgettimeofday.o FORCE
>
>> --- a/arch/powerpc/kernel/vdso64/Makefile
>> +++ b/arch/powerpc/kernel/vdso64/Makefile
>> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>> asflags-y := -D__VDSO64__ -s
>>
>> targets += vdso64.lds
>> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>> +CPPFLAGS_vdso64.lds += -C
>>
>> # link rule for the .so file, .lds has to be first
>> $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) 
>> $(obj)/vgettimeofday.o FORCE
>
> Why are you removing -P and -Upowerpc here?  "powerpc" is a predefined
> macro on powerpc-linux (no underscores or anything, just the bareword).
> This is historical, like "unix" and "linux".  If you use the C
> preprocessor for things that are not C code (like the kernel does here)
> you need to undefine these macros, if anything in the files you run
> through the preprocessor contains those words, or funny / strange / bad
> things will happen.  Presumably at some time in the past it did contain
> "powerpc" somewhere.
>
> -P is to inhibit line number output.  Whatever consumes the
> preprocessor output will have to handle line directives if you remove
> this flag.  Did you check if this will work for everything that uses
> $(CPP)?

i don't know about everything for sure but i checked few configs and in all 
cases (except vdso) $CPP was receiving cflags.

>
> In any case, please mention the reasoning (and the fact that you are
> removing these flags!) in the commit message.  Thanks!


but i did mention this, the last paragraph... they are duplicated.

>
>
> Segher


------------1795b9efe921a4027bb955e6ea
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">On 11 May 2021 21:24:55 Segher Boessenkool &lt;segher@ker=
nel.crashing.org&gt; wrote:</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi!</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Tue, May 11, 2021 at 02:48:12PM +1000, Alexey Kardashe=
vskiy wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">--- a/arch/powerpc/kernel/vdso32/Makefile</div>
<div dir=3D"auto">+++ b/arch/powerpc/kernel/vdso32/Makefile</div>
<div dir=3D"auto">@@ -44,7 +44,7 @@ asflags-y :=3D -D__VDSO32__ -s</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">obj-y +=3D vdso32_wrapper.o</div>
<div dir=3D"auto">targets +=3D vdso32.lds</div>
<div dir=3D"auto">-CPPFLAGS_vdso32.lds +=3D -P -C -Upowerpc</div>
<div dir=3D"auto">+CPPFLAGS_vdso32.lds +=3D -C</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"># link rule for the .so file, .lds has to be first</div>
<div dir=3D"auto">$(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(o=
bj)/vgettimeofday.o FORCE</div>
</blockquote>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">--- a/arch/powerpc/kernel/vdso64/Makefile</div>
<div dir=3D"auto">+++ b/arch/powerpc/kernel/vdso64/Makefile</div>
<div dir=3D"auto">@@ -30,7 +30,7 @@ ccflags-y :=3D -shared -fno-common -fno=
-builtin -nostdlib \</div>
<div dir=3D"auto">asflags-y :=3D -D__VDSO64__ -s</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">targets +=3D vdso64.lds</div>
<div dir=3D"auto">-CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)</div>
<div dir=3D"auto">+CPPFLAGS_vdso64.lds +=3D -C</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"># link rule for the .so file, .lds has to be first</div>
<div dir=3D"auto">$(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(o=
bj)/vgettimeofday.o FORCE</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Why are you removing -P and -Upowerpc here? &nbsp;"powerp=
c" is a predefined</div>
<div dir=3D"auto">macro on powerpc-linux (no underscores or anything, just =
the bareword).</div>
<div dir=3D"auto">This is historical, like "unix" and "linux". &nbsp;If you=
 use the C</div>
<div dir=3D"auto">preprocessor for things that are not C code (like the ker=
nel does here)</div>
<div dir=3D"auto">you need to undefine these macros, if anything in the fil=
es you run</div>
<div dir=3D"auto">through the preprocessor contains those words, or funny /=
 strange / bad</div>
<div dir=3D"auto">things will happen. &nbsp;Presumably at some time in the =
past it did contain</div>
<div dir=3D"auto">"powerpc" somewhere.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">-P is to inhibit line number output. &nbsp;Whatever consu=
mes the</div>
<div dir=3D"auto">preprocessor output will have to handle line directives i=
f you remove</div>
<div dir=3D"auto">this flag. &nbsp;Did you check if this will work for ever=
ything that uses</div>
<div dir=3D"auto">$(CPP)?</div></blockquote></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">i don't know about everything for sure but i checked f=
ew configs and in all cases (except vdso) $CPP was receiving cflags.</div><=
div dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;"=
 dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"marg=
in: 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><d=
iv dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">In any case, please mention the reasoning (and the fact t=
hat you are</div>
<div dir=3D"auto">removing these flags!) in the commit message. &nbsp;Thank=
s!</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">but i did mention this, the last paragraph... the=
y are duplicated.</div><div dir=3D"auto"><br></div><div id=3D"aqm-original"=
 style=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gm=
ail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; p=
adding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Segher</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

------------1795b9efe921a4027bb955e6ea--

