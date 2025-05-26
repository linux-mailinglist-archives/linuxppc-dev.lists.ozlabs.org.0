Return-Path: <linuxppc-dev+bounces-8930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6806AC3ACE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 09:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5SNz0lLxz2xfR;
	Mon, 26 May 2025 17:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748245251;
	cv=none; b=dSgbaHHos44l3Ifm7J8l5/oWh9AdtN6NzyOxTyE5tW5fb8GIfh0Gl59tj7Aw2mtXQFWJ1wIR4y8vxBZ34psfUnmWiAijfvxMogEK2kJ4HC2mztIfZ4aaOxMP/Nck3MJJl4sSAOmAYXILoGYEszryU1JRw6qNqJfJs3NtGIVN4XwINqU1JjdDmSZbV9O4cHYuTmHkcNEvRqNXpZuF9rcENggTPBxoRIESHsKd+G570SKS1iWghqA2YVCTzVqT0sHNB/MhYZF5bS1O2ijKMnz+3q/An+7O34QKiY2YNfdL+EX/rQROgrLwy7yUutWhU+/ZLCZqlaHQeeO8d6dGJWi5wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748245251; c=relaxed/relaxed;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsNx+CYdOjvH0WXgZpDlhC5mA5aC4AIQW4bZ/e5cL8HO+GkWrOORZkoD/N3KnH/6z5ER7dg+d5xcoZDyiIHeKopvTfmydqDVkiQUTMJM1puBi4wGisIiAvqLpAFDStrqu1P/GWSHhH/CP+frSu7AiSsl/GuFe5eSLq+DyBWlEMXZu0LvFqQCtlr/43EbalqvuUAiNKBWwg5c6y3mPJXOEIbNPGqCO0fzGXTVK9ufzyJxtaAbKfmU6uNtDxA2L3qfZ+tNnqv/MpIFjdl7NpZQk6cdbTX50DR7C++2Q9HbChxAmZq9C202OlPOBWfOGl8HGolYrzK8TiJSSObOW1KIJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DXCAw5Wo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VijT8Nqr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DXCAw5Wo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VijT8Nqr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=sgarzare@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5SNx2d8Pz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 17:40:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748245240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	b=DXCAw5WoOTzr9Wv4/UOm06HX+g1MjiDC29VlzhEU6OU+EFjEIrB7miPGpZHMFUUi+xmUso
	m/TX0jZwebJLgRaDSPfcsWk9rcgiMZdLnvGGNELv2YZ+VcSj+enQT1P7q50n82S7JccXPC
	VQsx9i4J7JlrWwRdXNAaY3GJVW07pUc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748245241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	b=VijT8NqrO6pMaWui/GbQ3W3LcqLqIylGD1VKTIklJCU/Wtyqs3Oo6XTxCZPyALsFsOTIsl
	Yi98bz3hTuzRiIJCJb2iVV6JBAl7Y0hBJ4SlZED23pG+W6bSNdfYqorISUfr/yVcA6UuL7
	5bqlVfIm5qy6jOzVtYXQhFAYau/SDDQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-AtLB02yENA-UrmB9BUbDlw-1; Mon, 26 May 2025 03:40:36 -0400
X-MC-Unique: AtLB02yENA-UrmB9BUbDlw-1
X-Mimecast-MFC-AGG-ID: AtLB02yENA-UrmB9BUbDlw_1748245236
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e7da24c05afso1254050276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245236; x=1748850036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
        b=ZGpy4PJxSp0rwyQyVpJYBHH3LRcbWN9XZG6FfHV/23kiIOE1qXKzS++eb4PzD+yXYH
         V+lGFY4OBDd+bT4vduSAqkMeQNDWt9WZ5hPb89xs2x+cJ2l72909M9VUSXxb98Hqb/Sn
         QnTNZ4J6zu/PNf5fRGRd+NuTzZKgG0V1QvfEcE5zMiicCOq+w086jvOL7P2I/aPag2y1
         hds2lJqhSt+sePEghAosheAnrbxP49kOdqCtNayuRcAZhUude1iqtSljXt1oROZFXZUW
         Y5RT0XX++FBTL8aWonSQuSMFeQRqD4liBxEUzAVmsZRDtBV1881JTJCO81bFJgz7m3qm
         /EBg==
X-Gm-Message-State: AOJu0YyLzerE/ehEFxgbysMJYs1VDIaPSL0hVUpK60ZHezX15giJJcDD
	T38ISrUNpHbd0nlU2xoXpkgV0WrUETRtzCTnCEYhGMkyn/r6VM9ALl6V2/aXdQ/UmPnGhjXzi6z
	a/p65DWQaWosrGqFZ5ff8gf2N2Ab+Hv3vcxQk0jPM7Xr15u2Ry/OoSjw/WkWo2y77HfR73Ek84t
	Lyg/F39NwuucGvIAbzn1XsrD6GNp9khAI1fan6FBL9bw==
X-Gm-Gg: ASbGncuyJk2N9VIbZaFC71qpJi18ZaKcwmfAvNW5pOBFmVOBvIRATi9LhLKm4QTvcAm
	k8gsqJGFEhfPAXgx0hEAmxZPiEOPalK5a58giZ+iMmKd1FU/T2svT8cEWFLiWn6A27hc=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id 3f1490d57ef6-e7d919ff94bmr8974763276.3.1748245236235;
        Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7Pp/XoXNFVlvnyTUc1K1XXQydWSpcpTrFXtXpr4SnhnenRHHP8SHUydPH75wP5FH91MrTTW9j01EIYlJd6g=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id
 3f1490d57ef6-e7d919ff94bmr8974742276.3.1748245235915; Mon, 26 May 2025
 00:40:35 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
 <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com> <aDCb-wkHGoLQ-IGg@kernel.org>
In-Reply-To: <aDCb-wkHGoLQ-IGg@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 26 May 2025 09:40:23 +0200
X-Gm-Features: AX0GCFsNxPiQg4uBSQzNKiQ-b9RZogg3WHbWdCxyQyCynKE3SGVLrqvJ3a7shh4
Message-ID: <CAGxU2F7bS7LsUTVihKdFu2UE20-HfqGk+T8j5fUaX=wMu7R1OA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _2Aq1kwDFqbtRHF3K_x7c8beG_0HrbbT0QTYlz5jnwA_1748245236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 23 May 2025 at 18:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Thu, May 22, 2025 at 10:26:34AM +0200, Stefano Garzarella wrote:
> > On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > >
> > > On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > > > I tried, but the last patch (this one) is based on the series merged
> > > > > on the tip tree, where I introduced tpm_svsm.
> > > > > I can see that series in linux-next merged with commit
> > > > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > > > but I can't see it in your next tree [1].
> > > > >
> > > > > How do we proceed in such cases?
> > > > >
> > > > > Just to be sure, did I use the right tree?
> > > >
> > > > Thanks for the remark. Lemme check tonight. Hold on doing
> > > > anything ;-) We'll get there...
> > >
> > > I just rebased my branches on top of latest from Linus. That is what I
> > > need base PR also on, and:
> > >
> > > $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > > fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > >
> > > I'd use git cherry-pick on a range to take them from linux-next to a
> > > mainline tip...
> >
> > I see, let me know if I can help in some way.
> >
> > We can also wait the next cycle if it simplifies your work, definitely
> > no rush on my side.
>
> Let's do it. At least it will then get a full round of testing before
> ending up to a release.

Sure, I'll send v6 after the merge window.

Thanks,
Stefano

>
> Thank you!
>
> >
> > Thanks,
> > Stefano
>
> BR, Jarkko
>


