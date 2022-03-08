Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 411254D19D2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcNy0xqlz3ch3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:58:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f3DWUJwy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f3DWUJwy; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDt6rtmz3bbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:26 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso2193625pjc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BcrkBj9FNDVs+7CR17x1OE2BCfplgUQCJzSr/kw+/L4=;
 b=f3DWUJwynLgpl4A1vL+XQeiwcITB4nP2tc1e7NO1Y/lVfkd6YhiICiA1PWHs/g34oj
 aj0NvjiCl57bcQj8Lf+P5Ke/QVQgc2jXxedDr5Ps3jYJ1GuwwPdYUPT/2PCpMTQwPkBe
 r1RdHEaZAcejSfQcy7C/fQnmrvvSK4PYzKjCTJJO+tJtRjRm4p3SD0ZrRW/Pju2GIKB0
 z/iGGn2gimpqej3LnvE+1itfY4p0XhQ4fnC5WVL6ws3hCIE3nRJhvcHDULwvl2qy6r30
 P0E1bSNA+6s3zZETrs6uM0bY8pTn1pCWO8J24PXNfFn/3AYE2Qdgau0Owho8AJBY0s8Z
 /PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BcrkBj9FNDVs+7CR17x1OE2BCfplgUQCJzSr/kw+/L4=;
 b=3TSbktty6zAbmby8J1TPP3rLGyeAr48FWYPh/mqFTeiDZ3pIBgSGeyclzxgG9tm317
 q+goclnGJDfFUvd8y5fBrvn6ieEQnv8m7KvJVjb0r17o+ksMTC+S2LjHCwTKc5CBgbRi
 lnuxAFF/f3R+671LHKYsfo29ix9wo82uP3lOjcNOYbiHOREh/iViE6c7TbLA1HX74Fi8
 QbE4emsI+HAQhZSd/9kD5BVvz5mW1tHFPL4pO3AMU+7EAcSO6uHC6ZJ5YDWaOweLcaVj
 q4ilqCqkgOhW/+H0DX16GuLzMJURorUueb19tYZTi6ONwf0MdVCIWIVF68635RwYfTNx
 4ZCA==
X-Gm-Message-State: AOAM531XTnnzERPcU+VhVlRlNlv3mHwchLeU02ipdwZvIubwb9MfYOwg
 Q8AmJMiEEUnQw3sJWSl1dsF1xT6g8W8=
X-Google-Smtp-Source: ABdhPJynZJv74YrxIbCtogtI/uU1j1gx19/WkBOGYARrS3jGIzGDHY2Uml2omoiarKEADxBI02asrw==
X-Received: by 2002:a17:902:9a46:b0:14e:ea0f:28cf with SMTP id
 x6-20020a1709029a4600b0014eea0f28cfmr17638363plv.43.1646747485720; 
 Tue, 08 Mar 2022 05:51:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:51:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/14] powerpc/rtas: tidy __fetch_rtas_last_error
Date: Tue,  8 Mar 2022 23:50:44 +1000
Message-Id: <20220308135047.478297-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__fetch_rtas_last_error can use the same rtas_args as the caller used
for the failed rtas call. It can also use a higher-level helper to
assemble the rtas_args.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/rtas.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 751a20669669..e047793cbb80 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -385,34 +385,22 @@ static int rtas_last_error_token;
  *  this routine must be called atomically with whatever produced
  *  the error (i.e. with rtas.lock still held from the previous call).
  */
-static char *__fetch_rtas_last_error(char *altbuf)
+static char *__fetch_rtas_last_error(struct rtas_args *args, char *altbuf)
 {
-	struct rtas_args err_args, save_args;
 	u32 bufsz;
 	char *buf = NULL;
+	int ret;
 
 	if (rtas_last_error_token == -1)
 		return NULL;
 
 	bufsz = rtas_get_error_log_max();
 
-	err_args.token = cpu_to_be32(rtas_last_error_token);
-	err_args.nargs = cpu_to_be32(2);
-	err_args.nret = cpu_to_be32(1);
-	err_args.args[0] = cpu_to_be32(__pa(rtas_err_buf));
-	err_args.args[1] = cpu_to_be32(bufsz);
-	err_args.args[2] = 0;
-
-	save_args = rtas.args;
-	rtas.args = err_args;
-
-	do_enter_rtas(__pa(&rtas.args));
-
-	err_args = rtas.args;
-	rtas.args = save_args;
+	ret = raw_rtas_call(args, rtas_last_error_token, 2, 1, NULL,
+				__pa(rtas_err_buf), bufsz);
 
 	/* Log the error in the unlikely case that there was one. */
-	if (unlikely(err_args.args[2] == 0)) {
+	if (unlikely(ret == 0)) {
 		if (altbuf) {
 			buf = altbuf;
 		} else {
@@ -430,8 +418,8 @@ static char *__fetch_rtas_last_error(char *altbuf)
 #define get_errorlog_buffer()	kmalloc(RTAS_ERROR_LOG_MAX, GFP_KERNEL)
 
 #else /* CONFIG_RTAS_ERROR_LOGGING */
-#define __fetch_rtas_last_error(x)	NULL
-#define get_errorlog_buffer()		NULL
+#define __fetch_rtas_last_error(args, x)	NULL
+#define get_errorlog_buffer()			NULL
 #endif
 
 static int notrace va_raw_rtas_call(struct rtas_args *args, int token,
@@ -503,7 +491,7 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
 	if (ret == -1)
-		buff_copy = __fetch_rtas_last_error(NULL);
+		buff_copy = __fetch_rtas_last_error(rtas_args, NULL);
 
 	unlock_rtas(s);
 
@@ -1247,7 +1235,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
 	if (be32_to_cpu(args.rets[0]) == -1)
-		errbuf = __fetch_rtas_last_error(buff_copy);
+		errbuf = __fetch_rtas_last_error(&rtas.args, buff_copy);
 
 	unlock_rtas(flags);
 
-- 
2.23.0

