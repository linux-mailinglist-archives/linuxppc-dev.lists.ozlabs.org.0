Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F682AD162
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:36:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVh6d319czDqkX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:36:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=snWyQe4H; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVh4g1m7ZzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:34:59 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id f21so6127028plr.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=GT7OIfzoTh+fG+QPFfSdAujf5YRiTavGXKKQZBKMQZg=;
 b=snWyQe4HR+jrtXJmZxaglZgbjI6ipyIfiK9U34cfphpMC56HurRZh6l+2B18dMoAfx
 NcAA5R2kNhdE1fhiHRGS3/Vt+R9RVeWLzH5Y4K4kH7vpxDESITcIsSTvWadT7t2oi4VR
 wE+qkHc6+tgdHzkamZ6aNPMAdvwgzgqSgBvWQA2M//t/LOFCaBgElQNkqft58sEAJBda
 qHxfUnGOcC0zWiqT5US1U/wFA07ciDir56G3metVCkKBgXSD8Ohwns7WjvxgCtstqhP/
 42uP2VWF+0FahkeS0Y8UZxeF6g+vQ72OZ0RaljMlOMkiqSLNg3E6TqN2mIj12Luhrxuv
 lrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=GT7OIfzoTh+fG+QPFfSdAujf5YRiTavGXKKQZBKMQZg=;
 b=bJKwjRDjduWP2MmgcEgc1PsJBTNgbjjnap5yPe6fbHHLQYc+qQYbHYBz5kkVfBjr4f
 5QuQkg8Ej10d1Ki+zgQuTg8u0PKA5O8qhNV+Yx/f1GiScix6S4cdlnGmuJASvBByHPvW
 Cn7ttd9z6yreRXME3nCcm9boeaR/7rUI4WhMKOKYmohSukkhM0Su7BOgGp6X/fSy1a7C
 u/7Rl9ZHHLVIZN8cnMCQMTRek3Cup46cEWlCDQzcYT1wspQiT/PhoYU4uVea7DhgvC4x
 iiqProwUpfj8XdK4HptG3muLQrgdePTspqn2tUJX7sDiZStAaA0XQZ2SbVWFLdHJgIGw
 jrAw==
X-Gm-Message-State: AOAM532jWKtXeoeddR9Mzb9YGPPk61FULLDB47fIkZh0K8NcmNpYibnx
 6JSGSsMeTvYqD4WdAWA0qDXCDPuobzQ=
X-Google-Smtp-Source: ABdhPJxs7OVSHG+koNqGmFdOlFtzZOGkIeV6jVKKXNtzHpvBbya2/Qn8IerjQlPvEUvd7seJhIYJLA==
X-Received: by 2002:a17:902:8218:b029:d6:ce9f:372 with SMTP id
 x24-20020a1709028218b02900d6ce9f0372mr15911944pln.54.1604997295506; 
 Tue, 10 Nov 2020 00:34:55 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id a25sm13958180pfg.138.2020.11.10.00.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 00:34:55 -0800 (PST)
Date: Tue, 10 Nov 2020 18:34:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/18] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-4-npiggin@gmail.com>
 <8b325832-b843-7d01-8b0f-fc278c444ce5@csgroup.eu>
In-Reply-To: <8b325832-b843-7d01-8b0f-fc278c444ce5@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1604996998.52nfki5192.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of November 6, 2020 6:14 pm:
>=20
>=20
> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This also moves the 32s DABR match to C.
>=20
> Is there a real benefit doing this ?

Oh I missed doing it, but yes I think bad_page_fault and do_break should
probably be implemented with the DEFINE_INTERRUT_HANDLER wrappers.

Thanks,
Nick
