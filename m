Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC78873E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 20:27:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cNPxta01;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1XQ96tRlz3vxB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 06:26:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cNPxta01;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1XMp1Dxsz3vZX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 06:24:52 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d41d1bedc9so46466891fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 12:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135484; x=1711740284; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vux8fc5fM7LNtFQnsX415d4fh0A+DwGLl9t/xPE2qdQ=;
        b=cNPxta01GYOHzfiA+8ip5hKyhs615Ytr9yjvqxOQrf7aIAb/UVtDFN9ckZliOEch6g
         +Cx54JFy+0PvUB4K7R6gLvBWYzXIuaCjUJaJcVs2JdfmoQUQpy0tABE0Z+axeSPaa9RP
         vWrWr1UVvGK0hXMrQ8/w4mH8jhyYlL4Mx4fW9jvKjkBXJwXVAxhaEodTm/3QAqFIDIuE
         jfRXSLX6m2JywcoZFJHo1WBaH/bh3oakuu49TxZduzc091MN767QcYZBO4mYksdsuOUL
         HQtVC4SvWUvYodh5tOO93JUEM7Yq054tcPZtxZLj6oF1VP/nQFK4Sd6oR1xzj7zqJ5sE
         1R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135484; x=1711740284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vux8fc5fM7LNtFQnsX415d4fh0A+DwGLl9t/xPE2qdQ=;
        b=sz+/3AkmDVTR2hQPxSaqu2dnH3pN6+XxS1amD8q2gUaYE+Z3XY4BXX1q3ViLSv5Bjo
         a3X7LJbWF+ZW7m0/vrevpuRdFKMCUA6US/DZYTEAHw5ea6HKjZy9Mxovpa3uymLy3BS5
         2R7MDgivaWVsDqzGoTSZEz00+t+1CE5GMGbyYW5MpsKdD69Ubk95Lw3QB3LwoUBaljpS
         nHQoWxEKvm7A8G5ojuaa86DJSl+77JDuDqoLmqavwO1tSEccpn9v8KaDYJbPHXnS3ukN
         QvGFQ5T7oNN1ymWa7FFZApj7XrTTvsO+16JwLaePwPkD2v3WHqOFXhIMO857E3TNVrUO
         mPfA==
X-Forwarded-Encrypted: i=1; AJvYcCW1oC/KEdnpX2yCNQwa+VPoSnzCp28sKoaTM3oqAvczjcqB/3ejFbW+fkKP1VI9Ee7quj4lPHyW2n9DzlTrczbqV0J7ZGIKc6ob7fbb3w==
X-Gm-Message-State: AOJu0YxtLNQJ8QC6n6FiNfwXBJxiM+yYc6DFOLfQgZfswKcSRSDDcWlK
	cviJDGLuMfaAfapQEv8C88+pxB/MXPMS47Ed3zNtMUVKYX+3rVzm
X-Google-Smtp-Source: AGHT+IEztkWv0lG4BchX5uTHqaHr01cPk54RdBLOUlG46H0Z9WQy5mDhfH5yA43OaaEk7mNjUJrofw==
X-Received: by 2002:a19:e04b:0:b0:513:cf77:48c5 with SMTP id g11-20020a19e04b000000b00513cf7748c5mr314380lfj.38.1711135483932;
        Fri, 22 Mar 2024 12:24:43 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-b7fa-7d92-6b28-0504.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b7fa:7d92:6b28:504])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b00a46b87c32besm138572ejc.39.2024.03.22.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 12:24:43 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v3 0/5] dt-bindings: hwmon: convert multiple devices to
 dtschema
Date: Fri, 22 Mar 2024 20:24:34 +0100
Message-Id: <20240322-hwmon_dtschema-v3-0-6697de2a8228@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLa/WUC/2XM3QqCMBjG8VuRHbfYh+bHUfcREXO+uheai01WI
 d57UwikDp8H/r+ZBPAIgTTZTDxEDOjGNOQhI9qocQCKXdpEMJEzKRg1T+vGWzcFbcAqWvZF1ec
 155VSJEUPDz2+NvByTdtgmJx/b37k6/ul+C8VOWW0PmlZcaZlLdl5sArvR+0sWako9rn4y0XKi
 5K1AFxp0O0+X5blA9JRlpvrAAAA
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711135482; l=2035;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TRwBnRIKVJvP1oP0vOUbRxZfMz6ws9mrssXvYU2GQlg=;
 b=aTmpAFD7euHIggSgchvepGmBQhKMqXWjtiu+W0Zi8S99e23udMRL7ydG7U2wn2xv3SAf/QGZx
 1WGULD4yNcQCcA68UZtJRyufTfd8L1k2rWnhV03P4SMgatFErH6KJiP
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series converts the following existing bindings to dtschema:

- as370
- ibmpowernv (renamed to ibm,opal-sensor to match compatibles)
- stts751
- ibm,p8-occ-hwmon (moved to trivial-devices.yaml)

Additionally, pwm-fan.txt has been dropped because it was converted a
year ago, and it is not mentioned anywhere in the tree.
I could not find the rationale, but its current state does not seem to
provide any valuable information.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Rename ibmpowernv to ibm,opal-sensor to match compatibles.
- Link to v2: https://lore.kernel.org/r/20240322-hwmon_dtschema-v2-0-570bee1acecb@gmail.com

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
 .../devicetree/bindings/hwmon/ibm,opal-sensor.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/hwmon/ibm,p8-occ-hwmon.txt | 25 -------------
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

