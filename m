Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C13EFAF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 08:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqHV46pHYz3bVR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 16:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AA8Dm35a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AA8Dm35a; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqHTF5bGKz2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 16:06:07 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id w6so1114719plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbUwFOYf9QoLFM9o1nAVztc6nEJjeod+Gi+09Yoftqs=;
 b=AA8Dm35avczwDjy1quR0mKKgLjJMquju7U+lNNFVsOZUn5KeyzjnQXjClbgpdlxX3v
 2SCBsrMQ7ukd+uf8c6Etiiy64mFHHfp2eOjZzOj3u12Lg1Ng2Us4VyORw9XhVSTq8vtw
 HHhuGPccj0u5QnTYM0PtIjxC8fm4Xv9eP4lFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbUwFOYf9QoLFM9o1nAVztc6nEJjeod+Gi+09Yoftqs=;
 b=VXrIfcyV0Jzw7E1SA2cv8S+BPanJHo7wOLrigDEQYu9jIZrBZgLoFZ28MB5Dhq0Ye8
 9hpYpETPP2XjFM8D/MA8gORQcM2138xSbuMGozeNowETfIsyd5vkJTIjGdnN8uouQilU
 Qv5w7lUMPF+UX5VXOIcoRICwHN6VU4YgCzxrsTEXoNl8inanF8Y0dx+vjVYcscdJhDk+
 HJjbtuMuZZsNE7tSj9uxH48nfuR8HSRfmHBYaVsskihz6W2PGjs0/2CzCjnudMm9qX+5
 hQvu1iFyJSyGsTG7HtGp+yXrzz5NLnRgL5v/OPZKYtAyxwR0dxqaun57C06liYfdIwMR
 Cd7w==
X-Gm-Message-State: AOAM531yqLQkNV3IFpP6yI9OS+cuNuya6wjhaDdLI7MCn0cvkCJA54Ua
 ZzdnrpPHeRLjG500OXVvijZI6A==
X-Google-Smtp-Source: ABdhPJzgTBNMg0giRn1OlPz6IBm3E5s5bSOA2j6yOGDn8/0pIG8aKiyQ3az6o2cvg6kyztHJaHQzMQ==
X-Received: by 2002:a17:902:d2c3:b0:12d:8ce5:5b7d with SMTP id
 n3-20020a170902d2c300b0012d8ce55b7dmr6022538plc.67.1629266762932; 
 Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 20sm4769310pfi.170.2021.08.17.23.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:06:02 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 36/63] scsi: ibmvscsi: Avoid multi-field memset() overflow
 by aiming at srp
Date: Tue, 17 Aug 2021 23:05:06 -0700
Message-Id: <20210818060533.3569517-37-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; h=from:subject;
 bh=5Fef3h9MfV87icL3aKSaHfIze5Oq4yInxr2gg/s9eAg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMm17KLki3rqBaWpe95fASVBBQIIBI5vmXQYfcS
 JgzP+3CJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJgAKCRCJcvTf3G3AJn/GEA
 C0g1tF3vBSATxFlt9g2MNVHox82GGsf3qtgn9DL9516BujVpZ6kxxymzVqHQLiePOpV9iTyZhh8bJP
 WPrCjTBFFiAdb9Faz4yuO9NudbXOZ+FexNaG3BvwuZOEhhxFRk3UBhjg0yj+oUvaQFJI+eTXM87IiX
 XGBr1KfDdlwjfoNhrhvn+4x2NL1tTH2qiRtqPMKANljnd20L8dSa0Zf11kG3d+/5Pg3jlBdf5oFQ4U
 LAOUjEVvApr+/BCqpBDdWYLpXpnN6wBAOl/UKC2lE4+Bma8jAela+AXthAZ4+UkXlllUyJC7CYFuYC
 nNiMaWOxnlHpbs9rLdSPcik2ntQ+SzdHUvwQ6D98tTmN5hOsvVqKypYT3ih1P0V3tx5tnqBrY3146X
 db+XSYqsKceUuA6bnZUACjEVi2zDnJZN/ekJ/ihxxqVKhs9MGGBJk2lEf1aYuZL0wluSpQwGxJSRs+
 3TlPDK7rkiGCZ7rOUhBMieRFjYzAx2KdDP5B2vjJOI/xopH9WIrkKC46i/Nbijs4Tk/P6zfRhrnq3h
 VCi/Zuk8ZQvxwMdoc18EPHLm7+Q+Sti54Kj1u5YIGU/ibkC2dYtnH1OTLV3w/X4I14RtR5sSFhYudo
 sHSg/VA5WHaBn3O1xg6slKTE5ifCxA4C+jndEj5364mN8eVDW0pyOK+Bp0vw==
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-block@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kbuild@vger.kernel.org
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
index 50df7dd9cb91..ea8e01f49cba 100644
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

