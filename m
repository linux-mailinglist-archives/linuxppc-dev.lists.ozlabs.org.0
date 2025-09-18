Return-Path: <linuxppc-dev+bounces-12372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8ECB85608
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 16:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJZR1Wr7z30RJ;
	Fri, 19 Sep 2025 00:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758204506;
	cv=none; b=ksegnhDdts0XeSufGfdxu1VHo3WEnjphRoMoD3rwk3CdrIy64o5vsevAOPIlPse2K4hq1dBmzLPpvzimqca4pjKsAEXzi5T2Hy6NGREhXSJegxt1FQsZQK7qXEOME3iERNe+M3qrgREJHvEM5ODun3LM0xN6CPYaBJgOLk29z5GAeCO8cwhPrwb8muGYSTOg6T05A+ISIU510cy1FK05chhC+sZGHhdwrSDB29eCIHBhcwDOwnccrnUDfe/LdpHo8UojyNKKr44H/XU9sJO2Sp5hmbHwzIDorbiYJboQ0deHaUMF0u8y2IB57ph9djuWaDAjaBgsSYUtTWTuLO9juA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758204506; c=relaxed/relaxed;
	bh=zX8hRmCAzatzTP7W5f8Y/6xpy5/2V7FwxYbZWinrYv8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PVOxQNAZwhWs3PQEs/p96ZPKQ7tJy4cK1vDo35C0q701w3U80f4WrrEGT26J56WK3LNt7kUaWqDumBpgqwl//jBF1sxEZbyJw2c4cuIQbFouPiWg7TG62MXhqQZNUuTZzl24bB/FfFkfX64jqffikLasqjxCMzR338oIws6+fKbgGFK7QA30CXHcHnAFS9OEhhlXYzRrswUS7vwTHmNNkktEMMsQTAIkxUdadeU4w6l4H7zSkTFi6PUwG540cbRZic+0lVH56BFxt2FLYsdwbsNwK0RlU3/fHXr1noOVRmMXAZQBJgXE1ETemb7nyZQSFYPlgQak+bOtMRYDFgPHbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QQpnD4C6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3uxlmaackdpqwxwnjwockkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QQpnD4C6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--abarnas.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3uxlmaackdpqwxwnjwockkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--abarnas.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSHY468vXz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:08:24 +1000 (AEST)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45f2f15003aso6534825e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758204499; x=1758809299; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zX8hRmCAzatzTP7W5f8Y/6xpy5/2V7FwxYbZWinrYv8=;
        b=QQpnD4C6JsJ44nnESgg41X1Qf5kiQaDuSTlDyB3QrgTECoLIyBzoNnmHVh42w2dz8s
         XENPLbZN4qNMB42WxmtIkTZpXNw62J16EIM7SJPWXKPq5Oov8o9EYO+1ncQNK4l2BlmJ
         Sf3xu6oW5AAy8xrsNajBOzENip4rZR/PsblIVVjoSXZ2fEIhDIVVQWTq6OE6orClhe33
         cpnxy2aHw9gfCCH3vgRLKt/aoAnuqUVyYGDJ7J6rJKQVu1LKfQBD4TJyutg8Dui3MGGH
         /XplawgGZKdQ/JAmy39b3r9yz5vkCOdlLs97odp7JtvOpOaZX5Ox7uwSdRTBJELrhcat
         PCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204499; x=1758809299;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX8hRmCAzatzTP7W5f8Y/6xpy5/2V7FwxYbZWinrYv8=;
        b=Pn5B8Ar6Nwrsq7ejVWkONVNnUsxE3TgW6gwaT+el+IofTYr+8d2wTtEPLyMgT6NHR0
         foYt7bPrDZREb/k9IKScRns6RcXsyUZhwxDjHwwQmG2Zig/aXpF5VL6uHUYvqKXvw3AP
         NsESt2hX8eXL/V6y58gadaeZqkWzdcbWqq08x6RsEgeGAkrzrDyJai2FdLj8cX+Bjbx/
         zZ8K7HphVF9rPYbDU0Um4LUf7eXd9C3N+auwsMZ4vHSlxrVwzTcDkrvjUr2qcnoxIfz7
         jlPKVfwRn9mqiBHzuP0LmdwiGvIJ1YYIaHLdfoC7CnXjGq2tXt3ESuCmnzfXVTjiG+f+
         O/3g==
X-Forwarded-Encrypted: i=1; AJvYcCXNQbOeRQZoMvCNDIbtJUADwBFxOU+Iwdn20c7uzr3OyPfnaVKQWv9knx1SuLrZ0ua9JcSLi8wC3RFKefs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiwXwdLEcIAuv7dRaP7y0we02uqkLsdH+7FRpIdvy0gCHi7RSW
	2B4SOEmeJBgwBzylUM/AeDEfI7wosBYSsfTZ+5sSBOohvmZHo7kkG6EGZVydcR20skuwaZFuY1l
	m4jbvYjXIog==
X-Google-Smtp-Source: AGHT+IF1RQGSRNYZqdScgFD6eUa92ab9fa9/BqynjtzBd+gLQZAlGCMW8rWJZNptgVbcM6q8cADYm4uMJB3v
X-Received: from wmbdp7.prod.google.com ([2002:a05:600c:6487:b0:45b:9acb:6940])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:470f:b0:45b:615c:cd2
 with SMTP id 5b1f17b1804b1-46201f8a4b9mr68058415e9.8.1758204499266; Thu, 18
 Sep 2025 07:08:19 -0700 (PDT)
Date: Thu, 18 Sep 2025 14:08:14 +0000
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250918140816.335916-1-abarnas@google.com>
Subject: [PATCH 0/2] powerpc: pseries: making bus_type structures const
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Current driver core properly handle constant bus_type structures.
Both changes are moving bus_type structures to be constant.
It is a part of tree clean-up from non const bus_type structures

Adrian Barna=C5=9B (2):
  powerpc: pseries: make suspend_subsys const
  powerpc: pseries: make cmm_subsys const

 arch/powerpc/platforms/pseries/cmm.c     | 2 +-
 arch/powerpc/platforms/pseries/suspend.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.51.0.470.ga7dc726c21-goog


