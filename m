Return-Path: <linuxppc-dev+bounces-934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D2596AA0B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzFF23qfz2yM6;
	Wed,  4 Sep 2024 07:25:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725374762;
	cv=none; b=S/KB9po1rPLzbLJgdpuFwNVGI3QzEoHP9cDYyL3w7uaXkNswiYjI3iqAgoJmEzDcf9KkGTIU9HdZbfaQL3YqKFgGau4/rkX4pJ+0ttVL40cAtsCVt6qnJFe9pYZA4HvKcBjzszMqGNKFjSh1FcCVYqDZCewA7deG3skia238tis/xfI2yIfM0KNA8JaFe0LzkHQW3Wj21yQ4GEXF0plr7Lvt/TSiCt6TWZawsBNxANPizUDHMRJyc937Yii6xltTfkfzSrRzfZ7IWZsig3215krkTKXZvA1s8ci+fTQjOi31P+NazrX6okcXxJ6aiK9BQZWoS4UYKuHrOyRCC+ynUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725374762; c=relaxed/relaxed;
	bh=NPJbr+AV4ff0gStLIX6r7FtGNvxcxGtMDjNsvGlAFzc=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=H+wEWZY3Z7MYSBEVqff2Z1DovececVPrJMxKMYoYMwlFfDEXLSnx+Vess7zLvqzVO+pxQNR862H7p6mQ8ULSzvMGVUgaKh38O4pFi3tCwXgspz2CBDd8MqwEpmTQ7S4cMcUarGBpcuBRReJasXOWSxSq7/Je11Q7I5qpgWjM3IVVUMkAbzf+4nY4u5JWR2Y4qqdrmLz7k6AcmzHbq0dV5NlkhU+P5GzC6DIMKn8r9kO0enGR1TPttZHB8jhylALxwM0d/RprTVHKcs1z/Z33mUEHFc6zdj7lA8zBOPwAx81AKyV+rSMrb3M3Hmn2HnImzy1ERBLcOsQfAKl7ZTyNew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QndBwf92; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QndBwf92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b7; helo=out-183.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 337 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 00:46:01 AEST
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WypMs4lmNz2y83
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 00:46:01 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725374394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPJbr+AV4ff0gStLIX6r7FtGNvxcxGtMDjNsvGlAFzc=;
	b=QndBwf92xNE68kZ4zIA9+ERf3pqDd299f/UsUpxg8zH5Ls2qOmUJZuwF9QkxTp+pMnthJE
	gddfikKHVJqaj2qte0oZGBPaUGUi8TUkWt9l4Z9ZWUHgj6z1GpjSjMCyBw+XNg86nG5w9L
	JmWp5qDd6lyWlSxh1O96HZ+BLv4BH5c=
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
Subject: [kvm-unit-tests PATCH 1/2] configure: Introduce add-config
Date: Tue,  3 Sep 2024 16:39:48 +0200
Message-ID: <20240903143946.834864-5-andrew.jones@linux.dev>
In-Reply-To: <20240903143946.834864-4-andrew.jones@linux.dev>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
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

Allow users to add additional CONFIG_* and override defaults
by concatenating a given file with #define's and #undef's to
lib/config.h

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/configure b/configure
index 27ae9cc89657..7a1317d0650d 100755
--- a/configure
+++ b/configure
@@ -64,6 +64,8 @@ usage() {
 	                           no environ is provided by the user (enabled by default)
 	    --erratatxt=FILE       specify a file to use instead of errata.txt. Use
 	                           '--erratatxt=' to ensure no file is used.
+	    --add-config=FILE      specify a file containing configs (CONFIG_*) to add on to the
+	                           generated lib/config.h. Use #undef to override default configs.
 	    --host-key-document=HOST_KEY_DOCUMENT
 	                           Specify the machine-specific host-key document for creating
 	                           a PVM image with 'genprotimg' (s390x only)
@@ -153,6 +155,10 @@ while [[ "$1" = -* ]]; do
 	    erratatxt=
 	    [ "$arg" ] && erratatxt=$(eval realpath "$arg")
 	    ;;
+	--add-config)
+	    add_config=
+	    [ "$arg" ] && add_config=$(eval realpath "$arg")
+	    ;;
 	--host-key-document)
 	    host_key_document="$arg"
 	    ;;
@@ -213,6 +219,10 @@ if [ "$erratatxt" ] && [ ! -f "$erratatxt" ]; then
     echo "erratatxt: $erratatxt does not exist or is not a regular file"
     exit 1
 fi
+if [ "$add_config" ] && [ ! -f "$add_config" ]; then
+    echo "add-config: $add_config does not exist or is not a regular file"
+    exit 1
+fi
 
 arch_name=$arch
 [ "$arch" = "aarch64" ] && arch="arm64"
@@ -502,4 +512,8 @@ cat <<EOF >> lib/config.h
 
 EOF
 fi
+if [ "$add_config" ]; then
+    echo "/* Additional configs from $add_config */" >> lib/config.h
+    cat "$add_config" >> lib/config.h
+fi
 echo "#endif" >> lib/config.h
-- 
2.46.0


