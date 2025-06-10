Return-Path: <linuxppc-dev+bounces-9243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE08AD36A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 14:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGpJ03RT8z3bm3;
	Tue, 10 Jun 2025 22:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749559136;
	cv=none; b=GSTZzoJGj2NWlBKB4UKw5wBaWekvdb2mMuq2u3kdVWHXq0KNEufamusjrSOZZlWbCrPHf+Eis3OFCIIwfzrF22AZ8fi3CaBK2bsOmnCWM8QkePlgDSdYXbQjb/6sKLqGEPFAYbsDikBCH4Fo1dV3KEdtnzqfEehlQXQch29fm8xYwNzot8UWHUHQkAtVKS3UeVbvSWWym3l+tIIZJPvlM8nTz+ckNlU0KmPKdERw7BrGgHKg0cOxR1kIZgMMFkB9OVKDZWLoNZNu9gFNWslq3jPDvLm6PBXWxGljglby2yF+AfG/fgwdp44gbJ+/waKBQXzIGFPABWilO2GFaDAW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749559136; c=relaxed/relaxed;
	bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AtPg02RtTCl/BFUbR3ONdrXXCGiWkHxux9SUGCDHOZmBXrhtgG/kmp9R/6NZ1jvFgpB9ShnOtEr1sQNXc2t6yQRF24iBpxeRDTZogGcGzqKe8SWL3L31JLCEDobKvg4i6U1SiIhJCzaGIIoxldoEdOcTK/6ScfiCUqgO+AHELDbtYomRTXx70iSgDY5zG/E7nlEzuMP4wrRmv/y4u10flGxEzKmljELK5Gsj2kT7jV24KxWfb4MNtVZUGQkj4t7HXoPyfFtLywz2fsNYLhwzNbC3iUVqjZYnAKhplug5Le7S1+8mafeQGYM/HM3REXlmN0ziItmnnaeHqiY0pzwcLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=v6492stC; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=v6492stC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGpHz33tvz3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 22:38:55 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so62014595e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559132; x=1750163932; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=v6492stC/zkM4Mh7UCG+PgJnK445ObOisqppb8IE42cs99eZHu6D42BBXgzyueoCzo
         +559KfTesklWs434JY9mJwsMv0AzKW5gTypGCwN/3UcqhTc1ssgLVXd/anazHopqNLhH
         +km7S2WKrZt7LlwgdX4ij1FEkH0K8Vp37Nsv7UBJ3SAsc7kPDuYJZmiIzrFCxadyMch/
         zfIPgOhHwui7na/BhQFAUCsq/3WWLiM5z/DpmNIR7hhw1dnBNDnKxwjnM9VpQMW7rm6S
         yYPkEKKUR4B32sKGKGshSioZMWa1ir04AXgNfwnFo9LGgyPU06mEAbzFhVzmDSziNxpf
         Pj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559132; x=1750163932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU7/4my6HqhkT0+Lx2O0XgxysZx4KZxVdbslyauHUzc=;
        b=g9nB4MbzTbR8djorWc/KS8migw7X3n5Ehana51jfBiP6ZQXZFFG0rYUaurSqfgesha
         tcq4lHMT45qbuhtwiBJxJIjl9RCX2d3oQnkfr6FSDESOXMwvxfg/xv9bCVVwfWPkuXBB
         Zzmq/3h8C+YY86CDAsU3pA78r5LcS5RFn4ETX39Z47GkIhajba40t0RBMxb+L0a5iA2o
         ZKV78/5Dnh5t+7Pojv59DHQSiRq4jh7KvZ8G/0BFoKSG/bglIpLPyxGxD18zXIUNYT5S
         28z9vVlZryZmbmU2BmnjVUE75xFEZhoHDGP08DiamIdhHYedd86ogrEQGK4cYdE9nWEY
         RyXQ==
X-Gm-Message-State: AOJu0Yx4OMSEgBEmpdljirHOfVJaIqcDCT0epTmjzfghwC1rgV31T/x4
	73SvpP+ggx34KFwXTjEeabjf1ZeFV7bJsn0W6ERKeVQO0PMDsjRqNmqf0ysMcnf0dis=
