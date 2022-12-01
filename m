Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A191063F6BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:48:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNpr3sc6z3fH8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:48:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K5kXuHcE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K5kXuHcE;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNCxd6FBHz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 22:08:53 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id o13so3382680ejm.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 03:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPnx0twxhgnGZjrXWsF/2vKaeMeI6ZYYmbIIcD69SUE=;
        b=K5kXuHcEfBkPvXptT5Y+mfQkEfSuimVpWQKHjhZ9y+kPOfG6EGLbLQqZ7Vmi4Ht6xT
         AXJ/oi2Z0ArL4gZ9JbiQ5Dx7wPbrhxkR+aVJKyp6AwkIvHoR6IysS+toCXipubShsonE
         oHPeSUt0tvViAKC1UQK6OZfmPOR3FZyq1ixgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPnx0twxhgnGZjrXWsF/2vKaeMeI6ZYYmbIIcD69SUE=;
        b=XNu3YqVkRf6RqxitJqpjpbqTpJ9pz7gySDJy+MLqPNgyonNA32o3PzbFL0tviJaPuP
         vqYo5Isz836zfcbT+RrMIJ3rFOTQAUqAzHZeYJbHN4XECSQTHBBvj5e+4+nS4osYtFHC
         PhrrJJnMVblhjURhK0KJPleAcVqgYk5YFoq2DpOPvb/2YXbyaeJnzZE8qCbC1Syu/Lgw
         frkXMpK2v7GN63ITenDd459IApaleMwbPXpZyXtqcMKYhEiJwISbtmBkudvGcdfn3AvI
         eVrjEQ5FsvbhpfMo59ghz+U15V6eetuJ9xQK/qRnGvdccI9pOOP451teHtBFxN1FPu5S
         lwVQ==
X-Gm-Message-State: ANoB5pnu1P+H4TBSmVPcnJffHbHMl+mlLBy5GgZbfBpfsIDWGZPJuwwS
	fMcO1vLwiaL26dU1CR7+hW6dSA==
X-Google-Smtp-Source: AA0mqf6QA9epHr8ruPFiQGAKYscNsrTjXBsKaW09DtpGXeORJbLVCQptI5poBuY2TVEd05qONnm0EQ==
X-Received: by 2002:a17:906:7d13:b0:7bc:addd:2c54 with SMTP id u19-20020a1709067d1300b007bcaddd2c54mr14248196ejo.24.1669892930375;
        Thu, 01 Dec 2022 03:08:50 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:f554:724a:f89a:73db])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b0078e0973d1f5sm1663824ejd.0.2022.12.01.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:08:50 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 01 Dec 2022 12:08:22 +0100
Subject: [PATCH v8 2/3] freezer: refactor pm_freezing into a function.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v8-2-3bc02d09f2ce@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Uyd503AUpFQ+wB60JzDX21uxeFYPmKS/1xEV6a/+nC0=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjiIs47YRD/lKW5LPJ0JDcZ66XVU0S36xAkU2Fyjx2
 2sg9wC6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4iLOAAKCRDRN9E+zzrEiGFvD/
 97DssDxiQasPTlsNtz7Jry8QHtrWcpbeSa2Bm4gtZx1yhISwwBKhlnlj6KgFHG54yWyqPjrrVR0XTb
 DRsh8oxIzLjCsOJSaFHQVRhF6FQ+Sjacqhya5R4CgkbgCfYqD9BuqRs3k+WVdFOubhN2LtNG3lkx4T
 ue+l5QsOBRqMlPIvwRtgq2tpT+YUFNt5mgxSdvVT17WVelRA7EPFXF8dyd8oIs1E2iKfJpEnF/7Q4c
 7SZhnlSjo1D/vgoGmvCA0YHqwNf+Gd0soCFD8VDqMs3MsHI+0iHfFmvW9qis9BQ6eEQXsouG9nOnqA
 GHMdhq3WU7pGrL5DkzQU30oUH+Tdpk7c8hfRF3dIlk9oU1KXSXe9pg/38OguyIttqFUH/iSKDS0L92
 5vIDNhT9WlDT2uxzTt/kS9e7RVM3tR0vHpUMY48SrLT4ybX2MU+uX8pRhqF9B6yT+wCUozZXdnnFHC
 juHBoEPqlJn6F7z5v1GGk+dMOrd3JDk/aqI3cue3Q30WnL9D73CfUZ6MD9yALvFt8oSzUw8eMxA54/
 ac6QXsBUvXHMT4klIUFhVCOtry1lTKgmIF+hciCKQi7qleoR5g5iI9YQ1pERS75u9s0tp/U5COC9rF
 H128taN2NiXJoQ2/mDCQbYyiZZ7qAhM+BNxsaDYWxtgKxmCMfSlcBFUTo+xA==
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

