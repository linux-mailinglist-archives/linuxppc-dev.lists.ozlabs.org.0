Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9D899856
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lkmwlwyb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sX506D4z3vwZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:45:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lkmwlwyb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKQ4gtYz3vbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:42 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c3e2e0e407so1214670b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306199; x=1712910999; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6L3mP48IsUDDp5GHT4hPb4TjswdvN0rLft4Daqo8RQ=;
        b=lkmwlwybeoW658oATYdGedxCmkxAfSpkjWMIqw4BcXbh2wmeiyOXUk1guYEauLfQ5Y
         lDw0tsTJf3Dzcj1nz0WW45aNww4B75VHA3MzjBpOeUftRwNp/dyVRlYEIQAktHpBsn1k
         YMc/quhuf+xxNK5HEa+/exPSV3R5jD8EV2+dXP+jzgBKgCZZ7pcXkw+XtXIK9Z4bOO61
         Uppb6tfaZ2AhLh4ohzcihamLsDuCuLNcKNof+4dLLqgOyl+Npso16uPFVid9aKLX7j/i
         U0jklE3g8Sdt57NfX2I95fpkSh8dy5AuMuZiw0a/6tHaxFwUS0xqektrcJVs3M+K2Rtj
         S/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306199; x=1712910999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6L3mP48IsUDDp5GHT4hPb4TjswdvN0rLft4Daqo8RQ=;
        b=boIx3hceJDTQlAXDu9KLVZ6PHEMbJ+I82WhsAoQTEvyybJASZj6/jcEYx0kc8XW8qc
         WLyHLhG3zPWWft0iXSmcwvnFU2Kkxt8vJbtjFkahEpaecsY5PWDzjHv3g2ugRyt8dyy4
         3hXq47+gA7S/o38LVdKVE/Mh/6KVoZq2rGAYkXROv0M5c76saP1n/+WLzcMJbYP4/GfO
         kBTuznWa99hthyJK083SkhqcVK1PcxavNvBg7kyubKTtL6M41VBkr+hf+6ycd+JBlXYn
         wVaEz5YOEIBtbB5LbUqw3Tf5sUWqGVU6ZevTqrRy0SPzikQhuAD3TeHrZntQ8g3nSuON
         xoqA==
X-Forwarded-Encrypted: i=1; AJvYcCXkildos0iffGG0yF5gj3RUlRNACAqVM2W5W1GSxpukW4rNeiCDOqRkHa1M5NsZlpAD2Eg1f5ZJ507FlHbigqgjKfQhzFdq9TCzRBPhSw==
X-Gm-Message-State: AOJu0YzZX6K6HdqzI+ZWFFaPKPLQYWeWqClNLZ9lcu3NMKfdfB0ualPl
	hp1iaGJp5OxS5vtP0+2Fz3LuLt4nmE/Ag+KRYtVRbdodDnCE3o+I
X-Google-Smtp-Source: AGHT+IH7po3SAfDMqmHjbzAUfipp3UDO9dTc5iB0AVwVRPWt0QnCqIEQEeiB9i//C3iRw3a8ZWGX4Q==
X-Received: by 2002:a05:6358:ca8:b0:17f:8847:a4c6 with SMTP id o40-20020a0563580ca800b0017f8847a4c6mr1049547rwj.17.1712306199322;
        Fri, 05 Apr 2024 01:36:39 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 13/35] doc: start documentation directory with unittests.cfg doc
Date: Fri,  5 Apr 2024 18:35:14 +1000
Message-ID: <20240405083539.374995-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Consolidate unittests.cfg documentation in one place.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/unittests.cfg     | 26 ++-----------
 docs/unittests.txt    | 89 +++++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg | 25 ++----------
 riscv/unittests.cfg   | 26 ++-----------
 s390x/unittests.cfg   | 18 ++-------
 x86/unittests.cfg     | 26 ++-----------
 6 files changed, 107 insertions(+), 103 deletions(-)
 create mode 100644 docs/unittests.txt

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index fe601cbb1..54cedea28 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -1,28 +1,10 @@
 ##############################################################################
 # unittest configuration
 #
