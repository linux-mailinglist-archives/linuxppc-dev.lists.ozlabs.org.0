Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD337BEF06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 01:20:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RAF3uFWn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4FQF0gFmz3cb8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 10:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RAF3uFWn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3nookzqskdhucnlmbglmbmmzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4FPM19GDz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:20:05 +1100 (AEDT)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1c8f14ed485so7490634fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Oct 2023 16:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696893598; x=1697498398; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zjHQyvadONVOud3v/rE/Az+3J92aB2vK1iZQZ/OYRLE=;
        b=RAF3uFWn6zkN88sbsAdOvqvwcmBxxS+c2txrKVMdIWhwLkxh2WvTC+QKV1QC+T2Yxn
         uf6TFjfIUE1jO4HxUCurnGP9cUC2OLt3vpIdRcaggNBDt+Dn7NMnv2vbGGGNr90hlob8
         hMyJvlUP3hocgjZhzf+2uBjK57Alg1fAaEHFspwJthQE2W5IcA6mEQn2BbuyQJMJepay
         D6H3EMiyBtXfu8zzSh29ywQlaaSdjOesl6eMDOs4+a/n5lUsfsdaizMLLV4jDdHbmPUM
         Sl+Yg9RkbtvBVhVZPT5FUdyeR5V5xoa/ChryfTowmbL9thIpO5xeD3XcWUkiOfBOjV6L
         DXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696893598; x=1697498398;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjHQyvadONVOud3v/rE/Az+3J92aB2vK1iZQZ/OYRLE=;
        b=vbh9juegC6TC8kW1aEiTLcEDXZYiNw26AmRp+Wl5nI4I5iTKryrGtBlzFGVq5NL/hK
         RtDHy/LYOTcgxR9MwPn8wyAKyIOrVaSqDWLKlG9kvgp8s9cdJMA54aIki5qdAyP9ww9q
         OVFo6aU1D4QPfipSogAiLHtMIKkAZjLOulYqHBM8DOzPebsW4FD9bNfi8ZYEn/KEqPwd
         qebw1z+cMSUKE//9+rQdWy0IgVVUJbdHdbrhO9vLA3owLwQwdPJfSWWyfXIzC+dy7Vgc
         dfquHQQFLknsJ1k5rb4GqW/yZOzKprW/ForppI1fUrrFRSSHWrGT9reYb1bU68LnwMw0
         UPxg==
X-Gm-Message-State: AOJu0YyRdsRkfNHRkvdQrakY2VCSYrFBPanyZyXQHBCJK9m4jtk+cKdm
	OPLsdzgDUPbbnE6u2Laro8XnA/uR7x4NeTdy4Q==
X-Google-Smtp-Source: AGHT+IEJoSw0wb7t9m20c6ZpjKDlOmD783PHpu5vdHPvTTgfWAZC5cRf21JJzRLNwBCQUCa+9r2jjqVtgVy/1uiCHQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:3a10:b0:1d5:95fc:2a65 with
 SMTP id du16-20020a0568703a1000b001d595fc2a65mr6733088oab.0.1696893598255;
 Mon, 09 Oct 2023 16:19:58 -0700 (PDT)
Date: Mon, 09 Oct 2023 23:19:57 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJyKJGUC/x2NQQrCMBBFr1Jm7cCkohCvIi7a9GtnYSwzIVRK7
 27q4sF/m/82cpjC6dZtZKjq+slNwqmjNA/5BdapOfXSn4NIZC+W0/LlybTCnDMKo8ywY+j4Pqh ZEyeGRJFxCBGXK7XDxfDU9R+7P/b9B+1asIF8AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696893597; l=1913;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=IQPojGhMm0FWYkhisYrQ00VPkfbCrbcIeRucK9CSAtU=; b=lqQitRgTvDQrS2yNAdU1MwFFmxI/TImPYzq1XkAQrajgWQGjpKNWCOFzZ6AGd8vHFb8Xj4b88
 UcPIIFUP2hSCCsgd+ycewkMTnHNJ1UB2BTMpZXFag89Q1wnWwAwYyer
X-Mailer: b4 0.12.3
Message-ID: <20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-v1-1-712866f16754@google.com>
Subject: [PATCH] ibmvnic: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Haren Myneni <haren@linux.ibm.com>, 
	Rick Lindsley <ricklind@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, 
	Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: netdev@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`strncpy` is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

NUL-padding is not required as the buffer is already memset to 0:
|       memset(adapter->fw_version, 0, 32);

Note that another usage of strscpy exists on the same buffer:
|       strscpy((char *)adapter->fw_version, "N/A", sizeof(adapter->fw_version));

Considering the above, a suitable replacement is `strscpy` [2] due to
the fact that it guarantees NUL-termination on the destination buffer
without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.
---
 drivers/net/ethernet/ibm/ibmvnic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index cdf5251e5679..ac15dcadf4c1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -5247,7 +5247,8 @@ static void handle_vpd_rsp(union ibmvnic_crq *crq,
 	/* copy firmware version string from vpd into adapter */
 	if ((substr + 3 + fw_level_len) <
 	    (adapter->vpd->buff + adapter->vpd->len)) {
-		strncpy((char *)adapter->fw_version, substr + 3, fw_level_len);
+		strscpy(adapter->fw_version, substr + 3,
+			sizeof(adapter->fw_version));
 	} else {
 		dev_info(dev, "FW substr extrapolated VPD buff\n");
 	}

---
base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
change-id: 20231009-strncpy-drivers-net-ethernet-ibm-ibmvnic-c-e0900ba19e56

Best regards,
--
Justin Stitt <justinstitt@google.com>

