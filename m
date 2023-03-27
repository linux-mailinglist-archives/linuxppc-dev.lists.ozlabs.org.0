Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A56CA085
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 11:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlSm04hF9z3c9H
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:52:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oDfAm4pE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oDfAm4pE;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlSl35Yz5z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 20:51:42 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so11248429pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679910700;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwVHUErF6NBSyCtvSa/omuwEN4SL1/DY9fX2CVuT0Nw=;
        b=oDfAm4pEY67NP4M9cZcT/HBEDRoggyD4pTTB3OdeogAR0MYqUItOgSVqA4qry+p7Y2
         Maw3WkuU29O27qg1MA8hjBP4FLx5rqIuKahSFa2cSYCFAlDskSGh30XQx+2NjzY26Ejz
         +q3cQB0tuifvO0meeaa6Pp+r2YiQRUKKwcfOnJV0Zm0hTi53g+CvAPhapNv92uoAn1ZS
         P1mezE7aYTmlvbYW6CoR92vozjaVvVL/bCDN0v78zCBRYg9x1KChJtKVSb6XZJnqp/Rv
         syVZ7ddN/UAw9ZjNExJWsphfo/FvBZB7nv8ZITfvW5wNuqbM7A8msW/94ZIkVb15xzgb
         4EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679910700;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RwVHUErF6NBSyCtvSa/omuwEN4SL1/DY9fX2CVuT0Nw=;
        b=I9Y19I493HKvzNFNCzq1CxSMQnPWNoBlEBKFJIlo9NS4E1cZYyQeBhzMDHXMNIL2x8
         vGbbdqypJ8rUmKMmwBYzcA6fibqG66p6Rou0c7posH2B9KpxE1Ge6VWHDdAF0mT3uS9x
         jZikPIfYT95P5pRW5zNA4Cvw/WmEp36PVx0Ve3hppvFSPgd9sbXAgGpI3yM/VizNU3qe
         2T39N5APtxpwHdudpWCFD68iGw4av+FWf6HYnL18L+V+L/SLi1SmGtAf4h9IchpVAZJ3
         bvvk2LvVJZkF5zRz7JpgQTYW6djrmtq533p0z2JlNRNWGFb9Z2FPQJ1h1v2wiX15qeht
         zQtA==
X-Gm-Message-State: AAQBX9eCinI75SvtEDTDWiVXazHNvCAFheU00n9nPUpgSPFmJknK/yUJ
	bsXfUq8kKRjy3BXht2aASgU=
X-Google-Smtp-Source: AKy350YXGIXyJID7gUD4IjW8G4q44qArdiHnyamBHZ+Gownt1/tzz2XxWktxSWtByoVC6jx/s+2kXA==
X-Received: by 2002:a17:903:1c7:b0:19d:323:e68 with SMTP id e7-20020a17090301c700b0019d03230e68mr13783654plh.1.1679910699879;
        Mon, 27 Mar 2023 02:51:39 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902a5c700b001a207906418sm7470582plq.23.2023.03.27.02.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 02:51:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 19:51:34 +1000
Message-Id: <CRH2N2UNMLQW.1W51OVV9ZES7L@bobo>
To: "Kautuk Consul" <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove
 .global scope
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
 <CRH1YM72SK4L.QU56WGVQQ2GE@bobo>
 <ZCFhnNPrMr3D5+rZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCFjJ1sMuLMUkBWc@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To: <ZCFjJ1sMuLMUkBWc@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
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

On Mon Mar 27, 2023 at 7:34 PM AEST, Kautuk Consul wrote:
> On 2023-03-27 14:58:03, Kautuk Consul wrote:
> > On 2023-03-27 19:19:37, Nicholas Piggin wrote:
> > > On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> > > > kvmppc_hv_entry isn't called from anywhere other than
> > > > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > > > this function and annotating it with SYM_INNER_LABEL.
> > > >
> > > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > > ---
> > > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc=
/kvm/book3s_hv_rmhandlers.S
> > > > index acf80915f406..b81ba4ee0521 100644
> > > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> > > >   *                                                                =
            *
> > > >   *****************************************************************=
************/
> > > > =20
> > > > -.global kvmppc_hv_entry
> > >=20
> > > I think this is okay.
> > >=20
> > > > -kvmppc_hv_entry:
> > > > +SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > >=20
> > > The documentation for SYM_INNER_LABEL says it for labels inside a SYM
> > > function block, is that a problem? This is a function but doesn't hav=
e
> > > C calling convention, so asm annotation docs say that it should use
> > > SYM_CODE_START_LOCAL?
> > That is correct. Will create a v4 patch for this and send it.
> But using SYM_CODE_START_LOCAL again causes a warning in the build
> (which we were trying to avoid):
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48: un=
annotated intra-function call

Are you using SYM_FUNC_END as well? Looks like you need that to
annotate the type properly. It should be the same as SYM_INNER_LABEL
in the end AFAIKS.

> > >=20
> > > BTW. why don't our _GLOBAL() macros use these SYM annotations? I have=
n't
> > > really looked into them.
> > Not sure. Was mostly just concentrating on the kvmppc_hv_entry code.

Looks like it's because we have a .type @function annotation in those
already. Not sure if we should end up converting all that over to use
the SYM annotations or if it's okay to leave it as is.

Thanks,
Nick