-# [unittest_name]
-# file = <name>.flat		# Name of the flat file to be used.
-# smp  = <num>			# Number of processors the VM will use
-#				# during this test. Use $MAX_SMP to use
-#				# the maximum the host supports. Defaults
-#				# to one.
-# extra_params = -append <params...>	# Additional parameters used.
-# arch = arm|arm64			# Select one if the test case is
-#					# specific to only one.
-# groups = <group_name1> <group_name2> ...	# Used to identify test cases
-#						# with run_tests -g ...
-#						# Specify group_name=nodefault
-#						# to have test not run by
-#						# default
-# accel = kvm|tcg		# Optionally specify if test must run with
-#				# kvm or tcg. If not specified, then kvm will
-#				# be used when available.
-# timeout = <duration>		# Optionally specify a timeout.
-# check = <path>=<value> # check a file for a particular value before running
-#                        # a test. The check line can contain multiple files
-#                        # to check separated by a space but each check
-#                        # parameter needs to be of the form <path>=<value>
+# arm specifics:
+#
+# file = <name>.flat            # arm uses .flat files
+# arch = arm|arm64
 ##############################################################################
 
 #
diff --git a/docs/unittests.txt b/docs/unittests.txt
new file mode 100644
index 000000000..53e02077c
--- /dev/null
+++ b/docs/unittests.txt
@@ -0,0 +1,89 @@
+unittests
+*********
+
+run_tests.sh is driven by the <arch>/unittests.cfg file. That file defines
+test cases by specifying an executable (target image) under the <arch>/
+directory, and how to run it. This way, for example, a single file can
+provide multiple test cases by being run with different host configurations
+and/or different parameters passed to it.
+
+Detailed output from run_tests.sh unit tests are stored in files under
+the logs/ directory.
+
+unittests.cfg format
+====================
+
+# is the comment symbol, all following contents of the line is ignored.
+
+Each unit test is defined as with a [unit-test-name] line, followed by
+a set of parameters that control how the test case is run. The name is
+arbitrary and appears in the status reporting output.
+
+Parameters appear on their own lines under the test name, and have a
+param = value format.
+
+Available parameters
+====================
+Note! Some parameters like smp and extra_params modify how a test is run,
+while others like arch and accel restrict the configurations in which the
+test is run.
+
+file
+----
+file = <filename>
+
+This parameter is mandatory and specifies which binary under the <arch>/
+directory to run. Typically this is <name>.flat or <name>.elf, depending
+on the arch. The directory name is not included, only the file name.
+
+arch
+----
+For <arch>/ directories that support multiple architectures, this restricts
+the test to the specified arch. By default, the test will run on any
+architecture.
+
+smp
+---
+smp = <number>
+
+Optional, the number of processors created in the machine to run the test.
+Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
+
+extra_params
+------------
+These are extra parameters supplied to the QEMU process. -append '...' can
+be used to pass arguments into the test case argv. Multiple parameters can
+be added, for example:
+
+extra_params = -m 256 -append 'smp=2'
+
+groups
+------
+groups = <group_name1> <group_name2> ...
+
+Used to group the test cases for the `run_tests.sh -g ...` run group
+option. Adding a test to the nodefault group will cause it to not be
+run by default.
+
+accel
+-----
+accel = kvm|tcg
+
+This restricts the test to the specified accelerator. By default, the
+test will run on either accelerator. (Note, the accelerator can be
+specified with ACCEL= environment variable, and defaults to KVM if
+available).
+
+timeout
+-------
+timeout = <duration>
+
+Optional timeout in seconds, after which the test will be killed and fail.
+
+check
+-----
+check = <path>=<<value>
+
+Check a file for a particular value before running a test. The check line
+can contain multiple files to check separated by a space, but each check
+parameter needs to be of the form <path>=<value>
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e65217c18..432c81d58 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -1,28 +1,9 @@
 ##############################################################################
 # unittest configuration
 #
-# [unittest_name]
-# file = <name>.flat		# Name of the flat file to be used.
-# smp  = <num>			# Number of processors the VM will use
-#				# during this test. Use $MAX_SMP to use
-#				# the maximum the host supports. Defaults
-#				# to one.
-# extra_params = -append <params...>	# Additional parameters used.
-# arch = ppc64				# Select one if the test case is
-#					# specific to only one.
-# groups = <group_name1> <group_name2> ...	# Used to identify test cases
-#						# with run_tests -g ...
-#						# Specify group_name=nodefault
-#						# to have test not run by
-#						# default
-# accel = kvm|tcg		# Optionally specify if test must run with
-#				# kvm or tcg. If not specified, then kvm will
-#				# be used when available.
-# timeout = <duration>		# Optionally specify a timeout.
-# check = <path>=<value> # check a file for a particular value before running
-#                        # a test. The check line can contain multiple files
-#                        # to check separated by a space but each check
-#                        # parameter needs to be of the form <path>=<value>
+# powerpc specifics:
+#
+# file = <name>.elf             # powerpc uses .elf files
 ##############################################################################
 
 #
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index 5a23bed9c..50c67e37f 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -1,28 +1,10 @@
 ##############################################################################
 # unittest configuration
 #
