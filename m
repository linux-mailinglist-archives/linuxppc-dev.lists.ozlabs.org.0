Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291648500FA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 01:08:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=kiqiJiie;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrdq0lWJz3chF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 11:07:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=kiqiJiie;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWrd06kX4z3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 11:07:15 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d958e0d73dso11522475ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 16:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707523632; x=1708128432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:dkim-signature:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jJ/8P9/m1QyzSqfdTbTrwPfsfjkC4DETPIKZtr1GOEA=;
        b=CUYlqp37aKXSSekbqZK4HKPAZtblakGUNgc7pPD5/GUS4Mkxgcqp+itn0uZUKzAbXb
         z8Kt+f1ufe3vVICh7rNTPeW1EPCurDucAIYzZo9sw+Bcv6gBoGq6TKwmRobV/ZO7Llwg
         pP9YYqZuXPMgu4UiVNRuUlbOjwgvUXyFMB9I0uL8YzYlwAeN0KonD0YIfH509tP205zn
         6LMcepGnoG1ErHIJvUimBw2eYXCkCAFdvLoqJd9JEe1z8KeMO4J4L/QJNWyRapOAr0w8
         6tNAyPca3PfKGq5BGN7Xta2ixm+rRnfCgHfM3ejM8y/ESAlWVuMeTMdb8Q+oUSH9KNWJ
         BXsQ==
X-Gm-Message-State: AOJu0Yz1TAWdA2TIQIeJ5Q+ZeIKtb8b6PfpX3WPK4BBNuGQFya1LHo3h
	eBytMeqmnTQHI0yn5Bn3MVWO2X8DO9LMZj+DTt1yOH3GrIeLJpHZakeRGMKMbCmElw==
X-Google-Smtp-Source: AGHT+IEQFw7ZjdLNXEsWU9/4iuzrZmSGZEl5ZmXh1Y5PhENIs7gG/v0xu+B16lGfQq/q6TBJYO7Ozg==
X-Received: by 2002:a17:903:1d2:b0:1d9:4143:5fe1 with SMTP id e18-20020a17090301d200b001d941435fe1mr1175352plh.0.1707523631576;
        Fri, 09 Feb 2024 16:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9fHoG6i7/iyW1eWfe2TY57fmSS9yKawaYHI57R1vdvze3bmBsPhhBmHyX2YOOaOgvuFlFyz5t+8RUjx5bZZVMih12O+TtyBlucDPCANLblqbBg2TFw167PYpM0rDr8AMbB/mQvxlXBeDWNL3zWy0/7yLuXj92bJvEguFA+vQAgKFY7divGfzIsDz1/PA2zMNjiiKxMUTMqBtki3urLC67VTEsBfdzd39AUcDdhDoQr2fRk+X2+qBJiGg6OL7kgok3K/Xr6DBj9qCnsflk
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id o3-20020a170902d4c300b001d987771271sm2018287plg.123.2024.02.09.16.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 16:07:10 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707523629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jJ/8P9/m1QyzSqfdTbTrwPfsfjkC4DETPIKZtr1GOEA=;
	b=kiqiJiieBWKVrASvW4zc52ozJYSCAbgBrO7DkPZE61NKY75+NZL3B9Zmi/mlGOAqLYlSK3
	0PiBQKOgwHpVSeGTzd7Elo6eBxOLGEMMU+kxWF0vIO24CVEXPGrrkIDSXqL1EqW+WqFOGy
	RXJ0wsgATetDWf0xEoCE+VpAlKMjs8lADGtDQHYw1yWhH/+5qxNisPoSn4OYS89wwclBdE
	8uvlP2krTz3+ufIKtavYwZNY1fdlar/Q2JWndsVehid7jJB/tNY1yQsYcc5KLbcwVEiSrC
	/08B/I8pKiGgaPCLCEGAJuLvTEu/I6oNmCPk23ksYOdMeQkPwLWNvSnefS1+nQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Subject: [PATCH 0/4] powerpc: struct bus_type cleanup
Date: Fri, 09 Feb 2024 21:07:15 -0300
Message-Id: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADO+xmUC/x3MTQqAIBBA4avErBNskMiuEhE5TTUQJko/EN09a
 fkt3nsgcRRO0BYPRD4lye4zqrIAWke/sJIpG1Cj0aitckcaaOPRH0GF/eIYCJWxjcF6JnK2gZy
 GyLPc/7br3/cD8Lc1fWYAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=uPAkjkhNnUn2eErVPCyjQ/ycs8iGMX/5VT620BWcpNU=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlxr5P2MxlFZPof0FmplPWNVsPWX2aQt9io6fB+
 A+IM40f+kyJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZca+TwAKCRDJC4p8Y4ZY
 plBbD/9xpcNb6D4WFKz+2DQ36EYnVeiGJjexUsSCvOrYiNyZi20rCkGtKLIRwDvw0BciZeeGcEE
 GrtiCvNkYZBYC8c56HH1YsO8zDbTR9gVDan+Tfog/wgO4Ntqk8Vw89YBZed013otm6ZtNB+tBLL
 b4cGZY1nANGa58Xpr1pkfIDwanhCbnbtxU9HBkPMGAgq/8FogzTPhKYGAI6YDxvUVFa2TRgv6Ea
 NoHMyouCaxOIfEa/lDNRKH6Z5LrN7sCcFZRNCO8swkVZR2IvXQWou1F0u74haz2MOIJD+WSyb6v
 1gUbeAx9aufVtuoOyeoIQk0eQ8NBqTWXgIxqcn0BlyoX0R/Y92pg6r14pr+8B7Rv4MHWWAUmhuB
 dkNuqtkPWvBGBG5V7kszXBF81PMLCWWGwIUzrx92QX4mURyZUtpqXnD5NJl3ILq+FOzqE4YaB2G
 rESrBg5d4evKxUOjVkvsbgZoz3Sa/TPxvx84rTlPVON2R1Yx+3MDoI5BGWnhCN+qwbO8FoWbF1x
 5ibJvs1x74HxlZvYsUbAP4TYQuPGNKY022lIQvEE9mRJVPw4+oMd8ycZ4QcKuT0VnymEcBuJko/
 O1QMaVGply37KuU3gQRt8MXHOPIO5x9GUZ3lkr53K3l+fJt8oS1KedHP4Zx1dUYu8J5y+omUtBA
 UJaYOMrjZBl7ruA==
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

This series is part of an effort to cleanup the users of the driver
core, as can be seen in many recent patches authored by Greg across the
tree (e.g. [1]). Patch 1/4 is a prerequisite to 2/4, but the others have
no dependency. They were built using bootlin's without warnings using
powerpc64le-power8--glibc--stable-2023.11-1 toolchain.

---
[1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

---
Ricardo B. Marliere (4):
      powerpc: vio: move device attributes into a new ifdef
      powerpc: vio: make vio_bus_type const
      powerpc: mpic: make mpic_subsys const
      powerpc: ibmebus: make ibmebus_bus_type const

 arch/powerpc/include/asm/ibmebus.h       |  2 +-
 arch/powerpc/include/asm/mpic.h          |  2 +-
 arch/powerpc/include/asm/vio.h           |  2 +-
 arch/powerpc/platforms/pseries/ibmebus.c |  2 +-
 arch/powerpc/platforms/pseries/vio.c     | 61 ++++++++++++++++++--------------
 arch/powerpc/sysdev/mpic.c               |  2 +-
 6 files changed, 40 insertions(+), 31 deletions(-)
---
base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
change-id: 20240209-bus_cleanup-powerpc2-498426fccb98

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

