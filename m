Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4578FC521
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 09:53:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BZMm1UC8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvKT85WvLz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 17:53:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BZMm1UC8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvKSM3Y87z30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 17:52:33 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so447564a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573946; x=1718178746; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lIh0cLxT50JftfUA2rP85KmtIiPU5OgAnjec/yxyuM=;
        b=BZMm1UC8Kssd8LPVtV0hpoJ3G9ndXY2Hr3hxvpP/RFvNTNz4aMicYIpDUdqorOOR0/
         azJTSff01MZrZp+UnncHhkXgAi1oUlAHWcteudc6suqnCxnA4rMb+WJX64fpjX5J89Ca
         jNepOWshDyWlSvHJmnYfQFB00CMsVesJf6A5a7eMPBKEwBkk/i/p9DXANVIoPMuDqfiX
         NWpNyOekkPtsK+fXlDx6F4DzbKRKqvRjMCrWB6T9vdVwBZkWUHUAaycKCtx/qWv7JHHV
         DUgVSaZOj4XUpQnrNVLM51AyVefeRlqKmxP6bXqyFJmwXii7fzQCjKUFzXMY4LM9p5wD
         L/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573946; x=1718178746;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6lIh0cLxT50JftfUA2rP85KmtIiPU5OgAnjec/yxyuM=;
        b=t99CaO96gSbquBKtdhNpH842MQ5ySWXexUNB0AaNChHJH1PTNfDh8w6YLqdX+iM6zP
         sXx5KQtJew5z16ng2+JZpDpNIrbs3h//zvpDtLLllXcahPyxmQHPWbAzNN5d+9lgss5W
         f7pOeKS+9I4FqbLRj9rh4nvLniCk7uhLSwJFkJEJWStzqtnzZWHlVSEd6/UZNQBX+aao
         aK229ZOzycIFpQAv/8EkFpj9u6FdQbL7P8pa+jlimMhuFzNz4z9B0AyvImUzVK9HjwPG
         ozGu07b+wJm40Wi1PO4+3VNn9KoiZYVlhcOzobdCOl3nOo/erPv2xRkyZGdDsyebCuy6
         BwgA==
X-Forwarded-Encrypted: i=1; AJvYcCVfvbv8HeIjdzKqGzcH0YAc3YTV0GhiepBuQizz8E1kLzU3XZp+nOHmVwzi34AEq1oZ9+Kintp3g78KapTm6n0IA2QYwEfXv0Ct1MqcFg==
X-Gm-Message-State: AOJu0YzxBraezTznwzlNqO/1IWURJy9kMTNfh3rsHzr84vFlQYgDkT+f
	RAtvIcrzn1a+0UsHAfDkk82CBobuWV7qRgFHqEgaoiTApicbPtAa
X-Google-Smtp-Source: AGHT+IGVXr6rfnVkKCl0GmHT+vD4oUSiqy+kJKn93c2WNj3b48AyYPWXn64ejBs975pM51aCZ89pow==
X-Received: by 2002:a17:90a:ca90:b0:2bf:e473:7045 with SMTP id 98e67ed59e1d1-2c2530ec9e1mr7144931a91.21.1717573946277;
        Wed, 05 Jun 2024 00:52:26 -0700 (PDT)
Received: from localhost ([1.146.96.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806398afsm798842a91.1.2024.06.05.00.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 00:52:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 17:52:19 +1000
Message-Id: <D1RX5B3PN2W3.26UX3M4SW8MLL@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, "Thomas Huth"
 <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v9 29/31] powerpc: Remove remnants of
 ppc64 directory and build structure
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-30-npiggin@gmail.com>
 <15d6ae85-a46e-4a99-a3b9-6aa6420e0639@redhat.com>
 <20240604-92e3b6502a920717bec7d780@orel>
In-Reply-To: <20240604-92e3b6502a920717bec7d780@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 11:36 PM AEST, Andrew Jones wrote:
> On Tue, Jun 04, 2024 at 12:49:51PM GMT, Thomas Huth wrote:
> > On 04/05/2024 14.28, Nicholas Piggin wrote:
> > > This moves merges ppc64 directories and files into powerpc, and
> > > merges the 3 makefiles into one.
> > >=20
> > > The configure --arch=3Dpowerpc option is aliased to ppc64 for
> > > good measure.
> > >=20
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > > ---
> > ...
> > > diff --git a/powerpc/Makefile b/powerpc/Makefile
> > > index 8a007ab54..e4b5312a2 100644
> > > --- a/powerpc/Makefile
> > > +++ b/powerpc/Makefile
> > > @@ -1 +1,111 @@
> > > -include $(SRCDIR)/$(TEST_DIR)/Makefile.$(ARCH)
> > > +#
> > > +# powerpc makefile
> > > +#
> > > +# Authors: Andrew Jones <drjones@redhat.com>
> >=20
> > I'd maybe drop that e-mail address now since it it not valid anymore.
> > Andrew, do want to see your new mail address here?
>
> No need to change to my new email address. We can either keep it as is fo=
r
> historical records, and as part of faithful code move, or just drop it.

I'll leave it, and leave it up to you to send an update email address
patch if and when you decide.

Thanks,
Nick
