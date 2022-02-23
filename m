Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386034C0CBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 07:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3RNZ3Kp4z3bbb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 17:44:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qFAQSLgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qFAQSLgS; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3RMw5j6Pz3bP4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 17:44:10 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id z2so9139955plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FibZ6lkCwiToTIV/NTWDV1xpOjz/kVQzk1s+tMa1Lh4=;
 b=qFAQSLgSAYx3HF7b518sa97AMGYAn4ihA4J9WNX6RDPE/my/mLgDKXQnu6b5MLdiDC
 QhhmNsg0mcLcHs44Hcsjp6YdhsPbSdDIJhJnlpJf02qnXXKTMdsH8WdmQDuk58re6toM
 DAM68cPPZc7P/MEIXepzou7K5Fg3lvBlTvyFLjXwTMWVzHoJYF0Kh7yRkh0LxuE2ZPH/
 JAtv/y6QYD3ww8TY5CKO9UGnXeczHf555zvxlznay++n/teDw6nQq3zAXjFeIqqRflxS
 GJmVPAYCk7+pimUMmn4Dup/vz5juUjYUExNAEMqvwh3Wnfq3Zsb9HC05b3kq5Try/Fl5
 TUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FibZ6lkCwiToTIV/NTWDV1xpOjz/kVQzk1s+tMa1Lh4=;
 b=z2il38FsPauCcgMEVLhjuNFmnE1pIIqhvjs07JjslIIa92XA/4NSbBv6pQvrkTo8I6
 acb8jPa5jV75PUfEnmcFOGLDOMpnkTKH2aJK49cMuWd15nCtfq/NzRxuvCaqEwcZLK35
 p4FuI762P8YwWtYSeWewbU3h1RaAJ03uBqTGsicJ0+DLqdulIRwTV0ajc2SrI9SbsAuW
 gwuqEoAPhJqleNDszgnbhooEVzRNTVoeO/Fc8pgGWORVz3rsjQ0aFOh+5b1onQC4Capm
 jUzVAq4L0wUYCXhMMarfiXs9/PPeWF1cxxqQ5ugOsOof9rV4qrk0S7IA7f+sIByx2lNC
 TKlw==
X-Gm-Message-State: AOAM532aGe4NzEHaUC4R6hh6wcjanGziYlFmXR6I9DR79nSjTYmv7iCQ
 Ay0BJv0+A404asQFStwLPvZlPHvfnw6Whg==
X-Google-Smtp-Source: ABdhPJwxLNkCduIs5cJFAQHaTPZ5zK5ESIW3mhmQh0szDO3aD6UE2vECv9LbQ7W6CE8MX+5t1KyweA==
X-Received: by 2002:a17:90a:7885:b0:1b9:b61a:aafb with SMTP id
 x5-20020a17090a788500b001b9b61aaafbmr7874638pjk.202.1645598648283; 
 Tue, 22 Feb 2022 22:44:08 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id h26sm23268961pgm.72.2022.02.22.22.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 22:44:07 -0800 (PST)
Date: Wed, 23 Feb 2022 16:44:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
To: linuxppc-dev@lists.ozlabs.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220222064727.2314380-1-npiggin@gmail.com>
 <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
In-Reply-To: <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
MIME-Version: 1.0
Message-Id: <1645598075.5g1cr5hdzf.astroid@bobo.none>
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
Cc: kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paolo Bonzini's message of February 23, 2022 12:11 am:
> On 2/22/22 07:47, Nicholas Piggin wrote:
>> Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
>> happy with it (link in changelog) just waiting on KVM upstreaming. Do
>> you have objections to the series going to ppc/kvm tree first, or
>> another option is you could take patch 3 alone first (it's relatively
>> independent of the other 2) and ppc/kvm gets it from you?
>=20
> Hi Nick,
>=20
> I have pushed a topic branch kvm-cap-ppc-210 to kvm.git with just the=20
> definition and documentation of the capability.  ppc/kvm can apply your=20
> patch based on it (and drop the relevant parts of patch 3).  I'll send=20
> it to Linus this week.

Hey Paolo,

Thanks for this, I could have done it for you! This seems like a good=20
way to reserve/merge caps: when there is a series ready for N+1, then
merge window then the cap number and description could have a topic
branch based on an earlier release. I'm not sure if you'd been doing=20
that before (looks like not for the most recent few caps, at least).

One thing that might improve it is if you used 5.16 as the base for
the kvm-cap branch. I realise it wasn't so simple this time because=20
5.17-rc2 had a new cap merged. But it should be possible if all new caps=20
took this approach. It would give the arch tree more flexibility where=20
to base their tree on without (mpe usually does -rc2). NBD just an idea=20
for next time.

Thanks,
Nick
