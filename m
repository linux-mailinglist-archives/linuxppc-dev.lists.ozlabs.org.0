Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65990C572
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3MH25y1bz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 19:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=jinglin.wen@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3MGf3knqz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 19:42:02 +1000 (AEST)
X-QQ-mid: bizesmtp78t1718703621t9im95qb
X-QQ-Originating-IP: j0bcr4tl1DrbKiAFzsSZfOa5k3gTatx80tph8xjFz5E=
Received: from HX01040082.powercore.com.cn ( [14.19.141.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Jun 2024 17:40:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16779118222086163285
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: segher@kernel.crashing.org
Subject: Re: [PATCH] powerpc: Fixed duplicate copying in the early boot.
Date: Tue, 18 Jun 2024 17:40:11 +0800
Message-Id: <20240618094011.19247-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617161336.GM19790@gate.crashing.org>
References: <20240617161336.GM19790@gate.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher Boessenkool,=0D
=0D
Segher Boessenkool <segher@kernel.crashing.org> writes:=0D
> Hi!=0D
> =0D
> On Mon, Jun 17, 2024 at 10:35:09AM +0800, Jinglin Wen wrote:=0D
> > +	cmplwi	cr0,r4,0	/* runtime base addr is zero */=0D
> =0D
> Just write=0D
>    cmpwi r4,0=0D
> =0D
> cr0 is the default, also implicit in many other instructions, please=0D
> don't clutter the source code.  All the extra stuff makes you miss the=0D
> things that do matter!=0D
> =0D
> The "l" is unnecessary, you only care about equality here after all.=0D
> =0D
> Should it not be cmpdi here, though?=0D
> =0D
> =0D
> Segher=0D
=0D
Thank you very much for your suggestion. I will use cmpd directly from now =
on. =0D
The specific code is as follows:=0D
=0D
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S=
=0D
index 4690c219bfa4..751181dfb897 100644=0D
--- a/arch/powerpc/kernel/head_64.S=0D
+++ b/arch/powerpc/kernel/head_64.S=0D
@@ -647,8 +647,9 @@ __after_prom_start:=0D
  * Note: This process overwrites the OF exception vectors.=0D
  */=0D
        LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)=0D
-       mr.     r4,r26                  /* In some cases the loader may  */=
=0D
-       beq     9f                      /* have already put us at zero */=0D
+       mr      r4,r26                  /* Load the virtual source address =
into r4 */=0D
+       cmpd    r3,r4           /* Check if source =3D=3D dest */=0D
+       beq     9f                      /* If so skip the copy  */=0D
        li      r6,0x100                /* Start offset, the first 0x100 */=
=0D
                                        /* bytes were copied earlier.    */=
 =0D
=0D
Thanks,=0D
=0D
Jinglin Wen=0D
