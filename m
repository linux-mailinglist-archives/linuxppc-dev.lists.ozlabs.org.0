Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943BA70239A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT5d2xsLz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:51:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hdKg7hvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hdKg7hvS;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT4m1v3xz3f5s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:51:04 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aaec6f189cso83315375ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684129861; x=1686721861;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhnXWhEoaPmmk1exmZjL3tgYWxt4Qz6YZRQzAOfmdPE=;
        b=hdKg7hvS3AbgfNwWEbilOjnOgLOTjhqI4qqC+Jjn04eC7R7Grm4viqd4y630S6Gha/
         KV+SW4cglI2Ky3JaS/qHeH30lHC4ZM0UCWt9q8uox+fjQ3XFGwYX822X4g62g82AglD3
         JQqhdsgMf/nKs7V4eddOws8ZblTYGMldwhhzK6vtZ5YVmSKjCscuCoZN42pYtbhKZWed
         g4ucoL2zErOE1/YnxTNKzvZNTxUdlrpsbQlhcvNnbL60TwOLpvEYC/9NvP/89o2bhwYQ
         ZOwEDxb2XqF6/BtN100qatJ3HTeDevPIGq96+SeBSb7zaYcvkI5DgIpcb0+oouomYRKa
         5JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129861; x=1686721861;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zhnXWhEoaPmmk1exmZjL3tgYWxt4Qz6YZRQzAOfmdPE=;
        b=GhMWKyqRWMjqD1pESCDw18wz48bdR4sai748nrD9I3PLPU6gQ8UzezTLjrl2BW4OUh
         JrKulp4xQ46hJ/1q1IFpsyUhVdBp08cNABwGaGt9mYxuyYB1dxXg/TXcz3DUm+6W4HBp
         Onm8Zb+zWROATtPpY4KmOiHqAyGyTYbHCKwmXSePSelzBvSzQQjfkviLKaAPsjgesalq
         IaJbuIq2cG1IGyN61jntlgV6JOjaggymNzUGDt9mvo/L8gUfZnYBBzbm+qiBnoW8kTAC
         azPpLPjEN9jxKOiDB/LxDFQYKwTrOwElx0bmga/sZ0+ZBEpY8v59wlNM2ilr6YF6mMWL
         tcZg==
X-Gm-Message-State: AC+VfDyjg+nggZKungxKJS9XrrwJ1y26LXQYG46Y4a8YP283xV44ef1V
	U50TrlECpudO7TRAvzYtR8A=
X-Google-Smtp-Source: ACHHUZ7aCNmXTL+YKi9Jo3uWNPrwJt027CqTx8730IH503RmPOwkocKJbKFs7b+7e3xhgXoK+gV+yw==
X-Received: by 2002:a17:903:264b:b0:1ad:dd1a:6415 with SMTP id je11-20020a170903264b00b001addd1a6415mr10271634plb.11.1684129861291;
        Sun, 14 May 2023 22:51:01 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id g8-20020a170902740800b001ac82e8491csm12424838pll.282.2023.05.14.22.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:51:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:50:55 +1000
Message-Id: <CSMM7IOP142I.1M5WWIXODLFUE@wheely>
Subject: Re: [PATCH v2 06/11] powerpc: powernv: Fix KCSAN datarace warnings
 on idle_state contention
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-7-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-7-rmclure@linux.ibm.com>
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
Cc: gautam@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
> The idle_state entry in the PACA on PowerNV features a bit which is
> atomically tested and set through ldarx/stdcx. to be used as a spinlock.
> This lock then guards access to other bit fields of idle_state. KCSAN
> cannot differentiate between any of these bitfield accesses as they all
> are implemented by 8-byte store/load instructions, thus cores contending
> on the bit-lock appear to data race with modifications to idle_state.
>
> Separate the bit-lock entry from the data guarded by the lock to avoid
> the possibility of data races being detected by KCSAN.
>
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
