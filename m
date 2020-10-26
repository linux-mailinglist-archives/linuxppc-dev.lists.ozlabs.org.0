Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DF29974B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 20:46:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKlhP5cgHzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 06:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uGeZxrbK; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKlfY21sqzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 06:44:50 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id q26so7644277qtb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AZnYVCXpAdxGrITpeg/XVTk5Yy68LhIj/hc9zCI8ypk=;
 b=uGeZxrbKJi6sAOY7r8Tn8eofHKiRQfdpVT0GnYl/5gri+hoMA+6nTS4db4zc4DNNVd
 AF/bO9llDrW/i/WOaYI4/bLgzhsnNleyfOb8XUwrVLZmFWVEe7kRLDh7zd8IX/KLllOl
 cmkaFJfHWaDVWQB/R8q1b1DctxlfkXTRXynGWTD+ARycbLK9di9vnDjZmb8nboBI6tRF
 K5H70sqaEIO5VB3+kKwu06ZnO2gKiDoO5BXIYNEXthZxFCYM9lr0wcpkqiapN4UIcTcq
 dyOVR7s35zMMyZxX+Oa0UfLE6b9lNfIQvcPiFbQMFHnWF/tW6DJTipKqMjWILub2sTMK
 KFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZnYVCXpAdxGrITpeg/XVTk5Yy68LhIj/hc9zCI8ypk=;
 b=Ov4fs8dmm6EYU6VkWVfAlLqicDd9oYYu3rEtuxUvbXaA1scUZlVLMMn8JbWy2LwTDR
 nF10cWI3ZSH75o2YIMk+yWYGp2FjDlSs1vYYdMWehgujaKdUWndWE6mzt55NNSSyiI29
 aNhNMqWPI9U8SZHQplMiJJxIlX/KLGwgEqTPCHHpiYD9HGWydSO/kHs0vYuc0OHrncgH
 QMaFm9TTCC348I7WYwCtlZINsWX/lRsqegmwqE3yiSy5GebnB2laGycNWob2cNL3C9cf
 5aJUkeG/2wAJtUmKox2b/hDwsRabpWj+0qsTBUlWXX4hM94F3am+iNiqmCkqpiU4M0fV
 0lVg==
X-Gm-Message-State: AOAM530PmYM5X+RLaDe6KeEfGqEO24+xVmNssUfK/hD1A7zi4/H667el
 VE36k4vyfl6GOv2xrGP5/Js=
X-Google-Smtp-Source: ABdhPJygnMN9Xs9zs5MNqgA1Pujx+ICimDfMyqNVnwOFTwjhGqttXktGFigCOyau3Gp1LJZAE03ymg==
X-Received: by 2002:aed:2338:: with SMTP id h53mr19116043qtc.127.1603741486093; 
 Mon, 26 Oct 2020 12:44:46 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
 by smtp.gmail.com with ESMTPSA id v5sm7068456qkv.89.2020.10.26.12.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 12:44:44 -0700 (PDT)
Date: Mon, 26 Oct 2020 12:44:43 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
Message-ID: <20201026194443.GA2879078@ubuntu-m3-large-x86>
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
 <20201026193652.GA77796@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026193652.GA77796@roeck-us.net>
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 12:36:52PM -0700, Guenter Roeck wrote:
> On Wed, Oct 21, 2020 at 07:36:07PM -0700, Joe Perches wrote:
> > Use a more generic form for __section that requires quotes to avoid
> > complications with clang and gcc differences.
> > 
> > Remove the quote operator # from compiler_attributes.h __section macro.
> > 
> > Convert all unquoted __section(foo) uses to quoted __section("foo").
> > Also convert __attribute__((section("foo"))) uses to __section("foo")
> > even if the __attribute__ has multiple list entry forms.
> > 
> > Conversion done using a script:
> > 
> > Link: https://lore.kernel.org/lkml/75393e5ddc272dc7403de74d645e6c6e0f4e70eb.camel@perches.com/2-convert_section.pl
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@gooogle.com>
> > Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> 
> s390 (all builds):
> 
> Error log:
> error: section .boot.preserved.data differs between vmlinux and arch/s390/boot/compressed/vmlinux
> make[2]: *** [arch/s390/boot/section_cmp.boot.preserved.data] Error 1
> make[2]: *** Waiting for unfinished jobs....
> error: section .boot.data differs between vmlinux and arch/s390/boot/compressed/vmlinux
> make[2]: *** [arch/s390/boot/section_cmp.boot.data] Error 1
> make[1]: *** [bzImage] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [__sub-make] Error 2
> 
> Reverting this patch fixes the problem.
> 
> Guenter
> 

Seems like this should be fixed by commit 8e90b4b1305a ("s390: correct
__bootdata / __bootdata_preserved macros").

Cheers,
Nathan
