Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BA2C33D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 23:24:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgdq62pzVzDqZQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 09:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NfPq1wTh; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgdnB5T6SzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:22:37 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id m9so492775pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJHeWjaBdZwomXBYbMExLuGxVcJ2kE2YHepOItpGyl8=;
 b=NfPq1wThF4bax4Wc54yxmbd3O4JURJngGs75IQyFFftNPqrf6BtVI5PUeVLYwXCsWo
 iINS0pl5vQHCGOwgdZb5X9Rm99q9n5neOK2PswQDMPhiN/xxNK+OCDBrF0NViCRYw0aQ
 brlxC/ZOWDeVXmRX9wEDJDnc6oU2xWI9oxtps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJHeWjaBdZwomXBYbMExLuGxVcJ2kE2YHepOItpGyl8=;
 b=HLjBhomPg0oxiWVEzHAq8fbCLKRLhThGp8k/oXpo9kKfdgymTZuR32KrlsUNwiawkT
 tlqiPZPlW8yyYN2dB1d1wfNk607DDO2fGZpH0gsGUt2Z7t2xrUeLWV5DKWD+RLeNmX+l
 dGrWIC48iAhK75a8J3ozPgIdmU4hQZyd7QyvCniuHOSncuF1rvqPV2uekHJYShNrRyM5
 8SG84TFiEz7/QlL4J4NbgPx8nSqdcR7JbTXcGaYq9is0XU3aX6orHnuZDGwCCxbo2zAE
 yx57v/OVtEu8u3wDuIVq/hBDf91vu42WtxATcPhZliC0q+0AzLuMuB8tu6HNWY/KEUII
 EckQ==
X-Gm-Message-State: AOAM531Re+NGLHuzCN+QSs6BKpjQaqhxXbooN4s4CA6KKPiyRIc2SZD6
 xsOxqeYh3NFq9vkIEVGlmvsaUg==
X-Google-Smtp-Source: ABdhPJzzU6ZeykNNsfU1lZsn6jxco0s14as0+LQMRx/IH4f1dYuHck5qrCwgoKmtZ6zQDKyRM8sR0A==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr453658pgl.310.1606256553666;
 Tue, 24 Nov 2020 14:22:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z29sm175922pgc.68.2020.11.24.14.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 14:22:32 -0800 (PST)
Date: Tue, 24 Nov 2020 14:22:31 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202011241421.A2F3062A70@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 "kernelci . org bot" <bot@kernelci.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > along with a few others. Newer versions of ld.lld do not have these
> > warnings. As a result, do not add '--orphan-handling=warn' to
> > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thanks for the additions in v2.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I'm going to carry this for a few days in -next, and if no one screams,
ask Linus to pull it for v5.10-rc6.

Thanks!

-- 
Kees Cook
