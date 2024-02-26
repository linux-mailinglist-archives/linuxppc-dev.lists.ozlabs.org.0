Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7118867139
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:34:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZQu6c72o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxnZ4B3tz86Xd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZQu6c72o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxLS2Dpkz3vd7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:14:40 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e4ca46ab04so1528627b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942478; x=1709547278; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn0wpF++cem/UZGdf5BQR6BIhvfqGjZKC1JKYpLlkg4=;
        b=ZQu6c72oIg9EZM082+AKZu1Or21bzP7PgfrOyMZBI2Jw4DcLt9YwqQFZNy2D+4nHf+
         vSBeqidzVgSWVnF/Okp3AXksmwqpW/95gDRdXxGeAAtD+UKo1ZF/CJQzDmS36nWcLI/y
         9DKY4IjFSXJWWaMrsaNroY0aZdks2OCw8g1IrVCUFwRESBTOcIGzlNxORXKReTDCrjzJ
         QPU3D05D4pxtDvXynCM9b1vFhHfeysMRLrFjKV4YunEGELoUnWjrP2nNjBfsRX+ZNo1i
         Vcu6gZRzJ/1dnKazlGoCrYjNS67TYpdgzdlQxftjArypKiAC4Uk15ukS4KuOL99nhrSb
         2m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942478; x=1709547278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nn0wpF++cem/UZGdf5BQR6BIhvfqGjZKC1JKYpLlkg4=;
        b=Ili/TZ/fXL7EwS0LjxGIIxXdwttc+a0V4wIcCD1s6A9gPBXcXaN+oQRAzHtgflv/n1
         QJ7pWSjhOd+2EGziePkmBAeOeUBrN1qqPERFxHubLZNKyxhxkFjTG0w3K/zI5C5du6Ed
         HtG3Rc4M3AXAwtKZXy8RaFjwTV12uGxmEc9VukW5iHzPvMIgorV+DX5JRvAgCeR9Bpxs
         I/WlBHmVaiCj+zQxhD5hn+eu+5qqO3Vp9P0HJhAsiJMIiFxzSnnWk+lpwudhTdFXtz4E
         lcCvcLiiGPLE/EYyOVKRWXluQkpCQ1XJExHCeZH/mvOFM3nOY9joxSx6vJydpIANzI4c
         VzBw==
X-Forwarded-Encrypted: i=1; AJvYcCWpiWcuqc5+lI0UwpfR5xgVGD9wBvtM1m7VBvwzLn0iYk7C9se0JJZ3Kk17z9AijInrnC+lU9Tx5plw/vhSadAx3xUjp8PPg6bYIFARqA==
X-Gm-Message-State: AOJu0Yznoqx57rJ6/B26OcYGz/qP+wi3keNG10+J+Pxa/Wb4VESRXlGi
	hN2+WmwsWSLLzMrNV4x9J5oui0k4004rwn66KhefixLV0cbe4V2+0GVyzEh5
X-Google-Smtp-Source: AGHT+IEONag+59fDg0rGek6fdriFbxd2o5/eMYAnHfHOB8an4AA/o7Pf8BjvWbqvq5clxGkq4IH8cg==
X-Received: by 2002:aa7:8613:0:b0:6e4:c69f:572b with SMTP id p19-20020aa78613000000b006e4c69f572bmr7009039pfn.27.1708942478503;
        Mon, 26 Feb 2024 02:14:38 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:14:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 29/32] configure: Fail on unknown arch
Date: Mon, 26 Feb 2024 20:12:15 +1000
Message-ID: <20240226101218.1472843-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, =?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Joel Stanley <joel@jms.id.au>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

configure will accept an unknown arch, and if it is the name of a
directory in the source tree the command will silently succeed. Make
it only accept supported arch names.

Also print the full path of a missing test directory to disambiguate
the error in out of tree builds.

Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Nico Böhr <nrb@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Cc: kvm-riscv@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 configure | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 6907ccbbb..ae522c556 100755
--- a/configure
+++ b/configure
@@ -45,7 +45,8 @@ usage() {
 	Usage: $0 [options]
 
 	Options include:
-	    --arch=ARCH            architecture to compile for ($arch)
+	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
+	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($arch)
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
@@ -321,11 +322,15 @@ elif [ "$arch" = "ppc64" ]; then
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     testdir=riscv
     arch_libdir=riscv
+elif [ "$arch" = "s390x" ]; then
+    testdir=s390x
 else
-    testdir=$arch
+    echo "arch $arch is not supported!"
+    arch=
+    usage
 fi
 if [ ! -d "$srcdir/$testdir" ]; then
-    echo "$testdir does not exist!"
+    echo "$srcdir/$testdir does not exist!"
     exit 1
 fi
 
-- 
2.42.0

