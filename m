Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E009F87F8F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:09:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cAJLoN50;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPX84YLdz2yt0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:09:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cAJLoN50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKP6p2wz3vYN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:25 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2228c3ffcbdso1445595fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835223; x=1711440023; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dYKloMaVNRA1K0WdUqfNiU807y8A/fMNA27ThMkpH8=;
        b=cAJLoN50CtqtGiX4Loh7rO+0ECMPO9z3FxGq/xBniTma4K4QHm1r+ujr2rI9ubOnsd
         YIqVAB2gTZ9O99L4yRqG2UrMxKcUq/hRuNujAvloG5ELPaqigSiocOJDLK22WzHN4Lvp
         6Lub0z9bf3VBx1+JaXPXhorNeIhdV8j9I+eAk4V2Kjgx6yqvN0CllB84gon5xuPIS2Zs
         fLc7IPgy/Nzsj/XaM77wlkl94fNcJ+PWp5ImL/8VHtXQjbWTfA5QET+88YjfcltzSkKN
         BRwFuP5ynbj0D0rjYJvJebzpJ+c7cyhtzGH9QVr0Jy0X4ILUYUcr56iZ0YaL/Z8IvG3A
         xErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835223; x=1711440023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dYKloMaVNRA1K0WdUqfNiU807y8A/fMNA27ThMkpH8=;
        b=Imcc9xS0UeF7GMgm5fRRJluuiHWuO7tBjXdwY9082ge7EhzPBx/X2BJoVygMt0PY6E
         VudRrP3KXTRJ9xOZwd/NGbFQLNDkPnKliScd771RvkHVlXUO7bV3d5CMOTm69MyslYF/
         2Izo+h3fKXr5zCjl9MQLAcsjxFekkwApaykAK0hLNqP11L0zNaRSPA5Z/Zakc/0/KxDE
         DWwpgRzUXuEPiUW2P+qnEyw+0nhyI/F+72p73m62RqyIwxQYeTHNnQ5f0B+Dm/7rvdk/
         8aDLtJIkWfela5AaGOmzfafpWdGQ6kqGWJDkMVlC3xeZWov3xXOa/KlFLzMepBEsbApS
         L+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXDJY2sH0Yam7JliPH2kvmrGIL/RsOTNMskv90XvriPFEYcMrYlltITOmWSd2J7HKezHd+mF45qqYNmUCkxz4RAuOIHndYn5dLGrdMs6g==
X-Gm-Message-State: AOJu0Yxxd5YPX3x7YyVMYBbqB2fbKlEj89p8j+JJS3rn1ukjvHWM46S5
	0wzzWaBfiObtQP6Z2IcohU4qmkr5P39YmxUiEwbDkHg1RxaLvslX
X-Google-Smtp-Source: AGHT+IEUonzbDLFfzykkcQwpnCF2OnRoX6IIO7f1kwVSXYK0lVTHuWmBwNyL1fdxb0nxoRNutxc8cA==
X-Received: by 2002:a05:6870:84cb:b0:21e:b8f7:9a1b with SMTP id l11-20020a05687084cb00b0021eb8f79a1bmr13865746oak.25.1710835223042;
        Tue, 19 Mar 2024 01:00:23 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 13/35] doc: start documentation directory with unittests.cfg doc
Date: Tue, 19 Mar 2024 17:59:04 +1000
Message-ID: <20240319075926.2422707-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
index 550eff787..d6abf72f3 100644
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
2.42.0

