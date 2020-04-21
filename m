Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044211B2866
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 15:48:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4964dm4CTRzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 23:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fQyXbJZ4; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964Y64dRxzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:44:10 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id w4so7793033ioc.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sPfBvq/n3vTz/kJ2DUkeMcpcV+Na4dhwXrNFcf9zH4c=;
 b=fQyXbJZ4IBEWkP/bdhtRwYUJUyQ0QJnF1Bb8f3of8yxd8ucr8UU+FTlvyoiYxIWzxo
 NQKQCkVQWRv76mDcDKhDZEfFfi6kYNzbPwa4HgPt8JvMoUxE3KpSFqDrZvK41gKybpJG
 zaxKqxrkiLVmaK+94om70VgXPxkKyqWCnPqxEtgyaL1RLXcWyvmWw7wfVRqQmjdS43er
 iMxuXXrsCwoFS6hAlymsfQfTCsXbO0HMd7M6M6CNNyk7t/Kjk2cOCszE7sfqEjBSZXW1
 g1m21BNDn5VbS1z2vfpxWNC63rg7k/IjjF4j680C9GslztsSyKI7MOeXuHNz3AjuXc5r
 I89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPfBvq/n3vTz/kJ2DUkeMcpcV+Na4dhwXrNFcf9zH4c=;
 b=JQ87A4C2xeaPvrfxlcQOll66el5Byd9bsXb1XKr9x7bXlm1sol/OIs6PUpwyMeuRB8
 Cj8rXnd6ViVlEslq+u2NWNPYcF/Q8OBHgtqDIJg278K7r1KZUXcNnR/1iD7tfnlAxMIj
 FyigPNA1BJsO3GrERwhIhNUtmuudamL0mtBZAc71XQzLcjMc3kJQvZK7hVnoQQT9IdoK
 Li4X5cQjLa0V8QP3Heqi+QMTR7rxja3Bw7+I9zESPLe4oFfy6/TW0/BnoE56a9+N0cRK
 5j05PxfhD6WvMxHVOLg8yQ8PpGi6fGW2H037OmMbNoaNHpaw9M+BJrNGNm+TeB/2iUqo
 IITQ==
X-Gm-Message-State: AGi0PubaOKVuGI8+39wDb8loPqPufbhOA2okfRhcRXcOIF8pBnX3a6Ad
 TgJzhMuGOjGqTxn6bIk4PGInDAICXn/PEpNfxKQ=
X-Google-Smtp-Source: APiQypImmMB49AgGl1BnBc0wcKFgqit9q6XYYifrmzA6W040jedeCZWXN8p6VY69AT0qDUZKGUxJdWq4qHdmn/56g6U=
X-Received: by 2002:a05:6602:2cc4:: with SMTP id
 j4mr20392563iow.144.1587476647207; 
 Tue, 21 Apr 2020 06:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200416162715.45846-1-ldufour@linux.ibm.com>
 <87k129gdx8.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k129gdx8.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 21 Apr 2020 23:43:56 +1000
Message-ID: <CAOSf1CF2YEG1U_1XP_Vvk3Bn1RCiNa1DAKEbemWu00JimoPsUQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: read ibm,secure-memory nodes
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 11:37 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Laurent,
>
> Laurent Dufour <ldufour@linux.ibm.com> writes:
> > The newly introduced ibm,secure-memory nodes supersede the
> > ibm,uv-firmware's property secure-memory-ranges.
>
> Is either documented in a device tree binding document anywhere?
>
> cheers
>
> > Firmware will no more expose the secure-memory-ranges property so first
> > read the new one and if not found rollback to the older one.

There's some in Ryan's UV support series for skiboot:

https://patchwork.ozlabs.org/project/skiboot/patch/20200227204023.22125-2-grimm@linux.ibm.com/

...which is also marked RFC. Cool.

Oliver
