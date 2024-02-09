Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0584F212
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:13:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MaES1m7G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSnP3BBDz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MaES1m7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSlv67mFz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:11:55 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6e2c402a5c2so381564a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469913; x=1708074713; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxyXAGgGrfeNy34o4rw1jwmZjpNeqct9+4wIMTyRvKI=;
        b=MaES1m7GJMltLyQwjApEoxH2e2rg6BaW4PzMIB2zV/LG4GYJlLYo8zbWHbreXhkfF/
         TYNzktqPmvxYk+Iv/98sbvZK2ougA61BxamkdXXXc2lm8NkA+8ns+vSYA9MbZi/9AqRl
         P1QG+5RB2iP9fatRvIqqWfX3Xk14zHxvINSR3IV0EmOF+fb4GG+W6fVdrv3N1GqQfvnW
         Y7M7PkKSa4svImRyruxXR6knYDRiNZQk88EZkK3tWVC71+tVJYQXVRm8EuF72Hix2fqG
         1w2W5v68CslEB4WuNKuH1SSPBt/cgw5eWheguCYXb4cMhhBHYx4sxU1xKr1XsAJw/EKg
         0VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469913; x=1708074713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxyXAGgGrfeNy34o4rw1jwmZjpNeqct9+4wIMTyRvKI=;
        b=NA6DejgM0Imi0NHakET0fvfnb+rd8jfKHNZ/Vl7Ka0GL5vkj3nPoZWlPn8//LX3CZo
         8sfEr4TIn2ezeySBjbKbg31/nz67Dc+spTXlNFWJEBWCxV4HyXeyHWUVWebyOeiQpMo6
         baxf54eBx3A466kEZ0ezbs+Laz4SA3jnrxnrVbb+2uWmaRXQb1agvaecB8PhrARH9g3g
         s9x0udEKBEJirhj0Wih02pFkkHcYAFNj2ifmt6yeqaCcQlBEaiXpbIsksDC7Fo2E0amu
         16CsklNgKLvJBf5nY9WkFBQapPBDEeZiGO9/rQW3z+Z9VUrbLpO9gZTuy64U6ZULOfGx
         hVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXa01xlS+l0aZrNxsDIhmXHNGgUjdVWOiAZ7rj2nU5104/Q1pSZqY2TWgyawn7L2VtQKtTPHX6xlm0PVugvP0qhwLg15Dj240+LzAonZA==
X-Gm-Message-State: AOJu0Yy7XEcLVh4pgCcAk7EAfPbSaUaiXrNLowikA/UOR3mLXfsNM/u7
	Hg37FYBoAwojCKiyfJKlrN/hBos+xXmmGeNmep+dvHrvavJIHmOc
X-Google-Smtp-Source: AGHT+IGcmytfLhFPegBL/6SAtwvaTgnR5fQUFdHgJo6Q2wspsRF4btaANrNXmauM6vRXjX9yxL/gWw==
X-Received: by 2002:a9d:7592:0:b0:6e2:b1b8:84c7 with SMTP id s18-20020a9d7592000000b006e2b1b884c7mr748994otk.17.1707469912911;
        Fri, 09 Feb 2024 01:11:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKEs+ZzHCXAJAGHH6bSzYysqcGhmXYYuO3J7InQHWbz7ru+8zL9FzYLwO9GhlA0tw/acl/lYs3xPiH65/zsxoAQ+vOunmMdeJHj7fwM/7IYXS11Wbs/M5zRz5EFWAit+rW73a2VQG4xCIgTGUjXY82AdiRPTb/BavJVUTQGbV3aId10/C9+rVjQIpd1Sqv+goLw0U2es5OSA3dWuYu5H7d6q1pn6MwjszvCXwnamaxbAuWZvyYWownmRTeOrIzuI/+ZouL6nKh1dRZNCzbkzenpPqIA0lri7eCfEnpLGUSmDhy4bR7gdHEr2MhHc30t+XM2H24jxoeAD/txqPe/zWL8MvUSl69ZVEGcQKNNJ6fDjyFBPGZD7Q2/0JE/myZwW5iFPDzucesGj3v4iUc6Gk/lIsdO/3DaDrVpOb8Tk4ap7x5eab++yF7e1pnQgSA6kNfYSZA7kvMlw+hGoaFgZYDYEkSxXqNBeh1/zUpugm2h2n6a+WOGKyuzbfTM72zw7egy17LNvoMYibovcDaGQ1CqWgMjcNfN+R1vbsgD9BEUgLLhu9mWmXL
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:11:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 1/8] arch-run: Fix TRAP handler recursion to remove temporary files properly
Date: Fri,  9 Feb 2024 19:11:27 +1000
Message-ID: <20240209091134.600228-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Migration files were not being removed when the QEMU process is
interrupted (e.g., with ^C). This is becaus the SIGINT propagates to the
bash TRAP handler, which recursively TRAPs due to the 'kill 0' in the
handler. This eventually crashes bash.

This can be observed by interrupting a long-running test program that is
run with MIGRATION=yes, /tmp/mig-helper-* files remain afterwards.

Removing TRAP recursion solves this problem and allows the EXIT handler
to run and clean up the files.

This also moves the trap handler before temp file creation, which closes
the small race between creation trap handler install.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d0864360..11d47a85 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -129,6 +129,9 @@ run_migration ()
 		return 77
 	fi
 
+	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
+	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
+
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
@@ -137,9 +140,6 @@ run_migration ()
 	qmpout1=/dev/null
 	qmpout2=/dev/null
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
-
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control | tee ${migout1} &
 	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
@@ -209,11 +209,11 @@ run_panic ()
 		return 77
 	fi
 
-	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
-
-	trap 'kill 0; exit 2' INT TERM
+	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
 	trap 'rm -f ${qmp}' RETURN EXIT
 
+	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
+
 	# start VM stopped so we don't miss any events
 	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
 		-mon chardev=mon1,mode=control -S &
-- 
2.42.0

