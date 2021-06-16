Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB043A95A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 11:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4fb71cQlz3byg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 19:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qcvIkQTt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qcvIkQTt; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4fZc5f0Dz3023
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 19:11:52 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id x73so1673024pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 02:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KtVdMb/6axa2rNnzxWBctbX/60Uc/ENo0T3/IaoLfho=;
 b=qcvIkQTtpPF0I+gN5iCvyP9ggl5XqSW4PJpsnIoGvVVckTmWiP5TV2ZMxiHaYXEX22
 UPbNzqeQ8J1M5ziNfdgDaxzmWJok/77O5B+CxV7rrkmd6YaWPQndrt1stBXAwytgPrHB
 4FWZYhZdYcoevju4mz/SKTFMGWcVuBvVFL/DCmGn0w0R7sOLtRttU4TPISiHduDUCKaB
 mbIwv+Y4DGyVx6ZZmiRvKCo1R5ELUk/MaOeqSg5c6FWffnYjM2sd7uqJQmHo9lGgX/ug
 oK0Czx1HPTR5BVGzl5c1VT0/f982B/zR+PfkeX5jrpSiCz4Pd4ZbxPi3hcO4pwSlmng6
 DeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KtVdMb/6axa2rNnzxWBctbX/60Uc/ENo0T3/IaoLfho=;
 b=Pn2x1HUZDtl7g38y4iPAG8ErAUKSE0z1xehAd/8DaFmDA0CrjU8pfm1KdkPS4GGbWR
 j13CIG7xWnAz1w5OTbfHW2XIBWEnCsuG8IffzPlfF+NlqhRn0bP2+VcyEWghoSU8tN04
 ziday+PitGv9z84Et5cXTa/gvoEfYWoPfNKlg43z/MsuuTVM6lq0gCqRBfzSQNMcx3JW
 txOHDhhHZiRS/TWPF9qjWyqpwoJndCns27tBgfgc7HrXYgqHCyBeZRYV8cyUjTp/NHxQ
 jMcz5uCIoDWgEdXSeixlMZFqR1STdGi02D3pAgz2iJoxQ0syW7NTpH9iKzm1tyBjmg+r
 XR7w==
X-Gm-Message-State: AOAM532uVHo8alhjoiVHZgIoF/x3hsGTTR2zBQEKWLiOeJap4W0u/NJp
 1w7aA91bLhS6pC89uuHiQCM=
X-Google-Smtp-Source: ABdhPJwg5t3ZzDFtVfbDZtWpDp3zMSLvjEML2ObcV6lg8iOQ5MkRUg0XhWXkRP1aYI1548X+Gpo8og==
X-Received: by 2002:a63:6982:: with SMTP id e124mr3900515pgc.439.1623834708645; 
 Wed, 16 Jun 2021 02:11:48 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id d12sm1576296pfo.113.2021.06.16.02.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 02:11:48 -0700 (PDT)
Date: Wed, 16 Jun 2021 19:11:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 04/17] powerpc/vas: Add platform specific user window
 operations
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <c64fda6e9b684c175cedb3ec448cce7aaf0f4615.camel@linux.ibm.com>
 <1623636838.8tsdy9nisc.astroid@bobo.none>
 <e409750a3bd5f8410d7a8a290c69375486420b93.camel@linux.ibm.com>
In-Reply-To: <e409750a3bd5f8410d7a8a290c69375486420b93.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623834468.xkn6to1dom.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of June 15, 2021 4:37 pm:
> On Mon, 2021-06-14 at 12:24 +1000, Nicholas Piggin wrote:
>> Excerpts from Haren Myneni's message of June 13, 2021 8:57 pm:
>> > PowerNV uses registers to open/close VAS windows, and getting the
>> > paste address. Whereas the hypervisor calls are used on PowerVM.
>> >=20
>> > This patch adds the platform specific user space window operations
>> > and register with the common VAS user space interface.
>> >=20
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/include/asm/vas.h              | 14 +++++-
>> >  arch/powerpc/platforms/book3s/vas-api.c     | 53 +++++++++++++--
>> > ------
>> >  arch/powerpc/platforms/powernv/vas-window.c | 45 ++++++++++++++++-
>> >  3 files changed, 89 insertions(+), 23 deletions(-)
>> >=20
>> > diff --git a/arch/powerpc/include/asm/vas.h
>> > b/arch/powerpc/include/asm/vas.h
>> > index bab7891d43f5..85318d7446c7 100644
>> > --- a/arch/powerpc/include/asm/vas.h
>> > +++ b/arch/powerpc/include/asm/vas.h
>> > @@ -5,6 +5,7 @@
>> > =20
>> >  #ifndef _ASM_POWERPC_VAS_H
>> >  #define _ASM_POWERPC_VAS_H
>> > +#include <uapi/asm/vas-api.h>
>> > =20
>> >  struct vas_window;
>> > =20
>> > @@ -48,6 +49,16 @@ enum vas_cop_type {
>> >  	VAS_COP_TYPE_MAX,
>> >  };
>> > =20
>> > +/*
>> > + * User space window operations used for powernv and powerVM
>> > + */
>> > +struct vas_user_win_ops {
>> > +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
>> > +				enum vas_cop_type);
>> > +	u64 (*paste_addr)(struct vas_window *);
>> > +	int (*close_win)(struct vas_window *);
>> > +};
>>=20
>> This looks better, but rather than pull in uapi and the user API=20
>> structure here, could you just pass in vas_id and flags after the
>> common=20
>> code does the user copy and verifies the version and other details?
>>=20
>> I think it's generally good practice to limit the data that the usre
>> can influence as much as possible. Sorry for not picking up on that
>> earlier.
>=20
> The user space pass vas_tx_win_open_attr struct - use only vas_id and
> flags right now but it can be extended in future with reserve elements.
> So passing the same struct to platform specific API.
>=20
> do you prefer "struct vas_window * (*open_win)(vas_id, flags, cop)" and
> extend later when more elments are used?

Yes I think so. The reason being so you don't sending data under the
control of user very far into the kernel. Better safe than sorry.

Thanks,
Nick

