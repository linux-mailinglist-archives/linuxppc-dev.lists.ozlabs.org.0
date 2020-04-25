Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EDF1B89CC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 00:27:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498lyT1v7xzDqcj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 08:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=niveditas98@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DUXzjlY0; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498lwT5yGyzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 08:25:11 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id k12so11195691qtm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xuQcmX1KuUHGcvDHgPS1loxSumVbQobQeCIW/Qnf+WU=;
 b=DUXzjlY0Gb6oeL/I2LT28x1KTxIhrpTcB8nsZp0Bj6bBweC03HPMYVSwd8cOGoavMV
 pPZu+ng+/FIsmudg/jkmH4Mf1+sXsDntxyGjEnwqAsgLxmrJwdTKPuJvZk1vvlqSaUtF
 AI51Wt7EKHFOEqDfoSMQmAJto565MqJtsgyRSaWQK0yZkIADmeo0ZQ1B6MZ8POxeBqj6
 rjBSjKWMF2C4sssgW/Qf+pinfy1pA9Gt47I6tK284HM1w3iGCELctfTm5+v+qfVN1rTf
 EGLW5NS/0jUXu10M22D0ezOtNRlTj3EF6BjOZStMkpD0mKCVbRLyMJgGRKuHxvuxFzoy
 NriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=xuQcmX1KuUHGcvDHgPS1loxSumVbQobQeCIW/Qnf+WU=;
 b=G96UP9bc0/vOHFK/i+7BddOue06ELGg2OO2tr5+P25UHK8y/LIQE7dAJtVTQ5M2qM8
 QWojlbDXp5//0RcjD8Gf4d9IJDlovBeb7uibn9v3ydv/xgPLTHmTLNlcnCrzOxmdmKaB
 OfrTI/QS6nyTOVABCwFxuOnwqbp1zYZeDZo0iYJ+bVvSauX3QzIuo6XDSqAZh9VCmgCf
 sgt6P2vCpFm0ImOSJ84YoT7v/LsoM7t5pRc82JaUHvvoP0ICrTi2847HIJKEf9ITyJzu
 rwAL0S0Ivx29s/yXpriLT1uxehoHmC3GwOCGevVJ00SkV4ref+OBG7RxpNGdSx4jO70o
 gK1g==
X-Gm-Message-State: AGi0PuaZrxKcD2NQr36wWhXS3+4xPiud3VJam9P5oCR+3J7On58tUPcx
 mJ2SV+exVvCWOvnn5GFmT8E=
X-Google-Smtp-Source: APiQypLxynL7JE9q+IReY89tAIdlSibLu7fiLFyDHSVDYQXBdXJyuz24+DnZFevMiJ8c7hxElV6KNA==
X-Received: by 2002:aed:2de7:: with SMTP id i94mr16651310qtd.248.1587853506847; 
 Sat, 25 Apr 2020 15:25:06 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id i5sm6631996qtw.97.2020.04.25.15.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2020 15:25:06 -0700 (PDT)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Sat, 25 Apr 2020 18:25:04 -0400
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425222504.GA1080319@rani.riverdale.lan>
References: <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
 <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic>
 <20200425183701.GE17645@gate.crashing.org>
 <20200425185313.GD24294@zn.tnic>
 <20200425191549.GF17645@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425191549.GF17645@gate.crashing.org>
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
Cc: Jakub Jelinek <jakub@redhat.com>, jgross@suse.com,
 Michael Matz <matz@suse.de>, Kees Cook <keescook@chromium.org>,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Peter Zijlstra <peterz@infradead.org>,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 boris.ostrovsky@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 02:15:49PM -0500, Segher Boessenkool wrote:
> On Sat, Apr 25, 2020 at 08:53:13PM +0200, Borislav Petkov wrote:
> > On Sat, Apr 25, 2020 at 01:37:01PM -0500, Segher Boessenkool wrote:
> > > That is a lot more typing then
> > > 	asm("");
> > 
> > That's why a macro with a hopefully more descriptive name would be
> > telling more than a mere asm("").
> 
> My point is that you should explain at *every use* of this why you cannot
> have tail calls *there*.  This is very unusual, after all.
> 
> There are *very* few places where you want to prevent tail calls, that's
> why there is no attribute for it.
> 
> 
> Segher

Well, there is -fno-optimize-sibling-calls, but we wouldn't be able to
use it via the optimize attribute for the same reason we couldn't use
no-stack-protector.
