Return-Path: <linuxppc-dev+bounces-978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAA96B92F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzK654Y0Dz2ygG;
	Wed,  4 Sep 2024 20:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447053;
	cv=none; b=nbC4UZ/jPNZyTpWjbdd9yoesRMe0AV92qH4xcUNnzgFm66OUPwaj8rWNA6Xk6IEMwZHkWuy5iApL96H67mg0wNznn2wWx7kzYGnyiLI2vfzRew6T2OyZkkqNi3nx7nOKJGiSlR2LOHVU0sL/ctgwo3aNLl1Adgjfk7BH5WaEabXGTBef/ckxtkADjgOFi7r4sIpw8zkzDY3vuPGz2RGsMhKOdwxG0R4eqD3DdacbRqXVyNjmIxgw/sVt+lpWF9HzFkflq54Gu6vIuX6qNPh/QJAtn7RO8p2f4JIVefxbMAd72iVDHMsvkXxvJQo14hqTtKby/PvTtJ8oQt9XI8KUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447053; c=relaxed/relaxed;
	bh=kNTcbcoGqC40B7+iBoWPEf68cZWl3EVbLygndY9kHOM=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=iDLhskjZCTuGTZQhZniIHrkbcEeshysJRW7z7gVjfKCkW6Oz4sMc8af4ZOulVG+/vkP9VJCbU+6ZmsnjHtpnTJfNBcSghj9WyXYySLzl/Nl9b4kVnb0bsEktM9xOAF0fvdJX8xWryCo6R+ULmBCRNbxUoGZhfzCHryyKHrwAq01vzupZnqkEWdOoypfS87NO5HX9dMKfaqH17PnPFOsW6NZ95NfX5Uh8zOLRamG3jhdEGMzlfodI0/1UguddSVVVaBJg9OWFSUPFraAGwCK7r5hJDUhGxjocl9fqzZYe05eS8xuZVCdzgDNTow//H3VDcu1XgyGnohv1s599lXICKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfwOsMng; dkim-atps=neutral; spf=pass (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DfwOsMng;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzK652ckDz2yWy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:50:53 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725447033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNTcbcoGqC40B7+iBoWPEf68cZWl3EVbLygndY9kHOM=;
	b=DfwOsMngKluH7GcwpljWLkvl87ksYQ8YxID4gdUeq1JHuXHhquhhB8ZkS0lyS0SDeJM5r5
	Kx4zUoP/Mfrs3I0ob+gaRCdkORb+wS1zh0ygqm2KAu2Wp4xP89OKPsUT3u1SpsThTQeYqe
	H8Gh1/16xHhT8yEcunySMkEsqwIaYeA=
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
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 3/4] configure: Support cross compiling with clang
Date: Wed,  4 Sep 2024 12:50:24 +0200
Message-ID: <20240904105020.1179006-9-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-6-andrew.jones@linux.dev>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
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


