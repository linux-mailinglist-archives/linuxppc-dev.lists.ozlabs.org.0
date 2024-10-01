Return-Path: <linuxppc-dev+bounces-1703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B994598B2FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 06:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHlJ35j2Bz2xnS;
	Tue,  1 Oct 2024 14:26:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727756784;
	cv=pass; b=bW1kkrOzMWPtWKIwyZzL3TEW/UKvFNCgsBIFDd0S7+nfTPxil/JQe/o6u77wdEXEe3BqjQtDl+ivv4NBkZq+VzB+yhF1bcnCDpQtZ7Bu7ovKNgglDkttStw+NpwhOOBgkfwnYGNKyS53H2qzwJvEAMKP33Xy1iqdO/+nJ4Of3k6iJ69lAAXTnMRnFKpnPZn8E6g2SIEp5FO3Sf9DIw75rS5hic/1tLdqtMSJocbHPfr12oBMzHbrpymp9s+DPkm8KarSvmIHZPcFxS5h97P1vF3CZDa4nB94jPOdE8LNjFHEhV+9RkXNS4ps86pOcXl4hxsjAU6q6VYPcMIJncjYoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727756784; c=relaxed/relaxed;
	bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=gew386iHi941FJvjY7TKNvJ36+48m5ebCqDo4nlyQ2vM5k8VR+6SDTB+bdY5cqYPUG+zZdBH53DWoZXwBfo406E4L1DygHZwAP85vb9ibHfzYb1Bo71LW63sX4ek43G7F6twy5CNgEqVGFVgb3C1J1GbHgvu9Kgw+JwC++MqWnyepC6JU7X4P7FLATXeboEkgrPpiiQjq5Pl/iXMdI36O0Hk++fto6emFEiYA8TMEWsDka68bw0fEiUb9gxdTqdACQd+ugXGc9xiX7mJsLGvXrBtY+LNeNzUKzz9bHYB43zpnjfi5Fh2P/6HhTEDvv6+pDY+Q7BmmMStpfYFAI/GdQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UZZMvhwZ; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0TpTrP5s; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UZZMvhwZ;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=0TpTrP5s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHlHx4BdRz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 14:26:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1727756773; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sXrW5a4pU6aIPaRPCiVN26Y7740EfsAJtbL1BM5cXPUjyry65qBq+PSrJc+c/ZS7lc
    4b6flfhfJg+N/jm1jn1CtEG1K922llX5wIHh8PyoIO8rT78s3P2wz3HLZ5uIccxJ/4bN
    7IwSIBNf0WVsj9TzxZuVD7WXvWqAz8Csgq/12R2O5vKKmmt/GLgekSzal58rtpqP0VWU
    OXsSe6ZffWCm8k1Jb2EP36JHq860DCz247ZnuD1LX94KtFfd3ip+w9BewB/BaNNldi0K
    QPyS4cAi3LJDDixAzPAV6p9Q7SsPxCpDrgV6UXEzA2ePioUaOgA3HzHxulpOXGS4KoX8
    VEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727756773;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
    b=MvPdYd997blvuZRuPSciWwLIzQ7hYfUU45JgOdNMldXJ7W9dehi1jrKQ/SmKghsv9Q
    5WqS0bHhGE4o8y9StthkLRqHPV1IRP/xs56PxOixcvRPpo/Y6kleGmDJL4Fk9X7JuT62
    nlJIrVw1tSgUHGo73dmQeqJse7Jh82IOZpazzTeXaV8iBa+5jO1p5/DzuqT3iIA7waQJ
    fmngxPVSlZB7BeBcNpYueYd9L0i3cB3hpf21qooDnGYEODnBFdTBSc9VEazkrHYGjUCd
    wx5SwUYATjiiLC060gsykVtmymGbEp17VEJrOfQ0Z0ZhcrGv+fzFRuaAL8EE8bcKBWhu
    yfuQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727756773;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
    b=UZZMvhwZQFT/lqAe1wURfytdubGY14ckUUdinUCj+SJObmRrwhN/nJCCDPJGCyfuoQ
    PUj7vztvnhOA/9Tw0nccpS0iLCKDZshhKptpfYNlZhQ9VIoO7kSwZlYR0adfICQwdc+j
    CXRPbNYreSERsaBX3MDwVttLe6/AjGTboaUCYUv8D7JtMHkxXdBV2jgcqu1fXWJ5mfFf
    RBAVlHxvGT0cd1cHYSRDNd4SliGruEWbJGpHo8CZlW9ktRNG0rhIupap86589EBVpN09
    mx8HhCAkAm51EQjAnhTaeqjolskcEtT9Bl6WqNdNiEeIETnGnTRW9P0QWrjg3viFRPWv
    62Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727756773;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=0WxRCpt9IJ3RwYa8CC9lm/lIsXtb+Z8TgGMIFsgKu+o=;
    b=0TpTrP5s+6kXRJtOL7pXJ1MLg71O6NkayswAwncB8+ZZ3CEysI2r50dj4d/59u53GF
    IoPM6BEw1xk1kaO/LhCQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VpnmsymRC32nq4HIjc1UIPKKQHGR7Ea0yJ2oU7c="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a0914QCTt0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 1 Oct 2024 06:26:12 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Tue, 1 Oct 2024 06:26:01 +0200
Message-Id: <D01B31B5-0609-4106-ABF4-B549CDBA362B@xenosoft.de>
References: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
Cc: Wu Hoi Pok <wuhoipok@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22A3354)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 30 September 2024 3:27pm, Alex Deucher <alexdeucher@gmail.com> wrote:

=EF=BB=BF+ Wu Hoi Pok

This is likely related to the drm device rework.

Alex

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-

Hi All,

I was able to revert the drm-next-2024-09-19 updates for the RC1 of kernel 6=
.12.

This kernel works on all machines without any problems.

This means, the new Radeon DRM driver is unreliable after the DRM rework.

Please fix this issue because we can=E2=80=99t deliver the kernels with the n=
ew Radeon DRM driver.

Error log: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log

Thanks,
Christian=


