Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3B63F6CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNqs3TVFz3fJX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ihhHeh07;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ihhHeh07;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCxh36CRz3bVW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 22:08:56 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id bj12so3284267ejb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFyJfR2WUZBDHeWemxJgoKouNxxtAGHlmHCCEO9QQfg=;
        b=ihhHeh07lyLQ9+bLJAT02xtbEUUwBhwmY6NbvI/an2JMfUbxhGOKl7udb7lLh5mId9
         jw5dKTuvmRP+w2K8ZYng51eJLaluDUotqflfy43/10yqWgw/yG+fgTeB0ukeRPMWa9sh
         dgPYzjd9Y05h6Utm7j5Kxf9v/xCIYLObtVbqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFyJfR2WUZBDHeWemxJgoKouNxxtAGHlmHCCEO9QQfg=;
        b=dCgAsvjgCG5PQmR3lUugiGxFpEko5yO52UUREpnkU+i/tAvhSVYaR97Xv6u42bq4CB
         m5wvsJRG48SXAI/dbZC3FhM0Sg6YRhHpdehL8t+ymOSHTdE7WGMd+aU8oIUVb3Tdc8zs
         ZkliAJzFP2s2S78qZBKoYTnLPr5VdWgvxf5TAeC2Obliwsz8Z+n2wVhJpwRSzAuMVTNq
         6HDSKAi+7fiLVQGnIefi5KtloylTlEwokuP5vSZU1Y1rxn8k9nyP22sFlUKetqfl5y6o
         wzhB7OPhJdBaBpcbdtPI1FkjMa6K3FdG4LmRtcYtFtnM+uxMO9nNFd/VTjxbsvQc3dKC
         uyNw==
X-Gm-Message-State: ANoB5pkbnKEaTxVQRrbxKk2sZ3qT1duYYuKpYwlZKOsw+XpjiIR4rhzd
	vgxsHoPAOQt4VROhWk40VwSQKiED5Yme+NPu
X-Google-Smtp-Source: AA0mqf5n8q8ZMG+bv3DehJEYX5ANkxpTsyIzmCnCUsZmiYp8gdzbFTHhMnsW4dhR0VzoX//sUAQsMg==
X-Received: by 2002:a17:906:7f09:b0:7c0:b3a8:a5f9 with SMTP id d9-20020a1709067f0900b007c0b3a8a5f9mr1338546ejr.154.1669892932820;
        Thu, 01 Dec 2022 03:08:52 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:f554:724a:f89a:73db])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b0078e0973d1f5sm1663824ejd.0.2022.12.01.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:08:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 01 Dec 2022 12:08:23 +0100
Subject:  [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org>
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
In-Reply-To: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2398; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=GWM+B74HgZm8hg965LkIrG7utJXhrwWC6OA28kyyUjA=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjiIs5X8qunJcdzh4yNadWVeViZgDn3gq/06nr8kdj
 kdUAnBmJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4iLOQAKCRDRN9E+zzrEiBePD/
 4n9U/k8s8PcSMHwaDWquOwoHUGMa1OTSXQAeS+zkfPMUpMhgcoTNo49nWa43GN+Y810XaYiML51562
 eLirizXRSalXPpYVLlUge+rUD8YTV54zGi5OoX528K7lwHG8z+THm4BSy0/gmpmwdgB3GttlQH5Xh0
 P4IRFzzQUndzF5+V+rD7ZDsOIqsqHLEl2xVrPlelt3OtQTf7xzm+FTwEgxz8fg42kpdkTUjKNidLBa
 PVVihXzxaPSrNmIcrlXDWrTscOrbX2UGlosoMD4NyfKwacu0juZk+QLlYCoIBu78E/d04Top6bsU/I
 uqQOeIB3UrGvmdWb9fO9H/WX4GIFLG+w7VCfaLbEd22SI+WITCvp/dDA/ZO8fzX1wgQBHvFZRLIuM4
 0mqtOEszlCVB4pMNrAVJcSULhKWOxrKI7MkUyf/otZRJ67hrWlDDaOmlBsOkJTF1T5obHSRoblMSSE
 UwMVB1vp64JD4LAxJGmFWSPjZ3BMJJK0mblOTi/qOiMm2QR7iraSkhMsUcpx9HI4IeSwbTJszKQ1Hb
 BgqjW0c2l0BpHzIlEvkoUHxIGQdKJLMfmy8GbTMKne5zBzPRx9+b+cGgNvRa/zWp72+v9Fm0r2l8rk
 2c1+78340GIwSb9Ffj750Evz1ISy6b5FAAiC5q+SWoZEFW2mWMAN+3crcCZw==
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

If we are shutting down due to kexec and the userspace is frozen, the
system will stall forever waiting for userspace to complete.

Do not wait for the clients to complete in that case.

This fixes:

[   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) done.
[  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 seconds.
[  246.819035] Call Trace:
[  246.821782]  <TASK>
[  246.824186]  __schedule+0x5f9/0x1263
[  246.828231]  schedule+0x87/0xc5
[  246.831779]  snd_card_disconnect_sync+0xb5/0x127
...
[  246.889249]  snd_sof_device_shutdown+0xb4/0x150
[  246.899317]  pci_device_shutdown+0x37/0x61
[  246.903990]  device_shutdown+0x14c/0x1d6
[  246.908391]  kernel_kexec+0x45/0xb9

And:

[  246.893222] INFO: task kexec-lite:4891 blocked for more than 122 seconds.
[  246.927709] Call Trace:
[  246.930461]  <TASK>
[  246.932819]  __schedule+0x5f9/0x1263
[  246.936855]  ? fsnotify_grab_connector+0x5c/0x70
[  246.942045]  schedule+0x87/0xc5
[  246.945567]  schedule_timeout+0x49/0xf3
[  246.949877]  wait_for_completion+0x86/0xe8
[  246.954463]  snd_card_free+0x68/0x89
...
[  247.001080]  platform_device_unregister+0x12/0x35

Cc: stable@vger.kernel.org
Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/soc/sof/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 3e6141d03770..9587b6a85103 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -9,6 +9,8 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/kexec.h>
+#include <linux/freezer.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/sof.h>
@@ -484,9 +486,10 @@ int snd_sof_device_shutdown(struct device *dev)
 	 * make sure clients and machine driver(s) are unregistered to force
 	 * all userspace devices to be closed prior to the DSP shutdown sequence
 	 */
-	sof_unregister_clients(sdev);
-
-	snd_sof_machine_unregister(sdev, pdata);
+	if (!(kexec_in_progress() && pm_freezing())) {
+		sof_unregister_clients(sdev);
+		snd_sof_machine_unregister(sdev, pdata);
+	}
 
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
 		return snd_sof_shutdown(sdev);

-- 
2.39.0.rc0.267.gcb52ba06e7-goog-b4-0.11.0-dev-696ae
