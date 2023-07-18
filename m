Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970677575D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 09:56:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=IHtLeQZU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rrS3X01z30PL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 17:56:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=IHtLeQZU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rqY6pcdz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:56:09 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4rqG2gghzBQskv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 15:55:54 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689666954; x=1692258955; bh=zWNni/qECU+wKhB4Mx0VGVeY3nW
	IHBQLKgy0+7TuklE=; b=IHtLeQZUhGryuLc1l44IuMr+WR86/I9bbmn8+dq9rzj
	uzRAvy1lXohHrI74wvKZIZw1ZyPPgHWaykBx2bN0ECWub3H3zlmdWzqFPGCbHiBc
	eKErWeIEccWeCVXyVNMVl/hmnO0X+Q3+dPljWpyq+6ct+NesntN5HnCZACi/CIce
	icDbEQMGkUQG61PlUbN4yjDZB+IL5xPCqqL6TumNlobHokk5Fl05qqqBZAYhwujQ
	cSJwEMHAyw8BsDTpajghGon9Ycr0O7OaWPKkSHl2jtV8DL83WbD2j67Rh4ShMj0L
	Bxn+ypOcTN9eF5GLOE7ZnS5TEI3dXfiL3IjL3tNa16w==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id t0_qSPkSQ9WH for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 15:55:54 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4rqG0jShzBHXh4;
	Tue, 18 Jul 2023 15:55:54 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 15:55:54 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: =?UTF-8?Q?=5BPATCH=5D_powerpc=3A_boot=3A=C2=A0insert_space_befor?=
 =?UTF-8?Q?e_the_open_parenthesis_=27=28=27?=
In-Reply-To: <tencent_66874A8B7152A23DDA815AEB731181CFEA07@qq.com>
References: <tencent_66874A8B7152A23DDA815AEB731181CFEA07@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <b1818ba6b3b305311f992885748494c9@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes checkpatch error:

./arch/powerpc/boot/main.c:273: ERROR: space required before the open 
parenthesis '('

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/boot/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index 64a3d6586321..c8ebd552d1e8 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -270,7 +270,7 @@ void start(void)

      kentry = (kernel_entry_t) vmlinux.addr;
      if (ft_addr) {
-        if(platform_ops.kentry)
+        if (platform_ops.kentry)
              platform_ops.kentry(ft_addr, vmlinux.addr);
          else
              kentry(ft_addr, 0, NULL);
