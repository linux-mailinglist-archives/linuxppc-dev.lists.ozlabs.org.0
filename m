Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E3849316
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 05:53:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=WK3V1FG3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSvCC687Yz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=WK3V1FG3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSWsp32pmz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 01:21:50 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d751bc0c15so31045685ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 06:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707056508; x=1707661308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DM1wclqTtJ+/yCoNOLkdaIuN4wdZRWjTbqonpGJw8JI=;
        b=kFxYa/4cQjur3iygbE3KhvYhftS0n6GTpF50kJ15fEZML+4CDuYBggVf7UweTwQ0u6
         ga6oMOhwD0qvgzno0nLGfwahxlIK6YEt3KesOuBwUosgvQVKYMDKF/7OAuEpHAdhB/fd
         nA0QlaQLUPRcHCnzGToGdb5miaPyMJyRtyQjCghjQXAlebVwqMJCYXoXnnZnFq2421ns
         7v3LSuXxyUgWx1HtWHMoO1OiPM8Ipz/814Dbm4+BuqB17l77BGHBdUjtpQS1PZm2vQVa
         yQHwetCY3/kQeheF/HImBBgTh6mrtB0SsnAA+V84rIhNgEHT8k19ntQTY001RGbxNNFJ
         nwcQ==
X-Gm-Message-State: AOJu0YzkbrM8mTaFZY4AsMkQOgff/IXOEFGTukwsuD80JgqWfX/4VZP5
	6MCNyoSbmifECV9VVnnBSqHah84IsBumwX214tzG3mxpeA8ZGrgS
X-Google-Smtp-Source: AGHT+IGbMbmdxU5sGxcRK8e4sB+bnO9dyqYgoYH8V8UbKpXj1YBl8/N0RtzoifBZkOzBV1fQMWlwsg==
X-Received: by 2002:a17:902:d4c6:b0:1d9:8fc6:35 with SMTP id o6-20020a170902d4c600b001d98fc60035mr5472471plg.15.1707056508444;
        Sun, 04 Feb 2024 06:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXFJSX5qjqrqhBMTuQdKaXScTPowLE0tBasLmOzydkWG6XABrdrT8wqS3Wcj1n6Zzixrg6hrwXofBXEI2/cnsU22fPr//4+tQMt4852e/pi/5nNv4FjWcaiT3vBn93sdsXPjaqqlCxFFYuzr8VJySscPpAixRlt4z7HQU2iNN3UFfQwWq7iLACRhOypSqlY4lLEugbhicoEHkCPgAqPIPBK0BhI0GmAp3Gdpr9sYDoueU1H0DCm1YZhwSQsmYHkZpur
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id r2-20020a63d902000000b005dab535fac2sm5097095pgg.90.2024.02.04.06.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 06:21:48 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707056506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DM1wclqTtJ+/yCoNOLkdaIuN4wdZRWjTbqonpGJw8JI=;
	b=WK3V1FG30pTDXErhU6A8V1nmaEE3ZW0hDpcaQEa9JBtKoOMLXG6AhgggNZ3k/0PX5BvTCJ
	8TzgwlHZ7kVj0Axx+zXzZ5lO4AGLDedzNA1UCJlwW4L8Z8DzKC3ZZTCAUNAA+mkaQLZ9KJ
	GKfNmpha/cMVPNrCVFRpbZcXNZkFbW1yKYEwuWWXYjyPMJKwp7Xy0xK98ZDYjYFkYsm8Hf
	0gF3W0AQx9cTglwv6s5oApK/tB/wcyF10+5F607wE7rPrT72Okj3SPdoHeVGwnNoqQermq
	BMx73JUci00NrjJDQ9TMWBkoZ4H0f8wUdBQYmtfE25ZJ1MImca1fKwEi6uzRVg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sun, 04 Feb 2024 11:21:58 -0300
Subject: [PATCH 4/4] powerpc: pseries: make suspend_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-bus_cleanup-powerpc-v1-4-c763f0e142e9@marliere.net>
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Geoff Levand <geoff@infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=5r8tPAE4JJiQ/TMfO7ryglYRMYVtmuiRDdzPD20d+eI=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlv52J/wzsesxRSSPnJ5rCztFrehjjQWiFrmPB0
 SjinE4QIhyJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb+diQAKCRDJC4p8Y4ZY
 pghvD/9p/r1OMruDDruavs7mlXgYdpGZBqX0Sx9e4jpOPBU8fYGah6R0HrUIAQk32wEul9pna27
 X5/g7MvXsA0Q/0/+aj/XGmMeoqZbWWe8ZvCK7b4y2BEpP5Ek8wugNYU4yIvpKmsnwwATsbUuYd6
 ZhBxPF6wSK9AzLLgRXD+9CyVzZkFYNeWt9JGEsdHpN2NEuza/TbC7V1NKTkArEpbOv5xPhkqpzZ
 t5f/SEEAR/ruJYHGzQhpR3TRmx2kLwnDd0ZN9/JtzCC+6xL1fMf64puEjT+xUHY1YqITyqEJnag
 SRKWVrYF94vvsfAYpvgEAlrUCImZumTmuCiFa4tYDOtl7IaQIiny/NI7fLZFh05RO1TKUrxyubL
 uUpsL32dnPWjaNVG8ClnkMBwR7wb2cHUSO/Q19cgWDCF2nl3ICSSdBMGIPQWF+mSgOpgv/KqDTY
 +3eBuejg8f/oLSEVjZGwla1Py8AR+RixFiYlOaiHKo5XRTEnW4szpnMSFtI6q6/ZyR3INHabBJ5
 Q0IlvqDaZOrFRJMsGNYvr0NW6SmqxC+YRkJlmDU5kp4CAjj/n86YlBn6qETZ/PvXxddPQ0XmM1f
 FJ1Um9H1F0KvtUhUaWV1a6Jkc7bJfZKlDS6ftSP1ZDEkSWuEiUy8VKHEaIEBhvfRW5k/cV1WkO9
 JzjGbrUONmmZLgQ==
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

Now that the driver core can properly handle constant struct bus_type,
move the suspend_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/platforms/pseries/suspend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 382003dfdb9a..c51db63d3e88 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -126,7 +126,7 @@ static ssize_t show_hibernate(struct device *dev,
 
 static DEVICE_ATTR(hibernate, 0644, show_hibernate, store_hibernate);
 
-static struct bus_type suspend_subsys = {
+static const struct bus_type suspend_subsys = {
 	.name = "power",
 	.dev_name = "power",
 };

-- 
2.43.0

