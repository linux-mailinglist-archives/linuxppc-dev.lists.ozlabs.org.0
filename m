Return-Path: <linuxppc-dev+bounces-14505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D189FC8B6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 19:25:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGp002ngCz2yvH;
	Thu, 27 Nov 2025 05:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764181536;
	cv=none; b=P4j6gz6dADQ5DvtabgUwRVaiyYGcrsmB3yOkqmvGwkjpwJMJmY5vdhIO1O7uz7TorP4vUKIeqo2H0yjcF6ncflaWpuwx9ho0hY7a0auii+Bn8uRP57y9CelH2fbAI0QxlT0faoj5BPU1KwjqsUefMeDLc0qX6ULEBylr+8wOAhCOF3a5zVziZfMXAJh8iEj98SBkO3kQdV2tS1TgIlCzEWcwuKYpEXU//0NxexjRK10xIaVERvIHMGs6JjLkvqjtVe+vc955YnfELP3QGDDiQhNxYJg6hFO4Ocf2pfsfOLoD7o0Q2+TclqAratsZGUW1MTaAKsxTTpA09uYsDrnIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764181536; c=relaxed/relaxed;
	bh=3ju/ldXsBe6GECB4X/G2ZCm8cAk6DSCMBFxrz6bv7fg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6dVhvTuxusLaVKGC7pNdQgPscEX9i0i4jpWbHp57+X2ycYYKi1oQQ1j3xztMj6vGDJWnMCF+it2RN1z+s/5JrUQmKZrcKLDfgjEMslTvGBdDQaAaY5bh4sbGXog9bQBZJSIzV/uGpoavDw7/TT5O11a3pBp90GAcj3Xg/ykHcNXIm6rIik5Nqd717GvaBF3wuK+qwbIb0zMuzv0MgWmcfriLvwSQnXEz0e/7bAtlUp2DGc77tSNF0XL5N325pWVLoQLyH42jVAVaNKnhQgesr9N4Mbxv3ar2oe5EZNqsqDHzHfx3qQVkkpCIMTrl8vjlrsbgKqCYnPoQ94AGSVMKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjro5+sG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjro5+sG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGnzy64Bnz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 05:25:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D46760234
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 18:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868E8C4CEF7;
	Wed, 26 Nov 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764181531;
	bh=GzupaEKKLt6dlKZTOTQv+YmPyEq5Ut1qYH3m3W+kO2o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rjro5+sGtv86d+XY/H/LbbNgoDiyDmmUTsdN0LKo9hegBC4g/89/3F97+sV3KKwTc
	 FgSAfAdhu0rsF3SRuhKn51DEEqm2QqSF9AjzsO0xBFUL9nozSMQFUjbvg6ii45Tuhr
	 oEZ1hXr8yz1+ulGPdeLb6j3kt9OlPLl3gZT3eA63GLDLRRjYzn2FB69VR+h3pbum7A
	 KjS/t2t2odxM+281DtZOUHrCqenYl5lAAYg2HDMo+DTlu+C4TZQk6+q4vTP0xr0yT6
	 AWfk0v1O4HfW0NYYQ/oeiAE6+FAJ2AAQ1GWcL9LKsNVrHg9QflWKVMp/xBF3njfuG9
	 FzTcD8dzZIZDQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: Update email address for Christophe Leroy
Date: Wed, 26 Nov 2025 19:25:17 +0100
Message-ID: <176418148589.2651617.7575630253315468185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <d9b6758297d7dcddf79feb4459ceaedd7d6f1f2e.1764155757.git.chleroy@kernel.org>
References: <d9b6758297d7dcddf79feb4459ceaedd7d6f1f2e.1764155757.git.chleroy@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=625; i=chleroy@kernel.org; h=from:subject:message-id; bh=zicumY69MsYvQBwNyZaGaO1zeOOYUK2B/KN0V/t+/pA=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSqu/G97L/gw+XOaXi905/tCPMJvTDJ958OLWx5N6eu+ bKsQXhHRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZhI3XaGv9L/FPZ84zppJVNw iCmz60LuPqcDu6d0Oljs+H9rfZZMfgsjQ8dl+UKvgKsFu9J0L8xw95aJifigoRj67bZmw6asQ99 rmAE=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 26 Nov 2025 12:26:57 +0100, Christophe Leroy (CS GROUP) wrote:
> My address at csgroup.eu is redirected to the new one at
> cs-soprasteria.com which is a Professionnal Microsoft account without
> SMTP gateway. We still have the SMTP gateway for csgroup.eu but it is
> not maintained anymore and might stop working at anytime. In addition
> the DKIM signature is not performed allthough the domain has DMARC
> set up.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: Update email address for Christophe Leroy
      (no commit info)

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

