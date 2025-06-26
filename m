Return-Path: <linuxppc-dev+bounces-9836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97734AEA3AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 18:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSkxg6Z6bz30Vf;
	Fri, 27 Jun 2025 02:42:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750956151;
	cv=none; b=d2f9rWmu3vwjUPHyjWVDiqnZTXdywIIcsP3yEN6pvATG1MI32lobu53awxu8RgWyCCV49utEdQhV4JxT5n3KTPLFuHf8JOJ3QD6kn7TjqeKo+f2N6J6DWru6UBe+Mbr3XXR3HpoGHZP8r8rDydp6virIdKmSXOD/EJ6xIUKld4yxkM2tGGSyyAdA6LoVdNuqSD1f39U8kjPbD5X7mHzCCRF4lwbFb//RsIu++qKD2sn2+d7/5Rz2PWpaEq8WTu+pRpYtOVhWCTUgQnRplcP4zFKgSTowqCZwz5yl0FLKo6puu80QYYR8iiyChU2fW+h237UrnDsNrQUBx1Wx8MZJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750956151; c=relaxed/relaxed;
	bh=zE++yYkzui2FWWVcnFjOVE1vAHF/LPi9JpEyqXXZrFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZKHcNZvPJavqeysvy8kvIkBUFIfN8DuU7u7XuhGvuZPoKD931LugxrZwBHbDIZRva3kqNGWvRuql+HvGyGNCl1NryLg7wkYt/mUtem2KTT+cR69IORe+v3G7dnodiSyP1ku0AeZk5f15X7jnCNYxU7fuy74ON4ZyaoBsdEUmle1OKtpSIIM5KV2piUZvkE0/w9bs8yxFuGUhqvVJ7LuTWxG8/83NLvw0fQF1NYaoo+sDbmBREvdQPeohdQtgLGtA98Zp49QqYPToxuPQw7vTZ444GLvj4XB3EJfHjN4wmWwQ1uvcb8mukB1KsSfpJNi6x5uKI/exUmObFbNnEBFGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LagSaL2S; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LagSaL2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSkxb3hznz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 02:42:26 +1000 (AEST)
Date: Thu, 26 Jun 2025 18:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750956124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zE++yYkzui2FWWVcnFjOVE1vAHF/LPi9JpEyqXXZrFo=;
	b=LagSaL2SZdqJBDNwQpUzO5Ai9oe7ZLfeIUqMPWjqfkqXIy7UXPyT6LcWqAD8ja4fjss1kN
	wnVcSTEHFJOGvtMi/Mj/kr2c+Ef0I+kmB7uQlaYl9XAjXwoC6IYzJTkBOAvza1sFnm6ai+
	EK0jP+scv3IuMjKy6oWqMsOE3wmN6G4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <20250626-f9239a18e811ef67ae5a9686@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> v3 can be found here [1]. Based on top of the series that add qemu_params and
> test_args [2].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to modify compared to qemu, which
> means developers may prefer it when adding or prototyping new features to
> KVM, and being able to run all the tests reliably and automatically is very
> useful.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.

Thanks for this Alex! I didn't test it on arm yet, but I did test it on
riscv with the quick patch below. It works great.

Applied to arm/queue

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/arm/queue

drew


diff --git a/README.md b/README.md
index 723ce04cd978..cbd8a9940ec4 100644
--- a/README.md
+++ b/README.md
@@ -65,8 +65,8 @@ or:
 
 to run them all.
 
-All tests can be run using QEMU. On arm and arm64, tests can also be run using
-kvmtool.
+All tests can be run using QEMU. On arm, arm64, riscv32, and riscv64 tests can
+also be run using kvmtool.
 
 By default the runner script searches for a suitable QEMU binary in the system.
 To select a specific QEMU binary though, specify the QEMU=path/to/binary
@@ -97,8 +97,7 @@ variable. kvmtool supports only kvm as the accelerator.
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
-On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
-tests under UEFI.
+This is only supported with QEMU; kvmtool cannot run the tests under UEFI.
 
 # Tests configuration file
 
diff --git a/configure b/configure
index 470f9d7cdb3b..4a9af4e0af30 100755
--- a/configure
+++ b/configure
@@ -90,7 +90,7 @@ usage() {
 	                           selects the best value based on the host system and the
 	                           test configuration.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
-	                           kvmtool, default is qemu) (arm/arm64 only)
+	                           kvmtool, default is qemu) (arm/arm64 and riscv32/riscv64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
 	    --cc=CC                c compiler to use ($cc)
 	    --cflags=FLAGS         extra options to be passed to the c compiler
@@ -284,7 +284,8 @@ fi
 if [ -z "$target" ]; then
     target="qemu"
 else
-    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
+    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ] &&
+       [ "$arch" != "riscv32" ] && [ "$arch" != "riscv64" ]; then
         echo "--target is not supported for $arch"
         usage
     fi
