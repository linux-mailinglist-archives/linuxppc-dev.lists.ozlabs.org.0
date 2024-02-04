Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384D884930E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 05:51:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=iP//cYTz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSv8n11gqz3cgJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=iP//cYTz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSWsd4C4hz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 01:21:39 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d76671e5a4so28805165ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 06:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707056496; x=1707661296;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UyoXp/8QYdgxWLoRQB6OIS41/J+8oPM3qkFDqrn6KSQ=;
        b=pLy7H7lRx3myyWtQqj5cPylEubnRWSikCSG6L49FZi7CEhfHP4dl3tpyvKcpeMjdXt
         r68kdWjBBJ6gaqfPG47vI7PmXvAhhI+njqaGDzDbj8jTIUO5CVxnqSzyvd3UzqLktVBc
         4XOldjw6mfxt9dWQze4j6mu/7/iLBj8hx8WnKsEKigQXTPSAZHpu1EHJORjGMIQ88Q4o
         fXYqYMDskn/fhlTh8VaT5bULJfcXARnnTgB9lNNhtYGMtr1BFx+gNjTK04bXReQpZXiz
         Xg1DlB/0mFAjcRov7+JxZrqFgl8raT8+TuFn452U4BwtEWc4sIFxsJb+LRdr632j6CD7
         6jpA==
X-Gm-Message-State: AOJu0Yz/SH9TQjDqPsdGKxnYvTi43YMY1UtloWcsLRfIURTMnSwcoTYL
	CJg/sapHno8N5EKMv2L44UxaXrqBrt+hVnH1vvZT5b7li/D7Zo6t
X-Google-Smtp-Source: AGHT+IH0NjA6VU+9PQZ5WKP9L2fAgDWu6h5Yb7luZQCwoVBPRIfE3fYTikWLmB64G8Z2QFGaoCs2Wg==
X-Received: by 2002:a17:902:c412:b0:1d8:f202:2e26 with SMTP id k18-20020a170902c41200b001d8f2022e26mr17817888plk.48.1707056495788;
        Sun, 04 Feb 2024 06:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIZR+/JPp+Rkl4I9agNPvayvxHEANuaQ0k/CTuOylfTj5besd8eLl9iwqRb2Po4rZNpgT6jcuxVyYEgmIxepk+0bHeTEDmGPsRcmyu8xnz8gsZcWcJE7zDFGf5mVSKvsEC3ZGWXeQanUiPpHx6jfl/BsnjJ5WR2JENa6dStvnfkxY7sU+uYZ73cVYjX58awIpKkEIhiK9gIUUX9YOnFGUIFvgWfnu6Acm6PX4CC8l4yEHxSodv2n+EebepuNe+b/4U
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id je5-20020a170903264500b001d8a80cbb15sm4569808plb.238.2024.02.04.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 06:21:35 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707056493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UyoXp/8QYdgxWLoRQB6OIS41/J+8oPM3qkFDqrn6KSQ=;
	b=iP//cYTz2EBlm4D/IAmcu3Gb2J+ahsv8JdtKZ/rfCw+lxxatjUX2RAr/mpjnUa7CevcUlY
	vgJQtVvheyzNt69dAKlkrL1HIsVVvf9clf04u+k55NeMBGkedWFZc6PyuOkvLQKzRH1w4N
	gfYnKEiQ5S0YZikSRdIm64gNk+DU++2IBu+vt9kFomKYaluLSvzASS1PLT8rCu55CNntiw
	Ryt4BmWMItgtrk2fjmUdQIPGawMFPwOz3wBCgHImYJ/slfIvZz031aVIGGC1hrMXs6wu/a
	49eUiaIAGvHHWxI9pP/4kwOAqzPtUpwnDWRQzp7xoI1wzcejJojTGaZP9lm4wA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/4] powerpc: struct bus_type cleanup
Date: Sun, 04 Feb 2024 11:21:54 -0300
Message-Id: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKdv2UC/x3MTQqAIBBA4avErBNsKIquEhE2jTUQJko/IN09a
 fkt3ksQOQhH6IsEgS+JcriMqiyANuNWVrJkA2qsNepazWecaGfjTq/8cXPwpFrUhO3S2aohyKU
 PbOX5r8P4vh/yveOqZQAAAA==
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Geoff Levand <geoff@infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=iahNaCAw9x35B3s1XY/K+RpDIjbPDPVEVSA4vTRhVu8=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlv52ILOpbsRHWiEOk3oWovwY2gvTTp4p2xo3mX
 YJ1akfIwluJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb+diAAKCRDJC4p8Y4ZY
 plOhEACmO2ogmhmLilOE6SHmErWs/7G0IDnQjLIcD5osz6jC6KJHOtXnVZxVabtuB6tDpkhGAjH
 eheA7iVVxFDv2NK4nR6zPxahrFHYO5AtSFFgQLexzpxg4P6hHIPhWVpsbsxMaYkkaIxrFIUYtgp
 40IuW50a7LjaBI1DdO8hlpBp5f8iVLJzp1JGenIu8xSUlMbFMHHzT/7g9UJTKvrj1sgEuKQ8A0q
 q8Oi3eXEC2L6yjALkMnkFeexEJiLwN7rKZ6AqrnrLjNnW93DB+5v2J1xG5sfBtY46PPcXu9onFh
 j0ArD46z78eQj4ki4K4v8PcisEtRPxkgrjsWJCMbUQyKa6ItrnSx8RUjfJweApBWg0Sh8NVBOZr
 wmV+rroOw58ndS6pr5EZLLhflo8OtS4oLuZ4FiMpx1Hui41zT8oCVKXx9Ze/wYRvTIeLAo90TEX
 5aM00mwnQ09Lnfv+vHOHN7glfo4Az5yxQfN0CVj5wPXbe4JBvYTEYvhtfIM96LtgpF45T7zAJOQ
 FZQOk/POgA0Rfajki8r5He7tzac5jqNoa4oHoFYOk8tJISa3QCCBtDjtx8fGw7QMaGHsDanvF8t
 KIavvsBf6DQpds0/QbI33yf9n967xEBhpfk+/cOn+qKcDkmYrIhbIaY2qeCvi+8mwvPTwcQEpOT
 7uMsnof/Z4Q/Thg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Mon, 05 Feb 2024 15:49:46 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]). Specifically, this series is part of the task of
splitting one of his TODOs [2].

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (4):
      powerpc: cell: make spu_subsys const
      powerpc: ps3: make ps3_system_bus_type const
      powerpc: pseries: make cmm_subsys const
      powerpc: pseries: make suspend_subsys const

 arch/powerpc/platforms/cell/spu_base.c   | 2 +-
 arch/powerpc/platforms/ps3/system-bus.c  | 2 +-
 arch/powerpc/platforms/pseries/cmm.c     | 2 +-
 arch/powerpc/platforms/pseries/suspend.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
change-id: 20240204-bus_cleanup-powerpc-720c27d8f15c

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

