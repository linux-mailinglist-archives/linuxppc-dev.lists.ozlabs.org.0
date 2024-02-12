Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BA851E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 21:06:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=Mu+f6XZq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYb7s1Cy3z3dd4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 07:06:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=Mu+f6XZq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYb5b01kgz3dBn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 07:04:34 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e08c16715fso1419479b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 12:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707768272; x=1708373072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uM4Z12hpk6ywnXmg4o7JBjzuS2oolDAHFENYm+t/mgg=;
        b=G4MhBancxgUfR3yiZ+/r7YsVmUaXGcHkvun655tcwzfWEeYiVfqb9efKKn24lzq4cG
         YV/OjJrzeNd2iTW7JRHnW8BUT5mgNZcPc2Nw9OUbRGZNMozp+0j0oiMosmvn7clKAQXM
         c6VPmz5Sk7HsEEJmJRTwb+RVlwjqCc/1f9dfMCkfpvrM0SZu3J8HyiuVhOp896Vye5rf
         vy6Raoktu3ikeV/HK7k43ZcWEbuU6lRbMMVtI8k7mPxJEX5QqaCUwRR20RIbOfsob9nL
         cMVnKTOj/7lIfo1Muwg1Jshp4vDvG2mm47QgYS/R8BVeSnL+hmYSU3g52s5YqgSKOM6+
         Q6iA==
X-Gm-Message-State: AOJu0YyENm4rzAvG1qFMTVmKYrZXjfM6KiCsmhch/FpM07S8nF/bNX6j
	x8zfXPpr4XgIMzu2xYPRcJJrReadIxnoIPDR1XOtx9hQFjwdEHhw
X-Google-Smtp-Source: AGHT+IHL2h7SDPA5vafi17KQNTfyVJG0IrVNXwwe9ZTwnAEz1/KhI2log19GhTkvjBRjJVI4CsvEJA==
X-Received: by 2002:a62:ee03:0:b0:6e0:9968:87e1 with SMTP id e3-20020a62ee03000000b006e0996887e1mr7194757pfi.20.1707768272484;
        Mon, 12 Feb 2024 12:04:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVinwUqKSkKJYv+R/n7EffgHxiGUzgM35n6oa1VEuy9ZvuyKBWxjlADigt3y3pzhUJqrNRwXgWnCX0dNI71O+S/wor5D1PlIOn6NoZiFHVyNjxFeLEpgW9LH5COqxddNWR0H8XxBDAiFU55yQ46GA5D6LmGp/qqcc9OxriEqbgymJUetyIaZhvI7HVDlG7+iTqZPJpSJOs6iHjnDD5oWMnXerLJ+bp7uB8Sdw+7NPb7YPyc7BjCc7LlQS84RrefPx0z+4V9AiXZ53aYDWOj
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id m15-20020a62f20f000000b006d9b35b2602sm5811979pfh.3.2024.02.12.12.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 12:04:32 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707768271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uM4Z12hpk6ywnXmg4o7JBjzuS2oolDAHFENYm+t/mgg=;
	b=Mu+f6XZqXzB5rLbeydHSZDUmtAFIJg2dn9KaXSgbCpUMbMBnYriFsCK75v1YeEyHp4m5se
	+tH7WC6PT8LPYeH6LREYA2pQ25PpYGu5IW6FelQEstIZDi5Xa0zebeZ5JWRYUnscuQtX+M
	SLkN8jZENSKRqJwzmD3xdZv7y/iWOUo4hP0jsTA+DxFrzfhtDJ0wVi5Qb4d+TjqQAb83tu
	cyk6YtcC8kssV+3STawo1Jb8DHGqJOt7NquuobFaThTvWfJcG9pgG167lldNYdFtskOyBe
	rZD0Zt0lyvK+9aiu3CKSzws2ZkPyzl0u/xlXXCwW9QIp3So1MoTgbjYssjdwmw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 12 Feb 2024 17:05:00 -0300
Subject: [PATCH v2 2/5] powerpc: vio: make vio_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-bus_cleanup-powerpc2-v2-2-8441b3f77827@marliere.net>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
In-Reply-To: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=wq2ksQ7riCsovFQtWGfWa+BPPUeBF8MZW1gziCVsNGU=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlynnu5I52P5SuFmly4enraO0oN3OCpnat1fA57
 nImlIfWOsWJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZcp57gAKCRDJC4p8Y4ZY
 plOOEACKsrsOIpmokRU6VXNzK5ezwmSY1tKdNJU9PusraupJcKE2n+zNbTsO7P5miK+XDIoxMgp
 gAKt4L7OYDC1SLDWnwrvjBh3KT87u7myz6lDXxktjBDIVvW8nn5NGWLZLuZ1qGwJ9LAWoDFjHoo
 8b6Io7uvYUtxXe/ySxu0RSFrt+EYRbg04RtFr8SVICTdjxIuzCioMfRtkNLR7N3QySEB2HIyPtc
 kSKqp5cl1g8IMkHarHcoXAhBYjCk6aPwEE3kfPUl3gcs8v7DUV3rWH7dGdcq+VuwXrClS7tLItU
 617tRgXwDdLnyahFel6MpI2ox8xCWlqsvcluCBVoTpzF+sTkZfrQ1/4Ek+Cve77dEnrEHK5JS2C
 NYY9i7EwVZRRIByV+fUbiKJnUZv09JWMGLEEpu3KQiWOZAqX2EJsjt0KMK5MiOY5RE+sszSSzci
 jyXHCXTU9kiOs6IJW1ajSp/su1epRKrroB78gNK7PLQjL0HdH9eWz4W5UmtevA8K2fxFk478PSU
 nKiJkGFws5DkY9GM3cF6QTfSwG9cG8RGm9h0TSnRRKVZd0/aZFEwnfwuoAzLawtEOL+cegctqMP
 7Phk4cJcihQhz1rIbkojDNncrIFvqVV0Vqo5sSjfDSpbOd/hyzNANnrMcsFNYxS0WjDM37UoPsF
 iBzsz4gniZJWHRQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
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

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the vio_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/include/asm/vio.h       | 2 +-
 arch/powerpc/platforms/pseries/vio.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/vio.h b/arch/powerpc/include/asm/vio.h
index cc9b787627ad..6faf2a931755 100644
--- a/arch/powerpc/include/asm/vio.h
+++ b/arch/powerpc/include/asm/vio.h
@@ -39,7 +39,7 @@
  */
 #define VIO_CMO_MIN_ENT 1562624
 
-extern struct bus_type vio_bus_type;
+extern const struct bus_type vio_bus_type;
 
 struct iommu_table;
 
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 6c58824190a2..90ff85c879bf 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1615,7 +1615,7 @@ static struct attribute *vio_cmo_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(vio_cmo_dev);
 
-struct bus_type vio_bus_type = {
+const struct bus_type vio_bus_type = {
 	.name = "vio",
 	.dev_groups = vio_cmo_dev_groups,
 	.bus_groups = vio_bus_groups,
@@ -1634,7 +1634,7 @@ static struct attribute *vio_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(vio_dev);
 
-struct bus_type vio_bus_type = {
+const struct bus_type vio_bus_type = {
 	.name = "vio",
 	.dev_groups = vio_dev_groups,
 	.uevent = vio_hotplug,

-- 
2.43.0

