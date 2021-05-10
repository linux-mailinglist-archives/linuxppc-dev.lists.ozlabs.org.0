Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D30A6377B95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:38:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdqb66VBgz307Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 15:38:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XQ+XbY+e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XQ+XbY+e; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdqZg4Yjjz30BP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 15:37:47 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id p4so12878542pfo.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 22:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=pGYundZh3DMkJO/27D5JZK0KI0HXvrAdOMOppV9+t9g=;
 b=XQ+XbY+eazUK4qe8iY755dRv9YEe8GiiJ5wPzdyI96Ciwesg8GtfETlGk3gEnXP7kF
 ucGMcC5yxabMLfPPEKLA5Cw8LXJWiNOJ73EqIxMW9wLFgJyMatF1NgJeWaYDvVgV8ddw
 qI0dtd1LnUN11azGl9Q2DNozWxRP8yNnZ5TOuqZE9H1G8VAx+zd6XXYIQ7V1cMgqsFWf
 Zhv4GcwyWc+ofocW8E8AsmK9UkL+JKonJWL/szf207uFjlzIISF94pgKduvNnMLYLm8N
 eqXqbLYZ0F2mG6EGpkcJLmES/lVQnKWFU/B/qx+JgXd6jY3efQiow2hP02K76QRI7obB
 jIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=pGYundZh3DMkJO/27D5JZK0KI0HXvrAdOMOppV9+t9g=;
 b=ZdME1yCX511z3frGIwzjCBIkPs68MGKKtuUju9Wjq8HrhhOgdKEdq+Yr8BX92Wdn0J
 XWXr9/4Xoh5hMcI0moyuc8Ks4HHafyB6YBh4eo2dl9t6iJn6k5lfoXAL9ao/XlSJAXd6
 WVfp2jRl4SFvTWWPs7tDXYUMJbF6m1Qhmk1SD9fi2erpfrSoQTCq1vgzzjAp5CmUVd9z
 rEGS1CtE+2MHxUzi6imxh2LCzqP3G3xkMvT7/ldirab32JCr79ORLNOJB9DfbqjabQxq
 VIH4xtG1PCHbd0nhclJPN/R7PaQUTytdQZ2J4ijVAWFue/FN8o4Wpegn7FWI5ssA23Xo
 wYdw==
X-Gm-Message-State: AOAM5314eco0yvxMWuR8OzM4bEAlBOVC9yQA2dRQq+pgCd61sd3IqEZ1
 dHpfqANheOMKEQX10Ri7gEcNrsGkbZw=
X-Google-Smtp-Source: ABdhPJxF0/bbM2o8V0Qg7RAgNBJ7jcdJM6pJxcim7Dfi8jAEWTN6O5/hlt0JwcmSnKKIeshmiuMtRg==
X-Received: by 2002:a62:1481:0:b029:2c1:1e90:c54 with SMTP id
 123-20020a6214810000b02902c11e900c54mr2559336pfu.55.1620625063877; 
 Sun, 09 May 2021 22:37:43 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id l21sm9949324pfc.114.2021.05.09.22.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 22:37:43 -0700 (PDT)
Date: Mon, 10 May 2021 15:37:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3 PATCH 05/16] powerpc/vas:  Define and use common vas_window
 struct
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <293d2b3ba726c8e2a61ccca52165c4fb1e9e593e.camel@linux.ibm.com>
In-Reply-To: <293d2b3ba726c8e2a61ccca52165c4fb1e9e593e.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620625034.ib9vm2fvp0.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of April 18, 2021 7:04 am:
>=20
>=20

Empty email?

Thanks,
Nick
