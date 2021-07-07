Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6193BE561
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 11:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKYZH3Pnwz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 19:11:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=S2JKLryR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=S2JKLryR; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKYYn4nsDz3062
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 19:10:52 +1000 (AEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73D1C1FD5C;
 Wed,  7 Jul 2021 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625649048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jBrTdZh0fhHdoZBmt7kZCO7hzkn6x3INTyY3C5pkFwM=;
 b=S2JKLryRPmjUmQr9qsJJMP4SAYWAeQdDK57J6LPLxK5z9x6x3XQrAFHaITXI3dWZAWazwE
 L7LZHl1Ecfl22mrcaxv93w06LSjduKdNmBf0P7ENfxbe5yed6jbPVBX7fEFsEiXK2/a3jd
 sC/5d4yUaeG8VZD/deLqErOUYhHNgho=
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3CDA613966;
 Wed,  7 Jul 2021 09:10:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6ZHeDJhv5WDWOAAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 07 Jul 2021 09:10:48 +0000
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
Date: Wed,  7 Jul 2021 11:10:45 +0200
Message-Id: <20210707091045.460-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xen frontends shouldn't BUG() in case of illegal data received from
their backends. So replace the BUG_ON()s when reading illegal data from
the ring page with negative return values.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- drop BUG_ON() (Christophe Leroy, Greg Kroah-Hartmann)
- replace WARN_ONCE() by pr_err_once() (Greg Kroah-Hartmann)
- break out from original series
---
 drivers/tty/hvc/hvc_xen.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 92c9a476defc..8f143c09a169 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -86,7 +86,11 @@ static int __write_console(struct xencons_info *xencons,
 	cons = intf->out_cons;
 	prod = intf->out_prod;
 	mb();			/* update queue values before going on */
-	BUG_ON((prod - cons) > sizeof(intf->out));
+
+	if ((prod - cons) > sizeof(intf->out)) {
+		pr_err_once("xencons: Illegal ring page indices");
+		return -EINVAL;
+	}
 
 	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
 		intf->out[MASK_XENCONS_IDX(prod++, intf->out)] = data[sent++];
@@ -114,7 +118,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
 	 */
 	while (len) {
 		int sent = __write_console(cons, data, len);
-		
+
+		if (sent < 0)
+			return sent;
+
 		data += sent;
 		len -= sent;
 
@@ -138,7 +145,11 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	cons = intf->in_cons;
 	prod = intf->in_prod;
 	mb();			/* get pointers before reading ring */
-	BUG_ON((prod - cons) > sizeof(intf->in));
+
+	if ((prod - cons) > sizeof(intf->in)) {
+		pr_err_once("xencons: Illegal ring page indices");
+		return -EINVAL;
+	}
 
 	while (cons != prod && recv < len)
 		buf[recv++] = intf->in[MASK_XENCONS_IDX(cons++, intf->in)];
-- 
2.26.2

