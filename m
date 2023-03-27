Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DDF6CA4E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXnq55Ddz3fhM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:54:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c+YEwJEV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c+YEwJEV;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXcB1lkwz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:46:02 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so8677168pjz.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ob1Ka1GDo4kUszz8YMerJdsHwWFQwfeKAyOzlxkgMc=;
        b=c+YEwJEVLECEtmPkN75tqIWyoibov+g4LcIPV+9zj5LMyqwtXXuLGuhrvMxetIJEz2
         gsiHpp+BLhj8TMEH+wSgL8xweD/mdqJ6VsNJ//stewOaNLCBnxVPn5IF340ShFycHK+v
         0fFA/E9ZAvLWtyYiWVKpDt99jHMcza7lj5War+XENswOEu21FHEblUhm/7ogbLQkUkyL
         02G7SNlRjP17Y9M2XBTKeXqt8dZbX8kybtKmBpzNiiUyepc+fsSmnHK03OwU6ZEl+CeM
         ZeQLge+7Cn0zEsKmTTQm2wscM2lyEj8szWqacgQrYVbTdNaKtZ1UNM6SYJJDsReyVnqr
         o1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ob1Ka1GDo4kUszz8YMerJdsHwWFQwfeKAyOzlxkgMc=;
        b=nuQCrJbOD65D0hXsIDSTnLrv6wChLNCWAvEYDSavNlY0LdaNHu4KNxTCo+D+fvmG+x
         DH8JMMIGm8QohlqI8oU5JYpDSfi/wgvhq+f13QrxKRON/N6wWUeG6dCqwjADYwlxnXPs
         tpq5uWyLiIlvcw6dm/lgGiJvYNzqJYV283/+qoO2eJWzAC/svL8FEtyEkqJ30WgRrOoH
         RH9wE7EB0qQFk+DjLbfRrm5l3lyrwU4rcHNvRDM/c+vIuH8ghRhwWskvs6UNoes39pwu
         P+qn9oKsW5cFVDNNg/ujXvtifdma6kAX3pvDAIo1odWT8EkV8FhnI+5dq2jP0LSECU/x
         FT5Q==
X-Gm-Message-State: AAQBX9eqM9oFioZhQg7CX9OTB5tQI9TFP85HK4yvTsICsCYJALs6Rcf7
	DJHLqUvPxmqe+8R+f+jmgQiKJGx38+k=
X-Google-Smtp-Source: AKy350aohabTNCzw6Ebj8r5zR6Y2fQGuegq50HCZBGegiiJ+lkjUzKO7o8TJ5w/jDAfxApx+luidgw==
X-Received: by 2002:a17:902:cec5:b0:19c:bcb1:d8c3 with SMTP id d5-20020a170902cec500b0019cbcb1d8c3mr14637115plg.54.1679921161694;
        Mon, 27 Mar 2023 05:46:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:46:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 09/13] powerpc: Expand exception handler vector granularity
Date: Mon, 27 Mar 2023 22:45:16 +1000
Message-Id: <20230327124520.2707537-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Exception handlers are currently indexed in units of 0x100, but
powerpc can have vectors that are aligned to as little as 0x20
bytes. Increase granularity of the handler functions before
adding support for thse vectors.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- New patch

 lib/powerpc/processor.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index f8b7905..411e013 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -16,19 +16,24 @@
 static struct {
 	void (*func)(struct pt_regs *, void *data);
 	void *data;
-} handlers[16];
+} handlers[128];
 
+/*
+ * Exception handlers span from 0x100 to 0x1000 and can have a granularity
+ * of 0x20 bytes in some cases. Indexing spans 0-0x1000 with 0x20 increments
+ * resulting in 128 slots.
+ */
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *),
 		      void * data)
 {
-	if (trap & 0xff) {
+	if (trap & 0x1f) {
 		printf("invalid exception handler %#x\n", trap);
 		abort();
 	}
 
-	trap >>= 8;
+	trap >>= 5;
 
-	if (trap < 16) {
+	if (trap < 128) {
 		if (func && handlers[trap].func) {
 			printf("exception handler installed twice %#x\n", trap);
 			abort();
@@ -45,9 +50,9 @@ void do_handle_exception(struct pt_regs *regs)
 {
 	unsigned char v;
 
-	v = regs->trap >> 8;
+	v = regs->trap >> 5;
 
-	if (v < 16 && handlers[v].func) {
+	if (v < 128 && handlers[v].func) {
 		handlers[v].func(regs, handlers[v].data);
 		return;
 	}
-- 
2.37.2

