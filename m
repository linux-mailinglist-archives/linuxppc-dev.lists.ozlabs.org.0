Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E31D8E28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 05:21:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R1Py3PtczDqq3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 13:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R1NC3jgnzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 13:20:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=m4WfQPBN; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 49R1NB5ZNZz9sTT;
 Tue, 19 May 2020 13:20:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1589858410;
 bh=3qHsOTSG7TkxlDU5tHr3S2esCt8I+uWhI8TSuSsGQm8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=m4WfQPBNvXg2ARkSFCXNqDD9Gcj4aGHKev2WxcBhlYso0T8scDdxr75IB9eRdM6X5
 qV/g/kle8YQszZq5dqmxem/vnms925gyy+vxU9/nyAOZRwfLmiIsvFPi0QXJi32rKn
 rsEHjCN9BybLGWrZFyUSPxSTlaxXvhPVRecYHAVAhKVriiFDDeka7Noq/eatrRl+bx
 w6sk92OOR2XMXVVoCl8zAmf43oAbh5InyuDKCNFJMSyLP6ZZOY94BtSyl7AbhtECiR
 VQWVxQvJPDWFN9CV/IJoSJtO+QxwqruzKu1jrGZn+R8ke6Qzw+xPHkb7GzulXPO57G
 J8NvCZTDg/Y3g==
Received: by neuling.org (Postfix, from userid 1000)
 id 8B31D2C04C2; Tue, 19 May 2020 13:20:10 +1000 (AEST)
Message-ID: <725901ebb965bf65f861369c8cea17af9d3d47c6.camel@neuling.org>
Subject: Re: [PATCH v2 1/7] powerpc: Add new HWCAP bits
From: Michael Neuling <mikey@neuling.org>
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 19 May 2020 13:20:10 +1000
In-Reply-To: <20200519003157.31946-2-alistair@popple.id.au>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-2-alistair@popple.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
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
Cc: npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-05-19 at 10:31 +1000, Alistair Popple wrote:
> POWER10 introduces two new architectural features - ISAv3.1 and matrix
> multiply accumulate (MMA) instructions. Userspace detects the presence
> of these features via two HWCAP bits introduced in this patch. These
> bits have been agreed to by the compiler and binutils team.
>=20
> Signed-off-by: Alistair Popple <alistair@popple.id.au>

I've test booted this series + powerpc/next (30df74d67d) on top of powervm =
and
OPAL on a P10 simulator.

In both cases, it enables MMA and prefix instructions and advertises them v=
ia
HWCAP2 MMA + ISA 3.1. Hence:

Tested-by: Michael Neuling <mikey@neuling.org>

> ---
>  arch/powerpc/include/uapi/asm/cputable.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/include/uapi/asm/cputable.h
> b/arch/powerpc/include/uapi/asm/cputable.h
> index 540592034740..2692a56bf20b 100644
> --- a/arch/powerpc/include/uapi/asm/cputable.h
> +++ b/arch/powerpc/include/uapi/asm/cputable.h
> @@ -50,6 +50,8 @@
>  #define PPC_FEATURE2_DARN		0x00200000 /* darn random number insn */
>  #define PPC_FEATURE2_SCV		0x00100000 /* scv syscall */
>  #define PPC_FEATURE2_HTM_NO_SUSPEND	0x00080000 /* TM w/out suspended sta=
te
> */
> +#define PPC_FEATURE2_ARCH_3_1		0x00040000 /* ISA 3.1 */
> +#define PPC_FEATURE2_MMA		0x00020000 /* Matrix Multiply Accumulate
> */
> =20
>  /*
>   * IMPORTANT!