Add a way to let the drivers know if the processes are frozen.

This is needed by drivers that are waiting for processes to end on their
shutdown path.

Convert pm_freezing into a function and export it, so it can be used by
drivers that are either built-in or modules.

Cc: stable@vger.kernel.org
Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

sdad
---
 include/linux/freezer.h |  3 ++-
 kernel/freezer.c        |  3 +--
 kernel/power/process.c  | 24 ++++++++++++++++++++----
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/freezer.h b/include/linux/freezer.h
index b303472255be..3413c869d68b 100644
--- a/include/linux/freezer.h
+++ b/include/linux/freezer.h
@@ -13,7 +13,7 @@
 #ifdef CONFIG_FREEZER
 DECLARE_STATIC_KEY_FALSE(freezer_active);
 
-extern bool pm_freezing;		/* PM freezing in effect */
+bool pm_freezing(void);
 extern bool pm_nosig_freezing;		/* PM nosig freezing in effect */
 
 /*
@@ -80,6 +80,7 @@ static inline int freeze_processes(void) { return -ENOSYS; }
 static inline int freeze_kernel_threads(void) { return -ENOSYS; }
 static inline void thaw_processes(void) {}
 static inline void thaw_kernel_threads(void) {}
+static inline bool pm_freezing(void) { return false; }
 
 static inline bool try_to_freeze(void) { return false; }
 
diff --git a/kernel/freezer.c b/kernel/freezer.c
index 4fad0e6fca64..2d3530ebdb7e 100644
--- a/kernel/freezer.c
+++ b/kernel/freezer.c
@@ -20,7 +20,6 @@ EXPORT_SYMBOL(freezer_active);
  * indicate whether PM freezing is in effect, protected by
  * system_transition_mutex
  */
-bool pm_freezing;
 bool pm_nosig_freezing;
 
 /* protects freezing and frozen transitions */
@@ -46,7 +45,7 @@ bool freezing_slow_path(struct task_struct *p)
 	if (pm_nosig_freezing || cgroup_freezing(p))
 		return true;
 
-	if (pm_freezing && !(p->flags & PF_KTHREAD))
+	if (pm_freezing() && !(p->flags & PF_KTHREAD))
 		return true;
 
 	return false;
diff --git a/kernel/power/process.c b/kernel/power/process.c
index ddd9988327fe..8a4d0e2c8c20 100644
--- a/kernel/power/process.c
+++ b/kernel/power/process.c
@@ -108,6 +108,22 @@ static int try_to_freeze_tasks(bool user_only)
 	return todo ? -EBUSY : 0;
 }
 
+/*
+ * Indicate whether PM freezing is in effect, protected by
+ * system_transition_mutex.
+ */
+static bool pm_freezing_internal;
+
+/**
+ * pm_freezing - indicate whether PM freezing is in effect.
+ *
+ */
+bool pm_freezing(void)
+{
+	return pm_freezing_internal;
+}
+EXPORT_SYMBOL(pm_freezing);
+
 /**
  * freeze_processes - Signal user space processes to enter the refrigerator.
  * The current thread will not be frozen.  The same process that calls
@@ -126,12 +142,12 @@ int freeze_processes(void)
 	/* Make sure this task doesn't get frozen */
 	current->flags |= PF_SUSPEND_TASK;
 
-	if (!pm_freezing)
+	if (!pm_freezing())
 		static_branch_inc(&freezer_active);
 
 	pm_wakeup_clear(0);
 	pr_info("Freezing user space processes ... ");
-	pm_freezing = true;
+	pm_freezing_internal = true;
 	error = try_to_freeze_tasks(true);
 	if (!error) {
 		__usermodehelper_set_disable_depth(UMH_DISABLED);
@@ -187,9 +203,9 @@ void thaw_processes(void)
 	struct task_struct *curr = current;
 
 	trace_suspend_resume(TPS("thaw_processes"), 0, true);
-	if (pm_freezing)
+	if (pm_freezing())
 		static_branch_dec(&freezer_active);
-	pm_freezing = false;
+	pm_freezing_internal = false;
 	pm_nosig_freezing = false;
 
 	oom_killer_enable();

-- 
2.39.0.rc0.267.gcb52ba06e7-goog-b4-0.11.0-dev-696ae
