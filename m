Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B03D3187BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 11:06:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbsjp5MFBzDwn2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 21:06:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p35Rgaoe; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dbsgp1vqmzDwmZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 21:05:06 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id x9so3058900plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=6LL6HEN/TlIvgjV/qKDhMJslAnmqizgu+vOTXyLuIe0=;
 b=p35Rgaoe/NHzNcM//KvM2suJwdKoGxwyruZkUwP7/rBRzL6qGUex30LwZjonYIYVVM
 olRdWmBoKpOUDcUIHLlviqP7cQhkV72X1Z1LSjDlZZ2AY2kZuhoNARwR63ePu1iclq4+
 0lmqreZ3NBi28ZdDjQPSYWjhu8hMP3Qu0L+7vRfyd/7GrDnGuJYPvic2faoCIgNsCD9E
 DpW4zTOzFqQv635bnW4w+vfbL6M1/ECRZgXlus2Hw/MLc1F0RRjXThszMn1FLrFakFX/
 YOZC+g2WSazUT9PbfxwkQwWeRcMGqsh/3+DIRzab6kk+4v3FKZ0W6Fe2rWAzezQNa63P
 lymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6LL6HEN/TlIvgjV/qKDhMJslAnmqizgu+vOTXyLuIe0=;
 b=Jy+7gn5txwvFoDh3R37AKiIQHlVpKmcqCoY18laYvP1+lxbqF3Fpe77Z5R/ko3C8Z3
 A8siYht0AtCziRisP2Kwi5QEv45+KRgwhUeh8fTwI/lcQWMge7FVLOGiShH00WwiJd4u
 5Gwm7IvDPNcuPr6Lx7e8mTNtarUWMmYN9gbbo6VfAJnO6gMdizOzOf5juku7vSr7juV2
 gLHuFRPv+wtwg+IAtFBZZcasguKQu8nKw2stKwHbBglxV58noIKo2qj4PZux3oUibPWQ
 XUripJSOhQqv+g7ENxBNX0kUgZLad1Bw8i6CINOHcZKnKeMrpzWVjJu/1SaWk+ahb2l8
 bc0g==
X-Gm-Message-State: AOAM530BF4vHTQ8ZUHChJq4HBlnkzydeW3T12to6GbCCawf7GMUCFWmS
 0nkg6Ni1r21aOMb7nrN8tQQ=
X-Google-Smtp-Source: ABdhPJw7en9Rdip4b1jO8Tx86JajlxFNgYrdaduyMhSqjEH+ic/FoFQBz2ksbyiZuNfN8ricNnsfSA==
X-Received: by 2002:a17:90a:f00b:: with SMTP id
 bt11mr3236187pjb.76.1613037902231; 
 Thu, 11 Feb 2021 02:05:02 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id i10sm4851813pgt.85.2021.02.11.02.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 02:05:01 -0800 (PST)
Date: Thu, 11 Feb 2021 20:04:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/bug: Remove specific powerpc BUG_ON()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
In-Reply-To: <694c7195c81d1bcc781b3c14f452886683d6c524.1613029237.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1613036567.zvyupcz926.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of February 11, 2021 5:41 pm:
> powerpc BUG_ON() is based on using twnei or tdnei instruction,
> which obliges gcc to format the condition into a 0 or 1 value
> in a register.
>=20
> By using a generic implementation, gcc will generate a branch
> to the unconditional trap generated by BUG().

We don't want to do this on 64s because that will lose the useful CFAR
contents.

Unfortunately the code generation is not great and the registers that=20
give some useful information about the condition are often mangled :(

It would be nice if we could have a __builtin_trap_if that gcc would use=20
conditional traps with, (and which never assumes following code is=20
unreachable even for constant true, so we can use it with WARN and put=20
explicit unreachable for BUG).

>=20
> As modern powerpc implement branch folding, that's even more efficient.

I think POWER will speculate conditional traps as non faulting always
so it should be just as good if not better than the branch.

Thanks,
Nick