-# [unittest_name]
-# file = <name>.flat		# Name of the flat file to be used.
-# smp  = <num>			# Number of processors the VM will use
-#				# during this test. Use $MAX_SMP to use
-#				# the maximum the host supports. Defaults
-#				# to one.
-# extra_params = -append <params...>	# Additional parameters used.
-# arch = riscv32|riscv64		# Select one if the test case is
-#					# specific to only one.
-# groups = <group_name1> <group_name2> ...	# Used to identify test cases
-#						# with run_tests -g ...
-#						# Specify group_name=nodefault
-#						# to have test not run by
-#						# default
-# accel = kvm|tcg		# Optionally specify if test must run with
-#				# kvm or tcg. If not specified, then kvm will
-#				# be used when available.
-# timeout = <duration>		# Optionally specify a timeout.
-# check = <path>=<value> # check a file for a particular value before running
-#                        # a test. The check line can contain multiple files
-#                        # to check separated by a space but each check
-#                        # parameter needs to be of the form <path>=<value>
+# riscv specifics:
+#
+# file = <name>.flat            # riscv uses .flat files
+# arch = riscv32|risc64
 ##############################################################################
 
 [selftest]
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index d7bdcfa91..68a1c1464 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -1,21 +1,9 @@
 ##############################################################################
 # unittest configuration
 #
-# [unittest_name]
-# file = <name>.elf		# Name of the elf file to be used.
-# extra_params = -append <params...>	# Additional parameters used.
-# groups = <group_name1> <group_name2> ... # Used to identify test cases
-#					   # with run_tests -g ...
-#					   # Specify group_name=nodefault
-#					   # to have test not run by default
-# accel = kvm|tcg		# Optionally specify if test must run with
-#				# kvm or tcg. If not specified, then kvm will
-#				# be used when available.
-# timeout = <duration>		# Optionally specify a timeout.
-# check = <path>=<value> # check a file for a particular value before running
-#			 # a test. The check line can contain multiple files
-#			 # to check separated by a space but each check
-#			 # parameter needs to be of the form <path>=<value>
+# s390x specifics:
+#
+# file = <name>.elf             # s390x uses .elf files
 ##############################################################################
 
 [selftest-setup]
diff --git a/x86/unittests.cfg b/x86/unittests.cfg
index 124be7a1f..867a8ea2f 100644
--- a/x86/unittests.cfg
+++ b/x86/unittests.cfg
@@ -1,28 +1,10 @@
 ##############################################################################
 # unittest configuration
 #
-# [unittest_name]
-# file = <name>.flat		# Name of the flat file to be used.
-# smp  = <num>			# Number of processors the VM will use
-#				# during this test. Use $MAX_SMP to use
-#				# the maximum the host supports. Defaults
-#				# to one.
-# extra_params = -append <params...>	# Additional parameters used.
-# arch = i386|x86_64			# Select one if the test case is
-#					# specific to only one.
-# groups = <group_name1> <group_name2> ...	# Used to identify test cases
-#						# with run_tests -g ...
-#						# Specify group_name=nodefault
-#						# to have test not run by
-#						# default
-# accel = kvm|tcg		# Optionally specify if test must run with
-#				# kvm or tcg. If not specified, then kvm will
-#				# be used when available.
-# timeout = <duration>		# Optionally specify a timeout.
-# check = <path>=<value> # check a file for a particular value before running
-#                        # a test. The check line can contain multiple files
-#                        # to check separated by a space but each check
-#                        # parameter needs to be of the form <path>=<value>
+# x86 specifics:
+#
+# file = <name>.flat            # x86 uses .flat files
+# arch = i386|x86_64
 ##############################################################################
 
 [apic-split]
-- 
2.43.0

