Return-Path: <linuxppc-dev+bounces-2418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C59A4AEC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 04:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVlVy2cvCz2xKd;
	Sat, 19 Oct 2024 13:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729304042;
	cv=none; b=RjMZs7+YaNIQz3VaLiGPL8PYuGFt5I+aUWRKR4CrjJRFTx6mwo3qf8L5/NhJty6AAZqliMWECJ8WIARn/SK2kU2YlRkpvy7jkeBeVvFl3CWNcfbymgj01hlNCaucpKF5KyPwL8Z24kwvT3aOEgtc5rzehqODBulIUo4z1ZQ+aTRoKwqkkbNPrUjocAlUVT5jsNaAz2fqLOcexAYxD0B81yUMhgU6bILbQXTObKHiAAcVzU/aN717FySl7a77hOpLrAyGlO/Qedv+rDe0n/AIhMN2HRgdjRGKCzhAce2prOm5eItBEy5AE4hjAbAVwgR+WACn1uWm/SrmO+mtrnwTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729304042; c=relaxed/relaxed;
	bh=m3OBhiG6hpLJQg9Qq6gvNx63LfPAP30OwnCahO0IdDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOA4FnEB2xrE0DUbZODvZNcDp/YDQyCFwqmPIb7/GA2R1IS4kYZ65Z66RqBFSM2idCyaP9HXUKu556Ew/1ggHLsPMU74hpNxzlPiwQpbN/rusiEeGzCS+kTMi9glZ0ldLkllpZe1PGIan6b/GqGF2X1VLu+ZTZf0XGUZqFKGUBNkGH+7EkAJKxYT/n6bdSmVmsSbdhpj8qO9cUOyBe6EkkNphW9XPfOG8eVwj9BjpG+she58BTzRfFTq2tavcsY7SwHOpCQEfzy24VPHoxVkY+1laEoTtPIcg0COoLhom6Rti85UJS30Mxyg5my2pAMl1JT2OeGsdZGychVxSxH3gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Phr6iVx8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Phr6iVx8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=paulo.miguel.almeida.rodenas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVlVv5d0pz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 13:13:58 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2330668a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729304037; x=1729908837; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3OBhiG6hpLJQg9Qq6gvNx63LfPAP30OwnCahO0IdDw=;
        b=Phr6iVx8gaDtZ068CS4oWgUpxNPrEkvm8HAvrNizUyGQNq3F1wHUd7hsWvhLb7tEfQ
         F2x+cYHCeJpxSpHSh/d2TMZjDKg9hAZbiTY2BxnQetMotMDiz0yee2E//MGO49X3hmCf
         wmlNS+oL2bfsBUZjghJ3xO943No4sR5oqeKfDzDTwKupxaSfTcEbq8ubO8eiCwrejaN3
         2mha7RNG1qZCANfs4HIKjlC2+eflcPaPhwkPBrTRlx3+to0TY3kj58OgZDtXZRwOYAGe
         MyagJxIRtKZNcKxD8H0Axgnc7IQCkpKobVGrU0DtjTP1/qv23BkFOBcATCM6eaqvV2rU
         Mu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729304037; x=1729908837;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3OBhiG6hpLJQg9Qq6gvNx63LfPAP30OwnCahO0IdDw=;
        b=C4IWEu5gPonjXFWc8Hx3kJNWFxunnjedSzE/86jiJ7DodHsIgTNznHWYqVCeoHZoEm
         SV+QCAHAJT6pZtZdFaT2ylZDKoVY7X8TrspvanVhDRffG1NKdgLziShZxas74pLHAGbI
         GsrzDEfbBK01CY0p2nC1bnQIoStrh6f45j/Ugsi75a0oSKMLyxIuy72SZVPV1xW8ddTx
         3arJuBY+WCfENokOJfmTpcmAZLcBJGL2vfbcNfx6ZYIzfCqNOp9/9tCavkmhrN8P8Ye3
         cxwRQe9z11wsQy03oG0c6DexrleJz/eXNMQnwfJiy7n7WwDh3ZcDp8lxVY1JdNwKhWSM
         XNRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOmiTNeMhDbzaQYCys8Xw2PPLlLKbZTdooGV71koYMnmDcHNo2/QtOfi1j/NK3G50YF3bQIGdfB3aa3K8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy6u4BgKXvdiSyNKm9ziTzDtKlk3U2joJuFGFqVXZShVLlovOpG
	IpEpNNt9UefGLDUDSIIB5CC+nYLnDUogKtcVISB8o5dbURdHD+mZ
X-Google-Smtp-Source: AGHT+IE4I/Iv1lLYcMF2ZZmIIaMutEWKICjcPsDAVtltpIWvp0LxjTcOiq0LVYwKdoAvk+M0c2j6qw==
X-Received: by 2002:a05:6a21:a4c1:b0:1d8:d6b6:94c6 with SMTP id adf61e73a8af0-1d92c4ad359mr6963538637.2.1729304036708;
        Fri, 18 Oct 2024 19:13:56 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311d59sm2229509b3a.16.2024.10.18.19.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 19:13:56 -0700 (PDT)
Date: Sat, 19 Oct 2024 15:13:49 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: geoff@infradead.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-hardening@vger.kernel.org
Subject: [PATCH][next] powerpc/ps3: replace open-coded sysfs_emit function
Message-ID: <ZxMV3YvSulJFZ8rk@mail.google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

sysfs_emit() helper function should be used when formatting the value
to be returned to user space.

This patch replaces open-coded sysfs_emit() in sysfs .show() callbacks

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 arch/powerpc/platforms/ps3/system-bus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index b9a7d9bae687..afbaabf182d0 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -453,10 +453,9 @@ static ssize_t modalias_show(struct device *_dev, struct device_attribute *a,
 	char *buf)
 {
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
-	int len = snprintf(buf, PAGE_SIZE, "ps3:%d:%d\n", dev->match_id,
-			   dev->match_sub_id);
 
-	return (len >= PAGE_SIZE) ? (PAGE_SIZE - 1) : len;
+	return sysfs_emit(buf, "ps3:%d:%d\n", dev->match_id,
+			  dev->match_sub_id);
 }
 static DEVICE_ATTR_RO(modalias);
 
-- 
2.47.0


