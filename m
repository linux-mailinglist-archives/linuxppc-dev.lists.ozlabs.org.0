Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C522A51E95F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 21:15:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwcbF46Nsz3cBX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 05:15:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5byyGjS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwcZX5CpLz3brq
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 05:15:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=V5byyGjS; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KwcZV5wzcz4ySx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 05:14:58 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KwcZV5synz4ySy; Sun,  8 May 2022 05:14:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=V5byyGjS; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KwcZT1vQCz4ySx
 for <linuxppc-dev@ozlabs.org>; Sun,  8 May 2022 05:14:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/znyXJRLDsok/YXirIxLkxYec6QFvnOe+R9jljS85JE=; b=V5byyGjS+aQTtTXriJ+35IDUKR
 v3q+TWlwj4c97wcCcmG8DlQY+MLorVgC38EJB7oc1omiLMr2+FTBkkNT4GK2gGUFTKhw71ormve2g
 jQ+VriF3FmMYXJH5iKuw6xPC2FmfoHlPfaGz/SlL/EANgoW+fsRQ4Zsg0rKqQnLsKE0P3JqP/9YQZ
 TaGz6w1h9ZZrYf0zs9Z3e/rtASJOB7tPUOKXX0ZVHJqa1aaxyv4ebPkedCgnz/d1FNDoXO57GrBmo
 1ivFTOe7e/CW+pCiPC4L2awJ8+JiW93SfrwgPIBj4WwwFVbeoisk1oVBiEC1/IgehgiBIJH2PdtBN
 kiMQWe+w==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nnPt9-0085Um-Iu; Sat, 07 May 2022 19:14:47 +0000
Date: Sat, 7 May 2022 12:14:47 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: request_module DoS
Message-ID: <YnbFJ0fn5gLTRLX7@bombadil.infradead.org>
References: <YnXiuhdZ49pKL/dK@gondor.apana.org.au>
 <77ecde32-e868-5804-d9a5-3bb22d314777@csgroup.eu>
 <YnYnjLXm6atlznPT@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnYnjLXm6atlznPT@bombadil.infradead.org>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 "fnovak@us.ibm.com" <fnovak@us.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 07, 2022 at 01:02:20AM -0700, Luis Chamberlain wrote:
> You can try to reproduce by using adding a new test type for crypto-aegis256
> on lib/test_kmod.c. These tests however can try something similar but other
> modules.
> 
> /tools/testing/selftests/kmod/kmod.sh -t 0008
> /tools/testing/selftests/kmod/kmod.sh -t 0009
> 
> I can't decipher this yet.

Without testing it... but something like this might be an easier
reproducer:

diff --git a/tools/testing/selftests/kmod/kmod.sh b/tools/testing/selftests/kmod/kmod.sh
index afd42387e8b2..48b6b5ec6c1e 100755
--- a/tools/testing/selftests/kmod/kmod.sh
+++ b/tools/testing/selftests/kmod/kmod.sh
@@ -41,6 +41,7 @@ set -e
 TEST_NAME="kmod"
 TEST_DRIVER="test_${TEST_NAME}"
 TEST_DIR=$(dirname $0)
+PROC_CONFIG="/proc/config.gz"
 
 # This represents
 #
@@ -65,6 +66,7 @@ ALL_TESTS="$ALL_TESTS 0010:1:1"
 ALL_TESTS="$ALL_TESTS 0011:1:1"
 ALL_TESTS="$ALL_TESTS 0012:1:1"
 ALL_TESTS="$ALL_TESTS 0013:1:1"
+ALL_TESTS="$ALL_TESTS 0014:150:1"
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
@@ -79,6 +81,19 @@ test_modprobe()
        fi
 }
 
+kconfig_has()
+{
+	if [ -f $PROC_CONFIG ]; then
+		if zgrep -q $1 $PROC_CONFIG 2>/dev/null; then
+			echo "yes"
+		else
+			echo "no"
+		fi
+	else
+			echo "no"
+	fi
+}
+
 function allow_user_defaults()
 {
 	if [ -z $DEFAULT_KMOD_DRIVER ]; then
@@ -106,6 +121,8 @@ function allow_user_defaults()
 	fi
 
 	MODPROBE_LIMIT_FILE="${PROC_DIR}/kmod-limit"
+	HAS_CRYPTO_AEGIS256_MOD="$(kconfig_has CONFIG_CRYPTO_AEGIS256=m)"
+	HAS_CRYPTO_AEGIS256_BUILTIN="$(kconfig_has CONFIG_CRYPTO_AEGIS256=y)"
 }
 
 test_reqs()
@@ -504,6 +521,21 @@ kmod_test_0013()
 		"cat /sys/module/${DEFAULT_KMOD_DRIVER}/sections/.*text | head -n1"
 }
 
+kmod_test_0014()
+{
+	kmod_defaults_driver
+	MODPROBE_LIMIT=$(config_get_modprobe_limit)
+	let EXTRA=$MODPROBE_LIMIT/6
+	config_set_driver crypto-aegis256
+	config_num_thread_limit_extra $EXTRA
+	config_trigger ${FUNCNAME[0]}
+	if [[ "$HAS_CRYPTO_AEGIS256_MOD" == "yes" || "$HAS_CRYPTO_AEGIS256_BUILTIN" == "yes" ]]; then
+		config_expect_result ${FUNCNAME[0]} SUCCESS
+	else
+		config_expect_result ${FUNCNAME[0]} MODULE_NOT_FOUND
+	fi
+}
+
 list_tests()
 {
 	echo "Test ID list:"
@@ -525,6 +557,7 @@ list_tests()
 	echo "0011 x $(get_test_count 0011) - test completely disabling module autoloading"
 	echo "0012 x $(get_test_count 0012) - test /proc/modules address visibility under CAP_SYSLOG"
 	echo "0013 x $(get_test_count 0013) - test /sys/module/*/sections/* visibility under CAP_SYSLOG"
+	echo "0014 x $(get_test_count 0014) - multithreaded - push kmod_concurrent over max_modprobes for request_module() for crypto-aegis256"
 }
 
 usage()
