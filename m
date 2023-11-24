Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C787F7139
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 11:18:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xo6SzXs6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc9sl1NJCz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 21:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xo6SzXs6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc9qy3zChz3dKp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 21:16:30 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5431614d90eso2488540a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820987; x=1701425787; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=Xo6SzXs6ngEX6qMrUgVNF6kKKAMHTTHuMgixBUYnJjrLYsKGCGqkrpxxwWYBpU4ndU
         Iri+H3ifJJGmz/DNe3VxYn9j/kziLkp9Fxy5IBvaH6BqbNmjRh983B0maGIwbKQhD7ym
         kmHRD67YC3rn2ANVajy7Gumkp5fq99x3V4IQ6cljIzJBWLCgYrk9MvsuIDzle3voh09g
         QNq2hdpOefOcPwVpCWyWkTTiXpQsA+ttRqZu4dKDoIRx2dufL+nSn1f9F1SyV2q8Y+A8
         mH/y2SklRlkHaeqeypnNANbA64BGAw1s1wJtavZX+Ize/4vjSNeKANF/u8J6nAGPtFRQ
         9vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820987; x=1701425787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=HKbveJqY8QGsuCJAsNrchtx4W/BXgMOHbvbo07UfYnAatYh/VjeBNZwvlx+vZYdVYf
         wX7to2p0NsglZlc7Zc9wP79ZlCZOEgJUOgaMIVGro3tWP/IHUaxOCM6TJwm8zzKdewUB
         nyJiyTHFBGcDGxN46wF4reVEDJOQYp5/W7cyaD7wxWK20LbvEFAgxNE9+b4emEinkCyk
         rsn7XZiAkklBSmXRkhuVwpC8+xuZWPpiOO5j+w/L6ziFJ/kdavzsHe45DGA/U4C02UY2
         oLYjYCoZwCfvay0RK04gEa/hlGe2bXAH/4DsWHhbCnImVZQWO8fz3SLEokX4aomF1L9d
         EfvQ==
X-Gm-Message-State: AOJu0YxrszRYD9JZ7NC144gRNPT24CVJw0o72mDzcpMjkxhdEKP+ZGeP
	gdeRWTJtzOH6n+pOfavR3W8=
X-Google-Smtp-Source: AGHT+IGkA02PbfBKunnd6jhHwP56ec1eLpYUxLVppuL6zxrnc1kQN/EcXDZ5EhmwsfyJqj84pfYEuA==
X-Received: by 2002:a17:906:158e:b0:9fd:8d07:a3ad with SMTP id k14-20020a170906158e00b009fd8d07a3admr1465316ejd.17.1700820986648;
        Fri, 24 Nov 2023 02:16:26 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:26 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 03/10] i2c: pasemi: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:12 +0100
Message-ID: <20231124101619.6470-4-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/i2c/busses/i2c-pasemi-pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index cfc89e04e..77f90c743 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,7 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	if (!smbus->ioaddr)
 		return -EBUSY;
 
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.class = I2C_CLASS_HWMON;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		return error;

