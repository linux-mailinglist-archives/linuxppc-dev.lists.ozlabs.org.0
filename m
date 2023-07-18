Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B665757804
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 11:29:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=FfPFpEqK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4ttz6ZHfz3btp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 19:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=FfPFpEqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4tt75C2rz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 19:28:30 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4tsz4lHxzBR1PC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:28:23 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689672503; x=1692264504; bh=hAS+grwZbIyw2t0g0PBTUpkLyXc
	bK0qGakiu0DaoB3c=; b=FfPFpEqKrEKyiCQ9RAqBWlLjwXKzjMx7fzDngsHIZ+F
	XRSjxeqcXxcSOk5rteA4BIQrD5zgFn4DMV1G/1tqOKnJ58eFuVucXOhuy2sKIT2p
	Pv5tjf9WAzr+YZQF3bzRPVHc1QHUszlNayE2rBo3y8kmzW5TiyP+SUIExbvhVCWl
	PYmHF+67YktZWq0u1UY5aky71qgwLfsoHMDEStBZZCfhbKb2oDCgHvNUWIu8FVAu
	xRKwy2n549DbElboGJJO9yu+qMvCov36YCe22ErfHAm2PbM/5HVcojDwECCc3NRC
	h3Nm/jNnGRZnXE0q9goSnaTLEIQmyNCYmFZvvy40wuA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YO-bTexOdzEm for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 17:28:23 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4tsz21h1zBJBfd;
	Tue, 18 Jul 2023 17:28:23 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 17:28:23 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: platforms: chrp: Add require space after that ','
In-Reply-To: <tencent_541AA1B260FC8E0892D6A696F01C5600AD05@qq.com>
References: <tencent_541AA1B260FC8E0892D6A696F01C5600AD05@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <8e586ffecc673079ad58045ddc6e3ea6@208suo.com>
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

./arch/powerpc/platforms/chrp/time.c:109: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/time.c:110: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/time.c:111: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/time.c:112: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/time.c:113: ERROR: space required after 
that ',' (ctx:VxV)
./arch/powerpc/platforms/chrp/time.c:114: ERROR: space required after 
that ',' (ctx:VxV)

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/chrp/time.c | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/chrp/time.c 
b/arch/powerpc/platforms/chrp/time.c
index d46417e3d8e0..6bd40be22c33 100644
--- a/arch/powerpc/platforms/chrp/time.c
+++ b/arch/powerpc/platforms/chrp/time.c
@@ -106,12 +106,12 @@ int chrp_set_rtc_time(struct rtc_time *tmarg)
          tm.tm_mday = bin2bcd(tm.tm_mday);
          tm.tm_year = bin2bcd(tm.tm_year);
      }
-    chrp_cmos_clock_write(tm.tm_sec,RTC_SECONDS);
-    chrp_cmos_clock_write(tm.tm_min,RTC_MINUTES);
-    chrp_cmos_clock_write(tm.tm_hour,RTC_HOURS);
-    chrp_cmos_clock_write(tm.tm_mon,RTC_MONTH);
-    chrp_cmos_clock_write(tm.tm_mday,RTC_DAY_OF_MONTH);
-    chrp_cmos_clock_write(tm.tm_year,RTC_YEAR);
+    chrp_cmos_clock_write(tm.tm_sec, RTC_SECONDS);
+    chrp_cmos_clock_write(tm.tm_min, RTC_MINUTES);
+    chrp_cmos_clock_write(tm.tm_hour, RTC_HOURS);
+    chrp_cmos_clock_write(tm.tm_mon, RTC_MONTH);
+    chrp_cmos_clock_write(tm.tm_mday, RTC_DAY_OF_MONTH);
+    chrp_cmos_clock_write(tm.tm_year, RTC_YEAR);

      /* The following flags have to be released exactly in this order,
       * otherwise the DS12887 (popular MC146818A clone with integrated
