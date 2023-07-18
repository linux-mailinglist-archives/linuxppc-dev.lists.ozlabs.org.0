Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3E75777B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 11:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=xEo+BHBv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4tWn33k1z30YL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 19:12:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=xEo+BHBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4tVx2f3jz30Dm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 19:11:53 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4tVs2VDCzBR0gv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:11:49 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689671509; x=1692263510; bh=KucHDh6DWgAfyXp3Nu1+swDR6DT
	wgz80t/2PvvAIrgs=; b=xEo+BHBvDOf2ZOq3+I35APvibMBO0308GAxxNtIFZF7
	x3tbsuHTwh83ppRo7b5fSAVuib4HxXjOSphJnC2l96qcQ60S3HZJSHE/dWtFSg9g
	IDevvlo1IUkUYDvTESfc89ZwtEZ0nDWZukHjYJ5QNlsxpgRfOJ4//YPYRGF8d5r5
	hsAJUEIiZYkK1vUsoFbn8ce1Tz/HQzI0whP04PKtYwl+t0tRs2T5qdjaSWbVNtCv
	OKWRz3/r6s8C0i5E16LU8G+TpnDEr1Nq43mNTdFrgrbTbxAbWPk3gcADOOel0sC3
	xK2psjqaqMlx429Tc9WJpsQ9+/Wq7/G2zX2PoQ4EqPQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NpGawob7z6Hw for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 17:11:49 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4tVr6hvbzBJBfd;
	Tue, 18 Jul 2023 17:11:48 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 17:11:48 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 nathanl@linux.ibm.com
Subject: [PATCH] platforms: chrp: Add require space after that ','
In-Reply-To: <tencent_DC5A89DAEE730A81E76A904AA67119225807@qq.com>
References: <tencent_DC5A89DAEE730A81E76A904AA67119225807@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <482baf0b2b66efeb3605d44823b37fde@208suo.com>
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

Fixes checkpatch errors:

./arch/powerpc/platforms/chrp/setup.c:91: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/setup.c:91: ERROR: space required after 
that ',' (ctx:VxV)

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/chrp/setup.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/chrp/setup.c 
b/arch/powerpc/platforms/chrp/setup.c
index 36ee3a5056a1..f8f06413bf23 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -88,7 +88,7 @@ static const char *gg2_cachemodes[4] = {

  static const char *chrp_names[] = {
      "Unknown",
-    "","","",
+    "", "", "",
      "Motorola",
      "IBM or Longtrail",
      "Genesi Pegasos",
