Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C731C3C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 09:23:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4538LK5XMzzDqLH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 17:23:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="prVvBfyG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="c8g+mmmo"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4538Jr4ZhszDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 17:22:19 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D1F7E24811;
 Tue, 14 May 2019 03:22:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 14 May 2019 03:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 C2tqMHY/rN4zDLt1czzdTIeaoMoR2rT5PtdfzubldGA=; b=prVvBfyGcd5GXDJH
 ST1vEc/pMaLvGr96oUKgZ56ZkCVXBgfoLRa36Rf4B1xId/AkqbA8RhbsFQYGDHek
 PdQ9FPqSDzXSHBXQd9nfOdwTKJjWjxFCSPDdB6NQ7q+/89qXvqCAnl4UxytdHpEl
 jDyVjxZoJMqdHPfamQdTOKQfgfjGGQO/NgTudorghDbvnEDExlBfwZVbWONR189y
 ApvNvCyuA1jD62RKq53oEpiERUgABjueiFCAA7rla8WK0dUHulHA8IhWzPQy6ta2
 SS69AlAgSyobrt8sOFu1u4kqErPD6flankVuqUJ56xVjX06FRyEA9p3XzWO3l2Qq
 +qekiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C2tqMHY/rN4zDLt1czzdTIeaoMoR2rT5Ptdfzubld
 GA=; b=c8g+mmmoEBY7vdyPGYc7BWxZ/OtFk/ncH6Zqp/KAWXcqKZ4JI/9ZSwgnJ
 hxbu2W1vluJYp4FAKNzKdd32t4p54NtPxepWzpvenpS1lg45GTj0Hbo6QqW0iJQS
 bsAagSKsyMNE5Ft4b1QaPZR3AdB2PgVDL326PrUY9LVMK864j6TN2Ai7EW5oHwMt
 jxctPd8p23FdTGYdkin4PMj1M2Qb43W42McSDPFbh9YhMv3A3XNuRiaJfPWPeZsO
 Lmr5B5MaAtt3Zh0CXez7ACOHHcuKmopWrZigUi6Jt2FWPcdDfm/17/Dt7Vl+4IqF
 OTYKPg3iKJEb0rSLfORXIJeeCiBeA==
X-ME-Sender: <xms:qGzaXIXhYYgBSPpSYNwWBL5BC4-3A-H2zzeNzpHAqLPDry3ZeISO2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleehgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvddtmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppeduvddv
 rdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
 hsshgvlhhlrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qGzaXCd7snQuwkyLGhvDTl1bHf64owzwusmyKTBm_NfSlSL_b29Q_w>
 <xmx:qGzaXHKdL9-XjJP634PiBdZgX0nxs15blnLh3GybSZFxKfmQcOZLXQ>
 <xmx:qGzaXEMSWin6s-HFtLkoZjpQpVMvZn7kNAggOZi6MSVF3tsaYJELlg>
 <xmx:qGzaXNAw6qogSt0EpxlHH-SJWOPrZ9gEzmnLQG0MVxX41wlQGZ6bag>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id D51C680060;
 Tue, 14 May 2019 03:22:14 -0400 (EDT)
Message-ID: <5f31b4964d64aea3fc31165b9cbd0b9d16fd2aa0.camel@russell.cc>
Subject: Re: [v2 2/2] [PowerPC] Allow use of SIMD in interrupts from kernel
 code
From: Russell Currey <ruscur@russell.cc>
To: Shawn Landden <shawn@git.icu>
Date: Tue, 14 May 2019 17:22:12 +1000
In-Reply-To: <20190514022308.32363-2-shawn@git.icu>
References: <20190513005104.20140-1-shawn@git.icu>
 <20190514022308.32363-1-shawn@git.icu>
 <20190514022308.32363-2-shawn@git.icu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-05-13 at 23:23 -0300, Shawn Landden wrote:
> This second patch is separate because it could be wrong,
> like I am not sure about how kernel thread migration works,
> and it is even allowing simd in preemptible kernel code.
> 
> Signed-off-by: Shawn Landden <shawn@git.icu>
> ---

Hi Shawn,

This patch doesn't build on 64-bit embedded (ppc64e_defconfig):

arch/powerpc/kernel/process.c:194:13: error: 'interrupted_kernel_fpu_idle' defined but not used [-Werror=unused-function]
 static bool interrupted_kernel_fpu_idle(void)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

and otherwise adds two sparse warnings:

+arch/powerpc/kernel/process.c:356:13: warning: function 'disable_kernel_altivec' with external linkage has definition
+arch/powerpc/kernel/process.c:416:6: warning: symbol 'may_use_simd' was not declared. Should it be static?

There's also some style issues (spaces instead of tabs).

Reported by snowpatch (see https://patchwork.ozlabs.org/patch/1099181/)

- Russell

