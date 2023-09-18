Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2287A521A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 20:34:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mYkXWIBX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqD3t3Wybz3cGL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 04:34:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mYkXWIBX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=grundler@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqD303RxSz30Bg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 04:34:03 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c4084803f1so25025ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695062039; x=1695666839; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKTgwH+a7GA+sqcUVWql5MlsB+4X33g9465h/429Hc0=;
        b=mYkXWIBXp7j+ELcXMTje7F34CSouBmp7NYXYOpMpmf7YPTR6bXOJ/ojwkJG8UD/D+D
         Sj3U8l1bZxo7AakFqZhRUtEpD7hQV7Yhw772j5A3JmB5fGKVXRIveW1kxgRMjqmXx6oV
         Al2WpzpIuTDFjYUQS+iM8pAQ/xGQbVrLosyAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695062039; x=1695666839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKTgwH+a7GA+sqcUVWql5MlsB+4X33g9465h/429Hc0=;
        b=Q9xUPu1Ipa8MaCFJzfmJGYwxLTzWg+Zda7fuMWPnKY1kGFiNvdYaBJp0S0IkZeFLY2
         0AiyGp8XdHRawbRXs2eKZ5JthxOElEkVSe5DJpcN0rpBf9pzxK5xTz5cJG4BglQYqLd2
         jvfUpY9xQL7fEWCbM1bkJvYRc9dddVrBkwCXUgiqxjvcVuUgyAx9WY4pRLGSxcp608Wj
         HNWTz+SDf/63J1LxATx52Sp2uxjcMDckGeUObeyXHjcoPok2VetlihqMqA0peU+ofQge
         B9QQa7LRqVroj9ZZXLrbqIzfzMJhWqxtlrDSmCcYqQohYppZvWDtawgtD6x3CxHLnl28
         ZEmA==
X-Gm-Message-State: AOJu0YwFiPfBP+pkK2o/9OP/xWwRY6UYLPs2Sufgc6OWqZ2k9KagbuRo
	X/OehdD57Nxkm3lAB48vgJz9mh1RQNOiMEQpMBFcnQ==
X-Google-Smtp-Source: AGHT+IG9iiAMseb4ZhGyHZ3N9oA8N0efd7OyAIeu0TwA2wzqNBLYcNnR5qYso1PzbWQf4f8ZoUvyOG8za+GE/Uy6LvY=
X-Received: by 2002:a17:902:cecc:b0:1c5:59ea:84c3 with SMTP id
 d12-20020a170902cecc00b001c559ea84c3mr17897plg.21.1695062038771; Mon, 18 Sep
 2023 11:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230606035442.2886343-1-grundler@chromium.org>
 <4fa1e0fe-eec4-4e5c-8acd-274a039c048a@ixit.cz> <CANEJEGt-6+AGGSdZb9OTv3UrBn1fFFqk=A6TdYjBsq4SqTTxsA@mail.gmail.com>
 <3c3f9a2ee7f9effe7cf9d1077652e85de0eae66c.camel@xry111.site>
In-Reply-To: <3c3f9a2ee7f9effe7cf9d1077652e85de0eae66c.camel@xry111.site>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 18 Sep 2023 11:33:47 -0700
Message-ID: <CANEJEGtSFAGEvKS0fJd_5OapXGeyWDZeJQYVZ7X_+wUOXBSK8A@mail.gmail.com>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as KERN_INFO
To: Xi Ruoyao <xry111@xry111.site>
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 4:42=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Mon, 2023-08-14 at 08:40 -0700, Grant Grundler wrote:
> > On Sat, Aug 12, 2023 at 5:45=E2=80=AFPM David Heidelberg <david@ixit.cz=
>
> > wrote:
> > >
> > > Tested-by: David Heidelberg <david@ixit.cz>
> >
> > Thanks David!
> >
> > > For PATCH v4 please fix the typo reported by the bot :)
> >
> > Sorry - I'll do that today.
>
> Hi Grant,
>
> Is there an update of this series?

Sorry, while I had good intentions, my work has completely derailed my
attempts to make time for this. :(

I'll give this another run.

I'm also not offended if someone else picks this up and improves the situat=
ion.

cheers,
grant

>
> My workstation suffers from too much correctable AER reporting as well
> (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
> Generate Correctable Errors" and/or the motherboard design, I guess).
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
