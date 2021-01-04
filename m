Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B82E95E3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 14:26:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8bxm4NvbzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 00:26:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8bQD4BLpzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 00:02:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=U0ijzSIt; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8bQ82vFyz9sVw;
 Tue,  5 Jan 2021 00:02:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1609765361;
 bh=I6gu+WnV61ml7N9YKJuSvHuz1prsrkoQR4jFijLhY0Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=U0ijzSItrDytH92e6K5/rOeI3oJXLbOZq+XDRZXBARr3q0UcGE701Eip7j08Q/cuF
 AF3eBWViqN/Lb9x/zEnsVVVQCvz6KomJiKm7QczYMiu5Jk5JOQnzM4YueRV0TsAs3g
 Ln7o6vCCulNY9xLdgHDUiC8V16iMfEM8EsRUqJ82ANv/0UP9Kt0ukksOnhtD0seZmS
 nHbk89KtTeuPJfGXsmzjF1QFm6AVDufXZqN5fJqDamYJcs+7u1S8prlkK9ANZNrgNZ
 KJ/37ywj7aY4VI/UQWLo1Po2Fc7ihgWEneJdqkCQ/RD+BVEsIClkVu9SBqKhD9V6kI
 Ng+35IvyZf03A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Larry Finger <Larry.Finger@lwfinger.net>,
 Christophe LEROY <christophe.leroy@c-s.fr>
Subject: Re: Regression for 32-bit ppc on PowerBook G4 Aluminum (bisected to
 commit d0e3fc69d00d)
In-Reply-To: <04289c09-50c3-26f8-26d7-f43975fbb76a@lwfinger.net>
References: <04289c09-50c3-26f8-26d7-f43975fbb76a@lwfinger.net>
Date: Tue, 05 Jan 2021 00:02:35 +1100
Message-ID: <8735zghn2s.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Larry Finger <Larry.Finger@lwfinger.net> writes:
> I tested 5.11.0-rc1 and it booted OK. My problem is fixed.

Thanks.

cheers
