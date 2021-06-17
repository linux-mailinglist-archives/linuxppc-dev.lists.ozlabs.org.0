Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 156D73AA9A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 05:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G572x5WKgz3bwD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 13:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SWZmufYB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SWZmufYB; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G572R60R9z3048
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 13:34:06 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id y15so3879059pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 20:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Np87+P91qpLWwoFgyfj/tVvnbhFOu2PiFh8/7E4oNNU=;
 b=SWZmufYBXINix7/MHI629etAmmtBCT21x/eT4irvwjM8HUG0nFjwyMcXibhj4ODnG4
 3MkPm/nYtVj1kXUdjUS9UZ02EU+htVQUFF8zowNuTWzjVShPVCWWBnWSdp8g48fIJ+Nm
 eMrm6zLpJYTtfJkFcaMVTSur10oBYr/K8xXJ5Kysa4o0PaqEJumDh/7+3rBGVgHY1o9Y
 8ybsNypepRxESJOycWNi+AluTbvQgjb/UuQfS05zkJJU19CGmsozLRReDKk7GzoLRQUb
 sYtqsFCJMVyFmUnGDevw3Pjvwv0wk1KWnmbhPTvTicMKdQNPsO9lsDwECOo4oRokM9Bz
 fu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Np87+P91qpLWwoFgyfj/tVvnbhFOu2PiFh8/7E4oNNU=;
 b=Qb9rG1C3u/HtSnBO6byhxr8ECPU939AYKyQ6ncx58EvzwZYSpHeLwO/gh608HTQFdK
 /J2WX8mQgNd61YWTpRu5UtQkPLydDMkp0834NhdZKEN8L4dCYdhnSom7eAIAKCkKQX3z
 ckM6h3tZh+CnV5OtCUNkc4pRZqLJipHWaJzWvaxf0tIM3Fr48+uKu5CDTQtQuGVcwqjB
 Sj7a0yvLUuleedMlYaqgE20Kmfq313AMOoW6eQSOYWKHbbGzdgYEzpE5wMRIRPNJO/0M
 /m8ztK7Zp03TD390wehtN/S5o/j957OWP6zRli8qOJXOLMjw3FnMdZlmDTVw1xsw2g+P
 B0Lw==
X-Gm-Message-State: AOAM532zpg+iiJmTO/Mf+90VmQ3g2sBPUx4y6pbUyxVjKKgmM87T364+
 QcrTDa+ktaxfpvKFYRr0BrI=
X-Google-Smtp-Source: ABdhPJwaKbkscV5Os4TdY4LLC+vm6rH5DiyJ0bLZ8Qywlo8VE6hK0awThMofSNj3Ak+GdCXhUiNxmw==
X-Received: by 2002:a63:6841:: with SMTP id d62mr2905034pgc.7.1623900841294;
 Wed, 16 Jun 2021 20:34:01 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q4sm3609641pfh.18.2021.06.16.20.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 20:34:00 -0700 (PDT)
Date: Thu, 17 Jun 2021 13:33:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/4] powerpc/interrupt: Refactor
 prep_irq_for_user_exit()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <809d316bf5f1a81acdd69e220c13e716dac24f53.1622818556.git.christophe.leroy@csgroup.eu>
 <3fbef68e1cffc0ebbbad1893e4fb9426b0915039.1622818556.git.christophe.leroy@csgroup.eu>
 <1623378421.ayihg84s3a.astroid@bobo.none>
 <4f21c7c2-d04b-dcb6-09ad-562a2c3cf88f@csgroup.eu>
In-Reply-To: <4f21c7c2-d04b-dcb6-09ad-562a2c3cf88f@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623900771.37yjadhzel.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of June 15, 2021 6:37 pm:
>=20
>=20
> Le 11/06/2021 =C3=A0 04:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of June 5, 2021 12:56 am:
>>> prep_irq_for_user_exit() is a superset of
>>> prep_irq_for_kernel_enabled_exit().
>>>
>>> Refactor it.
>>=20
>> I like the refactoring, but now prep_irq_for_user_exit() is calling
>> prep_irq_for_kernel_enabled_exit(), which seems like the wrong naming.
>>=20
>> You could re-name prep_irq_for_kernel_enabled_exit() to
>> prep_irq_for_enabled_exit() maybe? Or it could be
>> __prep_irq_for_enabled_exit() then prep_irq_for_kernel_enabled_exit()
>> and prep_irq_for_user_exit() would both call it.
>=20
> I renamed it prep_irq_for_enabled_exit().
>=20
> And I realised that after patch 4, prep_irq_for_enabled_exit() has become=
 a trivial function used=20
> only once.
>=20
> So I swapped patches 1/2 with patches 3/4 and added a 5th one to squash p=
rep_irq_for_enabled_exit()=20
> into its caller.
>=20
> You didn't have any comment on patch 4 (that is now patch 2) ?

I think it's okay, just trying to hunt down some apparent big-endian bug=20
with my series. I can't see any problems with yours though, thanks for
rebasing them, I'll take a better look when I can.

Thanks,
Nick
