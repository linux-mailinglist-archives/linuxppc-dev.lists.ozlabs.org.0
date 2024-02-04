Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB074849312
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 05:52:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=h9RJaU/i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSvBP5RYXz3dSx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=h9RJaU/i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSWsl6xYWz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 01:21:47 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d958e0d73dso17942045ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 06:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707056505; x=1707661305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHTVR82oJxjzskpZPEdBmE91C5T4iAunxv4wjFY1nfc=;
        b=B3Dy0gzjZLwbn6zRCCkOQfmCqp9w8q16NL6LPD3IxxY4PF5fDhidCQXx8n8iZSuSmL
         fZCzGadkpIGlfycRj4mry+dR3MRvW3Aom4VDMo2FIOH2XiAXeaE/YSl3IrMWbydsxntW
         YjrhpE7dCTHXgKcw+sdBG05H0XtOrzFQXBjFyUNkB3emhc35zHGtKBlh1PiqKslFg4zN
         h+a8G2RDhreXFnuClJAICh2JDm3L9zgXnTg9fI08l9dHkV+yHxqI+9FDyQ7b2Rl/7G3K
         aq0To+pz42SMrftxd0xVrgXFzmRAC81RRBHcD7dhK1II8By/q60VujXFV4HPjtC5X1or
         Ff7g==
X-Gm-Message-State: AOJu0Yyr3DSd7KutusyOjsi+griFGJug27sxf9GLQrTIoKxro6CdvR9M
	RBd1RjSFuZ2Iy+azQtlMAQanyuPnovuB4f3SPCBia+K9maCIsiYbV5KKsyEcjQ4IHA==
X-Google-Smtp-Source: AGHT+IFnxDcHKcqFG0FkygR0Ytn7AdpYRpJG5e9YcGVrKPogkQsls2qpinGrOuL42JpnMCDUjOHynA==
X-Received: by 2002:a17:903:98c:b0:1d9:a15:615d with SMTP id mb12-20020a170903098c00b001d90a15615dmr5281659plb.1.1707056505235;
        Sun, 04 Feb 2024 06:21:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUhC94iyl0+VWBvOMii/Ie3ZeOnJPwaJglnNjuI4MN5P+jK+5NO+K8t2AD3Nw+NK2FfuD0xLeb8vODLn9BgAf0iziOWHtiq0o7RzDbCO/hXyIobzMj6hhmrSWq0SK8x2WYALXXP7nU4JAMp7mZqrvtwr0F2xUCJqhlWofgTvsWzcllWPLe9npaGiG8JalL1mEyfx+DsDP014R5KH/g+ycBWm+jI+oFTvj8bWvZguGerqXYnR6tcW0h5LKTsF85JcLqb
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902c38200b001d8ee2884c6sm4609803plg.218.2024.02.04.06.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 06:21:44 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707056503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHTVR82oJxjzskpZPEdBmE91C5T4iAunxv4wjFY1nfc=;
	b=h9RJaU/iHQx+xntBzJkEFD2ovMgBGTUqNtBTge7Qh7LVL3klLNR4GW6iranmYAIYJKODRw
	JC/rTKcnEx+NkhV42R9gdRJAWtxn+yXdpEZXW0VtuE8uEbhZyGKkNOxX0QtYvnR4mdyEv1
	nV/w+5WiSgUj6ke4Hlra+FxL9xCPr4YDKGjwS3+dZqLY2aTCqzC5AfwJ3y1aaNG/T6Hd2S
	sZfb/dm1vgNaKZpz7q80D+Sb6cpwLaNaLBM8+AdgyF+uww8NMYV8Aks0efJPlWD4pxxGAX
	armnejmHiNlRTcchM0HcX3PKFJt7gTKz4kvgh0u2IO6nj7KWXXizYLb36MBU4w==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sun, 04 Feb 2024 11:21:57 -0300
Subject: [PATCH 3/4] powerpc: pseries: make cmm_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-bus_cleanup-powerpc-v1-3-c763f0e142e9@marliere.net>
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Geoff Levand <geoff@infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=vX4zjhZKqFa8JoxKRN7aX2nEk1pJYZI5Yuxa5g51+Ic=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlv52JH0RVChP/ofquW6EPeXAMdjGo10WSeUC9O
 h3sBucb3ZWJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb+diQAKCRDJC4p8Y4ZY
 pkadD/0TlY8FzfIjCQDLawUdlYcvbSomh3gXRLnEHroWY/LecVGFkF3AkbtPP0QIYBXD5T31HFB
 HVypW5RmOBQFdiFBG2sHO+PCkZBvzkJJewhHZNW2eF/uYqr2SfnDY3+MwmJyCYCTNKDVMdDqqk5
 kKOUUXv0YW5fXx4v2Uju0b8G8oAthRrkfKwiYMXm87gpA06e6QuCxUHEOyxisJaFiVfCdI73I9/
 L63eIOxFStcTa9yxet3Culd3mN6R8T5Nk0rlHqYoT13DepgrIkkuIrVWtWIe8jvqWA5Hrv7a0PO
 sKc8ml7h4B2XY1OfpZHeD/1TKxjBtulPfhD3p71EhodEneU+yD0d89Qa6IhafmWG7ACX7Zr1Ech
 gt8gPI2mkJxcWviJ2DFInqAG0kztc4YDOdnxuBRjkZEqbZ6JOqZ6cXXGcx5/glhAFiiv25bzDkl
 GBIz7Oo7rydanRQUykKDN7S+pNqM3wjBKYOJYdCktkQNzO8pTTlt6wspLz2idEfI2cntNkmjPmt
 cihQJ095A+Qaaq8qepX1esm/yOfaB5KOyrZlH8ke8IiQm11HYX1dB3dzR6p5lgaNAGRfjRip2gG
 ZNwagG60OdKk8UaEU3M9c/NkhPbn5PVk+UGpgrMkVgLKzFlWHYnxFEUnXTCDpfLmVI+50CtmEHv
 9lisZWj+nM2sLPw==
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
move the cmm_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/platforms/pseries/cmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe..6307dacc3862 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -375,7 +375,7 @@ static struct device_attribute *cmm_attrs[] = {
 static DEVICE_ULONG_ATTR(simulate_loan_target_kb, 0644,
 			 simulate_loan_target_kb);
 
-static struct bus_type cmm_subsys = {
+static const struct bus_type cmm_subsys = {
 	.name = "cmm",
 	.dev_name = "cmm",
 };

-- 
2.43.0

