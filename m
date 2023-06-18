Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25674734969
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 02:05:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=KR1y3uP6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qkqm34swtz30PH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 10:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=KR1y3uP6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=zhumao001@208suo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 544 seconds by postgrey-1.37 at boromir; Mon, 19 Jun 2023 01:17:44 AEST
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qkc2w3dwDz308s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 01:17:44 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4Qkbr41P7hzBJTD7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 23:08:20 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-type:message-id:user-agent:references:in-reply-to
	:subject:to:from:date:mime-version; s=dkim; t=1687100900; x=
	1689692901; bh=QIcZOBynhyZVuqtTppi/QgtH5uEk2xGMmNooc0JUOeE=; b=K
	R1y3uP6kDpW/i15XylaxtJEottmFDxUXuspBc6AYh1Cjdic0gwWUYoUvZtnVh5db
	Hk1UGCGNNdwtPX+NQir+oWLJmMulRL1qSeD/N8Gr3WhMIeluT/Wo0fIFLHAYEhB0
	8bdd5zaCWAGRshZawJqiZ3waOXvGPytKgRAhSJILZZDJhs3lBMItDa7tOcSovtWh
	YzRUm/9a/NRBa9gh4lKacPd0LQtTMCwCRpePyzrNGQo+A5oopvVwlouXK5VyUCz2
	Ls5qsmeELIu7Rf55EEjiubTuWTtkV4wx99TqqsvrKpUhsv+RZXtbw2M40iZmU7GJ
	Wx1o0a/3W7RhpzCTU+dTg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NO1IlWJUB7si for <linuxppc-dev@lists.ozlabs.org>;
	Sun, 18 Jun 2023 23:08:20 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4Qkbr35sMRzBJJDJ;
	Sun, 18 Jun 2023 23:08:19 +0800 (CST)
MIME-Version: 1.0
Date: Sun, 18 Jun 2023 23:08:19 +0800
From: zhumao001@208suo.com
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Subject: [PATCH] cxl/ocxl: Possible repeated word
In-Reply-To: <20230618150648.1123-1-dengshaomin@cdjrlc.com>
References: <20230618150648.1123-1-dengshaomin@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <787f5a712a0459bc21d83bb388770b58@208suo.com>
X-Sender: zhumao001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_b268a70895ade5c999a5d7f3bb310296"
X-Mailman-Approved-At: Mon, 19 Jun 2023 10:04:52 +1000
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

--=_b268a70895ade5c999a5d7f3bb310296
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed


Delete repeated word in comment.

Signed-off-by: Zhu Mao <zhumao001@208suo.com>
---
  drivers/misc/cxl/native.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
index 50b0c44bb8d7..6957946a6463 100644
--- a/drivers/misc/cxl/native.c
+++ b/drivers/misc/cxl/native.c
@@ -920,7 +920,7 @@ int cxl_attach_dedicated_process_psl9(struct 
cxl_context *ctx, u64 wed, u64 amr)
       * Ideally we should do a wmb() here to make sure the changes to 
the
       * PE are visible to the card before we call afu_enable.
       * On ppc64 though all mmios are preceded by a 'sync' instruction 
hence
-     * we dont dont need one here.
+     * we dont need one here.
       */

      result = cxl_ops->afu_reset(afu);
--=_b268a70895ade5c999a5d7f3bb310296
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Delete repeated word in comment.<br /><br />Signed-off-by: Zhu Mao &lt;zhum=
ao001@208suo.com&gt;<br />---<br />&nbsp;drivers/misc/cxl/native.c | 2 +-<b=
r />&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br /><br />diff --g=
it a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c<br />index 50b0c=
44bb8d7..6957946a6463 100644<br />--- a/drivers/misc/cxl/native.c<br />+++ =
b/drivers/misc/cxl/native.c<br />@@ -920,7 +920,7 @@ int cxl_attach_dedicat=
ed_process_psl9(struct cxl_context *ctx, u64 wed, u64 amr)<br />&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;* Ideally we should do a wmb() here to make sure t=
he changes to the<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* PE are visible=
 to the card before we call afu_enable.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;* On ppc64 though all mmios are preceded by a 'sync' instruction henc=
e<br />- &nbsp;&nbsp;&nbsp;&nbsp;* we dont dont need one here.<br />+ &nbsp=
;&nbsp;&nbsp;&nbsp;* we dont need one here.<br />&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;*/<br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;result =3D cxl_=
ops-&gt;afu_reset(afu);</div>

</body></html>

--=_b268a70895ade5c999a5d7f3bb310296--
