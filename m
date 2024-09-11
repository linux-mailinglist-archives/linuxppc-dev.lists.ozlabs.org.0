Return-Path: <linuxppc-dev+bounces-1243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26193974E42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:15:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zdx6p1Qz2yk7;
	Wed, 11 Sep 2024 19:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ab"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046085;
	cv=none; b=lCeOc7QEV3odxXiTVEPXBFP51nID647k3Gymj9Tohl3DIHkojY24Npx5mFFNAWxB3Rr2q9Dxl20LPvH0yRw2x9HNL1uKU9Qe8B3d8JyxyjJQezRggSj6E/8O8yaPuLR4vHP7AWGc5IOZRLzkgKpicpXzmW+F8VhCFg7+LwREvNpX48cR/JQFX4hVsu5TWjSbGOE5tNHIql7BirjzaYMZa+6LzpPoFPXKeeXFXGALYvaVRAQSeY8MV1eoboUQ+PJTmb5cCt3+kDUwIL+oAy+VlbI3cWRZL0DpBY11dvIM87+PwqWbe6hgrajNaag8QoAkstQddYULBmsv8QQdtwWXSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046085; c=relaxed/relaxed;
	bh=OsPMkwGnmjxo8sJCbsJnrotMn1FMT4yM5h3OsBJs5A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/gKbqPOqLDwOdUtNUZW9thCz4nAwWePZSqB85DCOlGzn1/rzW25ejEQWUHXtN3jqwgZofsNbimQPclJpZu58hxiby0QOu0lOYlxiVOJ7Iv4/Kvx41s7+WCARviwq3jOhcAT9GUvhSQJ5xd9ymMoRGo2IaEMk1e5VN6/wt5Lh1U0aErMfsXaYjxrNRvGejQFVJ9Qw7jpgmK6N/+LUHFtb13NQsaWOT0ilz/JKIZoX8n/GaNyP+e6QRU4Zl8qXiAMLsVttAd4AeJ2KM7bHQp160ylXo/TYjQK7u9PVQiiuNB7kgdo0wSHoLKj1UxftntM3jjXLNU7y/7OKTwQ/4fB1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M/L8jvpC; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M/L8jvpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ab; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zdx4p3wz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:45 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsPMkwGnmjxo8sJCbsJnrotMn1FMT4yM5h3OsBJs5A4=;
	b=M/L8jvpCq6Lms6T+WyzTPt0/nG1hiGx8NuLu96rSqL0Ticw900TLKyJeW0+3jx6XRkNbXi
	KnQUzkSx2GDETZ5LMzJR9rHnVzDiz7FxKrodiwtzOpcQ3aSXyYEHkyxUKMiyoBDqNa3QjB
	M1MsIzc6cVG428WiTpu7L7fMBcawvUE=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	atishp@rivosinc.com,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [kvm-unit-tests PATCH v3 3/5] configure: Support cross compiling with clang
Date: Wed, 11 Sep 2024 11:14:10 +0200
Message-ID: <20240911091406.134240-10-andrew.jones@linux.dev>
In-Reply-To: <20240911091406.134240-7-andrew.jones@linux.dev>
References: <20240911091406.134240-7-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When a user specifies the compiler with --cc assume it's already
fully named, even if the user also specifies a cross-prefix. This
allows clang to be selected for the compiler, which doesn't use
prefixes, but also still provide a cross prefix for binutils. If
a user needs a prefix on the compiler that they specify with --cc,
then they'll just have to specify it with the prefix prepended.

Also ensure user provided cflags are used when testing the compiler,
since the flags may drastically change behavior, such as the --target
flag for clang.

With these changes it's possible to cross compile for riscv with
clang after configuring with

 ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
             --cross-prefix=riscv64-linux-gnu-

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 27ae9cc89657..337af07374df 100755
--- a/configure
+++ b/configure
@@ -130,6 +130,7 @@ while [[ "$1" = -* ]]; do
 	    ;;
 	--cc)
 	    cc="$arg"
+	    cc_selected=yes
 	    ;;
 	--cflags)
 	    cflags="$arg"
@@ -200,6 +201,10 @@ while [[ "$1" = -* ]]; do
     esac
 done
 
+if [ -z "$cc_selected" ] && [ "$cross_prefix" ]; then
+    cc="$cross_prefix$cc"
+fi
+
 if [ -z "$efi" ] || [ "$efi" = "n" ]; then
     [ "$efi_direct" = "y" ] && efi_direct=
 fi
@@ -370,7 +375,7 @@ fi
 cat << EOF > lib-test.c
 __UINT32_TYPE__
 EOF
-u32_long=$("$cross_prefix$cc" -E lib-test.c | grep -v '^#' | grep -q long && echo yes)
+u32_long=$("$cc" $cflags -E lib-test.c | grep -v '^#' | grep -q long && echo yes)
 rm -f lib-test.c
 
 # check if slash can be used for division
@@ -379,7 +384,7 @@ if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
 foo:
     movl (8 / 2), %eax
 EOF
-  wa_divide=$("$cross_prefix$cc" -c lib-test.S >/dev/null 2>&1 || echo yes)
+  wa_divide=$("$cc" $cflags -c lib-test.S >/dev/null 2>&1 || echo yes)
   rm -f lib-test.{o,S}
 fi
 
@@ -442,7 +447,7 @@ ARCH=$arch
 ARCH_NAME=$arch_name
 ARCH_LIBDIR=$arch_libdir
 PROCESSOR=$processor
-CC=$cross_prefix$cc
+CC=$cc
 CFLAGS=$cflags
 LD=$cross_prefix$ld
 OBJCOPY=$cross_prefix$objcopy
-- 
2.46.0


