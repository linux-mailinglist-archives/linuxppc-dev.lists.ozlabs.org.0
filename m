Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E9EC68E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:20:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474S8q0sgdzF7D6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 03:20:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Gw4YiAn3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474S6M0qXZzF6RM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 03:18:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 474S693NsXz9v2yk;
 Fri,  1 Nov 2019 17:18:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Gw4YiAn3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7R5HJrjvJMqx; Fri,  1 Nov 2019 17:18:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 474S692J1vz9v2yj;
 Fri,  1 Nov 2019 17:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572625089; bh=//xW9oe3sdeea9BTEt/GmLNcAVM0ebOxU86PVSKO8v8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Gw4YiAn34KPIZVpbWNuT3uI3oIGrSSzhBPX8K7h17dzkE4ph9h4nSAkz98Op1BF9M
 F/GEsICzWRl/01VVs0AYkHnT4+aELBMwekMi/jZgM87Up+wTQC/5SPAkgtZKIkIuYf
 zREJScQJEWnhgUVIzRiDaJpvUOrlia2OMK5cXps0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA86C8B8F6;
 Fri,  1 Nov 2019 17:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id etT95YCdmsBx; Fri,  1 Nov 2019 17:18:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39F758B7C2;
 Fri,  1 Nov 2019 17:18:10 +0100 (CET)
Subject: Re: [PATCH v3 26/36] soc: fsl: move cpm.h from powerpc/include/asm to
 include/soc/fsl
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-27-linux@rasmusvillemoes.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5071118d-2008-7725-a6cd-ce14b49dfa20@c-s.fr>
Date: Fri, 1 Nov 2019 17:18:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101124210.14510-27-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/11/2019 à 13:42, Rasmus Villemoes a écrit :
> Some drivers, e.g. ucc_uart, need definitions from cpm.h. In order to
> allow building those drivers for non-ppc based SOCs, move the header
> to include/soc/fsl. For now, leave a trivial wrapper at the old
> location so drivers can be updated one by one.

I'm not sure that's the correct way to go.

As far as I know, CPM is specific to powerpc (or maybe common to some 
motorola 68000). So only powerpc specific drivers should need it.

If cpm.h includes items that are needed for QE, those items should go in 
another .h

Of course, it doesn't mean we can't move cpm.h in include/soc/fsl, but 
anyway only platforms having CPM1 or CPM2 should include it.

Christophe


> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   arch/powerpc/include/asm/cpm.h | 172 +--------------------------------
>   include/soc/fsl/cpm.h          | 171 ++++++++++++++++++++++++++++++++
>   2 files changed, 172 insertions(+), 171 deletions(-)
>   create mode 100644 include/soc/fsl/cpm.h
> 
> diff --git a/arch/powerpc/include/asm/cpm.h b/arch/powerpc/include/asm/cpm.h
> index 4c24ea8209bb..ce483b0f8a4d 100644
> --- a/arch/powerpc/include/asm/cpm.h
> +++ b/arch/powerpc/include/asm/cpm.h
> @@ -1,171 +1 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __CPM_H
> -#define __CPM_H
> -
> -#include <linux/compiler.h>
> -#include <linux/types.h>
> -#include <linux/errno.h>
> -#include <linux/of.h>
> -#include <soc/fsl/qe/qe.h>
> -
> -/*
> - * SPI Parameter RAM common to QE and CPM.
> - */
> -struct spi_pram {
> -	__be16	rbase;	/* Rx Buffer descriptor base address */
> -	__be16	tbase;	/* Tx Buffer descriptor base address */
> -	u8	rfcr;	/* Rx function code */
> -	u8	tfcr;	/* Tx function code */
> -	__be16	mrblr;	/* Max receive buffer length */
> -	__be32	rstate;	/* Internal */
> -	__be32	rdp;	/* Internal */
> -	__be16	rbptr;	/* Internal */
> -	__be16	rbc;	/* Internal */
> -	__be32	rxtmp;	/* Internal */
> -	__be32	tstate;	/* Internal */
> -	__be32	tdp;	/* Internal */
> -	__be16	tbptr;	/* Internal */
> -	__be16	tbc;	/* Internal */
> -	__be32	txtmp;	/* Internal */
> -	__be32	res;	/* Tx temp. */
> -	__be16  rpbase;	/* Relocation pointer (CPM1 only) */
> -	__be16	res1;	/* Reserved */
> -};
> -
> -/*
> - * USB Controller pram common to QE and CPM.
> - */
> -struct usb_ctlr {
> -	u8	usb_usmod;
> -	u8	usb_usadr;
> -	u8	usb_uscom;
> -	u8	res1[1];
> -	__be16	usb_usep[4];
> -	u8	res2[4];
> -	__be16	usb_usber;
> -	u8	res3[2];
> -	__be16	usb_usbmr;
> -	u8	res4[1];
> -	u8	usb_usbs;
> -	/* Fields down below are QE-only */
> -	__be16	usb_ussft;
> -	u8	res5[2];
> -	__be16	usb_usfrn;
> -	u8	res6[0x22];
> -} __attribute__ ((packed));
> -
> -/*
> - * Function code bits, usually generic to devices.
> - */
> -#ifdef CONFIG_CPM1
> -#define CPMFCR_GBL	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> -#define CPMFCR_TC2	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> -#define CPMFCR_DTB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> -#define CPMFCR_BDB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> -#else
> -#define CPMFCR_GBL	((u_char)0x20)	/* Set memory snooping */
> -#define CPMFCR_TC2	((u_char)0x04)	/* Transfer code 2 value */
> -#define CPMFCR_DTB	((u_char)0x02)	/* Use local bus for data when set */
> -#define CPMFCR_BDB	((u_char)0x01)	/* Use local bus for BD when set */
> -#endif
> -#define CPMFCR_EB	((u_char)0x10)	/* Set big endian byte order */
> -
> -/* Opcodes common to CPM1 and CPM2
> -*/
> -#define CPM_CR_INIT_TRX		((ushort)0x0000)
> -#define CPM_CR_INIT_RX		((ushort)0x0001)
> -#define CPM_CR_INIT_TX		((ushort)0x0002)
> -#define CPM_CR_HUNT_MODE	((ushort)0x0003)
> -#define CPM_CR_STOP_TX		((ushort)0x0004)
> -#define CPM_CR_GRA_STOP_TX	((ushort)0x0005)
> -#define CPM_CR_RESTART_TX	((ushort)0x0006)
> -#define CPM_CR_CLOSE_RX_BD	((ushort)0x0007)
> -#define CPM_CR_SET_GADDR	((ushort)0x0008)
> -#define CPM_CR_SET_TIMER	((ushort)0x0008)
> -#define CPM_CR_STOP_IDMA	((ushort)0x000b)
> -
> -/* Buffer descriptors used by many of the CPM protocols. */
> -typedef struct cpm_buf_desc {
> -	ushort	cbd_sc;		/* Status and Control */
> -	ushort	cbd_datlen;	/* Data length in buffer */
> -	uint	cbd_bufaddr;	/* Buffer address in host memory */
> -} cbd_t;
> -
> -/* Buffer descriptor control/status used by serial
> - */
> -
> -#define BD_SC_EMPTY	(0x8000)	/* Receive is empty */
> -#define BD_SC_READY	(0x8000)	/* Transmit is ready */
> -#define BD_SC_WRAP	(0x2000)	/* Last buffer descriptor */
> -#define BD_SC_INTRPT	(0x1000)	/* Interrupt on change */
> -#define BD_SC_LAST	(0x0800)	/* Last buffer in frame */
> -#define BD_SC_TC	(0x0400)	/* Transmit CRC */
> -#define BD_SC_CM	(0x0200)	/* Continuous mode */
> -#define BD_SC_ID	(0x0100)	/* Rec'd too many idles */
> -#define BD_SC_P		(0x0100)	/* xmt preamble */
> -#define BD_SC_BR	(0x0020)	/* Break received */
> -#define BD_SC_FR	(0x0010)	/* Framing error */
> -#define BD_SC_PR	(0x0008)	/* Parity error */
> -#define BD_SC_NAK	(0x0004)	/* NAK - did not respond */
> -#define BD_SC_OV	(0x0002)	/* Overrun */
> -#define BD_SC_UN	(0x0002)	/* Underrun */
> -#define BD_SC_CD	(0x0001)	/* */
> -#define BD_SC_CL	(0x0001)	/* Collision */
> -
> -/* Buffer descriptor control/status used by Ethernet receive.
> - * Common to SCC and FCC.
> - */
> -#define BD_ENET_RX_EMPTY	(0x8000)
> -#define BD_ENET_RX_WRAP		(0x2000)
> -#define BD_ENET_RX_INTR		(0x1000)
> -#define BD_ENET_RX_LAST		(0x0800)
> -#define BD_ENET_RX_FIRST	(0x0400)
> -#define BD_ENET_RX_MISS		(0x0100)
> -#define BD_ENET_RX_BC		(0x0080)	/* FCC Only */
> -#define BD_ENET_RX_MC		(0x0040)	/* FCC Only */
> -#define BD_ENET_RX_LG		(0x0020)
> -#define BD_ENET_RX_NO		(0x0010)
> -#define BD_ENET_RX_SH		(0x0008)
> -#define BD_ENET_RX_CR		(0x0004)
> -#define BD_ENET_RX_OV		(0x0002)
> -#define BD_ENET_RX_CL		(0x0001)
> -#define BD_ENET_RX_STATS	(0x01ff)	/* All status bits */
> -
> -/* Buffer descriptor control/status used by Ethernet transmit.
> - * Common to SCC and FCC.
> - */
> -#define BD_ENET_TX_READY	(0x8000)
> -#define BD_ENET_TX_PAD		(0x4000)
> -#define BD_ENET_TX_WRAP		(0x2000)
> -#define BD_ENET_TX_INTR		(0x1000)
> -#define BD_ENET_TX_LAST		(0x0800)
> -#define BD_ENET_TX_TC		(0x0400)
> -#define BD_ENET_TX_DEF		(0x0200)
> -#define BD_ENET_TX_HB		(0x0100)
> -#define BD_ENET_TX_LC		(0x0080)
> -#define BD_ENET_TX_RL		(0x0040)
> -#define BD_ENET_TX_RCMASK	(0x003c)
> -#define BD_ENET_TX_UN		(0x0002)
> -#define BD_ENET_TX_CSL		(0x0001)
> -#define BD_ENET_TX_STATS	(0x03ff)	/* All status bits */
> -
> -/* Buffer descriptor control/status used by Transparent mode SCC.
> - */
> -#define BD_SCC_TX_LAST		(0x0800)
> -
> -/* Buffer descriptor control/status used by I2C.
> - */
> -#define BD_I2C_START		(0x0400)
> -
> -#ifdef CONFIG_CPM
> -int cpm_command(u32 command, u8 opcode);
> -#else
> -static inline int cpm_command(u32 command, u8 opcode)
> -{
> -	return -ENOSYS;
> -}
> -#endif /* CONFIG_CPM */
> -
> -int cpm2_gpiochip_add32(struct device *dev);
> -
> -#endif
> +#include <soc/fsl/cpm.h>
> diff --git a/include/soc/fsl/cpm.h b/include/soc/fsl/cpm.h
> new file mode 100644
> index 000000000000..4c24ea8209bb
> --- /dev/null
> +++ b/include/soc/fsl/cpm.h
> @@ -0,0 +1,171 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __CPM_H
> +#define __CPM_H
> +
> +#include <linux/compiler.h>
> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <soc/fsl/qe/qe.h>
> +
> +/*
> + * SPI Parameter RAM common to QE and CPM.
> + */
> +struct spi_pram {
> +	__be16	rbase;	/* Rx Buffer descriptor base address */
> +	__be16	tbase;	/* Tx Buffer descriptor base address */
> +	u8	rfcr;	/* Rx function code */
> +	u8	tfcr;	/* Tx function code */
> +	__be16	mrblr;	/* Max receive buffer length */
> +	__be32	rstate;	/* Internal */
> +	__be32	rdp;	/* Internal */
> +	__be16	rbptr;	/* Internal */
> +	__be16	rbc;	/* Internal */
> +	__be32	rxtmp;	/* Internal */
> +	__be32	tstate;	/* Internal */
> +	__be32	tdp;	/* Internal */
> +	__be16	tbptr;	/* Internal */
> +	__be16	tbc;	/* Internal */
> +	__be32	txtmp;	/* Internal */
> +	__be32	res;	/* Tx temp. */
> +	__be16  rpbase;	/* Relocation pointer (CPM1 only) */
> +	__be16	res1;	/* Reserved */
> +};
> +
> +/*
> + * USB Controller pram common to QE and CPM.
> + */
> +struct usb_ctlr {
> +	u8	usb_usmod;
> +	u8	usb_usadr;
> +	u8	usb_uscom;
> +	u8	res1[1];
> +	__be16	usb_usep[4];
> +	u8	res2[4];
> +	__be16	usb_usber;
> +	u8	res3[2];
> +	__be16	usb_usbmr;
> +	u8	res4[1];
> +	u8	usb_usbs;
> +	/* Fields down below are QE-only */
> +	__be16	usb_ussft;
> +	u8	res5[2];
> +	__be16	usb_usfrn;
> +	u8	res6[0x22];
> +} __attribute__ ((packed));
> +
> +/*
> + * Function code bits, usually generic to devices.
> + */
> +#ifdef CONFIG_CPM1
> +#define CPMFCR_GBL	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> +#define CPMFCR_TC2	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> +#define CPMFCR_DTB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> +#define CPMFCR_BDB	((u_char)0x00)	/* Flag doesn't exist in CPM1 */
> +#else
> +#define CPMFCR_GBL	((u_char)0x20)	/* Set memory snooping */
> +#define CPMFCR_TC2	((u_char)0x04)	/* Transfer code 2 value */
> +#define CPMFCR_DTB	((u_char)0x02)	/* Use local bus for data when set */
> +#define CPMFCR_BDB	((u_char)0x01)	/* Use local bus for BD when set */
> +#endif
> +#define CPMFCR_EB	((u_char)0x10)	/* Set big endian byte order */
> +
> +/* Opcodes common to CPM1 and CPM2
> +*/
> +#define CPM_CR_INIT_TRX		((ushort)0x0000)
> +#define CPM_CR_INIT_RX		((ushort)0x0001)
> +#define CPM_CR_INIT_TX		((ushort)0x0002)
> +#define CPM_CR_HUNT_MODE	((ushort)0x0003)
> +#define CPM_CR_STOP_TX		((ushort)0x0004)
> +#define CPM_CR_GRA_STOP_TX	((ushort)0x0005)
> +#define CPM_CR_RESTART_TX	((ushort)0x0006)
> +#define CPM_CR_CLOSE_RX_BD	((ushort)0x0007)
> +#define CPM_CR_SET_GADDR	((ushort)0x0008)
> +#define CPM_CR_SET_TIMER	((ushort)0x0008)
> +#define CPM_CR_STOP_IDMA	((ushort)0x000b)
> +
> +/* Buffer descriptors used by many of the CPM protocols. */
> +typedef struct cpm_buf_desc {
> +	ushort	cbd_sc;		/* Status and Control */
> +	ushort	cbd_datlen;	/* Data length in buffer */
> +	uint	cbd_bufaddr;	/* Buffer address in host memory */
> +} cbd_t;
> +
> +/* Buffer descriptor control/status used by serial
> + */
> +
> +#define BD_SC_EMPTY	(0x8000)	/* Receive is empty */
> +#define BD_SC_READY	(0x8000)	/* Transmit is ready */
> +#define BD_SC_WRAP	(0x2000)	/* Last buffer descriptor */
> +#define BD_SC_INTRPT	(0x1000)	/* Interrupt on change */
> +#define BD_SC_LAST	(0x0800)	/* Last buffer in frame */
> +#define BD_SC_TC	(0x0400)	/* Transmit CRC */
> +#define BD_SC_CM	(0x0200)	/* Continuous mode */
> +#define BD_SC_ID	(0x0100)	/* Rec'd too many idles */
> +#define BD_SC_P		(0x0100)	/* xmt preamble */
> +#define BD_SC_BR	(0x0020)	/* Break received */
> +#define BD_SC_FR	(0x0010)	/* Framing error */
> +#define BD_SC_PR	(0x0008)	/* Parity error */
> +#define BD_SC_NAK	(0x0004)	/* NAK - did not respond */
> +#define BD_SC_OV	(0x0002)	/* Overrun */
> +#define BD_SC_UN	(0x0002)	/* Underrun */
> +#define BD_SC_CD	(0x0001)	/* */
> +#define BD_SC_CL	(0x0001)	/* Collision */
> +
> +/* Buffer descriptor control/status used by Ethernet receive.
> + * Common to SCC and FCC.
> + */
> +#define BD_ENET_RX_EMPTY	(0x8000)
> +#define BD_ENET_RX_WRAP		(0x2000)
> +#define BD_ENET_RX_INTR		(0x1000)
> +#define BD_ENET_RX_LAST		(0x0800)
> +#define BD_ENET_RX_FIRST	(0x0400)
> +#define BD_ENET_RX_MISS		(0x0100)
> +#define BD_ENET_RX_BC		(0x0080)	/* FCC Only */
> +#define BD_ENET_RX_MC		(0x0040)	/* FCC Only */
> +#define BD_ENET_RX_LG		(0x0020)
> +#define BD_ENET_RX_NO		(0x0010)
> +#define BD_ENET_RX_SH		(0x0008)
> +#define BD_ENET_RX_CR		(0x0004)
> +#define BD_ENET_RX_OV		(0x0002)
> +#define BD_ENET_RX_CL		(0x0001)
> +#define BD_ENET_RX_STATS	(0x01ff)	/* All status bits */
> +
> +/* Buffer descriptor control/status used by Ethernet transmit.
> + * Common to SCC and FCC.
> + */
> +#define BD_ENET_TX_READY	(0x8000)
> +#define BD_ENET_TX_PAD		(0x4000)
> +#define BD_ENET_TX_WRAP		(0x2000)
> +#define BD_ENET_TX_INTR		(0x1000)
> +#define BD_ENET_TX_LAST		(0x0800)
> +#define BD_ENET_TX_TC		(0x0400)
> +#define BD_ENET_TX_DEF		(0x0200)
> +#define BD_ENET_TX_HB		(0x0100)
> +#define BD_ENET_TX_LC		(0x0080)
> +#define BD_ENET_TX_RL		(0x0040)
> +#define BD_ENET_TX_RCMASK	(0x003c)
> +#define BD_ENET_TX_UN		(0x0002)
> +#define BD_ENET_TX_CSL		(0x0001)
> +#define BD_ENET_TX_STATS	(0x03ff)	/* All status bits */
> +
> +/* Buffer descriptor control/status used by Transparent mode SCC.
> + */
> +#define BD_SCC_TX_LAST		(0x0800)
> +
> +/* Buffer descriptor control/status used by I2C.
> + */
> +#define BD_I2C_START		(0x0400)
> +
> +#ifdef CONFIG_CPM
> +int cpm_command(u32 command, u8 opcode);
> +#else
> +static inline int cpm_command(u32 command, u8 opcode)
> +{
> +	return -ENOSYS;
> +}
> +#endif /* CONFIG_CPM */
> +
> +int cpm2_gpiochip_add32(struct device *dev);
> +
> +#endif
> 
