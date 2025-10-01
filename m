Return-Path: <linuxppc-dev+bounces-12932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66504BE0858
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 21:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cn1ps5Q8Rz2xdg;
	Thu, 16 Oct 2025 06:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.205.221.239
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760539218;
	cv=none; b=naUleIg7CFhHKelM5savwo5ES82oLXHj8R4nCe3Xt1fVZdYL53cW6yyDjb7mLXo7XHS3VuV+/kkh4ufTpu+xUfcLT/a4sXZEa1wkjSQmdm4cGTFKwwemdIzN1JSdlxMl1amyekW1rlLbESmIJ27adH/IQpsFbUAJbuUNJEf6eNoVtki2XcPGyu4lZv/P0R9B67aflyUP842yljAmt1rJ5RxWpjOQYUmEOCeiw04+E53wdYfiBQv1o6OwfCSAyxXrm5mus8rv5Tt3G/s9nUVm38MLp4m2qcBL3YVlwhxWa9H2qJd6tL8RzLThEU4/qvtIYb8I+62iajiG4kICOwJ9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760539218; c=relaxed/relaxed;
	bh=ezgtSDOXHivCFuC5AUAl3AvdnYQYhmw66BozkVx5J4s=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=HNEMZbkd4ry9IJiRbA1hjMW92EjxtNZqYvJqktfokoJHpQWwkSmwcgsNiai+i3G8c6zVg43ZqZz19FUKzEwE8cf2VUGDsta5SbxIuUOBYx51yS2lqGbMxmiAPSw+J/gFsQg4UJIxSOoNCHzjyVir+i1i1eRQwTJlX75qCc/WjBnZ13KvZtrniIEQ6CcRp/fLeREFnHOdEcOC9TOg0w4Vk5lX5nRVnTkNc7Crbe4Hyzst94oO+XWKjOqggw7TTdB5jFnWp4UCUeWHp9JA0oxBgHNLT6fwC2+rdAbUF9oTHeANGxZJq35qaKVzXJhEdlM1sg9gsEEKC2z4zbDpIdxexA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PnRGeToP; dkim-atps=neutral; spf=pass (client-ip=203.205.221.239; helo=out203-205-221-239.mail.qq.com; envelope-from=470658536@qq.com; receiver=lists.ozlabs.org) smtp.mailfrom=qq.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PnRGeToP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qq.com (client-ip=203.205.221.239; helo=out203-205-221-239.mail.qq.com; envelope-from=470658536@qq.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 10821 seconds by postgrey-1.37 at boromir; Thu, 16 Oct 2025 01:40:14 AEDT
Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cmtzL75c6z3dHf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 01:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1760539206; bh=ezgtSDOXHivCFuC5AUAl3AvdnYQYhmw66BozkVx5J4s=;
	h=Date:From:To:Subject;
	b=PnRGeToPoY86AamWuNqGoc0nayufSeZzzKsR+SpLR74rXh1eVSImJpJmkOYTzsgxm
	 ma2vJFA487CCvAPo7IyUb0+eo5T/ISV5grQwAWE7zsjaMpB/Y7h+zMDns+2Cqz2YF5
	 j0m9IaVKnYBN0Il4tDpG4pIET3qyr15ecKLsD1UA=
Received: from localhost.localdomain ([120.197.14.100])
	by newxmesmtplogicsvrszb20-1.qq.com (NewEsmtp) with SMTP
	id 688B002E; Wed, 15 Oct 2025 18:26:08 +0800
X-QQ-mid: xmsmtpt1760523968t2v5hdscj
Message-ID: <tencent_F844A82DB85660D110008F34E54330312A08@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznAY66XNxY4lbviBs5aYbr52JEvjx3ndSIRX9HtLdU4CXGgX3AkN
	 OGnH/ROHiy1IyslmPmeYWZhncWgRsX3vcOlq2shw0SUVaxUK0aKinR5EhooDzwHOMR86x2tIaRRY
	 a5Ogi9lVC97/sX6GWWLvppJnRkij1rYz8JGjluGfOIuKU23UnTGan0q8OMGAasglQ8Zb7p5SXBFO
	 jDlxROKmkmAPPNrbzoiY292lHv5hbPrdoYGubv7zHFIoJJkdcgRFcqXEcsXO0Lh0CMvhVRf+D/R0
	 S+9egDapl0V4gSaO1svSJCuJevk/HUY9jos3/SJFdxGpGLnevSrG4Z2VHyeo+lBET+sTxAZOn1z1
	 GBjdt7kzEW0H2d2KbVK3vvpu5c0c6Dhb06exTvcuneZ+lKf3wtZIPp9FMerWbxV/IZy0Q4yaEqcu
	 MZmtmtAs6qJdX+WmF4YMjWYmm+0d38DbrfWPut9r5lq9i9D1ROMTFPG0gJUeMn41VDZypcrLbhZO
	 Kcl7J+OusBrv5C5n7FFjrhnipbrTWzNYCR+W0GZlyxt4qiMB1iIrdQW6LrchePtWyf0sipYdAtEg
	 te/YnNxKlHZOt1+FLWhFO71vPS7RfyuR1vj6KK3AQHE+CQ22iOQ5xggm6gmRAo8+nNQqqGBWrv2d
	 KPW9H78pEyDHqNhAYndfUBs0vGW7OjDQoHzUtilYJezUSZl4z06Rgj63jsO51fCgLxlQBFh3q3Ny
	 DBoOeRIdY4P0ZEgI4AOnu3ymIouASIIoYi/zuENs/9nbaSh4FvtH2Wmz+UDfCes3m9rnlKjBiWrb
	 56QlMpZq24qVY9GLkz3r9j/9yAlyODlDI0TikX+7+ajDG4sCeDmcs+QUmRZS/kDeM1aEoYurhMzu
	 QkK8NSUpQm5iqIZJmXIrs6zJ/2gUpIZGfDv/aN82PWzPR3H2tbNqduu6odehvJFyip8hJYtyRo6J
	 cHuQgGb1NuQP0h6msNvGBVlZ63lSSidrxHANjWJU5LmP0PMbg5+B3MEoVFokH5fONuMS8ZbDk=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Date: Wed, 1 Oct 2025 22:42:39 +0800
From: Haoran lee <470658536@qq.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: PATCH: Fix typo recommand in comment
X-OQ-MSGID: <aN0938CSHL6NoJa_@localhost.localdomain>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Flag: YES
X-Spam-Status: Yes, score=5.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HELO_DYNAMIC_IPADDR,
	RCVD_IN_DNSWL_NONE,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [203.205.221.239 listed in list.dnswl.org]
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	*  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
	*      digit
	*      [470658536(at)qq.com]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [470658536(at)qq.com]
	*  2.1 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received: date
	*  0.4 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  3.2 HELO_DYNAMIC_IPADDR Relay HELO'd using suspicious hostname (IP addr
	*      1)
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From e949fa326c98953fda200fe92c108fa71e334715 Mon Sep 17 00:00:00 2001
From: Haoran Lee <470658536@qq.com>
Date: Wed, 15 Oct 2025 10:18:52 +0000
Subject: [PATCH] powerpc/smu: Fix typo "recommand" in comment

The word "recommand" is incorrect. The correct spelling is "recommend".

Fix the typo in the comment in arch/powerpc/include/asm/smu.h.

Signed-off-by: Haoran Lee <470658536@qq.com>
---
 arch/powerpc/include/asm/smu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/smu.h b/arch/powerpc/include/asm/smu.h
index 2ac6ab903023..23b4ed8b4399 100644
--- a/arch/powerpc/include/asm/smu.h
+++ b/arch/powerpc/include/asm/smu.h
@@ -667,7 +667,7 @@ extern struct smu_sdbp_header *smu_sat_get_sdb_partition(unsigned int sat_id,
  * file is opened. poll() isn't implemented yet. The reply will consist
  * of a header as well, followed by the reply data if any. You should
  * always provide a buffer large enough for the maximum reply data, I
- * recommand one page.
+ * recommend one page.
  *
  * It is illegal to send SMU commands through a file descriptor configured
  * for events reception
-- 
2.48.1


