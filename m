Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB4E905E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 20:58:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472j7Z4lHfzDrD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 06:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--asteinhauser.bounces.google.com
 (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com;
 envelope-from=3e464xqwkdaygyzkotng0ykxmuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--asteinhauser.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="suiQYpBy"; 
 dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472h1n1NQ8zF31C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 06:08:06 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id p14so8837119plq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WIf6OipJpdo3v0Hr4Gq71yzQ45OlT8i5EQnQcgGoZTM=;
 b=suiQYpBynI2Vr7eaGAJ8IfhHC4yPkJbq2Qdlg6+QAkgTYDikwQm6qR8cCjlhe3f67i
 H9MbPnhlZpNg/yduMZsLBrIS9sB1EXp9Jhntyu2KC7ptVTX+aOGjTUpo+s5EpY5wjyuY
 QaAdFMkNa8L2YfpJgTwK6nzFdJeNutiKd49mctnwN0+jqrbHsTTO7dpdKRDTGqXKM66R
 7X5FUgCMOIZwme40zfZZq0col01r4cpqiTMon8mddNtKqGK2BAbR7PNTFNsez/Xr0CAP
 PyguFDX7NC+RISZzpwMRaAXlIdvEzy383cobwdxi0M4aJ4oscNN21ZRsi52PrXkYeap+
 HUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WIf6OipJpdo3v0Hr4Gq71yzQ45OlT8i5EQnQcgGoZTM=;
 b=WFv+6TC5nvRnCk0gtWiGi88nsPOF8KqSoRH2TawkxSrqeeIygysBTEkiHe4EEfjCJ1
 uXO25m+YWjmsxvD9O3RrNTfIqmG/1ST/D/YtPBNRH3FyCaqEULzP4wajMhViaaTX0KjQ
 1Vd+uftAl7utVJFCjUHxnqfjVgxQIYJxIbLFbN/gbQ5DJvHBsN3lTko89ZScIP1Qh1tq
 M6qqkCEUtZ1M246CFGH+d7ZYtV1UvGxacpAwbyQJiz7klSVD4wvU67wysKgdv6Z8SQfN
 4uoK6KshIULbbca3/yqE0ihdLlg7+IvTQ21Q5VJV8L9WxT9rTedgqYQ+24z2nI8Vlu2J
 YmpQ==
X-Gm-Message-State: APjAAAXEQl9Ih7gPDUcfxmQQNPw7g0CSCoPwBGf/5cgjK4nIbsztlh3E
 19D0RmRir+hmgYDMAxEia3ug8H5ACZVLnUH0kg==
X-Google-Smtp-Source: APXvYqxRzwqkAqZOe0KjOTviy14PYVLW5Jp/FcTlv7gExWLMdZyDq9el6CO68UV9xtMRlHRRIlOVm80/4ldt+AjKkW4=
X-Received: by 2002:a63:77cc:: with SMTP id
 s195mr28872278pgc.293.1572376083354; 
 Tue, 29 Oct 2019 12:08:03 -0700 (PDT)
Date: Tue, 29 Oct 2019 12:07:59 -0700
Message-Id: <20191029190759.84821-1-asteinhauser@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
Subject: [PATCH] L1TF support in PowerPC SYSFS.
From: asteinhauser@google.com
To: benh@kernel.crashing.org, paulus@samba.org, diana.craciun@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Oct 2019 06:56:34 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anthony Steinhauser <asteinhauser@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anthony Steinhauser <asteinhauser@google.com>

PowerPC CPUs are vulnerable to L1TF to the same extent as to Meltdown.
It is also mitigated by flushing the L1D on privilege transition.
Currently the SYSFS gives a false negative on L1TF on CPUs that I verified
to be vulnerable.
https://www.ibm.com/blogs/psirt/potential-impact-processors-power-family/
https://github.com/google/safeside/pull/52
Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
---
 arch/powerpc/kernel/security.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 7cfcb294b11c..a1a5017c5170 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -135,7 +135,8 @@ void setup_spectre_v2(void)
 #endif /* CONFIG_PPC_FSL_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S_64
-ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t cpu_show_delayed_fault_common(
+		struct device *dev, struct device_attribute *attr, char *buf)
 {
 	bool thread_priv;
 
@@ -167,6 +168,16 @@ ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, cha
 
 	return sprintf(buf, "Vulnerable\n");
 }
+
+ssize_t cpu_show_l1tf(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return cpu_show_delayed_fault_common(dev, attr, buf);
+}
+
+ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return cpu_show_delayed_fault_common(dev, attr, buf);
+}
 #endif
 
 ssize_t cpu_show_spectre_v1(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.24.0.rc0.303.g954a862665-goog