X-Gm-Gg: ASbGnctOqoIhaYx0Xj74cgkG6/L9Dm4t7IqkT53jLGj+ZJN1ATf+cK1CnUlKQzk38OK
	nHuP8Az0ZngUFjQghT/kWXCjZXJazthwQch/ckPcBkO0tLEVV/AGE/z9XmOnbTeP8bc/7HCi3yk
	uOCwxj6CKFcD/3fznQxqjKWeSIg/K0T8dpllhy8U51yZjWyT8bMEJNiO5avtE6Swqqk99lt4vfi
	F3sbmv8OgVcq9SssjCwNv59icr+V+nB8LS5WyV0yCfP0g7Hq9L0inHcuDxYHfiXZL5AIUGHKeoc
	OU/UwnXYhRd6y9jWvtvTxw56n6WeHxJRttIZQeYHzsgs0ZrxXzR1raG0+RcaJyg=
X-Google-Smtp-Source: AGHT+IFUBxicO7hQVJhltf8pKkjk8eVddbD5uhxdka17FsMWwGoc9zt6HgcPXCEgQzPEEyRBJN+3Qw==
X-Received: by 2002:a05:6000:24c7:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a531ce8887mr13210295f8f.56.1749559132270;
        Tue, 10 Jun 2025 05:38:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] soc: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:38:49 +0200
Message-Id: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFknSGgC/x3MQQqAIBBA0avErBtQM6KuEi3CppyNihMRiHdPW
 r7F/wWEMpPA0hXI9LBwDA2678D5PVyEfDSDUWZUoxnwShyd54RCN+YHJTrUlvQxW23PSUErU6a
 T3/+6brV+xtJg+mUAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-soc-14e1d9414f70
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sGr/PNAndJxKtPVU5XNTYT21VZPL04qdLeA8uRGJeaE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCda3jdxUjB3y8y65I+EGMTPUKfUhIEDVrAHr
 JBuGF9gOJ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWgAKCRARpy6gFHHX
 cs12EACyEHdV65zoM07w3fER71x+bL/lzzv9ak6UL5WWCzMWUhqXM9fuKnO9LcmVm7mqDVNveiN
 AUdXK0/68zZkddeVHu3ENhI9tm92CrnaFx1V2dLwfSBZ7ASs5GEIXvbV3X8Dni3dGphkpvJ4Xny
 gacdtzbCW7nrjji3x1moDcgcET9rxgkmlmmzMcT8+avcRJ68DS3xkcr1GQKPM2RQ/PoKKiQa4Ci
 G2NQC5B3wBRVHkMAz04e7aGy1UOxNekQrxf+0QzO5zgfVb/oo/QF4wqd90GNJSlgjrDlIq5D9mU
 /nJn7XnqWUim/BFCyBola7xRLAr0tdrRKwdmrDdRVULix6Z0CXPXoUgNg9WH6ZSRAgFjSpQRCrB
 vnPqDPNpD/kpE3zZ3W419DvEvcfWKN77fmoIIlgEZt52ZAUV6qc0kOeNxbnEt5JZZSDfloLKTel
 yxBEzzydWWDhu6eCO9iZ+sqZA0266BG1djyrNkXJKzayOLu14ADuG2ul81SZ1DozyPTiO1PIXse
 Z5+pwSdNtIhCqSzmPK3Qod/pzzh/DrDzvMbfB5azT2yP8RymRe7ERcn8iVfr0LcAKOozsb6tx8l
 SxZwGqbUdg/HDLqLVXMx7GWD55Rc+O61o+zkaJxX2U2+7ElCLC6F7YHw6p/4rnKaU8Suw50DagU
 mF0i2p7lsP7AuBQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/soc/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      soc: fsl: qe: use new GPIO line value setter callbacks
      soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks

 drivers/soc/fsl/qe/gpio.c       | 6 ++++--
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


