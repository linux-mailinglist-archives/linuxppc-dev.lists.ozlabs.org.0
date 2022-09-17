Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 100565BB6AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 08:34:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MV1P63LzJz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 16:34:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=caQZ+WbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MV1NT1BRkz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 16:33:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=caQZ+WbI;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MV1NR4jvtz4x1V;
	Sat, 17 Sep 2022 16:33:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663396408;
	bh=KjMTk+7Rl2KC/AZXlSN/X+dxc3ZWXGWLL/VsuneopGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=caQZ+WbId01r4rWDPyLvg44rLzYC/kkYvB88ZVCFrxlNVgd5aNAun04CTIrrVL2BM
	 FwY12Heh7lsrDSxGabl6u6lKm9YYxBCAhwv7ujuA/d4iAiyyVraMECJjBrt2G/dAOk
	 OWMUqm3CMwHMI51yaOrG1qJFCd3ihvkqPS559g+o0XQdw6hg7DOyrImzd2G4g6hriQ
	 oqIbfMYq+NDeTVcnuEYoVK4QnQbh2m0uuHh80WUQfG+ZUCziMz8i65eqGP8CHaSAez
	 2L6heYIduYhwnL1FF0B7gehp6K6HtaHsi/3ZFjIwdv+ojj1azCYZzjoKfuA0OLlWvy
	 sYaHMSLvAuVUQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] macintosh/ams: Adapt declaration of ams_i2c_remove() to
 earlier change
In-Reply-To: <YyTEi++70eURjXpQ@shikoro>
References: <20220916090802.261279-1-u.kleine-koenig@pengutronix.de>
 <YyTEi++70eURjXpQ@shikoro>
Date: Sat, 17 Sep 2022 16:33:26 +1000
Message-ID: <87v8pmldc9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, kernel@pengutronix.de, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@kernel.org> writes:
>> I don't know how to proceed with this fix. Squashing into the broken
>> commit is out of the game as the commit is on a stable branch that is
>> already merged in a few trees. Maybe let it go in via the i2c tree?
>
> I think it would be simplest if I put it on top of my for-next branch.

Yeah please do.

An ack if you need it:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


cheers
