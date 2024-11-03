Return-Path: <linuxppc-dev+bounces-2811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1649BA8F3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 23:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTrD5qdyz3bcy;
	Mon,  4 Nov 2024 09:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730673164;
	cv=none; b=VGQYy1vQlFRV7I1aMWqlioeMAuvCU/bF2a2ccA9Lf+nMazHH2qA2H4Ki6lGiKyid2s2ciIctucSsVVLnpHTeMnXlsbCa8piNfireREqIaDjcUivVu+L1QSVdO3TNxlvRI50Y3a3GtkEfctHE/IcNn3z5fJvN3N4/cNMBIMDXGUpQC2CmQYkWtqo4i8ZjDLEtxBp9VXPnyd2lZ0IzHqh57lSrzwDeUo2sKr/zCQNMc+WbPsN5Zk4POGMr3zrFQH7fye4DEz8sj9dh+7yV+D7XH2dkma14QJDaTMQZ3yId8XWAOQI/Dp843IBBNCKdL9dRqPMahCNzdGiHjff/6iKOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730673164; c=relaxed/relaxed;
	bh=Hf8+Da0rGshjNHDtsLGUajFT0rpNGIG8kOp0FjaPXxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuHXIj2EOK57Ndr9PAvdXSJYin0GBxhDOart1yneD0givytHd5WYFF0NKRe2OL7uDJGII/e3nWoDXy9V6zZ1CYJ0WnP9LACA2NIt4CDAAsEOT+a1br7ChGpIOl9HNJ/WDRKTtua+bKAdeMJL97pWVVAp6MvH+l8C2ca+KLt7GnHsbyuqj3JxqnfYBrZodQ2EaTePRVFEq9bxoJ3GwkFOZJSbNkWQXZ3svsg6Ij7UXprjVyWaRtlTxrCFuparZUDl4CBDYyf9rAlKWnCIZys5o1Eta4ntWa+80kKb5U3nd8jpNfAalNjhdWhV9J2HDMRyouAxySLMdA5Y/4QUSwavlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SZh8dplT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SZh8dplT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhTr723kzz2yxL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 09:32:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2A377A41F31;
	Sun,  3 Nov 2024 22:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8C3C4CECF;
	Sun,  3 Nov 2024 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673154;
	bh=h0v+/+dQC51krLqRK0yf3yojMlp/Lk1g/dsT2vwPhiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZh8dplTHlFRi2pkXj5jDw8BwmOYWoRIsaQ1Okcid6WrA5P/skRI4/XY7mVYzbixc
	 0aZ6RuwL1J5F9KBkaSeHlrV6WB4/OA2lMDSabbAqatcfNCC5zvOV+cekvtre/YTiLI
	 0SI0a2Cm5gO004FcJfWIEgdlYfSz/yRPBFzZitx5xftA7rLvOhUOuB0IldkNsPxYXk
	 OsYxLmGHV+7ENQ9yDlD6EwGMttgXosMxiBjtcnpA/FWlqR8ihJQ6eZ5UzoXrL7oufo
	 C0N04fZZD4KlYkqiPqYi1YwunMtj9CKjhPfNSMBFCHLA4/nstjP81WyO1sq5lJByTH
	 ZrQLm2DJtUZeQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 18/18] scsi: target: iscsi: switch to using the crc32c library
Date: Sun,  3 Nov 2024 14:31:54 -0800
Message-ID: <20241103223154.136127-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/target/iscsi/Kconfig              |   3 +-
 drivers/target/iscsi/iscsi_target.c       | 153 +++++++---------------
 drivers/target/iscsi/iscsi_target_login.c |  50 -------
 drivers/target/iscsi/iscsi_target_login.h |   1 -
 drivers/target/iscsi/iscsi_target_nego.c  |  21 +--
 include/target/iscsi/iscsi_target_core.h  |   3 -
 6 files changed, 49 insertions(+), 182 deletions(-)

diff --git a/drivers/target/iscsi/Kconfig b/drivers/target/iscsi/Kconfig
index 1c0517a12571..70d76f3dd693 100644
--- a/drivers/target/iscsi/Kconfig
+++ b/drivers/target/iscsi/Kconfig
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config ISCSI_TARGET
 	tristate "SCSI Target Mode Stack"
 	depends on INET
