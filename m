Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8818F1D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:32:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Ks4H6XzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zq9GNoHO; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8G93kdxzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:29:05 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id a49so12652570otc.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+8wzAi5t+EzxcuxCwFW9WRGhsjNvDzy8oCHQ/U/lQQ=;
 b=Zq9GNoHOfuwcNhKkxFHn4QJ0M+Bg/RB0pGU7+Oe2ZJbbx0QK5q9dNGu4rlMZsDzzR+
 3aDOAnbbDhG89IbaueWNPiHEI4JdP36eQIwT2LVf1SI6yW0PhAx53EfzXJ6JF6j4/8fR
 GVbneCc9tRg2J1Bi/hponwEl4djpXbVwqydH1CCB6iYp5zCyrNqF6xSyX6khQcvGaeku
 9skhlpANYTX4QpKcUcqzrRnEOYn6Qhq0Lb+j4SY+56kiekrwbX/DbOwZA5UQL9MxzhUh
 tU778rgxyinU6jhZTCb3No/qRXLzJSOai/hW+q9wxjV4SPDuZqxutXNyYUp/5VgUUVbL
 Tmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+8wzAi5t+EzxcuxCwFW9WRGhsjNvDzy8oCHQ/U/lQQ=;
 b=K0nscKiR+kTvFFu+Zp7PLXhJDsQhdoRnu99q2YwnsN4HdMloRWIGTEUXO79jxo5QJX
 ixhasyA1TSkoqvqe4vFx5PPYp7shjt+r+/03ociq3tkHGA++djLDCVPPXKP23nR2Abqf
 3kX57S24DoCOITPVZreIVrH7p3P+t0hdpRL+V/Dwx8Vgt2Y9XEExBJIMm/bgpnjRmj0o
 mdZJXRG8KXCxoXpJ8ozwLu1AeFLCsKDC0fAZlcnCKlQMK6gkqGlcOCyNeq/zw6WSiopR
 vekkgK4kz/Ol2AjIzWZvm6t+6bcf4czUACG1jr7WUUCXlcBR6NNRcfUzyM+OY4KkVsEZ
 jdoA==
X-Gm-Message-State: ANhLgQ0CJPtgzMRFUPNm2ZKVTs5X8W1mjDOBZ7PCVYzqQexVfk33cKS2
 bgHg1tmMgWNOfZWbMB+OqmplPL9xL1Zl9Ut8QKE=
X-Google-Smtp-Source: ADFU+vvqPyrw8s61eueuzhnT6TQua0IesmYSOoeHoTcvoNe90uuyuYbTxRWMqSBgy6PXS/tBaegEWFQKUrfAxQAnuh8=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr4193663otk.155.1584955741896; 
 Mon, 23 Mar 2020 02:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-4-jniethe5@gmail.com>
 <1584944554.pe2tzckmyl.astroid@bobo.none>
In-Reply-To: <1584944554.pe2tzckmyl.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:28:50 +1100
Message-ID: <CACzsE9qy7dUv+sbcCN-i0EeYiH=DacutULunpBdgV0h8D0m2yQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] powerpc: Use a datatype for instructions
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:27 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:17 pm:
> > Currently unsigned ints are used to represent instructions on powerpc.
> > This has worked well as instructions have always been 4 byte words.
> > However, a future ISA version will introduce some changes to
> > instructions that mean this scheme will no longer work as well. This
> > change is Prefixed Instructions. A prefixed instruction is made up of a
> > word prefix followed by a word suffix to make an 8 byte double word
> > instruction. No matter the endianess of the system the prefix always
> > comes first. Prefixed instructions are only planned for powerpc64.
> >
> > Introduce a ppc_inst type to represent both prefixed and word
> > instructions on powerpc64 while keeping it possible to exclusively have
> > word instructions on powerpc32, A latter patch will expand the type to
> > include prefixed instructions but for now just typedef it to a u32.
> >
> > Later patches will introduce helper functions and macros for
> > manipulating the instructions so that powerpc64 and powerpc32 might
> > maintain separate type definitions.
>
> ppc_inst_t I would slightly prefer for a typedef like this.
Are _t types meant to be reserved?
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
