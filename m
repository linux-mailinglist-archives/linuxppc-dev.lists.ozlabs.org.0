Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CB752DE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 01:21:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=Jx2XpLN+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R29Zz2p1lz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 09:20:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=Jx2XpLN+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hexingwei001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1tRL4snWz3bYt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 21:58:17 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R1tQz0sx7zBRSV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 19:58:03 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689249483; x=1691841484; bh=BIsYHfdCMZPZNbfMC1iMXVuZv2Y
	KkrROMhSFrUl8kDw=; b=Jx2XpLN+5BJz+2+EddLVrTs1Y12C5CjS9GjkZDA6lMJ
	4M6ZJpzW66CRrDQXJU1OZzJEow+Gtz+BaTOgM2SnwWcXElfouHwrb7KXHSqYzXsR
	4wfa/Mk4Npirxeo7fZW0JTGbDLECJO7yH48XDgaGpGsYjnARVVYs7PEP4DD5SWcb
	b7C281P8mQgI3bMma6+JwLzGeawOdLWZYd/0Vr86EjPwXwYo0hT8e8GOo8Vx06vR
	DQTzv3eLADROfL/fgaP6F3mb1T0ZFC355rkBFa6FCjXInu7zDd+6wzuAU/yLIUtf
	60lTmb3lEQw4FSa3OrQEBWJmHpbpUsmTh0PXJPY+H4A==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Tv_kcWsMdbj1 for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 13 Jul 2023 19:58:03 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R1tQy50xQzBRRLy;
	Thu, 13 Jul 2023 19:58:02 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 13 Jul 2023 19:58:02 +0800
From: hexingwei001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 maddy@linux.vnet.ibm.com, rashmica.g@gmail.com
Subject: [PATCH] media: atomisp: void function return statements are not
 generally useful
In-Reply-To: <20230707142206.52811-1-panzhiai@cdjrlc.com>
References: <20230707142206.52811-1-panzhiai@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <359683bc83ac7a0090089ef3837969d0@208suo.com>
X-Sender: hexingwei001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 14 Jul 2023 09:17:19 +1000
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

void function return statements are not generally useful,
so deleted the return in function ia_css_get_crop_offsets().

Signed-off-by: Xingwei He <hexingwei001@208suo.com>
---
  drivers/staging/media/atomisp/pci/sh_css.c | 1 -
  1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c 
b/drivers/staging/media/atomisp/pci/sh_css.c
index 93789500416f..bd0e2451cd08 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -3107,7 +3107,6 @@ ia_css_get_crop_offsets(

      IA_CSS_LEAVE_PRIVATE("void start_col: %u start_row: %u", column, 
row);

-    return;
  }
  #endif