@@ -393,6 +394,10 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     testdir=riscv
     arch_libdir=riscv
     : "${uart_early_addr:=0x10000000}"
+    if [ "$target" != "qemu" ] && [ "$target" != "kvmtool" ]; then
+        echo "--target must be one of 'qemu' or 'kvmtool'!"
+        usage
+    fi
 elif [ "$arch" = "s390x" ]; then
     testdir=s390x
 else
@@ -519,7 +524,8 @@ EFI_DIRECT=$efi_direct
 CONFIG_WERROR=$werror
 GEN_SE_HEADER=$gen_se_header
 EOF
-if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
+if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] ||
+   [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     echo "TARGET=$target" >> config.mak
 fi
 
diff --git a/riscv/efi/run b/riscv/efi/run
index 5a72683a6ef5..b9b75440c659 100755
--- a/riscv/efi/run
+++ b/riscv/efi/run
@@ -11,6 +11,12 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/arch-run.bash
+source scripts/vmm.bash
+
+if [[ $(vmm_get_target) == "kvmtool" ]]; then
+	echo "kvmtool does not support EFI tests."
+	exit 2
+fi
 
 if [ -f RISCV_VIRT_CODE.fd ]; then
 	DEFAULT_UEFI=RISCV_VIRT_CODE.fd
diff --git a/riscv/run b/riscv/run
index 0f000f0d82c6..3c242923412c 100755
--- a/riscv/run
+++ b/riscv/run
@@ -10,35 +10,75 @@ if [ -z "$KUT_STANDALONE" ]; then
 	source scripts/vmm.bash
 fi
 
-# Allow user overrides of some config.mak variables
-mach=$MACHINE_OVERRIDE
-qemu_cpu=$TARGET_CPU_OVERRIDE
-firmware=$FIRMWARE_OVERRIDE
-
-: "${mach:=virt}"
-: "${qemu_cpu:=$TARGET_CPU}"
-: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
-: "${firmware:=$FIRMWARE}"
-[ "$firmware" ] && firmware="-bios $firmware"
-
-set_qemu_accelerator || exit $?
-[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
-acc="-accel $ACCEL$ACCEL_PROPS"
-
-qemu=$(search_qemu_binary) || exit $?
-if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
-	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
-	exit 2
-fi
-mach="-machine $mach"
+vmm_check_supported
 
-command="$qemu -nodefaults -nographic -serial mon:stdio"
-command+=" $mach $acc $firmware -cpu $qemu_cpu "
-command="$(migration_cmd) $(timeout_cmd) $command"
+function arch_run_qemu()
+{
+	# Allow user overrides of some config.mak variables
+	mach=$MACHINE_OVERRIDE
+	qemu_cpu=$TARGET_CPU_OVERRIDE
+	firmware=$FIRMWARE_OVERRIDE
 
-if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_test_status $command "$@"
-else
-	# We return the exit code via stdout, not via the QEMU return code
-	run_test_status $command -kernel "$@"
-fi
+	: "${mach:=virt}"
+	: "${qemu_cpu:=$TARGET_CPU}"
+	: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
+	: "${firmware:=$FIRMWARE}"
+	[ "$firmware" ] && firmware="-bios $firmware"
+
+	set_qemu_accelerator || exit $?
+	[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
+	acc="-accel $ACCEL$ACCEL_PROPS"
+
+	qemu=$(search_qemu_binary) || exit $?
+	if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
+		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
+		exit 2
+	fi
+	mach="-machine $mach"
+
+	command="$qemu -nodefaults -nographic -serial mon:stdio"
+	command+=" $mach $acc $firmware -cpu $qemu_cpu "
+	command="$(migration_cmd) $(timeout_cmd) $command"
+
+	if [ "$UEFI_SHELL_RUN" = "y" ]; then
+		ENVIRON_DEFAULT=n run_test_status $command "$@"
+	else
+		# We return the exit code via stdout, not via the QEMU return code
+		run_test_status $command -kernel "$@"
+	fi
+}
+
+function arch_run_kvmtool()
+{
+	local command
+
+	kvmtool=$(search_kvmtool_binary) ||
+		exit $?
+
+	if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
+		echo "kvmtool does not support $ACCEL" >&2
+		exit 2
+	fi
+
+	if ! kvm_available; then
+		echo "kvmtool requires KVM but not available on the host" >&2
+		exit 2
+	fi
+
+	command="$(timeout_cmd) $kvmtool run"
+	if [ "$HOST" = "riscv64" ] && [ "$ARCH" = "riscv32" ]; then
+		echo "Cannot run riscv32 on riscv64" >&2
+		exit 2
+	else
+		run_test_status $command --kernel "$@"
+	fi
+}
+
+case $(vmm_get_target) in
+qemu)
+	arch_run_qemu "$@"
+	;;
+kvmtool)
+	arch_run_kvmtool "$@"
+	;;
+esac