+	select CRC32
 	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRYPTO_HASH
 	help
 	Say M to enable the SCSI target mode stack. A SCSI target mode stack
 	is software that makes local storage available over a storage network
 	to a SCSI initiator system. The supported storage network technologies
 	include iSCSI, Fibre Channel and the SCSI RDMA Protocol (SRP).
diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
index 6002283cbeba..091c1efccfb7 100644
--- a/drivers/target/iscsi/iscsi_target.c
+++ b/drivers/target/iscsi/iscsi_target.c
@@ -6,11 +6,11 @@
  *
  * Author: Nicholas A. Bellinger <nab@linux-iscsi.org>
  *
  ******************************************************************************/
 
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #include <linux/string.h>
 #include <linux/kthread.h>
 #include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/vmalloc.h>
@@ -488,12 +488,12 @@ void iscsit_aborted_task(struct iscsit_conn *conn, struct iscsit_cmd *cmd)
 
 	__iscsit_free_cmd(cmd, true);
 }
 EXPORT_SYMBOL(iscsit_aborted_task);
 
-static void iscsit_do_crypto_hash_buf(struct ahash_request *, const void *,
-				      u32, u32, const void *, void *);
+static u32 iscsit_crc_buf(const void *buf, u32 payload_length,
+			  u32 padding, const void *pad_bytes);
 static void iscsit_tx_thread_wait_for_tcp(struct iscsit_conn *);
 
 static int
 iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 			  const void *data_buf, u32 data_buf_len)
@@ -508,13 +508,11 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 	iov[niov++].iov_len	= ISCSI_HDR_LEN;
 
 	if (conn->conn_ops->HeaderDigest) {
 		u32 *header_digest = (u32 *)&cmd->pdu[ISCSI_HDR_LEN];
 
-		iscsit_do_crypto_hash_buf(conn->conn_tx_hash, hdr,
-					  ISCSI_HDR_LEN, 0, NULL,
-					  header_digest);
+		*header_digest = iscsit_crc_buf(hdr, ISCSI_HDR_LEN, 0, NULL);
 
 		iov[0].iov_len += ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 		pr_debug("Attaching CRC32C HeaderDigest"
 			 " to opcode 0x%x 0x%08x\n",
@@ -535,15 +533,13 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 			pr_debug("Attaching %u additional"
 				 " padding bytes.\n", padding);
 		}
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_tx_hash,
-						  data_buf, data_buf_len,
-						  padding, &cmd->pad_bytes,
-						  &cmd->data_crc);
-
+			cmd->data_crc = iscsit_crc_buf(data_buf, data_buf_len,
+						       padding,
+						       &cmd->pad_bytes);
 			iov[niov].iov_base = &cmd->data_crc;
 			iov[niov++].iov_len = ISCSI_CRC_LEN;
 			tx_size += ISCSI_CRC_LEN;
 			pr_debug("Attached DataDigest for %u"
 				 " bytes opcode 0x%x, CRC 0x%08x\n",
@@ -564,12 +560,12 @@ iscsit_xmit_nondatain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 }
 
 static int iscsit_map_iovec(struct iscsit_cmd *cmd, struct kvec *iov, int nvec,
 			    u32 data_offset, u32 data_length);
 static void iscsit_unmap_iovec(struct iscsit_cmd *);
