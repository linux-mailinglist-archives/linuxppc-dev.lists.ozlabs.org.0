Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B455B85533A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:30:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=ExxGDG4H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZpDs4WQsz3vc7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 06:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=ExxGDG4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZpBY1CFzz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 06:28:04 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1db5212e2f6so1009855ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 11:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938882; x=1708543682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SW2EVXlkBr3rgXstlJZO0zqxkNTOtfGuPtYbWFp/giM=;
        b=a3tOeRtbV4evNorZVi0K41iWs7Io/mVLbZQtYj1H2AYzUVFuquu5wYjWq+wiukyfHV
         z/M4k6+INrd/qPL9UgAQpyBP9vLD+/4zGBVMERDO4z14ev/D9foCj4uM25JAT132/AtU
         E20YEl4rEdby7IEQSVMOou6TzoijNI5B2DgurDcJ3k0V/wj88TYCNRO17jgBO1/upssa
         +r98+6SQKNjWljcoNiy/z7i3yxyFbh6W/a1E2jkqgKFJxN6lyKAhMhYvtZSlo+HB5ynz
         m3xMSYyqqNw8QptEX0OMxjShT+EvpG0Fp0tMf8ySIw8ARfj2hvVO/PFGbjH4ZU3cv8PI
         fr2g==
X-Gm-Message-State: AOJu0YxejugJPPt5zRZtwXWpOPQFjnnJ4geBF1nT7KDRumnkG0xWJLkI
	fKa0n8Gk791yM0lXCJ/9TKqzOs/TBRI+duRLMcDhsXt7xKqsH7k7
X-Google-Smtp-Source: AGHT+IFfGbZuAKSoIipQ/AuSt4XRcAoPLUj2tmOBYt6LOxRikAJhgLvwB5Ih9ElCDzXfq8dY46oA7g==
X-Received: by 2002:a17:903:32c6:b0:1d9:adc9:2962 with SMTP id i6-20020a17090332c600b001d9adc92962mr4216641plr.20.1707938882014;
        Wed, 14 Feb 2024 11:28:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNr2uJ9kjnrGCOQC9BNLwWgg0FTNhR81r3mhUOmcxEJOT46yMDQ2YE9PySMXH9JejYyLfBYad23Xt/qtP4pPO7VaCiW5o6cRBaLbImdxN8Ea1NBJL/n/vkMXS+JbXWFt4TGJQbxO8QSVNbOlI0qMyY8fs9rdBzMpEusKyCRENQa2meTvVnw65ziaJRTjSACAWZOqJbCLVARgAiekH+t3uAQ08tn0XAp8sd9nu7H5VACcHMwU9UDTqQnBR4BeAtg5VErA==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id kk11-20020a170903070b00b001d8a93fa5b1sm2269628plb.131.2024.02.14.11.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:28:01 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SW2EVXlkBr3rgXstlJZO0zqxkNTOtfGuPtYbWFp/giM=;
	b=ExxGDG4HkIj1oisfc/xBYlb83uf+EJVkHyY++SDgkc95zRxC5dMn62sB0ubUZ9MmGZ//Ve
	lIF/ReQzCklcu8k5GEkXFg8Et4Oyf8JMeuqB3qJDimH9K+Zjzb6y6TWjvbbln2aQLXkSjo
	9a82NqA3wef3FOOC/DioCZN13IuEG+DQcl1aHqC1Dmh7BSbeVJz39Nk8PBDTUEXX0elzk2
	BLpIxKjaxPDeaMxBSmX++g6iWbO5mf0bDTZYMrw76JUkqShALd/iWaiRQpGN2KqbN3moMP
	Z+jYdDVMOGEbXWEo/bmczCW9woQefjvDnjsUueUdWw9Z0HF0Br0IUu23wasUig==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Wed, 14 Feb 2024 16:28:29 -0300
Subject: [PATCH 2/2] ALSA: seq: make snd_seq_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-bus_cleanup-alsa-v1-2-8fedbb4afa94@marliere.net>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=krKW6FufyrqnEsJjvhkOclRGG5wwZHLlEbv96z5uKcQ=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRhl5Veu7uhBrVI+1uU+rR4q9IbJhifdb9TU
 N+d17t0QdmJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYQAKCRDJC4p8Y4ZY
 pua5EACuVYFKzDW/TNKVRiEKvBIwgkmSnbmvzLYBd//6zcN/EAmhfhvISk2n9yBPuubxPSZaaxn
 RqRssHLBSRa1iXhKOvZXLcO6w4JAvMSpsQItJWa1JjBhBbiCyGvFqjzT1nMR7UIJ9ygrJxm5sin
 BpR/KI9reM1gxTPJwDCt3TubQKaaH8CkcX9uMDP2bchSDnQ5209TEhdocOZ3NReMxnm2ry5Szce
 0x63cr2s6aAKiETtlrjTDMYIIcjFmH7ZSArvFGGcjxijIDBfb2sj3yxF9e2xKBL9RyDBY5xS3rW
 B7JHq6CngM/y0FV8xzlF7Dt7SoW5eEZKVFQBdMwRwQFfjA+5hc1eVSHXCyKVYM02dKvYUtKw1Z9
 xf2JfFQicxO2BJlDyGq0XUj3yNxEo0TXIeWjCKsDLOWD/cLS6LsSlZuUkwPFbyZrxQmfuTrwAWu
 44agkqrnN0TkX8NggIw2mYTOULjDWAFuRups2m4TfBhd+G/Rf3KqRoJzKfqb8XETovkNlHCt/GP
 nouPP+s1xHBga6enpHkwe1geOAkFmtvCPkLM7ZEnGSLRiE/neQExxHJJ9+ZRK4fclXGpADPv2b/
 +LFqX9LvwU2qa5tcINF5yMW6AEOFCheXlE/15rHjKff8s5MkkAz4ZI8mMsDDFoRTTNPuz18gIn9
 IyMwkxY0ce06jZQ==
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
Cc: alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the snd_seq_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/core/seq_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq_device.c b/sound/core/seq_device.c
index 7f3fd8eb016f..654d620d0199 100644
--- a/sound/core/seq_device.c
+++ b/sound/core/seq_device.c
@@ -49,7 +49,7 @@ static int snd_seq_bus_match(struct device *dev, struct device_driver *drv)
 		sdrv->argsize == sdev->argsize;
 }
 
-static struct bus_type snd_seq_bus_type = {
+static const struct bus_type snd_seq_bus_type = {
 	.name = "snd_seq",
 	.match = snd_seq_bus_match,
 };

-- 
2.43.0

