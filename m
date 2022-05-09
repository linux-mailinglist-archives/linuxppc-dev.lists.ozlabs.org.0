Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684051F282
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 03:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxP8D261Xz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:43:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=st/9uAHX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxP7S3Sjwz3bhK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 11:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=st/9uAHX; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KxP7M6Ydqz4xcN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 11:42:39 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KxP7M6TxBz4xbN; Mon,  9 May 2022 11:42:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=st/9uAHX; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KxP7K5Z4Sz4xcN
 for <linuxppc-dev@ozlabs.org>; Mon,  9 May 2022 11:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NuGSALwoLk4dQeQSKTaMdHjmaUOrXItUM4Q9Ls2i1Oc=; b=st/9uAHX4XrWNsxGP0umYxBgg/
 DrgyN0OrxK18w0lI8wKiK3F1D/ZSideEp6TClnHVf4bXj+DnLOprzL/kpcYX20rNnZtFUAETXnACI
 NrR4dBKGcooh3o9pbYIL1sabjC/6C2u0qFbVrjmqt84jvw/ZBz1QJTJFugwHJ0YbOagNKbrERb7Xj
 DC1/myYrbNRTE/3NKFrZPd6gi+AT5VS30OQ/+7+Vym0Hg84QwjQhsA/ZM0YwTHLW5nRPoBHW/aok7
 S9gIxHOFhwaM6UnAi2Y5imadRrfhgPHUxG598VPJ3svXo/ekU30ulT9nLgyxLha257KeazjdpJuMG
 YL/cNS4g==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nnsPs-00BzTe-Q1; Mon, 09 May 2022 01:42:28 +0000
Date: Sun, 8 May 2022 18:42:28 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: request_module DoS
Message-ID: <YnhxhIsSTCwSPphy@bombadil.infradead.org>
References: <YnXiuhdZ49pKL/dK@gondor.apana.org.au>
 <77ecde32-e868-5804-d9a5-3bb22d314777@csgroup.eu>
 <YnYnjLXm6atlznPT@bombadil.infradead.org>
 <YnbFJ0fn5gLTRLX7@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnbFJ0fn5gLTRLX7@bombadil.infradead.org>
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

On Sat, May 07, 2022 at 12:14:47PM -0700, Luis Chamberlain wrote:
> On Sat, May 07, 2022 at 01:02:20AM -0700, Luis Chamberlain wrote:
> > You can try to reproduce by using adding a new test type for crypto-aegis256
> > on lib/test_kmod.c. These tests however can try something similar but other
> > modules.
> > 
> > /tools/testing/selftests/kmod/kmod.sh -t 0008
> > /tools/testing/selftests/kmod/kmod.sh -t 0009
> > 
> > I can't decipher this yet.
> 
> Without testing it... but something like this might be an easier
> reproducer:
> 
> +	config_set_driver crypto-aegis256

If the module is not present though nothing really happens, and so
is it possible this is another issue?

Below a bogus module request.

diff --git a/tools/testing/selftests/kmod/kmod.sh b/tools/testing/selftests/kmod/kmod.sh
index afd42387e8b2..a747ad549940 100755
--- a/tools/testing/selftests/kmod/kmod.sh
+++ b/tools/testing/selftests/kmod/kmod.sh
@@ -65,6 +66,7 @@ ALL_TESTS="$ALL_TESTS 0010:1:1"
 ALL_TESTS="$ALL_TESTS 0011:1:1"
 ALL_TESTS="$ALL_TESTS 0012:1:1"
 ALL_TESTS="$ALL_TESTS 0013:1:1"
+ALL_TESTS="$ALL_TESTS 0014:150:1"
 
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
@@ -504,6 +506,17 @@ kmod_test_0013()
 		"cat /sys/module/${DEFAULT_KMOD_DRIVER}/sections/.*text | head -n1"
 }
 
+kmod_test_0014()
+{
+	kmod_defaults_driver
+	MODPROBE_LIMIT=$(config_get_modprobe_limit)
+	let EXTRA=$MODPROBE_LIMIT/6
+	config_set_driver bogus_module_does_not_exist
+	config_num_thread_limit_extra $EXTRA
+	config_trigger ${FUNCNAME[0]}
+	config_expect_result ${FUNCNAME[0]} MODULE_NOT_FOUND
+}
+
 list_tests()
 {
 	echo "Test ID list:"
@@ -525,6 +538,7 @@ list_tests()
 	echo "0011 x $(get_test_count 0011) - test completely disabling module autoloading"
 	echo "0012 x $(get_test_count 0012) - test /proc/modules address visibility under CAP_SYSLOG"
 	echo "0013 x $(get_test_count 0013) - test /sys/module/*/sections/* visibility under CAP_SYSLOG"
+	echo "0014 x $(get_test_count 0014) - multithreaded - push kmod_concurrent over max_modprobes for request_module() for a missing module"
 }
 
 usage()