-static u32 iscsit_do_crypto_hash_sg(struct ahash_request *, struct iscsit_cmd *,
-				    u32, u32, u32, u8 *);
+static u32 iscsit_crc_sglist(const struct iscsit_cmd *cmd, u32 data_length,
+			     u32 padding, const u8 *pad_bytes);
 static int
 iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		       const struct iscsi_datain *datain)
 {
 	struct kvec *iov;
@@ -582,14 +578,12 @@ iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 	tx_size += ISCSI_HDR_LEN;
 
 	if (conn->conn_ops->HeaderDigest) {
 		u32 *header_digest = (u32 *)&cmd->pdu[ISCSI_HDR_LEN];
 
-		iscsit_do_crypto_hash_buf(conn->conn_tx_hash, cmd->pdu,
-					  ISCSI_HDR_LEN, 0, NULL,
-					  header_digest);
-
+		*header_digest = iscsit_crc_buf(cmd->pdu, ISCSI_HDR_LEN, 0,
+						NULL);
 		iov[0].iov_len += ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 
 		pr_debug("Attaching CRC32 HeaderDigest for DataIN PDU 0x%08x\n",
 			 *header_digest);
@@ -612,16 +606,12 @@ iscsit_xmit_datain_pdu(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 
 		pr_debug("Attaching %u padding bytes\n", cmd->padding);
 	}
 
 	if (conn->conn_ops->DataDigest) {
-		cmd->data_crc = iscsit_do_crypto_hash_sg(conn->conn_tx_hash,
-							 cmd, datain->offset,
-							 datain->length,
-							 cmd->padding,
-							 cmd->pad_bytes);
-
+		cmd->data_crc = iscsit_crc_sglist(cmd, datain->length,
+						  cmd->padding, cmd->pad_bytes);
 		iov[iov_count].iov_base	= &cmd->data_crc;
 		iov[iov_count++].iov_len = ISCSI_CRC_LEN;
 		tx_size += ISCSI_CRC_LEN;
 
 		pr_debug("Attached CRC32C DataDigest %d bytes, crc 0x%08x\n",
@@ -1402,81 +1392,49 @@ iscsit_handle_scsi_cmd(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		return 0;
 
 	return iscsit_get_immediate_data(cmd, hdr, dump_payload);
 }
 
-static u32 iscsit_do_crypto_hash_sg(
-	struct ahash_request *hash,
-	struct iscsit_cmd *cmd,
-	u32 data_offset,
-	u32 data_length,
-	u32 padding,
-	u8 *pad_bytes)
+static u32 iscsit_crc_sglist(const struct iscsit_cmd *cmd, u32 data_length,
+			     u32 padding, const u8 *pad_bytes)
 {
-	u32 data_crc;
-	struct scatterlist *sg;
-	unsigned int page_off;
-
-	crypto_ahash_init(hash);
-
-	sg = cmd->first_data_sg;
-	page_off = cmd->first_data_sg_off;
-
-	if (data_length && page_off) {
-		struct scatterlist first_sg;
-		u32 len = min_t(u32, data_length, sg->length - page_off);
-
-		sg_init_table(&first_sg, 1);
-		sg_set_page(&first_sg, sg_page(sg), len, sg->offset + page_off);
-
-		ahash_request_set_crypt(hash, &first_sg, NULL, len);
-		crypto_ahash_update(hash);
-
-		data_length -= len;
-		sg = sg_next(sg);
-	}
+	struct scatterlist *sg = cmd->first_data_sg;
+	unsigned int page_off = cmd->first_data_sg_off;
+	u32 crc = ~0;
 
 	while (data_length) {
-		u32 cur_len = min_t(u32, data_length, sg->length);
+		u32 cur_len = min_t(u32, data_length, sg->length - page_off);
+		const void *virt;
 
-		ahash_request_set_crypt(hash, sg, NULL, cur_len);
-		crypto_ahash_update(hash);
+		virt = kmap_local_page(sg_page(sg)) + sg->offset + page_off;
+		crc = crc32c(crc, virt, cur_len);
+		kunmap_local(virt);
 
-		data_length -= cur_len;
 		/* iscsit_map_iovec has already checked for invalid sg pointers */
 		sg = sg_next(sg);
-	}
 
-	if (padding) {
-		struct scatterlist pad_sg;
-
-		sg_init_one(&pad_sg, pad_bytes, padding);
-		ahash_request_set_crypt(hash, &pad_sg, (u8 *)&data_crc,
-					padding);
-		crypto_ahash_finup(hash);
-	} else {
-		ahash_request_set_crypt(hash, NULL, (u8 *)&data_crc, 0);
-		crypto_ahash_final(hash);
+		page_off = 0;
+		data_length -= cur_len;
 	}
 
-	return data_crc;
+	if (padding)
+		crc = crc32c(crc, pad_bytes, padding);
+
+	return ~crc;
 }
 
-static void iscsit_do_crypto_hash_buf(struct ahash_request *hash,
-	const void *buf, u32 payload_length, u32 padding,
-	const void *pad_bytes, void *data_crc)
+static u32 iscsit_crc_buf(const void *buf, u32 payload_length,
+			  u32 padding, const void *pad_bytes)
 {
-	struct scatterlist sg[2];
+	u32 crc = ~0;
 
-	sg_init_table(sg, ARRAY_SIZE(sg));
-	sg_set_buf(sg, buf, payload_length);
-	if (padding)
-		sg_set_buf(sg + 1, pad_bytes, padding);
+	crc = crc32c(crc, buf, payload_length);
 
-	ahash_request_set_crypt(hash, sg, data_crc, payload_length + padding);
+	if (padding)
+		crc = crc32c(crc, pad_bytes, padding);
 
-	crypto_ahash_digest(hash);
+	return ~crc;
 }
 
 int
 __iscsit_check_dataout_hdr(struct iscsit_conn *conn, void *buf,
 			   struct iscsit_cmd *cmd, u32 payload_length,
@@ -1660,15 +1618,12 @@ iscsit_get_dataout(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		return -1;
 
 	if (conn->conn_ops->DataDigest) {
 		u32 data_crc;
 
-		data_crc = iscsit_do_crypto_hash_sg(conn->conn_rx_hash, cmd,
-						    be32_to_cpu(hdr->offset),
-						    payload_length, padding,
-						    cmd->pad_bytes);
-
+		data_crc = iscsit_crc_sglist(cmd, payload_length, padding,
+					     cmd->pad_bytes);
 		if (checksum != data_crc) {
 			pr_err("ITT: 0x%08x, Offset: %u, Length: %u,"
 				" DataSN: 0x%08x, CRC32C DataDigest 0x%08x"
 				" does not match computed 0x%08x\n",
 				hdr->itt, hdr->offset, payload_length,
@@ -1923,14 +1878,12 @@ static int iscsit_handle_nop_out(struct iscsit_conn *conn, struct iscsit_cmd *cm
 			ret = -1;
 			goto out;
 		}
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash, ping_data,
-						  payload_length, padding,
-						  cmd->pad_bytes, &data_crc);
-
+			data_crc = iscsit_crc_buf(ping_data, payload_length,
+						  padding, cmd->pad_bytes);
 			if (checksum != data_crc) {
 				pr_err("Ping data CRC32C DataDigest"
 				" 0x%08x does not match computed 0x%08x\n",
 					checksum, data_crc);
 				if (!conn->sess->sess_ops->ErrorRecoveryLevel) {
@@ -2326,14 +2279,11 @@ iscsit_handle_text_cmd(struct iscsit_conn *conn, struct iscsit_cmd *cmd,
 		rx_got = rx_data(conn, &iov[0], niov, rx_size);
 		if (rx_got != rx_size)
 			goto reject;
 
 		if (conn->conn_ops->DataDigest) {
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash,
-						  text_in, rx_size, 0, NULL,
-						  &data_crc);
-
+			data_crc = iscsit_crc_buf(text_in, rx_size, 0, NULL);
 			if (checksum != data_crc) {
 				pr_err("Text data CRC32C DataDigest"
 					" 0x%08x does not match computed"
 					" 0x%08x\n", checksum, data_crc);
 				if (!conn->sess->sess_ops->ErrorRecoveryLevel) {
@@ -2686,14 +2636,12 @@ static int iscsit_handle_immediate_data(
 	}
 
 	if (conn->conn_ops->DataDigest) {
 		u32 data_crc;
 
-		data_crc = iscsit_do_crypto_hash_sg(conn->conn_rx_hash, cmd,
-						    cmd->write_data_done, length, padding,
-						    cmd->pad_bytes);
-
+		data_crc = iscsit_crc_sglist(cmd, length, padding,
+					     cmd->pad_bytes);
 		if (checksum != data_crc) {
 			pr_err("ImmediateData CRC32C DataDigest 0x%08x"
 				" does not match computed 0x%08x\n", checksum,
 				data_crc);
 
@@ -4114,14 +4062,12 @@ static void iscsit_get_rx_pdu(struct iscsit_conn *conn)
 			if (ret != ISCSI_CRC_LEN) {
 				iscsit_rx_thread_wait_for_tcp(conn);
 				break;
 			}
 
-			iscsit_do_crypto_hash_buf(conn->conn_rx_hash, buffer,
-						  ISCSI_HDR_LEN, 0, NULL,
-						  &checksum);
-
+			checksum = iscsit_crc_buf(buffer, ISCSI_HDR_LEN, 0,
+						  NULL);
 			if (digest != checksum) {
 				pr_err("HeaderDigest CRC32C failed,"
 					" received 0x%08x, computed 0x%08x\n",
 					digest, checksum);
 				/*
@@ -4404,19 +4350,10 @@ int iscsit_close_connection(
 	 * If any other processes are accessing this connection pointer we
 	 * must wait until they have completed.
 	 */
 	iscsit_check_conn_usage_count(conn);
 
-	ahash_request_free(conn->conn_tx_hash);
-	if (conn->conn_rx_hash) {
-		struct crypto_ahash *tfm;
-
-		tfm = crypto_ahash_reqtfm(conn->conn_rx_hash);
-		ahash_request_free(conn->conn_rx_hash);
-		crypto_free_ahash(tfm);
-	}
-
 	if (conn->sock)
 		sock_release(conn->sock);
 
 	if (conn->conn_transport->iscsit_free_conn)
 		conn->conn_transport->iscsit_free_conn(conn);
diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index 90b870f234f0..c2ac9a99ebbb 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -6,11 +6,10 @@
  *
  * Author: Nicholas A. Bellinger <nab@linux-iscsi.org>
  *
  ******************************************************************************/
 
-#include <crypto/hash.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/kthread.h>
 #include <linux/sched/signal.h>
 #include <linux/idr.h>
@@ -69,50 +68,10 @@ static struct iscsi_login *iscsi_login_init_conn(struct iscsit_conn *conn)
 out_login:
 	kfree(login);
 	return NULL;
 }
 
-/*
- * Used by iscsi_target_nego.c:iscsi_target_locate_portal() to setup
- * per struct iscsit_conn libcrypto contexts for crc32c and crc32-intel
- */
-int iscsi_login_setup_crypto(struct iscsit_conn *conn)
-{
-	struct crypto_ahash *tfm;
-
-	/*
-	 * Setup slicing by CRC32C algorithm for RX and TX libcrypto contexts
-	 * which will default to crc32c_intel.ko for cpu_has_xmm4_2, or fallback
-	 * to software 1x8 byte slicing from crc32c.ko
-	 */
-	tfm = crypto_alloc_ahash("crc32c", 0, CRYPTO_ALG_ASYNC);
-	if (IS_ERR(tfm)) {
-		pr_err("crypto_alloc_ahash() failed\n");
-		return -ENOMEM;
-	}
-
-	conn->conn_rx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
-	if (!conn->conn_rx_hash) {
-		pr_err("ahash_request_alloc() failed for conn_rx_hash\n");
-		crypto_free_ahash(tfm);
-		return -ENOMEM;
-	}
-	ahash_request_set_callback(conn->conn_rx_hash, 0, NULL, NULL);
-
-	conn->conn_tx_hash = ahash_request_alloc(tfm, GFP_KERNEL);
-	if (!conn->conn_tx_hash) {
-		pr_err("ahash_request_alloc() failed for conn_tx_hash\n");
-		ahash_request_free(conn->conn_rx_hash);
-		conn->conn_rx_hash = NULL;
-		crypto_free_ahash(tfm);
-		return -ENOMEM;
-	}
-	ahash_request_set_callback(conn->conn_tx_hash, 0, NULL, NULL);
-
-	return 0;
-}
-
 static int iscsi_login_check_initiator_version(
 	struct iscsit_conn *conn,
 	u8 version_max,
 	u8 version_min)
 {
@@ -1163,19 +1122,10 @@ void iscsi_target_login_sess_out(struct iscsit_conn *conn,
 		} else
 			spin_unlock_bh(&conn->sess->conn_lock);
 		iscsit_dec_session_usage_count(conn->sess);
 	}
 
-	ahash_request_free(conn->conn_tx_hash);
-	if (conn->conn_rx_hash) {
-		struct crypto_ahash *tfm;
-
-		tfm = crypto_ahash_reqtfm(conn->conn_rx_hash);
-		ahash_request_free(conn->conn_rx_hash);
-		crypto_free_ahash(tfm);
-	}
-
 	if (conn->param_list) {
 		iscsi_release_param_list(conn->param_list);
 		conn->param_list = NULL;
 	}
 	iscsi_target_nego_release(conn);
diff --git a/drivers/target/iscsi/iscsi_target_login.h b/drivers/target/iscsi/iscsi_target_login.h
index e8760735486b..03c7d695d58f 100644
--- a/drivers/target/iscsi/iscsi_target_login.h
+++ b/drivers/target/iscsi/iscsi_target_login.h
@@ -7,11 +7,10 @@
 struct iscsit_conn;
 struct iscsi_login;
 struct iscsi_np;
 struct sockaddr_storage;
 
-extern int iscsi_login_setup_crypto(struct iscsit_conn *);
 extern int iscsi_check_for_session_reinstatement(struct iscsit_conn *);
 extern int iscsi_login_post_auth_non_zero_tsih(struct iscsit_conn *, u16, u32);
 extern int iscsit_setup_np(struct iscsi_np *,
 				struct sockaddr_storage *);
 extern int iscsi_target_setup_login_socket(struct iscsi_np *,
diff --git a/drivers/target/iscsi/iscsi_target_nego.c b/drivers/target/iscsi/iscsi_target_nego.c
index fa3fb5f4e6bc..16e3ded98c32 100644
--- a/drivers/target/iscsi/iscsi_target_nego.c
+++ b/drivers/target/iscsi/iscsi_target_nego.c
@@ -1192,18 +1192,11 @@ int iscsi_target_locate_portal(
 	if (!sessiontype) {
 		if (!login->leading_connection)
 			goto get_target;
 
 		sess->sess_ops->SessionType = 1;
-		/*
-		 * Setup crc32c modules from libcrypto
-		 */
-		if (iscsi_login_setup_crypto(conn) < 0) {
-			pr_err("iscsi_login_setup_crypto() failed\n");
-			ret = -1;
-			goto out;
-		}
+
 		/*
 		 * Serialize access across the discovery struct iscsi_portal_group to
 		 * process login attempt.
 		 */
 		conn->tpg = iscsit_global->discovery_tpg;
@@ -1256,21 +1249,11 @@ int iscsi_target_locate_portal(
 		ret = -1;
 		goto out;
 	}
 	conn->tpg_np = tpg_np;
 	pr_debug("Located Portal Group Object: %hu\n", conn->tpg->tpgt);
-	/*
-	 * Setup crc32c modules from libcrypto
-	 */
-	if (iscsi_login_setup_crypto(conn) < 0) {
-		pr_err("iscsi_login_setup_crypto() failed\n");
-		kref_put(&tpg_np->tpg_np_kref, iscsit_login_kref_put);
-		iscsit_put_tiqn_for_login(tiqn);
-		conn->tpg = NULL;
-		ret = -1;
-		goto out;
-	}
+
 	/*
 	 * Serialize access across the struct iscsi_portal_group to
 	 * process login attempt.
 	 */
 	if (iscsit_access_np(np, conn->tpg) < 0) {
diff --git a/include/target/iscsi/iscsi_target_core.h b/include/target/iscsi/iscsi_target_core.h
index 60af7c63b34e..51ca80abacf7 100644
--- a/include/target/iscsi/iscsi_target_core.h
+++ b/include/target/iscsi/iscsi_target_core.h
@@ -574,13 +574,10 @@ struct iscsit_conn {
 	spinlock_t		nopin_timer_lock;
 	spinlock_t		response_queue_lock;
 	spinlock_t		state_lock;
 	spinlock_t		login_timer_lock;
 	spinlock_t		login_worker_lock;
-	/* libcrypto RX and TX contexts for crc32c */
-	struct ahash_request	*conn_rx_hash;
-	struct ahash_request	*conn_tx_hash;
 	/* Used for scheduling TX and RX connection kthreads */
 	cpumask_var_t		conn_cpumask;
 	cpumask_var_t		allowed_cpumask;
 	unsigned int		conn_rx_reset_cpumask:1;
 	unsigned int		conn_tx_reset_cpumask:1;
-- 
2.47.0


