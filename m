Return-Path: <linuxppc-dev+bounces-4281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 678119F5CCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 03:26:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCcxZ4cjpz2yFK;
	Wed, 18 Dec 2024 13:26:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1035"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734488786;
	cv=none; b=mRkRMrw2wRe54NPqhwj2rjURU0OuvCI3BMYqw+AE/f7hntX2z1wY6hcsS1w8xiZ1nkZpHb0GtZsEuCsJepeiJsMSIozFKl3sYJeCwGDZKnIyn2z021VCMw8BuU/dDw4St0rSgPnJiN9lvIm5UMpm8L2bIximSJQo4OVqdJYLqa/zBFQozOxPoANTqOtrZerXA+6Ti4HnZVCDqq5lNUGV13o+2+uDntW6Xjmv6i+dTxxDvjexfhk870anZoWh/sStezPsIq9c8qVJNEmiG06sFoWoQlKsBFj+4DUX/hGH+mzaTxJrWBUa/+YvShENF6GpSBozvG9BVSpVQAVxeJfclA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734488786; c=relaxed/relaxed;
	bh=BagawvVDnsOrLAIlniZvJqfSJzpvpibYF0RA+idwPdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9hn9w/8Tw8Z3twAbwPl1xWozJMxjw8moTC27pmZcH6DQqilwAXWlBuafNOCM52q3AE48x8mU2ynCtFU2vGuLAE2BWoXqk48NwvYJi38iG/fE39/U3wO58T9dPEPpbwVMDsKJm7oLw405uB2peGI8YYc3dOUOjR+t5NGFEpmbM2Oo97HZx5MnbKAx0tg9Zw4+1nN/1WrVL3UYEvLjfMFusUbK5m/mSOUrURu83Lx3uNyfCl0GCkxBiKglSxc/mZVBCKEJZWsJzXVO83zJxs8ysCZZB/j3K2OLk/ZnqakVeAgea2Bv5oa5qHCWjCYff7Px6EZKw7WRb5wHHjWpDTC2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LRwcspx1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LRwcspx1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCcxX4xsWz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 13:26:22 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ee6c2d6db0so5210292a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734488777; x=1735093577; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BagawvVDnsOrLAIlniZvJqfSJzpvpibYF0RA+idwPdM=;
        b=LRwcspx1UVs+ZHd3LtTAcYIsaKuTxvKGGA9lRK76IS177Y82ARqP0IAuogJRjzjUPM
         FtusS3DxapckFfWjk+arZbxdxTU6kowAbJ/tjpGq+CBiSHLxP0NgQglmsY/oZ9vxy6Wt
         5nM5KJ7fMuMNCrhUEQEb5wKHnN2miKjRwy/bUK2AwNk5CM9MN6iY51J4WfhOaL1gIcIE
         FNYg5Uv07FD5CMUuu/d5NLxVFH5F4zuU2rBP+0gdA2TFPKRIzdqOffpFNfyZr/UuC8YY
         qBGF9dEFCaoSKul7/shYoeJJSh2mcB3eh9GOYXNUg2XZGC0gIoZUkKCd8SEqrp1AYcmn
         4CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734488777; x=1735093577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BagawvVDnsOrLAIlniZvJqfSJzpvpibYF0RA+idwPdM=;
        b=BMs+d5YpCxSw8QzU5qJu5g9WfQipixmD+/2OlFxishx56x7sJtKtMUxlJg/ppyiF90
         Ru9EeMD+K9JRADvxQ0DVsoOzv6E6kcPW/L/2fIIMUxS+UjJswEwi2h28tIbLllaNKMxo
         Gxj9XV0BAhhhJUOIcb4k9udoZyIVQyUiR80YgN4G4CHdCf6xz53n3uxjCdk9/XOYZKcc
         TI94VuBopjMJLzgj6xa2i8EaOlfO8GA/gi/VbNZjTTqox8u9c8xFX7IPVR7z1YJmyuiT
         rMmHFeROTzzijw+1kl55X9PtvHqI260U9oVxf20bTOq1x6gIqNnlm7MPiDSb+7AVybLA
         Exgg==
X-Forwarded-Encrypted: i=1; AJvYcCWvYzqxhe/o7aQs+6tAJbk+ebOL1hxCpViMSLkYTmwQD84hy5kknCk80Smi1w4c6E1hYrjm0ThyLRL9HlI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyH3iwq7c51sHDFucarEMIBY7bTzd178pD8lq4p2KtJg1c0o624
	VEE6HN/RLP5BoTV7Iy9peIeoRAtvMK0adQ5G0ewtQAXdp3rUK+xpv9FdcuCExqQ1TEXjcw6tcQu
	Q7DFlfx+iuwf4yxjx+/6lc8y4vKA=
X-Gm-Gg: ASbGncuybikn3ko2OefTsBIQkMbFtKqkRI201um1KB37wCrisjaERSZv97ln4wMAIQ5
	6ZbwC0O6S6scerqEhCw1RqUinwLjyDJtgsCS/YTI=
X-Google-Smtp-Source: AGHT+IEJAaULWYqthldY2Wx43oPayoxJWbNV8sHKuj/F13CQBjEBFhhIbzIahuHbUDiuktvfQdphxUHe01zCSXTIknU=
X-Received: by 2002:a17:90a:d00b:b0:2ee:db1a:2e3c with SMTP id
 98e67ed59e1d1-2f2e91a987emr1699474a91.1.1734488777557; Tue, 17 Dec 2024
 18:26:17 -0800 (PST)
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
MIME-Version: 1.0
References: <20241216-constify_sysctl_mac_hid-v1-1-f60c0871dc03@gmail.com> <7j4sqkjgkj5wd2sraigedoppbojjvnptrajspl5bqehihlvzln@pc2zwgtnzdkm>
In-Reply-To: <7j4sqkjgkj5wd2sraigedoppbojjvnptrajspl5bqehihlvzln@pc2zwgtnzdkm>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Tue, 17 Dec 2024 21:25:41 -0500
Message-ID: <CAGRSKZiqjWDvRJgPPACqfEc5cs=Dz8267JXsEy9EzOczMOXrPQ@mail.gmail.com>
Subject: Re: [PATCH] macintosh: declare ctl_table as const
To: "Ricardo B. Marliere" <rbm@suse.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000740f800629822321"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--000000000000740f800629822321
Content-Type: text/plain; charset="UTF-8"

Will do, thank you for the review Ricardo!

Best,

Felipe

--000000000000740f800629822321
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div><div>Will do, thank you for the review Ricardo!<br><br></div>Best,<br><br></div>Felipe<br></div>

--000000000000740f800629822321--

