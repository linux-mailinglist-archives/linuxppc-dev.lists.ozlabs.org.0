Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1834F8CE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 05:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZPGr4vJvz2ynd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 13:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dL1emr/S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dL1emr/S; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZPG759wfz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 13:42:37 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 66so6674018pga.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K96mlN10n7EweDR+53jcFZAkfBQwRjsHeZeSVOaqH6U=;
 b=dL1emr/SVvDUitmI/GhFvZ5GDfJfCZqqybUK0jY5r9YpcwDEym86lGSPk5ajT9fkXv
 68GItVAds/Z+CMKr5K6+nclMV48nPWohX7Qz2mbKGSdt22CtfWYhovUHU9eWOOIJxF/x
 TIwKpkgJMMkaKK6GQVnlphvoASG3ht7FbopB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K96mlN10n7EweDR+53jcFZAkfBQwRjsHeZeSVOaqH6U=;
 b=iwGTrfmPy9JW1OVtPE4xt+ao0tEiQcFRjA8fangips9/phFbs0IcBKUamsm21oXLyf
 xl23cubak8Id24GDfQWQHK//tHa+AQMJUzGKS8TORfksWDpUjNcEEuE2SQdXT95JPG30
 mUF1Qd8zO75KGvcfdmOhJlfIMQiu5tWWgm9gAv73NEPsOJiDiTBxmuK1xtRSIXUgsDZ4
 w7Rn+tC6p7YkooifU6ffA9pLFY/iwclwmfM+UTipdAhN3XB87zgw/0SSUSqYw+9GaE3w
 cdcmyQB+6BbTy/geeLyqL/CQpqmxsJZ8gM+r2pv6jdOwJDDYZOy2OnVjfzUg5A5tknl4
 StuA==
X-Gm-Message-State: AOAM531Msh//qiUcYUqvc0xoa74aHO1kJjmDeJuezTn/3rX0Q7Au0PN/
 2+vim8dlbARi4Wx0ZJmK8nlX+A==
X-Google-Smtp-Source: ABdhPJzs4BJvqoMUJeyjaJ1TeZcDIdeQX1b09zQG89u/2Jo2P8sjElQ6/UOvNErwvd9fdVv73z+YWw==
X-Received: by 2002:a63:6c02:0:b0:398:833b:f739 with SMTP id
 h2-20020a636c02000000b00398833bf739mr14106439pgc.524.1649389353914; 
 Thu, 07 Apr 2022 20:42:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 q27-20020aa7961b000000b004fdf7a4d49esm17171769pfg.170.2022.04.07.20.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 20:42:33 -0700 (PDT)
Date: Thu, 7 Apr 2022 20:42:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH] lkdtm: Replace lkdtm_rodata_do_nothing() by
 do_nothing()
Message-ID: <202204072037.FE91C45E@keescook>
References: <fe36bf23fb14e7eff92a95a1092ed38edb01d5f5.1634491011.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe36bf23fb14e7eff92a95a1092ed38edb01d5f5.1634491011.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 17, 2021 at 07:19:47PM +0200, Christophe Leroy wrote:
> But for EXEC_RODATA test, execute_location() uses
> lkdtm_rodata_do_nothing() which is already in rodata section
> at build time instead of using a copy of do_nothing(). However
> it still uses the function descriptor of do_nothing(). There
> is a risk that running lkdtm_rodata_do_nothing() with the
> function descriptor of do_thing() is wrong.

Wrong how? (Could there be two descriptors?)

> To remove the above risk, change the approach and do the same
> as for other EXEC tests: use a copy of do_nothing(). The copy
> cannot be done during the test because RODATA area is write
> protected. Do the copy during init, before RODATA becomes
> write protected.

Hmm, hmm. This is a nice way to handle it, but I'm not sure which
"weird" way is better. I kind of prefer the code going through all the
"regular" linking goo to end up in .rodata, but is it really any
different from doing this via the ro_after_init section? It makes me
nervous because they can technically be handled differently. For
example, .rodata is mapped differently on some architectures compared to
ro_after_init. Honestly, I actually this this patch should be modified
to _add_ a new test for EXEC_RO_AFTER_INIT, and leave the existing
.rodata one alone...

-Kees

-- 
Kees Cook
