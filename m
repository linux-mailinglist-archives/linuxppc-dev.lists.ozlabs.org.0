Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792B3F3E74
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 09:52:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsnfW0PGjz3d82
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 17:52:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJB3FTt5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VJB3FTt5; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gsnd21DmRz2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 17:51:32 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id bo18so10082393pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwHDlRYGw2pe2VpozCEASD85dDS6sHxCPa/xDSIICvM=;
 b=VJB3FTt5q3R3nGTwAgDC29A/KPNoR+UpkxoBw0Dq4oRvBhiadsp7xDfQYieHFnlYbk
 4FxWfTV91NYwkFNCEBLbyPpmTlxrZQr0gC271DLHzeiQnbnlhlxApp/G+sbOQk8iU7Eg
 P4t+2DpWPq78fX+VsMvxWmM5/zw7BIsDMwPjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwHDlRYGw2pe2VpozCEASD85dDS6sHxCPa/xDSIICvM=;
 b=Qx/4AJdHJGZSgww8n+slxcTo1v79b/MYocw++4VtvUaXmdv071GiXjvgk/v/e9Rdzy
 N4+JzAk6/wLMPmxE5q/xMjYGiYBevctqSlDtmeeVi8R5V762zX1oDsDu7yNXX3dCBAXK
 GlRnV9atscdWuB2nuLUsVPQfVVOGLmUzD1Xulj1+znI1inhL+Xzh8DNyfkLhXSP7dPdz
 WDkh78zsQYPCKGN8D7vWhA0lNEKavKGF7usW3ziNDr/pHHRBf96gY/1RQSVcvcEEv06S
 VYU0W4H6HmPrVKll8DkpyewbqIEilpQ4Kc4MbLRmHhkqLJ2czlucfbDGTpNVkTGE5q1/
 XPNw==
X-Gm-Message-State: AOAM5319Pz6Ny54Ytc0XSsDttVYJaXNe1iWaeHLhnwGkHi6C/+6C9fKX
 l+QvOz2IJbTO4BCYnUeBXEKZKg==
X-Google-Smtp-Source: ABdhPJy91PqrhLQGvyTAftsayxdZqXZXrWDF2+1RCGOwRui/AsaObRqzH9olXGQRjCk+pfD4T5l3Nw==
X-Received: by 2002:a17:90a:1f09:: with SMTP id
 u9mr13451822pja.206.1629618689283; 
 Sun, 22 Aug 2021 00:51:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j5sm16177432pjv.56.2021.08.22.00.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 00:51:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH for-next 01/25] scsi: ibmvscsi: Avoid multi-field memset()
 overflow by aiming at srp
Date: Sun, 22 Aug 2021 00:50:58 -0700
Message-Id: <20210822075122.864511-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210822075122.864511-1-keescook@chromium.org>
References: <20210822075122.864511-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; h=from:subject;
 bh=ug7KtAnqHA97F0XIHxj84B1vcjl5KTaHRbDt5BL2iJc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhIgH029iMytTOfEkySdRelPdaDhR6VhLaGeRkdoDa
 4ABOm4yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSIB9AAKCRCJcvTf3G3AJjv2D/
 48Fr/XBXtchVss+4cH6PQaHpgRQzDXtB1e3n+pg90FdtK9Gu2IOW5Eeo4HeRN99/sieQG+UcSe490f
 qdjzZblkN7rCOZs5uC7Qv2WpSpX0BBhVlJiGfxEbCTMtN/McHWDMfDGmctuVYCjiFd7y7Qpjh/L95Y
 m7MEuz01lgiYVwA7kXYcrKV101D+aRlU+gawH0a187wiLOGq8y3BJAooZKrFbYl1355a2kJZCjPGoC
 hfz0Zlx7XRVAVlQj2eCSdwACSCDiDmZx+gKHkVGAa0CtgE0F32xohvWP2x4Yt3yFRHQZDV+m2xqDvg
 jdu7NtA6bQe03uJ61mDeZEZmxbYOgkiliI38njvH83Gv+Oio1sCmUJjxyDGm325T/wynBN5hbw25If
 e7zPYndMKDwfXXY+dtyCHCMOh0rwCnS8C5qg3Z+ez6sc/fc1H3oGeSo4BsvngOPFd0iFMrdzhmT9Y4
 eXJZW8YHVV7l2UMynV+iVHszGnG5p93QrqnK5KN++aRu+Vr8WKiP9AlwHb8ALA+9vT6sy4fojF/6p1
 yL/9kO9S1YrHvKzdaJA1a0FZiq0azd5ExdJrqy3oB43u2iZm/iUYWiea6jYZ0NIrVuHaNcIy9Dn8By
 CUJjki1mhqlzaYinYiWB2xUvQmLUuuYrVcDc6adS96luBv0lQeyKTVjBPPdw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kees Cook <keescook@chromium.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 clang-built-linux@googlegroups.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-scsi@vger.kernel.org,
 linux-mm@kvack.org, Daniel Micay <danielmicay@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 David Gow <davidgow@google.com>, linuxppc-dev@lists.ozlabs.org,
 Bart Van Assche <bvanassche@acm.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Instead of writing beyond the end of evt_struct->iu.srp.cmd, target the
upper union (evt_struct->iu.srp) instead, as that's what is being wiped.

Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
Link: https://lore.kernel.org/lkml/yq135rzp79c.fsf@ca-mkp.ca.oracle.com
Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Link: https://lore.kernel.org/lkml/6eae8434-e9a7-aa74-628b-b515b3695359@linux.ibm.com
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index e6a3eaaa57d9..3bd3a0124123 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -1055,8 +1055,9 @@ static int ibmvscsi_queuecommand_lck(struct scsi_cmnd *cmnd,
 		return SCSI_MLQUEUE_HOST_BUSY;
 
 	/* Set up the actual SRP IU */
+	BUILD_BUG_ON(sizeof(evt_struct->iu.srp) != SRP_MAX_IU_LEN);
+	memset(&evt_struct->iu.srp, 0x00, sizeof(evt_struct->iu.srp));
 	srp_cmd = &evt_struct->iu.srp.cmd;
-	memset(srp_cmd, 0x00, SRP_MAX_IU_LEN);
 	srp_cmd->opcode = SRP_CMD;
 	memcpy(srp_cmd->cdb, cmnd->cmnd, sizeof(srp_cmd->cdb));
 	int_to_scsilun(lun, &srp_cmd->lun);
-- 
2.30.2

