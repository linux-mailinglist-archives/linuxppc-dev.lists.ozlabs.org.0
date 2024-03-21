Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5725886269
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 22:15:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ECMQ6KK4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0ytN49qtz3vcw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 08:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ECMQ6KK4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0vW62yC8z3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 05:44:00 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-56845954ffeso1674281a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711046634; x=1711651434; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3YRi7CjBRkbKzL2OgLfygDYkiVqLApDwF8CS48Fl/4=;
        b=ECMQ6KK4idpY3k6+3B7a4/2ndbUD2ZTImClqfD6PEtJR/1Mq8GRclGNIuP2CFi1H4U
         Kok72AIEZhfZrfjt3bWJGe8GwT6QYldCgZBzLHW3fzhxNXRgQCY2BXT4lj4u9Y92UuKf
         9NFX/CqjtZDI2v+9rbQR340RJ5RjUKjqxfWcyPIKF24w7sl65j9A/32AHMcMKs7WI/X7
         1QVGQY1rwaR3HVoJT0PhDe6bcj5TyXJ9rRLzxeK2Guqsw6A/mxWwmKcU1gYmEV7fOeao
         O/FAIGRmuXa7WcwwS3tIp1V279Hcgh+geccj0n9g1JEb9lD7GglikpSUfT//6fFXcugq
         wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711046634; x=1711651434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3YRi7CjBRkbKzL2OgLfygDYkiVqLApDwF8CS48Fl/4=;
        b=xCv3F41e/nia2GbjBJ2KyB4HNkoTUOdRm4bYqBGXg8sLj5QnpJWkDwKJq/8beurbmX
         3gf36KW+nioBgttcTPaMkmPsXkWQpokDOjl/SpLl1WCGHN47JFWYEVl0+YJqQzo94WCL
         d3AhXYCNwwhn2yj5W0v7id6hwuw0HMUPq1Q0UVp/UFXeRpDeHerWoa5G4zhp1S7re095
         uY4FTx/aS5nXaMEqja0ALqaG3FYJCFbUHdlIMrndSgvP6ik5SmOem+RCc0Bo4GoR034A
         1a24AKA0dLmImeK9kMRpxjc6rXhXErBklFv+qnTpGeJToDk+u0IZ0/0tF+9ly5X061ST
         01OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAN0PI+MFDSTPST2eiZY2X0wYtq4I7pnuke9+B3Iv/zAF1RQZVsytWfXyNucbD8Vmopqw0pEkOv45pAxf0zOmA6zHkVBDLVRGpvtd7xw==
X-Gm-Message-State: AOJu0YwmX4Nm2W3y7rZ6EmswY5U3/zOm4CSYSj5oX1p5wf9YUxqmRLLU
	8X77ktfX4UMnZ/7QFynEhCPkRzkDw/DfeKQhvUP7iXnlM5Pv0/f+
X-Google-Smtp-Source: AGHT+IEFiHREKP8OZY99MKua7vP3dIM4RLhMeHsbw+XjxbzuNF+ZCfqYHSxtkpjGdUDBwcJAT31ZEA==
X-Received: by 2002:a17:906:b4b:b0:a46:edfb:ff68 with SMTP id v11-20020a1709060b4b00b00a46edfbff68mr195840ejg.5.1711046634142;
        Thu, 21 Mar 2024 11:43:54 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7db2-5855-2c59-b89b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7db2:5855:2c59:b89b])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b00a4576dd5a8csm188627ejd.201.2024.03.21.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 11:43:53 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/5] dt-bindings: hwmon: convert multiple devices to
 dtschema
Date: Thu, 21 Mar 2024 19:43:41 +0100
Message-Id: <20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1//GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyMD3Yzy3Py8+JSS4uSM1NxEXfM0U4s0E0tDQ4vERCWgpoKi1LTMCrC
 B0bG1tQCDcjUqYAAAAA==
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711046632; l=1900;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qb/Bf0zXY7etChiyat2ZjXEDTHS7YWl2pfFPxlK7XNM=;
 b=LOtmOlWuGJJX1J1QTb6GMHIbOB8AUQtCR2RcGKO2IgzNuYJegE0yHi9i1d4c8pEUHYeoO5Fsk
 Jp0xXdmoM1tARxzZhRyS8V3i+Zh/xozT+HvOd6B9c5uZUNkTIj6vQOV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Fri, 22 Mar 2024 08:13:59 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts the following existing bindings to dtschema:

- as370
- ibmpowernv
- stts751
- ibm,p8-occ-hwmon (moved to trivial-devices.yaml)

Additionally, pwm-fan.txt has been dropped because it was converted a
year ago, and it is not mentioned anywhere in the tree.
I could not find the rationale, but its current state does not seem to
provide any valuable information.

The binding of the as370 looks very simple, but given that the reg
property is not a single address, I have written a dedicated file for
it. If reg = <address range> is valid in trivial-devices.yaml, I have
nothing against moving this device as well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (5):
      dt-bindings: hwmon: as370: convert to dtschema
      dt-bindings: hwmon: ibmpowernv: convert to dtschema
      dt-bindings: hwmon: pwm-fan: drop text file
      dt-bindings: hwmon: stts751: convert to dtschema
      dt-bindings: hwmon: ibm,p8-occ-hwmon: move to trivial devices

 Documentation/devicetree/bindings/hwmon/as370.txt  | 11 ------
 .../devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt | 25 -------------
 .../devicetree/bindings/hwmon/ibm,powernv.yaml     | 37 +++++++++++++++++++
 .../devicetree/bindings/hwmon/ibmpowernv.txt       | 23 ------------
 .../devicetree/bindings/hwmon/pwm-fan.txt          |  1 -
 .../devicetree/bindings/hwmon/st,stts751.yaml      | 41 ++++++++++++++++++++++
 .../devicetree/bindings/hwmon/stts751.txt          | 15 --------
 .../devicetree/bindings/hwmon/syna,as370.yaml      | 32 +++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  2 ++
 9 files changed, 112 insertions(+), 75 deletions(-)
---
base-commit: ebc9bee8814d12ec247de117aa2f7fd39ff11127
change-id: 20240320-hwmon_dtschema-7f58f49118aa

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

