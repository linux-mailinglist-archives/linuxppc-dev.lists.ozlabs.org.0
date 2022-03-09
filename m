Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB8F4D34D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 17:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDHkW1MJMz3bXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 03:30:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oIHRdIQt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=oIHRdIQt; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDHjr0f1Zz2yQC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 03:30:21 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id a5so2797180pfv.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Mar 2022 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OEKJ6HDfRbAYXq1y3GQ16S8ECnj8rGvJ1M6VsKHeWho=;
 b=oIHRdIQt5LoDmfPbY/G+bBH9o203m/KAHGz2i3DiFvY04vAFtOZbiV2VNw1Bco6aPR
 7KbjGoeqlwQ3COOJKgMqcvt6n0uAgO8pXJ9sECo3BMw6jNYxt57ENxj/F5kjvVMnCAXv
 jY2cx0MvlUyBrD5/D8cKaWx8Xmj0/ViDCRVWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEKJ6HDfRbAYXq1y3GQ16S8ECnj8rGvJ1M6VsKHeWho=;
 b=5xOXpFeEQIHaXh9RzngnObJZxqPy0cTyAt2R7gSCdabZnpZjpI85BeXd/laSFdsNY4
 HeflEXB5YWSZAsQCett4dttI2Kx9jGLFlj27u/GgycFLnuKa2WbsFqnnUWulgtIUKN38
 P1ABIVZJCjbE9TzLDvYwfI5VOBEx1qlVYVl3RATXfGHdG8+sWYRx6xVi3rPLjoOkFxne
 I6Yd7GvhUMmn9U6bjCLUHV4/QeTMR9Fta2D3JI0div/4Er7kAxetbihOf0GNKiX+EcOn
 p/6OpCu2zBtIDdLSlnKZn2pMASFSfvDnjEb+AV8IfdVoaaoIzxC6Ttd4TNm/zoth+3EB
 J6cg==
X-Gm-Message-State: AOAM533TO3uyqV5BNXoIC9w1yO6PjWeUPLrt5rDJaFT/YKL30PIwmui1
 IYoXImFpZyjNCXUzd88STN+HBA==
X-Google-Smtp-Source: ABdhPJysLOSUH1ejLQlt60xHSX+d3Bmy5LiPEBTc5BsVYUZY79bDZ5hXlYyKJbRu0bUDKCQC8AewHg==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr340497pfu.46.1646843418232; 
 Wed, 09 Mar 2022 08:30:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm2841805pgl.36.2022.03.09.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 08:30:17 -0800 (PST)
Date: Wed, 9 Mar 2022 08:30:17 -0800
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-ID: <202203090829.53A243306@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <164674125384.3322453.12551849351633372798.b4-ty@ellerman.id.au>
 <87r17bnbxx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r17bnbxx.fsf@mpe.ellerman.id.au>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 09, 2022 at 12:37:14PM +1100, Michael Ellerman wrote:
> Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> > On Tue, 15 Feb 2022 13:40:55 +0100, Christophe Leroy wrote:
> >> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> >> on those three architectures because LKDTM messes up function
> >> descriptors with functions.
> >> 
> >> This series does some cleanup in the three architectures and
> >> refactors function descriptors so that it can then easily use it
> >> in a generic way in LKDTM.
> >> 
> >> [...]
> >
> > Applied to powerpc/next.
> 
> I also have it in an rc2-based topic branch if there are any merge
> conflicts that people want to resolve, I don't see any in linux-next at
> the moment though.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/func-desc-lkdtm

Thanks! I've got some core changes coming for lkdtm, but I'm waiting
until after the merge window to rebase them and get them into -next.

-- 
Kees Cook
