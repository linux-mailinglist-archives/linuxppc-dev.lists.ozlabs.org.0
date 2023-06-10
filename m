Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7572A795
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 03:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdLJ32dJ3z3fJ4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:40:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RBjvFWTH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RBjvFWTH;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdLH75gdBz3dyD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 11:40:02 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-25665d2a8bdso957665a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686361199; x=1688953199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilYlb2adszjrCfZbp1GJc8mPc6w5JCghOVHqrO8o/h4=;
        b=RBjvFWTHApfdQov2X/c3QLEY084FGbar8zfS02I93bYnC158D+Ip7clwMw7Q/MO4r/
         HP3REa9MgeEA1rl0dyldzmK7wEMCeBSC7hMSjXTG+deCgH9hGEZd6w5ppWTBpFSzOj0i
         +KIige/Cso2qINKwNt6tx1nXK38RG192MwPzytFzwZkJHGN1zcR1GJmuD1857wf3+pjz
         g5eeKJ52l71UFKTDrUFjjPx0HLHLMk6yJVM9Z5byjX1tjOEHNeSgGkzRN8uX3WgaKQjZ
         sveL7H9NsYExURsrdynaeuuW5qWOnz3sjSkB158JYautOSvQz4qoNXEwHjHkzoje00rF
         ATvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686361199; x=1688953199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilYlb2adszjrCfZbp1GJc8mPc6w5JCghOVHqrO8o/h4=;
        b=Dn2Me8JyW7M/VrCPv+X2RJ5idDzeIMjpcXLASunA72UN0mykgBg0VV/IcBb68gzoyK
         eTP4rDdp4OAhe6LPnPQZKGjMFlw8IySEDjfniVwuKg0c+GU5XCU8+o25QbGof1DAupVW
         AQeMHvbwcbzK7FBGmxisQXBzLRUJ/n3e1A02vXAzMBvy9RCPc6Va6fiq8pZduRG81Bgc
         y4FWpHGukJZQ24XbwU+ys0s/t0nUyHG9JyyySA6uKnZ5sMEDsn/T4WRInyp1QmLZmP2p
         WLajOuPw/7CW8GVv8+0EOW4QD5Rs69cWWqvcxzc7R/Ln0JXDxakEpYKjRIWdqeUizmR6
         c45g==
X-Gm-Message-State: AC+VfDxw5cSKtXzPt2h+2PqUpBlVEsHhAV81kLOTzfX8owQcM9YNr6CL
	iBGbtx2qLkYhaB5aJdvYhlOem2X2shC/JOpIPDE=
X-Google-Smtp-Source: ACHHUZ7INTCboDgVuF7P5x88qVN9qFFNzPldzh4k7rPJ9MfdaiyaByfTOjR0AmXqcxHKn97c7V0g5Ol1dqw4qFEvjLA=
X-Received: by 2002:a17:90b:38ca:b0:24d:ff56:f8c1 with SMTP id
 nn10-20020a17090b38ca00b0024dff56f8c1mr2301690pjb.13.1686361199544; Fri, 09
 Jun 2023 18:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-7-jpn@linux.vnet.ibm.com> <ZIAXpMpjb3V852rB@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
In-Reply-To: <ZIAXpMpjb3V852rB@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 10 Jun 2023 11:39:47 +1000
Message-ID: <CACzsE9qbRC1JoDFRozspGjxR=nLgJCSE6ygNz-sDfFSDoAjqzw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/6] docs: powerpc: Document nested KVM on POWER
To: Gautam Menghani <gautam@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Jordan Niethe <jpn@linux.vnet.ibm.com>, npiggin@gmail.com, sbhat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 7, 2023 at 3:38=E2=80=AFPM Gautam Menghani <gautam@linux.ibm.co=
m> wrote:
>
> On Mon, Jun 05, 2023 at 04:48:48PM +1000, Jordan Niethe wrote:
> > From: Michael Neuling <mikey@neuling.org>
>
> Hi,
> There are some minor typos in the documentation pointed out below

Thank you, will correct in the next revision.

Jordan
>
>
> > +H_GUEST_GET_STATE()
> > +-------------------
> > +
> > +This is called to get state associated with an L2 (Guest-wide or vCPU =
specific).
> > +This info is passed via the Guest State Buffer (GSB), a standard forma=
t as
> > +explained later in this doc, necessary details below:
> > +
> > +This can set either L2 wide or vcpu specific information. Examples of
>
> We are getting the info about vcpu here : s/set/get
>
> > +H_GUEST_RUN_VCPU()
> > +------------------
> > +
> > +This is called to run an L2 vCPU. The L2 and vCPU IDs are passed in as
> > +parameters. The vCPU run with the state set previously using
>
> Minor nit : s/run/runs
>
> > +H_GUEST_SET_STATE(). When the L2 exits, the L1 will resume from this
> > +hcall.
> > +
> > +This hcall also has associated input and output GSBs. Unlike
> > +H_GUEST_{S,G}ET_STATE(), these GSB pointers are not passed in as
> > +parameters to the hcall (This was done in the interest of
> > +performance). The locations of these GSBs must be preregistered using
> > +the H_GUEST_SET_STATE() call with ID 0x0c00 and 0x0c01 (see table
> > +below).
> > +
> >
> > --
> > 2.31.1
> >
>
