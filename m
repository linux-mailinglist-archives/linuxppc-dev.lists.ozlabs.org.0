Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34C84930D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 05:50:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=cbefjGrk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSv7z43qSz3cJ9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=cbefjGrk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSWsd4sQpz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 01:21:41 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2685432a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 06:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707056499; x=1707661299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWCI+vqvVxBiSG/iqzOyq6BSjdvQw/1IHnThZEarm88=;
        b=lb9+n3NNEN8oLr2Hvkgymq72p9ijP4OIS/ZcTzccaaa/QF0WO+JA21kd7QPli3LbNC
         a/dXU7j2W2GL/M11Ublf7sSDzlkkaL5+v3Gyyv2bNVYZX+6IK6Asd5g5SiUjpCufw09g
         xsy5gD/q2W7XluXkEHSgUx2NyB5pt2Jc47ks2O3dZxhChdthM9aVLu1k+yyaHk2N2kHr
         Kq1NGdHaANO/Ni9B3umuG6Oh7MjT53Ba6fBiJQuMLDuNdY/iRLoGDNIE4h3TSUCzTKWl
         2m+tBKlGN1ts+0yGarXU297ghgsdaFYJdTAC8Yp/iK0PQeYLgIFLrOJAFm2DgIoxwKNs
         4Axw==
X-Gm-Message-State: AOJu0YwUK/u/JWyy4uRZsMNGu94hrTJQHAeWvuETSNDQWO6ao+BNYPq6
	FM0SlgBXVK1RfzySr+wM8t9G8ku4D2VIsHHYbP07ZhB0eY0tCkY5
X-Google-Smtp-Source: AGHT+IEskZfLj2ZTPXM2La+YvAGsynrKmLjr+vYWP4IKkXXLr7L91dtxUJHUEU0Je/Q0XcYvfcr55w==
X-Received: by 2002:a05:6a00:2314:b0:6dd:849a:d2f8 with SMTP id h20-20020a056a00231400b006dd849ad2f8mr13150112pfh.16.1707056498683;
        Sun, 04 Feb 2024 06:21:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUivQXCaPIDOria/tbG8UU+udpoEg1uo70idcJiJdt9QxcEycuIItUR+DkiVouQdX/Fx6wLa8p7qSYnKRiNBLE6tLMTdV+C2ZoTEQjpxvkIW6RoNehyZldbnkDjQiLzw3OguMomfLZ17FxLhn9dmzHs6+f9Vs5J/8Oa9w+tc4tJa+ZgCitfw5dV/kTU6uBOZ/L/Gs87IKpJRgPcb+q9VBbNYrKq+4GyBjz5v5DekEf18frvDqfLbFcG1O1m7zzV0DOx
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7845a000000b006ddc71607a7sm4844563pfn.191.2024.02.04.06.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 06:21:38 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707056497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWCI+vqvVxBiSG/iqzOyq6BSjdvQw/1IHnThZEarm88=;
	b=cbefjGrkGnGYMopgkkwo/WkMlw3RZvKxDFRronR7XkZQkcFTEPlt289xL+EH5Z79lIvuwF
	Ijfhek0t99DqpN3Fp8aqO729fE53m8RaUuXmQj2+y4fgkJZyIFhr8wcYSPc6gg/P9wU+kl
	evfcGQNPwO7aAWre/k0Mw4pQYJdmrFlJC1VhkSmZrT+zqpqYQuypJJiTZmBHVpUOnVN3gD
	eiG0S+bG2AH4oTe8eMXR349QJWGqxSiNYj3h5TcPFZwFm/Ie4UFX5dFIYKJK5mrU/C+zON
	4XCyT+0nmdczEIVfryE5gUQnTs5Deq2voEO4qrTpjbfJe0uh2ck7hdpTnrEGFw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sun, 04 Feb 2024 11:21:55 -0300
Subject: [PATCH 1/4] powerpc: cell: make spu_subsys const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-bus_cleanup-powerpc-v1-1-c763f0e142e9@marliere.net>
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Geoff Levand <geoff@infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=g8Hjw0Un2UmuNrx1HKqd2DuS7J125zeqL4Rufxc+bvQ=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlv52ItRdspNrLF6cpysl5pfj7tSlSrSpBs0/QI
 2LP21DjGReJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb+diAAKCRDJC4p8Y4ZY
 pg6YEACmjkpEiBCvlmFcn/tAz46rR5ZB9JK9GTxto8yThevzrnnVWpbKNlViKQkGqB4thL4uyl2
 pFle3tE7qQ3WUy/vr5rZkWd5nNQbcBlXOHo/EyXcgz1cA8PSKSG2NJqPbWMEjd0JCYqA2sxfMth
 dg+aEpmBX9Y0bjHVdBUyOPf96wyqTboDxM5oG1BNVzavQUSN2bCHgqNmD5VU9pdppb/Ma9bkiN0
 Lz4dKQUvYNGBkhYXG9QkrrwJyqTvh4qsbpper9rr/q/FmpNS8wIitlZKRJv3jq1nFX4E/qoaOMj
 R5TtttKuONMpQ0jgMeMjILLnv552lyIdDsMll/HsweuFEDXYQVf1TPc/PSAdDfj0zaHQqQHkEQ4
 WjSrNGDWjRIZ5IDOSz8XNZXZT53y+RXKTV+pYiDGXxNuVwW11U/m3Gkdny4IstvqnINARS0DBmJ
 jJcyS1/IfUf1VQT7CRrGMBKxLb8qylcqVthB9BjqGyAWJ9MWX3RkH+NjTIYjaMNE/6LDBZ1IKz/
 +tJDHzcSL5c6YfAEmmGRK0Hu4EOv8ctlNjGR0T676Z+Ajvla7j0eEVm3uk2BD2TJXcBBolAGfjq
 aEac2jYmgUOYyMW0ol8I1KQkQKFxRB5Yb2OISYjWWWZwdWRYsIag41bmjaXXoTNvWhQC9+zoNMF
 rpEVID097hbs+VA==
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
move the spu_subsys variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/platforms/cell/spu_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index dea6f0f25897..346e433d2706 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -465,7 +465,7 @@ void spu_init_channels(struct spu *spu)
 }
 EXPORT_SYMBOL_GPL(spu_init_channels);
 
-static struct bus_type spu_subsys = {
+static const struct bus_type spu_subsys = {
 	.name = "spu",
 	.dev_name = "spu",
 };

-- 
2.43.0

