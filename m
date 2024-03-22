Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D444E88670B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 07:47:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VA3fexTC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1CYJ4ZY6z3vc5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VA3fexTC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1CWn29F4z3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 17:45:39 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a44665605f3so206129266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711089936; x=1711694736; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ui2/86gYMRmJflyA3uO46uowsgpBJaLyEk39FOlIr+w=;
        b=VA3fexTClsahj6SQ+DxrZqRQa0ieIQzzn6YzJqHrOLYnR1KKzueAnioqGaxOMicagY
         Nl4IaoLkJFfECI9Uwd/9G2J6JPJ3DjMEwY5u/QiU9FNvhWtmdhLpUWE7WdwjUDl1Z8m2
         cgBjuCPB4h/7HxQYrsQQI1B2zFMXWcvv87sJBlxNwWGCs/hWeFJbs84C95vXw40S6Upi
         PT6PUUkvtSMQukFPOxY4PooBJ8X7t+91nZA7el3WQRh3ZxNREt6ZtfcoEPRDwYErTECO
         0Zy3lIQkrYx+OtRt2scgxTKo+dNgnbW+ZhJyY/aKXGosaBKBkX/CZUI2EPcyzFkMwvVq
         +jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711089936; x=1711694736;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ui2/86gYMRmJflyA3uO46uowsgpBJaLyEk39FOlIr+w=;
        b=SaD9BoTPxL/HmnVw75qtK2YuKzM6SNQA1EePITzjvGGwFnTL5xuhWbMDSEqcuvwbFq
         H07gGpi2HhUS3siOt4FKvSSfsIOVIZu9AFyRoounjyyZQLAglgLfXzD+O73ytwfAQ/DF
         bMat5nMOL5T6KiBrXvOSZ1w/63yWQBjjHa97s6JLd/MD+b8SwSlN98ppBuxpzSDmkRIV
         IfvEwXj0mEl0As4DQgCzuC9owwWGzmwQZwak3kU57sL9iX6WYVm8i5WHNd3n5w8vzeVH
         TjwNh3An6h8ONcCi1rljeeqh9gH50bWiE/+TclfWdnwBlQzmcqs56PqnQPVGQaWYRf4T
         a4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUj4RknfzdSTFIjw/3zgCyY1tMFsCae2r6DMV+kwGGLUdvNeEHHJLpELpWMou9P1AHC1tSFll//jAiQrV+9ThvjFcBZ6mmnXvJQ07yLIQ==
X-Gm-Message-State: AOJu0YyDzsgSXk9PS8EBgGT3ZKodCiYibMN0P56JL7/SNjrr4Q8zRvS0
	4UAb4BQCaTQ8Kg+pfvsPOb01kKfrSlMbQUOcJRa/ZUFLQL1/reSR
X-Google-Smtp-Source: AGHT+IGtFzN/gx9AFNKUy9rg+o03MkxUw7k8OBf076+VwdSjKPVBe2p5nZFPIt2uvPzL3RYH0jwxwA==
X-Received: by 2002:a17:906:eb08:b0:a43:f267:789f with SMTP id mb8-20020a170906eb0800b00a43f267789fmr948688ejb.41.1711089935743;
        Thu, 21 Mar 2024 23:45:35 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906375300b00a46bb8a44cdsm679694ejc.198.2024.03.21.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 23:45:35 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/5] dt-bindings: hwmon: convert multiple devices to
 dtschema
Date: Fri, 22 Mar 2024 07:45:25 +0100
Message-Id: <20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUp/WUC/13M3QrCIBjG8VsZ73GGH6tcR91HjBCn84XU0GHF8
 N6zQScd/h94fitkk9BkOHcrJFMwYwwt+K4D7VSYDcGpNXDKeyo4Je7pY7hNS9bOeEVO9iBtPzA
 mlYJ2eiRj8bWB17G1w7zE9N78wr7rj2L/VGGEkuGohWRUi0HQy+wV3vc6ehhrrR9LIkOmrAAAA
 A==
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711089934; l=2069;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=/lf0tDQvXRFPt50cWid1RnW3RlMNcFsrS7mt3Xkwubw=;
 b=2McnvuoHUuUtyQYvJUEBSnqDqQnJ2c+n4tSid9GmqgqV0Zi9e4tkHLv2pe+8MbsJr3uSAau/w
 yu/hjQxdwhkDr6+Iz3JBjASswg0ktvFhZOYsYhqCwUWzDO/UB4e8+YF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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
Changes in v2:
- ibmpowernv: fix compatible string in the example.
- Link to v1: https://lore.kernel.org/r/20240321-hwmon_dtschema-v1-0-96c3810c3930@gmail.com

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

