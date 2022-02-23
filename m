Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24C34C11D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:48:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Z6g19Kfz3cN3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 22:48:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kwg+FAbx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kwg+FAbx; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Z5x6wzpz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 22:47:32 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id 4so9756679pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 03:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ctPaxT51GgjUZKsgHy4OVPzHV8cBv3OcsGO1TWhtObM=;
 b=Kwg+FAbxZVnTWRYadHu7F428O4dcBN0YOyEgZRRwsHPlk/nY+JtHUPv/fSW2a8JJwA
 NAjGKUJvXFJDOWcwNYHdvE8LmTv+AtsAcLQgJHG9ZMVEPt4qWxfHn8FgOkGmI3/MHsgj
 tc9HaLKHo+EdF4Hv7sx+4/xz2/ZDmj2bWfPQHNw86ziyRlZjXcpR1fFUIEhpZRiaywQv
 mYdkWpSz0nq9GkmC7ffsP9vgEaX5h/gFAMmmathbDyXos4eFvJmGWC201T1/LL5QWUr0
 Fc1rGZpljGKsCLhAHEX0WikG0GbQmVNxqCbBeTo0QqNmYrs3aGw5zYkei8k+NzKfRo42
 eZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ctPaxT51GgjUZKsgHy4OVPzHV8cBv3OcsGO1TWhtObM=;
 b=gzn1ITLxZTiwXcUGRUOuTwFBTd4BwN7+jPeygbb0NlAOM8yyhjpzLeWJ0BV8NjOKPO
 5mZ8HqNsAXPILeQFlrQ1fToJyia3QCK1wJ+/eyPa0auBgKQzDRA3OiIt5U48paXrGVjQ
 8DVA1qlSkm4mFsL2H7WLAPkCEinrtCI5naydfuVhWo4Qt5sm1fd1CnRxAhpnyhrkpwpS
 g07n1zwTXP6/hUKATGfYNbrqnHMDdvvC1od1seoaQx9Vdva6X2Moc4gyfbPMkGUS2Bmp
 AI9CRrRZ2Y8pN5CsQG5ZpoJNWoyy03rMAwPn7tUlT8CLsxMufjfWgvqNZ/GhylmGAJXq
 5gZA==
X-Gm-Message-State: AOAM53136FKcDYA2cCFHqirhMty9Rs7uZBvlBvxijejw8EI8CDPBMxOY
 +YEQFMAmtz9XVPzaXmo7uhA=
X-Google-Smtp-Source: ABdhPJxFuG2bYEJsCZx/XWDrSbF2z8bmtCw49evuSl54sQAqjMZ7/sOnng/soDadpiu0qWf2ERn3Sg==
X-Received: by 2002:a17:902:b210:b0:14f:d0ff:46bb with SMTP id
 t16-20020a170902b21000b0014fd0ff46bbmr9674226plr.47.1645616849691; 
 Wed, 23 Feb 2022 03:47:29 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id bj26sm23328221pgb.81.2022.02.23.03.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 03:47:29 -0800 (PST)
Date: Wed, 23 Feb 2022 21:47:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 0/3] KVM: PPC: Book3S PR: Fixes for AIL and SCV
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220222064727.2314380-1-npiggin@gmail.com>
 <bf6cf0d0-31bd-5751-4fbe-8193dbd716a9@redhat.com>
 <6b123068-c982-1fcd-d09e-1a8f465147e3@linux.ibm.com>
In-Reply-To: <6b123068-c982-1fcd-d09e-1a8f465147e3@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645616541.qspjukz7s5.astroid@bobo.none>
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

Excerpts from Christian Borntraeger's message of February 23, 2022 7:14 pm:
>=20
>=20
> Am 22.02.22 um 15:11 schrieb Paolo Bonzini:
>> On 2/22/22 07:47, Nicholas Piggin wrote:
>>> Patch 3 requires a KVM_CAP_PPC number allocated. QEMU maintainers are
>>> happy with it (link in changelog) just waiting on KVM upstreaming. Do
>>> you have objections to the series going to ppc/kvm tree first, or
>>> another option is you could take patch 3 alone first (it's relatively
>>> independent of the other 2) and ppc/kvm gets it from you?
>>=20
>> Hi Nick,
>>=20
>> I have pushed a topic branch kvm-cap-ppc-210 to kvm.git with just the de=
finition and documentation of the capability.=C2=A0 ppc/kvm can apply your =
patch based on it (and drop the relevant parts of patch 3).=C2=A0 I'll send=
 it to Linus this week.
>=20
> We to have be careful with the 210 cap that was merged from the s390 tree=
.

Ah thanks, I didn't notice it.

Using 211 is no problem for me, merge will have a conflict now though.
We could avoid it by just sending my patch in a second batch instead of
doing the topic branch this time (I still like the idea of a topic
branch for caps for future).

Thanks,
Nick
