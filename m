Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA5C63F69A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNms1nFtz3chq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:46:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZRHyoajE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZRHyoajE;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCxc60FBz30Qq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 22:08:50 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id s5so1831594edc.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 03:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=lGm4cyBDbhcC+E+E+8rSuqE3igb1lprN1pN6/M3QLys=;
        b=ZRHyoajEwFC4By5LI1rVbOp/xLGzBq//9Xi/KMCz0lo8z9Pc1kxGrZQGSfdmpQmaMd
         1GnniREAshZoCU4tyHuy1piJbRVEDqwJVixje9ZJzJ77PtUXKFFljT/b8/IV0BWReOGd
         SqBdcc0wshVkJyGCE+uvwuRmeLcgRNVAq9pdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGm4cyBDbhcC+E+E+8rSuqE3igb1lprN1pN6/M3QLys=;
        b=MGrM6zR7OAK6jAykE3glc4qPvcfSqqLuQsiE90+ApjIgIs+yrFTasPAMFgxO+IQpTg
         /7/W8ztUHAVJRD+Srcg+QQkh4HDJIOfuZYBl5MoLcNOc9aHzeEdAjtAwCCmymNAm/mMr
         bb0Zeyv12yMe/yxfPjHYlz3E7wYzSkio7nH6CeiArkBEqYF6D2jq8hX18VWkMsxryneA
         fz5DvaxyptOIeaXlZ0FpDfqrtZ2A+FRlBuNyUNxfp8tF9WTEM2ge3o7qiBctqNomVN0T
         fpGiMDNv2ZS2i9ubTdnXjHmM8EirbK1Ym1BBrNID8gG6eZJ9o9gn5/kiqlm35VmPNH3s
         MNmg==
X-Gm-Message-State: ANoB5pmEJ449jAKetc4tF5peSksg/83HNFE3ZsQEH7RqVIoTHhaMUrKi
	1WmVXF+RoE8tqw4lP3kDuLfD9MKTAdZuJjj0
X-Google-Smtp-Source: AA0mqf5zzNn9de5BfFPh0J6RLCpw0dw9HFYWDLvw7kVxPfSHwhQH5HyYQ8cKCqwRv03JB5G51Q4CsA==
X-Received: by 2002:a05:6402:4516:b0:467:b88c:f3af with SMTP id ez22-20020a056402451600b00467b88cf3afmr43151776edb.24.1669892925587;
        Thu, 01 Dec 2022 03:08:45 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:f554:724a:f89a:73db])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b0078e0973d1f5sm1663824ejd.0.2022.12.01.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:08:44 -0800 (PST)
