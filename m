Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4091CAFB4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 13:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Szyk5TLkzF33Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 21:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="gVILecSB"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Szwn4CpJzF31l
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 21:20:56 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id y19so24088528wrd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 04:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yEm/6Jz34sEd/TPS+tNQ49kUmKwP86ymVLNzLiSgWtk=;
 b=gVILecSBs6QnwsZ+tVcGKZJzUcdF/4UK/rFxniUgqk+meB/ggS8jm3zvQ5AJCIa1vz
 sDvsgTALWTwzFP8qBeo6KtR11dRAVTEe75Ub4+kCj+RKEGe/e5XPTjaPN/ISbMEiJAmb
 yId7phTTN7WWQGvCZrBW4kWBwVd60Bf3vZzwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yEm/6Jz34sEd/TPS+tNQ49kUmKwP86ymVLNzLiSgWtk=;
 b=Kj0YZa4/i4qvYV57qsbQ3KOzR+LpT6bmY8hMrVNeTgt9FKgaxc1W6yLNGVEF6JTqlK
 1JHp4id1uzCokVNiTS0QklTGTRav+KCfxDb7NYZbj8eqfl9bLSzA3X14vNWUWP3mGCTn
 QtSH2v0wyfJWuCwJUm+kQme+aXPNT79Va9a8/6hZtDcPoHZx6JDPFp6Jp/XN/XcuxpNF
 9oV6Q2QQ7Pa1uDA7W1dtGbE5yQkYxq85Nxp6DBHeU62sG5Rbj7Kytj/58kTg0wS6GAC2
 zcfKIWU/1m+txNc8SO98MRX7lFsSfSgPdH/S5HrLC6QWaUFAbtloKIXjdP65PwW4pMyw
 smeA==
X-Gm-Message-State: APjAAAWa8lgcG5YiCweUkHGgN4FHSUXC/z7vUzpbkj8yeAM+YY0bqEfz
 dpuJvwsh9ZMCzB6ablAbyOv4uQ==
X-Google-Smtp-Source: APXvYqz4mviNdySjKkAku5DXmhzwzhVEEIpdN3y03EfYJn20mk48h91uhFgTy4RUInZl9y0ayE/Tmg==
X-Received: by 2002:a05:6000:1632:: with SMTP id
 v18mr12353420wrb.233.1568200850794; 
 Wed, 11 Sep 2019 04:20:50 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id r9sm35678905wra.19.2019.09.11.04.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 04:20:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, x86@kernel.org, aryabinin@virtuozzo.com, glider@google.com,
 luto@kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com,
 dvyukov@google.com
Subject: Re: [PATCH v7 0/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <d43cba17-ef1f-b715-e826-5325432042dd@c-s.fr>
References: <20190903145536.3390-1-dja@axtens.net>
 <d43cba17-ef1f-b715-e826-5325432042dd@c-s.fr>
Date: Wed, 11 Sep 2019 21:20:49 +1000
Message-ID: <87ftl39izy.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, gor@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> Are any other patches required prior to this series ? I have tried to 
> apply it on later powerpc/merge branch without success:

It applies on the latest linux-next. I didn't base it on powerpc/*
because it's generic.

Regards,
Daniel
