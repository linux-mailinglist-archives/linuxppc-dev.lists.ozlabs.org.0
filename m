Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D06CA152
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 12:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlTV96Scpz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BEOXB9Kg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BEOXB9Kg;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlTTD2gm9z30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 21:24:47 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id iw3so7959877plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 03:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679912684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQVXJx3PyYWBi/P3y1vObfoSrmCSvqy4APPy90F69bM=;
        b=BEOXB9KgVKR9+WTXfuh64EpofGAl20t83MBvlxlGdrsptsYY3qdByFrocgWmzIOUxk
         xR2Rc8G99uL22ONFYMlxuLIa0Aw1yQ70VnlRg7U7hhWaRiTga7PQ0cw2y+uNan6Bf0js
         V6epnh1luW+lto76bVF3VQL70ZVNke/kf2+GgqCe+8qTy9qLtT2Oks67MNzVshvnT6VU
         8N08Gp5YzldinAIRF65G7MIdSLGxaqVHt3SwWmst1LPGHr+3cHGdEgvjY3uiHt1fbwXB
         cJr9sbgNVDNwyuVvgXbW9j5fTvhYYmH6jRGauRpBNKipEECbzO1K9vMvXfBWuXD15xft
         0kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQVXJx3PyYWBi/P3y1vObfoSrmCSvqy4APPy90F69bM=;
        b=3AFjlRGLzm6kaTHiBKk30sp3NEPmiiY0WobsYKAF61XE/ev6dAFjRiyusfAmAUGhrm
         OQg3TKFBZEPn5q7XHxSTcaC9hBU8GBqyvc89J9PSSvCLg9U5x99JcjHMzMWX2PY7VJMe
         jNUmVdLVVrbBoImwJEUDfKF7OdK3Q46rzz+Feipe3r3EuYXUDmi8W3R/wvEvTSj44pP/
         SFQyCysNTVOCSlXb51C3TfJLzuqEQUU/g+OfgF0Zj3WahXGk1Na0b0ZXmwRYtZ55qkU8
         j8/LJ8wyXEotpTn2AhqmoHlDAtdAC3pvSgk1CKBw3wHWPRLrC6+A+gUuIM78ZIURmRgv
         WEgg==
X-Gm-Message-State: AO0yUKX7iVRwklqFuWXxBv9Mn9FHuwmx940M1KnNvGswii+imHqHfbpf
	MsmrRJVplYPC/TbVXqtVyag=
X-Google-Smtp-Source: AK7set/InsBOTZdgeW1VdGqTXnJZ9qDODaWMEWJEszaqYZO5YnJ9fjNkTaHYk/TcjcpIlmLELwCr5A==
X-Received: by 2002:a05:6a20:2a22:b0:dc:925f:62f1 with SMTP id e34-20020a056a202a2200b000dc925f62f1mr11386322pzh.6.1679912684625;
        Mon, 27 Mar 2023 03:24:44 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id n12-20020aa78a4c000000b005a8db4e3ecesm18757312pfa.69.2023.03.27.03.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:24:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 20:24:38 +1000
Message-Id: <CRH3CENOOS9G.2EZ66CM1VSMUD@bobo>
Subject: Re: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove
 .global scope
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Kautuk Consul" <kconsul@linux.vnet.ibm.com>
X-Mailer: aerc 0.13.0
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
 <CRH1YM72SK4L.QU56WGVQQ2GE@bobo>
 <ZCFhnNPrMr3D5+rZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCFjJ1sMuLMUkBWc@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <CRH2N2UNMLQW.1W51OVV9ZES7L@bobo>
 <ZCFoBqReJekPd7GI@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To: <ZCFoBqReJekPd7GI@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 27, 2023 at 7:55 PM AEST, Kautuk Consul wrote:
> On 2023-03-27 19:51:34, Nicholas Piggin wrote:
> > On Mon Mar 27, 2023 at 7:34 PM AEST, Kautuk Consul wrote:
> > > On 2023-03-27 14:58:03, Kautuk Consul wrote:
> > > > On 2023-03-27 19:19:37, Nicholas Piggin wrote:
> > > > > On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> > > > > > kvmppc_hv_entry isn't called from anywhere other than
> > > > > > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > > > > > this function and annotating it with SYM_INNER_LABEL.
> > > > > >
> > > > > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > > > > ---
> > > > > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
> > > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/pow=
erpc/kvm/book3s_hv_rmhandlers.S
> > > > > > index acf80915f406..b81ba4ee0521 100644
> > > > > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > > > @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> > > > > >   *                                                            =
                *
> > > > > >   *************************************************************=
****************/
> > > > > > =20
> > > > > > -.global kvmppc_hv_entry
> > > > >=20
> > > > > I think this is okay.
> > > > >=20
> > > > > > -kvmppc_hv_entry:
> > > > > > +SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > > > >=20
> > > > > The documentation for SYM_INNER_LABEL says it for labels inside a=
 SYM
> > > > > function block, is that a problem? This is a function but doesn't=
 have
> > > > > C calling convention, so asm annotation docs say that it should u=
se
> > > > > SYM_CODE_START_LOCAL?
> > > > That is correct. Will create a v4 patch for this and send it.
> > > But using SYM_CODE_START_LOCAL again causes a warning in the build
> > > (which we were trying to avoid):
> > > arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48=
: unannotated intra-function call
> >=20
> > Are you using SYM_FUNC_END as well? Looks like you need that to
> > annotate the type properly. It should be the same as SYM_INNER_LABEL
> > in the end AFAIKS.
>
> What about SYM_CODE_START_LOCAL and SYM_CODE_END ?
> This seems to work fine for me without any build warnings from objtool.

That's what I meant. So you were just missing SYM_CODE_END?

Thanks,
Nick
