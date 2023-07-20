Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9975AC36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 12:41:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=FLH62Zzg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R68Pw3DWpz3c3t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 20:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=FLH62Zzg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=zhangyongle001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R67sj5CKBz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 20:17:28 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R67sW31WMzBRDrZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:17:19 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:subject:to:from:date:mime-version; s=dkim; t=1689848239; x=
	1692440240; bh=LxfpSJfL1V77NdEh9Dzlz3/ExUhcJbp14kqRmN4ha/0=; b=F
	LH62Zzg+TbiqpAVUsMbBmczTlQlOqjQdLQZ1Un++GYWC0RNcURKGfy3kU898lH7l
	J5rGK1XLE2UmY6PUGgtG5ty7LTMdy3QzLFo2LC7rVeViwVCknRuQv6dYuJK1PlDu
	NKkwAu3feWLUoQBYt0zOEHybQZktHtT0jJ7RsB+S2TsvHfZWMVrmsVPSW6U/VjD1
	MtWX9EzMsvEbPXOAvxrNBQKJhZjFNAT0vQGDSIfkP/kz9QHdmZCNCAXyzmWf5TNS
	qIkNbvHjn5a4NJAAo4qlapDhfe9RSol2pu0fBf7Y2uEL0OA3WGxVmQltkOSVzaQE
	hy1yGUBHZvBpj7Lg++izA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TZdAsfITOMxQ for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 20 Jul 2023 18:17:19 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R67sW0k0MzBJqBL;
	Thu, 20 Jul 2023 18:17:19 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 18:17:15 +0800
From: zhangyongle001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH] floppy: ERROR: that open brace { should be on the previous
 line
User-Agent: Roundcube Webmail
Message-ID: <058c3448e220ee16bcb5e588271b685c@208suo.com>
X-Sender: zhangyongle001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 20 Jul 2023 20:41:11 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix twoce occurrences of the checkpatch.pl error:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhangyongle <zhangyongle001@208suo.com>
---
  arch/powerpc/include/asm/floppy.h | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/floppy.h 
b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..1ae67d2629be 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -163,16 +163,14 @@ static int hard_dma_setup(char *addr, unsigned 
long size, int mode, int io)
  	return 0;
  }

-static struct fd_dma_ops real_dma_ops =
-{
+static struct fd_dma_ops real_dma_ops = {
  	._disable_dma = disable_dma,
  	._free_dma = free_dma,
  	._get_dma_residue = get_dma_residue,
  	._dma_setup = hard_dma_setup
  };

-static struct fd_dma_ops virt_dma_ops =
-{
+static struct fd_dma_ops virt_dma_ops = {
  	._disable_dma = vdma_disable_dma,
  	._free_dma = vdma_nop,
  	._get_dma_residue = vdma_get_dma_residue,
-- 
2.40.1

