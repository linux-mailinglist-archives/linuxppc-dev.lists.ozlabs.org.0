Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22A91E2D9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 16:53:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oM/+2upB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCTYl07j3z3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 00:53:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oM/+2upB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCTY43ZVfz30Wg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 00:52:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D1F46146E;
	Mon,  1 Jul 2024 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC54DC116B1;
	Mon,  1 Jul 2024 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719845557;
	bh=p9YfnGbtHLfEIX8p3mNY3/6BkKuqCdHuCCiSXutUbIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=oM/+2upBDtZEj0r91Tqkmmg5mXJ6AoyvHu3pAqjHLI3lKmG2+YoGCGQS1//g2O37W
	 XYoZel02aU09rtL4WEhgzxhYNEYIT//n5qMkHITDC4ndG09KPjUbuJEKW5ngBTnkEV
	 geyPxQOC8eLbnHh8O9YllCmRf1UPK3a55VU/yuoNk/1BigWO4Nggoq06zxHdPDJQc6
	 /Doso1JNA8cO6fecnaCmDV2eFQw1GKZxwNe4rTZogBiIJhlox1swQ8Zh2fkgklSssz
	 Y4gkxxEeOtIIOfYFglBRYqgGKqov9GQ27BbRqLXrW9De1rQkbFNsa6DKduApzrWxdM
	 JBwPXzlBBKZZQ==
Message-ID: <656b319fc58683e399323b880722434467cf20f2.camel@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>, linux-integrity@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Date: Mon, 01 Jul 2024 14:52:33 +0000
In-Reply-To: <20240617193408.1234365-1-stefanb@linux.ibm.com>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-06-17 at 15:34 -0400, Stefan Berger wrote:
> Fix the following type of error message caused by a missing call to
> tpm2_sessions_init() in the IBM vTPM driver:
>=20
> [=C2=A0=C2=A0=C2=A0 2.987131] tpm tpm0: tpm2_load_context: failed with a =
TPM error 0x01C4
> [=C2=A0=C2=A0=C2=A0 2.987140] ima: Error Communicating to TPM chip, resul=
t: -14
>=20
> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

This is a bug in the hmac encryption. It should be robust enough
to only be enabled if tpm_sessions_init() was called.

It is fine to enable the feature IBM vTPM driver but definitely
not as a bug fix.

Missed this one in the code review.

BR, Jarkko
