Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC60303A1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:23:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ2rM1XjszDqxs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vLCujadw; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ2nx44ZMzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:21:25 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id 31so9510403plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 02:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=rCcoEc6WXLZHkKSRG6Dp64pc856U9Bay4SXV/yz5TDc=;
 b=vLCujadwwLLU6kFobsFVsN1/qz/gWVaXbur+czz+adfOuha7JgaL86ubL4kL27me5/
 QVf8UFDpNjm/6/Z/sA2yYiFrEzBzsHzh0/UbqOD2B2E3S40JsasRuVQjKV8Gi3qiQBLv
 thIuthMbXW48iuCy4EcYHoxxtzId5qsIzhdIYUQ/A5wRDkUlCjpvy470wxcm9mLAwBpF
 jbhCndmERM0ocsiv0TJQ+TsZad4F4u06MFb6sF2ccPoUZbwsw5iuXv/QREe5Xad3VZV8
 SWptDf/BCOzVqYuO+qVvuVyHxn6yFmPAbAqfr/4ccKAhShoY8H+n7YXxyjV1HGwMqUEX
 t8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rCcoEc6WXLZHkKSRG6Dp64pc856U9Bay4SXV/yz5TDc=;
 b=oAYcoUM8tsR6XsDAXd5z7qAx0gXOpIaTNbh9rBeO5UfVAjfaB9XwQXNb7wzBMOsAlq
 noVgtkPU0YgYFyeB/LUh6FS8x+xjiEJmImZIM1thbtzIZ9bzs0Hz434yyeivqcPW8KVQ
 9lSiELmf9n4hB4VfKsVPfTZ/37blaz7UTELcVi2BDhEzW0e701CT9DolFkd7bCVAtW1Z
 8FFsn5d7qa9Ur0y1+m60aDnoDdgkUA6oR6+1vMTBj3rwujBZaJTUl6UAbGGiVPLCT5Nh
 sZJm66F5QGAimogDUvrutxd4NVsBHZWbA3bMTgpw/b6XRG6tlH5lIXE1b9FLMPQ3ypZm
 jgNw==
X-Gm-Message-State: AOAM531r115gR/wx/r6qLobCbINuAXSNEDmj3jCK13Ok/kSkcErHv5t8
 ESK+KETV3He+xJ7QqwC+2Ho=
X-Google-Smtp-Source: ABdhPJxNCe+IzIn6LqnOc/P/GGzLLVXChWeOUG8maLaQds+/6qqf/ZMFVrvuza+JhtmKOkJChCA6pQ==
X-Received: by 2002:a17:90a:e00f:: with SMTP id
 u15mr5300446pjy.130.1611656481685; 
 Tue, 26 Jan 2021 02:21:21 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id m27sm18930768pgn.62.2021.01.26.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 02:21:21 -0800 (PST)
Date: Tue, 26 Jan 2021 20:21:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611656343.yaxha7r2q4.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
> syscall_64.c will be reused almost as is for PPC32.
>=20
> Rename it syscall.c

Could you rename it to interrupt.c instead? A system call is an=20
interrupt, and the file now also has code to return from other
interrupts as well, and it matches the new asm/interrupt.h from
the interrupts series.

Thanks,
Nick
