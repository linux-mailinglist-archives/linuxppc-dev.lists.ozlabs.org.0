Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018E7509F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 15:49:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=sKw/kWY/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1JyM3RqGz3c4T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 23:49:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=sKw/kWY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=pangzizhen001@208suo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 419 seconds by postgrey-1.37 at boromir; Wed, 12 Jul 2023 18:31:30 AEST
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R19v65rw2z30M1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 18:31:30 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R19kl74bczB77YW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 16:24:15 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-type:message-id:user-agent:references:in-reply-to
	:subject:to:from:date:mime-version; s=dkim; t=1689150255; x=
	1691742256; bh=B6fIx7ZYVVTgOrUfEyXLpwUKuYl1BQlMPn66PZlfVFc=; b=s
	Kw/kWY/Wu6q9Izk03hP2xwxxEW82prr5V0V0eioeFUH/c15UCXjrN9UKJWlxMaow
	40UMc6cwQPxc2R1/tbKhqmmSPcet+Eno2wCgme7m8Qc+ctBa3SnsNCCEDmJSyyTt
	9CQrBse302n3HHcUovYJxq59gFkIFwYh3KK7/IB9z9szu85Rs71akBQp5wk3z1l3
	3lZD26hkRCjhaAvH749N8x3DTYuDl6FMqAiHoUp0ff7vH0l410qx/RkpdaZwBB1Y
	3XZ+H14lDNPyp9immOaTmGbKKDQloPKQ/S6NaE9o5Oi7OQ8/siLDuHVssz1HLWKf
	AcZkBD1CSe/YcFbEaD2yg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sK6TIaM3LGVo for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 12 Jul 2023 16:24:15 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R19kl5DYWzBR5lP;
	Wed, 12 Jul 2023 16:24:15 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 12 Jul 2023 16:24:15 +0800
From: pangzizhen001@208suo.com
To: mpe@ellerman.id.au, Jason@zx2c4.com
Subject: Fwd: [PATCH] powerpc/kernel: Fix comment typo
In-Reply-To: <20230712081541.29077-1-wangjianli@cdjrlc.com>
References: <20230712081541.29077-1-wangjianli@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <070e7321ca11e0cd57e46fe240812c0e@208suo.com>
X-Sender: pangzizhen001@208suo.com
Content-Type: multipart/alternative;
 boundary="=_46ddd140eb1fbacb5104806f35683fed"
X-Mailman-Approved-At: Wed, 12 Jul 2023 23:49:03 +1000
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

--=_46ddd140eb1fbacb5104806f35683fed
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed



Delete duplicate word "the"

Signed-off-by: Zizhen Pang <pangzizhen001@208suo.com>
---
  arch/powerpc/kernel/process.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c 
b/arch/powerpc/kernel/process.c
index b68898ac07e1..6e35037282b6 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -173,7 +173,7 @@ void giveup_fpu(struct task_struct *tsk)
  EXPORT_SYMBOL(giveup_fpu);

  /*
- * Make sure the floating-point register state in the
+ * Make sure the floating-point register state in
   * the thread_struct is up to date for task tsk.
   */
  void flush_fp_to_thread(struct task_struct *tsk)
--=_46ddd140eb1fbacb5104806f35683fed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 12pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p><span style=3D"font-family: monospace; font-size: 12pt;">Delete duplicat=
e word "the"</span></p>
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<br />Signed-off-by: Zizhen Pang &lt;pangzizhen001@208suo.com&gt;<br />---<=
br />&nbsp;arch/powerpc/kernel/process.c | 2 +-<br />&nbsp;1 file changed, =
1 insertion(+), 1 deletion(-)<br /><br />diff --git a/arch/powerpc/kernel/p=
rocess.c b/arch/powerpc/kernel/process.c<br />index b68898ac07e1..6e3503728=
2b6 100644<br />--- a/arch/powerpc/kernel/process.c<br />+++ b/arch/powerpc=
/kernel/process.c<br />@@ -173,7 +173,7 @@ void giveup_fpu(struct task_stru=
ct *tsk)<br />&nbsp;EXPORT_SYMBOL(giveup_fpu);<br />&nbsp;<br />&nbsp;/*<br=
 />- * Make sure the floating-point register state in the<br />+ * Make sur=
e the floating-point register state in<br />&nbsp;&nbsp;* the thread_struct=
 is up to date for task tsk.<br />&nbsp;&nbsp;*/<br />&nbsp;void flush_fp_t=
o_thread(struct task_struct *tsk)</div>

</body></html>

--=_46ddd140eb1fbacb5104806f35683fed--
