Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CF7DC037
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 20:05:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jtGdqMYI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK2lr1HL1z3cVg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 06:05:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jtGdqMYI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qv4_zqskdg8whfgvafgvggtbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK2ky134Sz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 06:04:39 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7cf717bacso48717307b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 12:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698692674; x=1699297474; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VzjnyJquTGOFDWRTCwIsnRPKQd4yoRAbd2BHiNTCYPE=;
        b=jtGdqMYImxIJKWDEewyFE0tOz6mc+zxnigVm7x7VAhpYwzgJai64zJ0YAVcxt1CjC3
         2TFz10tGEzPvU8nThDGX6NIkhT3uZIvQKZ8/3oOI3mCIJAPNCdgsPCiGGNHALMY2qjiG
         9lJZ+zEUyt4eZU1Dqm3tofVlW8ehE1xeq0ZOsbAY3SaomXRWGD9eCMwKcSiyaLtlE1V4
         J8P1PsAOvtZudKRtEY1joEl6Z9F9YKG6TztHHOHhJkrgzoiea4iKQdvbIMGAf0CvdPui
         /E6Y81avprjAcCWLdpYPV2SuENOPkdhu2lTfoLUVvtEiPJP+D2i14JW4tdC8H/SyZRg7
         hv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692674; x=1699297474;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzjnyJquTGOFDWRTCwIsnRPKQd4yoRAbd2BHiNTCYPE=;
        b=OTgatEGGvGpT/ineduGvA1p7SI70wEFvTCOk7eDwaUMsKrmNZReK2u59tNOzgK7YDs
         MX/fj12c1FveB3b8O9zE3x8JBYGQT+pvNQy5FfI8T69I4YXwcerGxsHWJsVhOMbUjSlt
         PqW5fyUPLSwvKa5HogEj8W9o4aHnO/hDjjEhQYckuuONwWz+CtTaq+RcS3aJmHdQUmAE
         IGMmxZOZUDiPs/hU54eJKoSu8C3X7hUv8J6hMVRzLue8StnGK17fs6zDDWE6IS6b3YcL
         RiyG0gQ0tZJHteSfDN50SGrbe8isht1E9cWkyOkarqKHp7QPk2V3LzCXU7rD4lwOuncy
         W8Bg==
X-Gm-Message-State: AOJu0YxELz5aGaTtsEII6+5cCGGfu5+H+XHVLUfY2GU4bjNz7nTuGKQu
	v9LBLiZj0d/wYsAMZwzLgc8LxH8Gttyi4eFCaA==
X-Google-Smtp-Source: AGHT+IGs9hKG8tQnq+Kf3PiCNiCsBtpBmbVL7oN4YtYcjhYgkAwIvgGyw0USxYueImjqREofzsC5LZCxvaMlUQpNyQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:2d24:0:b0:d9a:4e29:6353 with SMTP
 id t36-20020a252d24000000b00d9a4e296353mr218208ybt.0.1698692674494; Mon, 30
 Oct 2023 12:04:34 -0700 (PDT)
Date: Mon, 30 Oct 2023 19:04:33 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAED+P2UC/z2NQQqDMBBFryKzdiAmBKRXKS7qZKKzaCozEiri3
 Ru6kLf5b/PfCcYqbPDoTlCuYvIpTYa+A1pfZWGU1By882FwwaHtWmg7MKlUVkMjE5T5Xe+RCRu UiYOPMcUR2tmmnOX7Dz2n6/oBR6DxKHgAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698692673; l=3539;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=72GgGEwj5Ps4pN3RPFU4tntY2mPxjof123VGlstKADQ=; b=zhou5EtC7CO55iMzjZDC3sTtF8LQi9QWb7YsZHwNRpQImsTgbFvjV9qobc8UJI22pNUZTB22k
 UiJOp9DK74sDASAGgsMQXEHSs+ldJdpEAf29LQBBGDrJByfvj0X0ISh
X-Mailer: b4 0.12.3
Message-ID: <20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-v1-1-5a4909688435@google.com>
Subject: [PATCH] scsi: ibmvfc: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
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
Cc: Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

We expect these fields to be NUL-terminated as the property names from
which they are derived are also NUL-terminated.

Moreover, NUL-padding is not required as our destination buffers are
already NUL-allocated and any future NUL-byte assignments are redundant
(like the ones that strncpy() does).
ibmvfc_probe() ->
|       struct ibmvfc_host *vhost;
|       struct Scsi_Host *shost;
...
| 	shost = scsi_host_alloc(&driver_template, sizeof(*vhost));
... **side note: is this a bug? Looks like a type to me   ^^^^^**
...
|	vhost = shost_priv(shost);

... where shost_priv() is:
|       static inline void *shost_priv(struct Scsi_Host *shost)
|       {
|       	return (void *)shost->hostdata;
|       }

.. and:
scsi_host_alloc() ->
| 	shost = kzalloc(sizeof(struct Scsi_Host) + privsize, GFP_KERNEL);

And for login_info->..., NUL-padding is also not required as it is
explicitly memset to 0:
|	memset(login_info, 0, sizeof(*login_info));

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

Found with: $ rg "strncpy\("
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index ce9eb00e2ca0..e73a39b1c832 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1455,7 +1455,7 @@ static void ibmvfc_gather_partition_info(struct ibmvfc_host *vhost)
 
 	name = of_get_property(rootdn, "ibm,partition-name", NULL);
 	if (name)
-		strncpy(vhost->partition_name, name, sizeof(vhost->partition_name));
+		strscpy(vhost->partition_name, name, sizeof(vhost->partition_name));
 	num = of_get_property(rootdn, "ibm,partition-no", NULL);
 	if (num)
 		vhost->partition_number = *num;
@@ -1498,13 +1498,15 @@ static void ibmvfc_set_login_info(struct ibmvfc_host *vhost)
 	login_info->async.va = cpu_to_be64(vhost->async_crq.msg_token);
 	login_info->async.len = cpu_to_be32(async_crq->size *
 					    sizeof(*async_crq->msgs.async));
-	strncpy(login_info->partition_name, vhost->partition_name, IBMVFC_MAX_NAME);
-	strncpy(login_info->device_name,
-		dev_name(&vhost->host->shost_gendev), IBMVFC_MAX_NAME);
+	strscpy(login_info->partition_name, vhost->partition_name,
+		sizeof(login_info->partition_name));
+
+	strscpy(login_info->device_name,
+		dev_name(&vhost->host->shost_gendev), sizeof(login_info->device_name));
 
 	location = of_get_property(of_node, "ibm,loc-code", NULL);
 	location = location ? location : dev_name(vhost->dev);
-	strncpy(login_info->drc_name, location, IBMVFC_MAX_NAME);
+	strscpy(login_info->drc_name, location, sizeof(login_info->drc_name));
 }
 
 /**

---
base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
change-id: 20231030-strncpy-drivers-scsi-ibmvscsi-ibmvfc-c-ccfce3255d58

Best regards,
--
Justin Stitt <justinstitt@google.com>

