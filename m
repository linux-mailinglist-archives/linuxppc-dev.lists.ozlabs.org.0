Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE8C2F8EC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 19:54:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJ6fb0nfBzDsjQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 05:54:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n12xMXlT; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJ6ck0t0pzDr75
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 05:52:52 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id h4so15107722qkk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ua/LuZsrNlCeFTfbXFziWkITBqn89svS3225QAvKj0A=;
 b=n12xMXlTU2DXR1uyiW4fXaINLmYT6of49oHn1WdmZ3Cl8itKncigwstKfybe20it5r
 +XBL9vo0t8S0SgTed0h6f/poowmdAb89scyZ9n/CI4cgJJuu1Qk43cg5mRMkl8S30V0S
 gNip6vOZJ748GPi7RCK8gZgl7jixCIJ9Ej1GzSoDQt9hwanLc4dNegiri7ZFG5hRPURu
 88aseBMY+iepKoZ+4hbaSedCImZU2hroSSH3pzVXBKGMVxzQxuk42C3HFPIfjPfP6Y33
 hSFIKE6pun1l6hiZ7emfdEo01uDho+975t46ArnU2jPyTz5NUl1xSJmp8LktXyWfb6v5
 +/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ua/LuZsrNlCeFTfbXFziWkITBqn89svS3225QAvKj0A=;
 b=M3Wuu1MaBWcpk9SezIMZtmlTOKpIGeMu53lWHL90uwyZ7brGKKpZuB9cuh79LKLh+s
 ftQcGNXtitiSOh/TD6zr11i1tNpwDDcg0LXoga0CKyAfJQCJH1HKP9B4jlw/pHRh4sAB
 2BL717eymPFBXUyAzOxpMFJVeiTQ700W+IrY+VMZdtjwkBdW0OS5rFTHy7YmZ1RfZ3d3
 xNSY/ozN0DH2+8psIFJXpSnlrs3jdb+ozA+d83luGjCrayowlyM5k7HgNQBhmfHaCczT
 Iqq9wm6m6R4WsUG4Ms1XO+qGXdL0boC4ZnfJCwdgyJprc9nhQReKh85jaNdV93GqOLFe
 Q+EQ==
X-Gm-Message-State: AOAM533n4LVz2tb0+O7ud1NS0wkJymQzcNt0mQVvg8kZVeUpbuDenX3S
 XjyahtBN8YZwHxjdCZrpkps=
X-Google-Smtp-Source: ABdhPJyWYkwjtMd7leSGPGTxr/2BxKXW6DNoXxh1e/n8q51VXlOSWufCd0l5E3S9cKNsl/xRvnTKDw==
X-Received: by 2002:a05:620a:b0f:: with SMTP id
 t15mr18389126qkg.485.1610823169107; 
 Sat, 16 Jan 2021 10:52:49 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id w42sm4349496qtw.22.2021.01.16.10.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 10:52:48 -0800 (PST)
Date: Sat, 16 Jan 2021 11:52:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: Handle .text.{hot,unlikely}.* in linker script
Message-ID: <20210116185247.GA2491296@ubuntu-m3-large-x86>
References: <20210104204850.990966-1-natechancellor@gmail.com>
 <20210104205952.1399409-1-natechancellor@gmail.com>
 <20210116184438.GE30983@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210116184438.GE30983@gate.crashing.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 16, 2021 at 12:44:38PM -0600, Segher Boessenkool wrote:
> Hi!
> 
> Very late of course, and the patch is fine, but:
> 
> On Mon, Jan 04, 2021 at 01:59:53PM -0700, Nathan Chancellor wrote:
> > Commit eff8728fe698 ("vmlinux.lds.h: Add PGO and AutoFDO input
> > sections") added ".text.unlikely.*" and ".text.hot.*" due to an LLVM
> > change [1].
> > 
> > After another LLVM change [2], these sections are seen in some PowerPC
> > builds, where there is a orphan section warning then build failure:
> > 
> > $ make -skj"$(nproc)" \
> >        ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- LLVM=1 O=out \
> >        distclean powernv_defconfig zImage.epapr
> > ld.lld: warning: kernel/built-in.a(panic.o):(.text.unlikely.) is being placed in '.text.unlikely.'
> 
> Is the section really called ".text.unlikely.", i.e. the name ending in
> a dot?  How very unusual, is there some bug elsewhere?

No, this was an intention change done by LLVM:
https://reviews.llvm.org/D79600

Cheers,
Nathan
