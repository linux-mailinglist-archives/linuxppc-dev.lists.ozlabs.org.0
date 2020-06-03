Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F31ED228
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 16:34:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cWdq6QSkzDqBm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=boris.brezillon@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cVnP1ywGzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:56:25 +1000 (AEST)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E57BA2A3D7A;
 Wed,  3 Jun 2020 14:49:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 08/10] mtd: rawnand: fsl_upm: Implement exec_op()
Date: Wed,  3 Jun 2020 15:49:20 +0200
Message-Id: <20200603134922.1352340-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement exec_op() so we can get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 86 ++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 9a63e36825d8..03ca20930274 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -194,6 +194,91 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	return ret;
 }
 
+static int func_exec_instr(struct nand_chip *chip,
+			   const struct nand_op_instr *instr)
+{
+	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
+	u32 mar, reg_offs = fun->mchip_offsets[fun->mchip_number];
+	unsigned int i;
+	const u8 *out;
+	u8 *in;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		fsl_upm_start_pattern(&fun->upm, fun->upm_cmd_offset);
+		mar = (instr->ctx.cmd.opcode << (32 - fun->upm.width)) |
+		      reg_offs;
+		fsl_upm_run_pattern(&fun->upm, fun->io_base + reg_offs, mar);
+		fsl_upm_end_pattern(&fun->upm);
+		return 0;
+
+	case NAND_OP_ADDR_INSTR:
+		fsl_upm_start_pattern(&fun->upm, fun->upm_addr_offset);
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			mar = (instr->ctx.addr.addrs[i] << (32 - fun->upm.width)) |
+			      reg_offs;
+			fsl_upm_run_pattern(&fun->upm, fun->io_base + reg_offs, mar);
+		}
+		fsl_upm_end_pattern(&fun->upm);
+		return 0;
+
+	case NAND_OP_DATA_IN_INSTR:
+		in = instr->ctx.data.buf.in;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			in[i] = in_8(fun->io_base + reg_offs);
+		return 0;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		out = instr->ctx.data.buf.out;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			out_8(fun->io_base + reg_offs, out[i]);
+		return 0;
+
+	case NAND_OP_WAITRDY_INSTR:
+		if (!fun->rnb_gpio[fun->mchip_number])
+			return nand_soft_waitrdy(chip, instr->ctx.waitrdy.timeout_ms);
+
+		return nand_gpio_waitrdy(chip, fun->rnb_gpio[fun->mchip_number],
+					 instr->ctx.waitrdy.timeout_ms);
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fun_exec_op(struct nand_chip *chip, const struct nand_operation *op,
+		       bool check_only)
+{
+	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
+	unsigned int i;
+	int ret;
+
+	if (op->cs > NAND_MAX_CHIPS)
+		return -EINVAL;
+
+	if (check_only)
+		return 0;
+
+	fun->mchip_number = op->cs;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = func_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			return ret;
+
+		if (op->instrs[i].delay_ns)
+			ndelay(op->instrs[i].delay_ns);
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops fun_ops = {
+	.exec_op = fun_exec_op,
+};
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -271,6 +356,7 @@ static int fun_probe(struct platform_device *ofdev)
 				  FSL_UPM_WAIT_WRITE_BYTE;
 
 	nand_controller_init(&fun->base);
+	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
 
-- 
2.25.4

