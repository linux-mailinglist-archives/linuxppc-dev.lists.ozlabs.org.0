Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1F956A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 07:27:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CK6j52TlzDr0d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="si+u45hg"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CK522Q9MzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 15:25:42 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b24so2653760pfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 22:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=07F27dbHjSBFW0Vf6s8eng3hyA7KIJPp2tEKV9Na+B8=;
 b=si+u45hgKxelZNfJ3k7rTcsYC78FVhGEB+nqGTaGfZWE1XdbxONmhZ3wdoiGokdLej
 xPBvzpNdvFjHDGXSpSrOOJFb8j7S7IfzVB5JX+BrgvYq7EyW7Xgltx4oWuWGSSOI4fd1
 thcVaLqCuo901VaqbEEXZK1HQE5H4imCPWF8DiatdTN5MEBtL4+701gjYeklQjDiLImj
 97YlKV80PFMnRuo1DuF+OOq+k2i9qCySSvMYX67j3FQbmmzN8bFMNogNi3Z7oAlhbw9c
 WXVy39eoQnOcn4dW5JjFirqpMHV4aBSELkofAkvPWHiTPHPtdC7bEQGytk3dKqYKDgYN
 +GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=07F27dbHjSBFW0Vf6s8eng3hyA7KIJPp2tEKV9Na+B8=;
 b=jjb1ttbrzFJ4ZOv7Dn9rWj1Q8eSHB5DeagBRmPVSPuCvsqPcj/uxDRWvxt743xyQK6
 QCsI86TVlnX4I/4sySAhKEYoLsP6jv/HdPdHkOWW+hwk4KaKgFUAgijtiQ6FymB3loO1
 rPn/FCiFIIzfsjopoHzDj4nHOLJOw7CqTLfojfsBMoxc4J8/q9QKSa0xBTbfKsEAKV4u
 rEymbKs6GnEDre6WZwUz6PykfCrQQIT8euBfIO6S8zjXzFz0b8kdVTtLX9okVAHpTf6H
 TmSOiLFd/FNiN2Bh31CE2rQb/VRxC1UlHKb2jClNsmbPoiDxy0UJ22kaAJz0PvfDjcD5
 q/Tg==
X-Gm-Message-State: APjAAAVrmxDGvTxAN/bXnYZywDJ7zt8RRY97u5j1qaT+gakd4EvH84QE
 Db7PReXBlwpr9Vnp9T7rgjm8Th2a
X-Google-Smtp-Source: APXvYqzp0TSfwd//bEnY7J3noJ0nGbh2FfRovnzKiTocEzqsAP1DqdSqErpbBT4YCBBTP8obuAl+UQ==
X-Received: by 2002:a17:90a:fe01:: with SMTP id
 ck1mr24235962pjb.89.1566278736580; 
 Mon, 19 Aug 2019 22:25:36 -0700 (PDT)
Received: from localhost ([193.114.104.176])
 by smtp.gmail.com with ESMTPSA id j20sm16416267pfr.113.2019.08.19.22.25.35
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 22:25:36 -0700 (PDT)
Date: Tue, 20 Aug 2019 15:25:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: remove support for kernel-mode syscalls
To: linuxppc-dev@lists.ozlabs.org
References: <20190820051106.15744-1-npiggin@gmail.com>
In-Reply-To: <20190820051106.15744-1-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566278548.kqnmyauasd.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Nicholas Piggin's on August 20, 2019 3:11 pm:
> There is support for the kernel to execute the 'sc 0' instruction and
> make a system call to itself. This is a relic that is unused in the
> tree, therefore untested. It's also highly questionable for modules to
> be doing this.

Oh I'm sorry this is not 64s, it's 64e as well, I just realised title
is wrong. I actually haven't tested 64e either.

Thanks,
Nick
=