Subject:  [PATCH v8 0/3] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSLiGMC/3XPzWrDMAwA4FcpPs8jln/b095j7CA7SmNoHbDXwF
 by7tN2HDY6CAk+/TxFo5qpicvpKSrtueWtcBFeTiKtWK4k88y1gAlAKfCylVkuleibpCJSRgMEDU
 4wiNhIxoolrUzK43bj5prb51a//hbsitN7d9au5CStN06hdo4SvKW1bvf8uL9u9So+eNIOYw2s54
 AGLOHZOd3Reqw1awSa0WuVUJmONmNtfi9n50z0C2DsaDvWlrWhmSNOIeLU0W6sHWtN58lavTiDtq
 P9WHvW3Es2wMIP/P/7OI4f/KJYEyACAAA=
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 01 Dec 2022 12:08:20 +0100
Message-Id: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
To: Juergen Gross <jgross@suse.com>, Mark Brown <broonie@kernel.org>,
 Chromeos Kdump <chromeos-kdump@google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Len Brown <len.brown@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Eric Biederman <ebiederm@xmission.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Joel Fernandes <joel@joelfernandes.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ingo Molnar <mingo@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Dexuan Cui <decui@microsoft.com>, Takashi Iwai <tiwai@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Rud9IUdbPKIRkkkE6G4uaTZbcmuiccX+lZS5manvrHM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjiIsuiQZl7CGQiKdplkqC0gHCzURIkJXoavQjeFfS
 sEPmEE6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4iLLgAKCRDRN9E+zzrEiIaWD/
 9SLVqH6ELG3Nj4DmzbcOc+YbsFvyvs/zS4DGTKOm4a1dsJ6EojOhIs9fpuGLT8o3p3+9VsWHC0In/y
 k6Iuhsi7YI2K91jtIDrxVIf4dUlmsglcYsc4qe5s+tqH0tWT7y7OlpaNM4+W605lNX2FMTKjGgKfHe
 jHVMfBfB0ebLbt7OhLXieR55yYucbmtChn3v49MHNc8u6oY5Zy9bC4bNkMJDJtd+ce/qqb8Bp4QeMA
 rOQjtJMeieO5qtXaDb8EfsUc4gu1PYL42HfoTN2sr18FL9SKNzVejr4Jq0RhUCNg/rf+Oqoqn7EEmV
 sjud45VDHbBcOD8OQJa/GQAuRwLJQYje6ycI76nIB/gnEiR08+uB3nK3tlAkKMMWbb4wS5vuWnCX2U
 3YF/ZK8xWASICm+G0JmfVBdajYCKUxaboXr7DPbP7oCUFU3bLEQqtBpNgeyfU46D4Q0gnTD8/frbVt
 UgY++3lpoKK+Pxg3zbTIKOvN4fumazPJdSB+a586EbWiw7LhOtWns3EsiPZqFybXoW0BptbVq0Aqan
 TLmIsVZkJSOl85YER762XGxsWyl9LeYioTLO/h4ozDLEbfseFlKxfz67nGgS7NBgsHBJDuc7Pu2/XP
 dfaTOEkimDz87TdwqvVEa5v67H9Ve4p2lif6Z3g7ymf71PA6yB0dtq2z/ZqQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: alsa-devel@alsa-project.org, linux-efi@vger.kernel.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, kexec@lists.infradead.org, linux-hyperv@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
we wait for all the workloads to be completed during shutdown. This was done to 
avoid a stall once the device is started again.

Unfortunately this has the side effect of stalling kexec(), if the userspace
is frozen. Let's handle that case.

To: Joel Fernandes <joel@joelfernandes.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Eric Biederman <ebiederm@xmission.com>
To: Chromeos Kdump <chromeos-kdump@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "K. Y. Srinivasan" <kys@microsoft.com>
To: Haiyang Zhang <haiyangz@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
To: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Ard Biesheuvel <ardb@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
To: Len Brown <len.brown@intel.com>
Cc: stable@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-hyperv@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-efi@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v8:
- Wrap pm_freezing and kexec_inprogress in functions.
- Do not run snd_sof_machine_unregister(sdev, pdata) during kexec (Thanks Kai).
- Link to v7: https://lore.kernel.org/r/20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org

Changes in v7:
- Fix commit message (Thanks Pierre-Louis).
- Link to v6: https://lore.kernel.org/r/20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org

Changes in v6:
- Check if we are in kexec with the userspace frozen.
- Link to v5: https://lore.kernel.org/r/20221127-snd-freeze-v5-0-4ededeb08ba0@chromium.org

Changes in v5:
- Edit subject prefix.
- Link to v4: https://lore.kernel.org/r/20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org

Changes in v4:
- Do not call snd_sof_machine_unregister from shutdown.
- Link to v3: https://lore.kernel.org/r/20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org

Changes in v3:
- Wrap pm_freezing in a function.
- Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org

Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER .
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org

---
Ricardo Ribalda (3):
      kexec: Refactor kexec_in_progress into a function
      freezer: refactor pm_freezing into a function.
      ASoC: SOF: Fix deadlock when shutdown a frozen userspace

 arch/powerpc/platforms/pseries/vio.c |  2 +-
 arch/x86/kernel/cpu/mshyperv.c       |  6 +++---
 arch/x86/xen/enlighten_hvm.c         |  2 +-
 drivers/firmware/efi/efi.c           |  2 +-
 drivers/pci/pci-driver.c             |  2 +-
 include/linux/freezer.h              |  3 ++-
 include/linux/kexec.h                |  5 ++---
 kernel/freezer.c                     |  3 +--
 kernel/kexec_core.c                  | 12 ++++++++++--
 kernel/power/process.c               | 24 ++++++++++++++++++++----
 sound/soc/sof/core.c                 |  9 ++++++---
 11 files changed, 48 insertions(+), 22 deletions(-)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
