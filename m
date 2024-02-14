Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40F855336
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:29:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=SCw6gFnF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZpD401nsz3dX6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 06:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=SCw6gFnF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZpBV3xkWz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 06:28:02 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6dc36e501e1so48582a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 11:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707938879; x=1708543679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jf14ZoO/nmlBr52xH16f4QtzbmUF7I3TiNIRIuzv/38=;
        b=RbA12DBE96fVbfrGJZEVFvgW6FmkwksNxJbIWXHeMi9c1Bxor0vWF2IYLqAhGL+fkM
         PE/qzLjWLfMQ2nYQwlUq5COeIfNZmpoE4zBlSHx9nU8qBY/EXkx5KMUpm0RML0bSdzu9
         ok3Fq5RnHRQmR6+mP+XDN6FsXtBTF0f5EWdpgCqDQLrr4/zDPs6a7c1XEpeoGl9oEbu2
         oNR9PndEThomuJepaD4pMLXsNIj1rayqyfDv0QAt+aInFdl0EFdOQ63tvPIzglZLSxa5
         a/9DsDx2dFGtFdZNFyBaIbF4/hvTaEJvi91p+GDfXf0dUYY/NbJL5Cbnf356FgLntaM5
         rvSw==
X-Gm-Message-State: AOJu0YxzsIcYfKvnV3nzXvYkG8MgdLrHslLl4PHeVLbHj/OidIK6qwMH
	DlNUIlOCIzNQ6V6YraVIaTG3Pwx1J46wS24WQqKuqPjbbgZuCc8l
X-Google-Smtp-Source: AGHT+IEAYhq6gDI+wfjGNpVE+rgP71R6IJWQwTaB4Pvado9bg6PRnPO8hd9fVaRstKBYiI5d1bhUkw==
X-Received: by 2002:a05:6358:7e94:b0:176:5a5e:4b7c with SMTP id o20-20020a0563587e9400b001765a5e4b7cmr4334094rwn.6.1707938878920;
        Wed, 14 Feb 2024 11:27:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR9u5eZkHuCGi5ouHd+f0g8NQQ4YHOm8cA1VMP51BbkhHt1JThb7MruHfBbp2jOqzY3XMlD5Np4SblYOAzR1eT/GlxGl27xiJBxkJ3DXV7BdB+CZa9jHyphsomO0b9enJZlVrQB3f0xpjnnXghR2Vfe+GzaoSW4vh6zSdbvGe80sbDUcgvZZKawa5fhWNiYy72gTdl+n7QfMmLZ9pxqjoXacya+Fk3ttY/sEZbWcGPZKtooyKgE0Go0IaZm/nsILUBsA==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id m20-20020a637d54000000b005dc4b562f6csm4610547pgn.3.2024.02.14.11.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:27:58 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707938877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jf14ZoO/nmlBr52xH16f4QtzbmUF7I3TiNIRIuzv/38=;
	b=SCw6gFnFMVEuGi9m9kdpWg/G/byrUWhUoaJNVFytbqm08dkL3TNLUCrp5yeU4nk3kH6IKG
	Q2ajsm7fuEGflTqeD6hhPkKqh7otTX5jGTxYS07WwodUuT+emH9TWpwYHF5qqNXYscGk9I
	KFebSrYePXpv5MtXEMJgTv46KBz5NV7GSQpxE4aimnaIwfeCfvA9KAsLL52o9ZwRa2sply
	7FiOY/ZOkr/c2XDxShAFyyXxuEOw51xdbA9jaK3r1H7Eit5zCVM/BBfUi3bsGjsHE0/FPt
	pmidWrok5yRwV2yjYdL2zs+NncOuDqxvjBwlYfRXrkrrsw7lnF82t/zcRv9JCg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Wed, 14 Feb 2024 16:28:28 -0300
Subject: [PATCH 1/2] ALSA: aoa: make soundbus_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-bus_cleanup-alsa-v1-1-8fedbb4afa94@marliere.net>
References: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
In-Reply-To: <20240214-bus_cleanup-alsa-v1-0-8fedbb4afa94@marliere.net>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=Xx9qKGdssRAp5mo/Ka75lHZUssh4sDREhVlfbYK5MNo=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlzRRg2+8TMjUIfbvPUXenySoAjgJXgm7QBin3p
 RuofTG2WeqJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZc0UYAAKCRDJC4p8Y4ZY
 piFQD/9ZfnDZxcp/IDe9X1ChNa7pjG9eIbYI5mUhOc0Zc6KRmLJ9g7A4IYS+kCOLoFsvVlBkE7t
 6iVQCjTvPi84Kn1tqqV7xnD1SqT3wHWIcLgsTmnYzAZm84HBMeawypWsRFlPgKtosS2aF0TEUz5
 9T+aA3whcNkEru0JDutdtJ9OVwSC0FjnzTbu7xn7UT6yEk52bo9wXKP8P9jpHfABQMwpjHHxr7e
 5bePOHNZ60MbjJZjbLYWANuprwfb77QuFkz+707XTvT00f2dj/WU9/kio0JCXwHge5ByskhQnuy
 NubuAsnmWCzutX4VZFIQoik2lTr5uGIjGFKIfS5NDmgFh7bN1hnyHqUoyo6yoDW/NwkB04lu7p2
 BIB1/EVZSLaj7YXXEoJ+UGEsjahRsI9s1Pz5AqL4JpHX/9JxVQkjUMDlp40MecUDkQA8iG/8oHc
 C/LXnxkomcncgrlQ67GVWTpjOG7v2V2QbYQIA+sz/RriOA6Gn65JZ2CXGLRM36xkK2co36/vZ1Y
 i2lzXIiLtC17GZPcaVd7pxBPwNI4jeNKcRdZ5oReR49HGo/Urq/HI1hHn5mUojaQTnYlrO5NKQA
 0EyWfXjPdN5BVaHaHip4HeiZoP+6CyDDy1L2AGTH4qS+cFaVVh7DS1Cnfv2u4FOYCpXW0W8EXn+
 0h2JDPc+V71skoQ==
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
struct bus_type, move the soundbus_bus_type variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/aoa/soundbus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/soundbus/core.c b/sound/aoa/soundbus/core.c
index 8f24a3eea16b..2a295f610594 100644
--- a/sound/aoa/soundbus/core.c
+++ b/sound/aoa/soundbus/core.c
@@ -127,7 +127,7 @@ static void soundbus_device_shutdown(struct device *dev)
 
 /* soundbus_dev_attrs is declared in sysfs.c */
 ATTRIBUTE_GROUPS(soundbus_dev);
-static struct bus_type soundbus_bus_type = {
+static const struct bus_type soundbus_bus_type = {
 	.name		= "aoa-soundbus",
 	.probe		= soundbus_probe,
 	.uevent		= soundbus_uevent,

-- 
2.43.0

