Return-Path: <linuxppc-dev+bounces-1133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F14C96F9F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 19:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0k184wjqz301Y;
	Sat,  7 Sep 2024 03:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725644188;
	cv=none; b=B2EN3ehg4ivsQ34uaolTl1bZ1VRxm+2Q7+aEtB+5VpBKJilLIsAoe9PkBVswzg0+pY0Bqy/mJWczAGZ/wG1jUwzalBNOQ6AAjjwMOp7fJlVgZEBXID5e2WCoHIs3kD18rr20udChIgQ8Waeq0NWzAB23RUxSNCdMJ1TQjSsd+G7nYzaveavLIJtFzcGjA1/I0pnwTdsz4abPxb/p4qd7DNix5aahVxAOZj73olK/g1kSrHKOpWJEToLviC9MCg+tk52fMmgvEUQYoPA/UwlHX1tLMKnWFK2/wCr3O5KtziqhHx2oCE/l+GHO+QapI8WvcnWlZmmKjJesTG/6Lu6tDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725644188; c=relaxed/relaxed;
	bh=F5p0FlPRhyRBy8rHQIto1v/VaWCYbt60EputVDrTk1I=;
	h=DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:Cc:
	 Subject:From:To:References:In-Reply-To; b=fywkemUNtESANR0cv3gE4qh4VD0PyblHHvl+13BQekSVxWkjl2jbxYJneW0hCzexX/xt2HqWpBvoWAjXSotwVIdzKIFVcZpAx4YpswK4NFKrw8Eebu/zJpQCO8fPKlKej5l3TiQwGxmkCJLmB+tavCbibVjUXRX4MzqkJslx108ves5/QJlOy0aYbIYdvI0vuKVv+/bRbgWIXJE5uogRFERxHHL4REKM7mvWIfTyPmGwwpvzg5krzV6uKXnicf6vyqTdUaOUKxiktzbFu89NTzV6BWtbFc5jmyX2AEiZWtM0+BP5IPmPEY5RmJzSmaG0I2a+1gCmAaciUAq4AbKrlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IiYAylp8; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IiYAylp8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0k181wYrz2ysh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 03:36:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57C3B5C5A85;
	Fri,  6 Sep 2024 17:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D99CEC4CEC4;
	Fri,  6 Sep 2024 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725644183;
	bh=aRfeEhcEuH0P68oO5jth9G8d0DHMgdo2eFNaf8ND4CU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=IiYAylp8CKShIMa2CwTo5hOFj5Ou5ORqkhXh4ALP/uL5r2RmE3NQD4ikpySJ7yIe0
	 OV9Sa8tfznO4aV+9PBk99hAJWxcLYPqrlFaO1ANw8rDjXPdMudJqGceq7lMmYcERyz
	 cPNMd5b//NKZ6k089LXuwysoq3KdzVXUFnmIApsNI58w+2yzhfolz9bOzXEfX87X5x
	 cw09R36oznw9eF8jyrnRqk9MD8U33KcFILVqPBKCfFjGkhp23Vo9NUXpeIzqrDpV8x
	 pb/mhpnNdwCMy1MOI7jp2hn6JkjaqNlO3Vwt+1we3DH/LDpQvVrqIt4TYOCFwbu/4G
	 gXU/fb+3DM71A==
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Sep 2024 20:36:19 +0300
Message-Id: <D3ZDT3Z8MZ40.1ZT3K2C7JPYMF@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <mpe@ellerman.id.au>,
 <naveen.n.rao@linux.ibm.com>, <zohar@linux.ibm.com>,
 <stable@vger.kernel.org>, "kernel test robot" <lkp@intel.com>, "Mingcong
 Bai" <jeffbai@aosc.io>
Subject: Re: [PATCH v2 RESEND] tpm: export tpm2_sessions_init() to fix
 ibmvtpm building
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, "Kexy Biscuit"
 <kexybiscuit@aosc.io>, <linux-integrity@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.18.2
References: <20240905085219.77240-2-kexybiscuit@aosc.io>
 <D3YF52E4EVJ0.2ZJSCR5FCVIGX@kernel.org>
 <603acd64-0a6d-470b-9c9b-f6146443dc0c@linux.ibm.com>
In-Reply-To: <603acd64-0a6d-470b-9c9b-f6146443dc0c@linux.ibm.com>

On Fri Sep 6, 2024 at 8:02 PM EEST, Stefan Berger wrote:
>
>
> On 9/5/24 10:26 AM, Jarkko Sakkinen wrote:
> > On Thu Sep 5, 2024 at 11:52 AM EEST, Kexy Biscuit wrote:
> >> Commit 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to
> >> initialize session support") adds call to tpm2_sessions_init() in ibmv=
tpm,
> >> which could be built as a module. However, tpm2_sessions_init() wasn't
> >> exported, causing libmvtpm to fail to build as a module:
> >>
> >> ERROR: modpost: "tpm2_sessions_init" [drivers/char/tpm/tpm_ibmvtpm.ko]=
 undefined!
> >>
> >> Export tpm2_sessions_init() to resolve the issue.
> >>
> >> Cc: stable@vger.kernel.org # v6.10+
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202408051735.ZJkAPQ3b-lk=
p@intel.com/
> >> Fixes: 08d08e2e9f0a ("tpm: ibmvtpm: Call tpm2_sessions_init() to initi=
alize session support")
> >> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> >> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> >> ---
> >> V1 -> V2: Added Fixes tag and fixed email format
> >> RESEND: The previous email was sent directly to stable-rc review
> >>
> >>   drivers/char/tpm/tpm2-sessions.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-=
sessions.c
> >> index d3521aadd43e..44f60730cff4 100644
> >> --- a/drivers/char/tpm/tpm2-sessions.c
> >> +++ b/drivers/char/tpm/tpm2-sessions.c
> >> @@ -1362,4 +1362,5 @@ int tpm2_sessions_init(struct tpm_chip *chip)
> >>  =20
> >>   	return rc;
> >>   }
> >> +EXPORT_SYMBOL(tpm2_sessions_init);
> >>   #endif /* CONFIG_TCG_TPM2_HMAC */
> >=20
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
> Would have tested it but machine is down..
>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

I'll add this before the PR, thank you.

BR, Jarkko

