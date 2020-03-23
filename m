Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF6318F1E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:35:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Pl29xnzDq7j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:35:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rE6q23Dy; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8Jx3fB5zDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:31:29 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id p125so14046428oif.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWCYZynQe5k9lTqFuAifUDLJ1uS6TyzMvs6UTytiMIM=;
 b=rE6q23DyQZkaW1dLkUYllexdG9KHI2CFKnN0K2G7A1aoDIidp/QNOC852llx2U5Gu9
 FwGbTmICsLpIPAzZhWyBd8tXDCxE2YqnRgxXpFB9eGDyO0zswYKIvrpxaOow2cvHt0Py
 JGJut0f7HT5v6/yFvaGMqg/Gj+dwpNY28bO3asWu8P/1bLCNlbrn60OtgijL1lQ/P1uB
 5ncOqdl5n+A1TtVo+jdvaPOiXAAiHdiER2Anh/Ep5usCMHcnPJBPsYF3kFVO7ZvGAl97
 GFenCv2Q3ta+QUajdiaEKuroJ/c2zrbqbZAHGeEwrZ9F0mheyaM8SMSkdJcY9b117dQr
 cgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWCYZynQe5k9lTqFuAifUDLJ1uS6TyzMvs6UTytiMIM=;
 b=DBrkQrFWO2HFqmUCb9CVk0RDawXFNXryEzE3fXaPdXB+LxYzym2UwTbHq1Iz2dSiUW
 u/BAPqRSaHRcz+2wz5Hoi3mlUz/3ec1d+Buw4zD5moFv8nuuS5lZHmu0x8067SsCL+bL
 DuEsVklEpJf5pLRxJTdtee4+APlxyDRaVs/0dVTmXXDH/6iMejVTKMGJoum3VbwVtB8c
 OP/cfD6CtLaHpvtkznxJI3Le5D6puHeWEr/716U2WIyMxJCBfNCJEcseh0w7qVM9l98f
 1CpSCay+pa2XsU0l9aOQOL1fZrI3NMlpNOAlnVLptcx8Z87OfXkavWXW7EjKvfr/HCV7
 rklg==
X-Gm-Message-State: ANhLgQ37eZoYU90E+jAr3o6vKL7ktik036M/BB1UawWroklVpnr3GBbe
 eqidDuPBsFmuiKOQfTXA4tPyPoDM+3a7Tc6MXCY=
X-Google-Smtp-Source: ADFU+vtieAK0j3CjGEazvMSX1AogSim2WAqAzxXvkUJMgdaqVgYDBSoEV5/g5Rghr5/07+tcV71WzuRtQBK5BOzGcGQ=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr16965984oig.40.1584955886967; 
 Mon, 23 Mar 2020 02:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-6-jniethe5@gmail.com>
 <1584944803.77ebm362hp.astroid@bobo.none>
In-Reply-To: <1584944803.77ebm362hp.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:31:15 +1100
Message-ID: <CACzsE9qE3XWc-1sn9mc+pHs=f88Yh9b_4Kx_XvQ9tM1kj7Qvgg@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] powerpc: Use a function for masking instructions
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

On Mon, Mar 23, 2020 at 5:40 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:17 pm:
> > In preparation for using an instruction data type that can not be used
> > directly with the '&' operator, use a function to mask instructions.
>
> Hmm. ppc_inst_mask isn't such a good interface I think. It takes a
> ppc_inst and a mask, you would expect it to return a ppc_inst, probably
> with some part of its value anded with your mask value but not entirely
> clear.
>
> I would have a ppc_inst_val that is a more mechanical replacement and
> lets you do more things with it, although I like the other helpers you
> add later. Oh you've added ppc_inst_word further down. Why not use that
> here intead of ppc_inst_mask()?
ppc_inst_word() was what I started using first, but I started seeing a
whole lot of them immediately being &'d so I made ppc_inst_mask().
The ppc_inst_word() patch can come first, and I will just get rid of
the ppc_inst_mask() function - it is not very clear.
>
> Thanks,
> Nick
>
