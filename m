Return-Path: <linuxppc-dev+bounces-6219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F627A37563
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 17:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YwrHW3B24z2y34;
	Mon, 17 Feb 2025 03:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739707360;
	cv=none; b=lexGtAtYAdLWfFuqrQ/4StPuF2syJXowP4w2+vFIDtgLXaiC1Xp3DsMUIp4vrc+JZfX+7ampFdoshdo35ip4auhJvhZ+A8f8pImeIqMQUyaBlukNHauoR4HzK/pindSRhJqkAR/r+zWF7gxpk9gF8lKcHI9gdgxAbAc3IL3R6ypSRufW+W7uctGwYdT5uS+GB73OXyVeFftqtnIsXaXWsqz9sxCq4CUM8lZl6SPNqkgLBp3a9uicS33QhdG+ppqaVAggzWvRUJkvE1TTGsKs2DXGkaJoCqwdLbcge4tM22RNmrw0xWEPF2R1nFRejiNld8aFbkfkgmPAzSgCTBQZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739707360; c=relaxed/relaxed;
	bh=82WigbKU8K6bF5i7jEXR0EoBUFDRYWWxYd/tjoD8mAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C29EJjiGCe7hLPMsrB8W7sYREiSKsw/HycHEvIVAOVXmQykpOQLRb2qMemRmXKqOf4TWtqRB58dap7KD2l3rKzJh855/GaXII39EJLDGGUjh58kPaGmsldz2b9v/6d4Rht+9UbOWZNOHLM7MaHpnzm6ppVoK/i9DYwkU/OReMxDMs4Umxx+QgqDGjlnw6s39rqjK4mnpUcXMB4W3PGQc15p6amhzw12LiEJOk75Id3pkLjfdmRSPmILY16PXa5wdh7jvFKJVu0AdrxqhBiZZkLyQa94/8jU1uaUpj4KsYqpQK87oUtDA/z6ugfQCc6yYg6X/Sk/EutYdT9SEEf1fbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WOkWgfkS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=duttaditya18@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WOkWgfkS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=duttaditya18@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ywktl2PrSz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 23:02:38 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e6028214so53251835ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2025 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739707355; x=1740312155; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=82WigbKU8K6bF5i7jEXR0EoBUFDRYWWxYd/tjoD8mAs=;
        b=WOkWgfkSFIVKXnm55EU1o4JiSD9IOWcj1xDwjNMBbXyrJncETwJmW+FZ8Wg7hlxwkO
         levkS6PwJJJDDfIiU+BPLf5WdbBfjAnW56QzIkRjQM00gdCK9pZf86hDLRE1hIiCd4C+
         j9lBI4hZeqc4IwI2eepQX9N71hxASaZShT/tKGWgUd1BpZegFujZG8dEIiq4NPpG/Y+4
         3YnvPAdA2zowbBZqohqFLR7LcRJcIZQr4k1X+2ZCmlcgpSHSY4/No1ESss3WHxMsgwSg
         UOER1D8s1KEGKkvLLyOtVx+43cRVS4L6StI+DK54/X8myAZfDRfnlgLvcFymnU1FyanW
         wSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739707355; x=1740312155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82WigbKU8K6bF5i7jEXR0EoBUFDRYWWxYd/tjoD8mAs=;
        b=jVOgyZ7fHBWHXK8a+9sGreZQidazBT8kw7Mhuq4XAXDo6RrjGH0FvMJ5XxlsCDWLvb
         TQuz3SL3U4bLNepcnd3aorJP7ovzUQJRM1DXtzG57GKiBpJqufGk5vcY3j7bzPKbvhZ4
         rpihUZNybLJ53ImJDl/Qawg+HWQpd3hee+WX9Q5WrsafWRnMnZQA/BQUwSe0L0ONK0to
         BcE6u3OIj194xZoFSHbnpwWTDcCli2F21qGFMGLsI+sG9oltCyYVzs7eZIABtkZbpbba
         hAmMhP0SHfS9T79DSVmUV2+xhXqxVFOLKr58oo8qlTlkY6l7PI597JG6h3snHjlsxnqa
         P2kg==
X-Forwarded-Encrypted: i=1; AJvYcCUEZbrOGkYkczxXLPfwW+UK8KcXcgp/i9SsXbBcgVHVu4jZozsEbz7QRccZ558UXyYUswZc/p8jolIX0Sk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQoKS40Utkxub/xzUXNGV6r3W82bknR1M1aunLMlGLDoQAygOn
	9smEYpAV7Z8TMr2q6WN7/YhLWibJ+4ItBJGYhr65JfmNNKTAP15k
X-Gm-Gg: ASbGnctMZFxjuRXOgUgcUhU7H3GxQdQOuTdGK/cDke+wj75RWMuiXL58rPzuSj2f6JE
	6hd0Dj9VWSZYVoUeu1hqdJ39T1IGy3JrpiwLtbTJZWobZXCdndMSebcoSK5ck2jxX2brnEnMRfG
	t+dmmAy741sgvSjNyyf6VJkRtAEhanwPMqS+m/83wOWvWpqVrE2Ob5AKM5KCg4iVXtIWgtjc4LI
	sGoNgSJ/vgoQ0Z7KcIMU5qI6ch7AYf68y2RDJKAWki5wLheFQsiayT9x7kJF3cgOdoUJMIok5Xm
	pT72KOUQ5CpyvF+mnLo=
X-Google-Smtp-Source: AGHT+IErcCjOiHya8dVFasaPJCiSrh08Dpt+kq1hL0br1lZQvSwuAwOU/Wv3CBTQ2n9JWQBjRD9s0w==
X-Received: by 2002:a05:6a21:6b05:b0:1ed:e7cc:ee89 with SMTP id adf61e73a8af0-1ee8cc0335fmr10408406637.26.1739707355394;
        Sun, 16 Feb 2025 04:02:35 -0800 (PST)
Received: from pop-os.. ([2401:4900:65bb:caef:d8d2:fa8c:9c6d:c932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324256896csm6181753b3a.40.2025.02.16.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:02:34 -0800 (PST)
From: Aditya Dutt <duttaditya18@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Aditya Dutt <duttaditya18@gmail.com>
Subject: [PATCH] selftests: make shell scripts POSIX-compliant
Date: Sun, 16 Feb 2025 17:32:25 +0530
Message-Id: <20250216120225.324468-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes include:
- Replaced [[ ... ]] with [ ... ]
- Replaced == with =
- Replaced printf -v with cur=$(printf ...).
- Replaced echo -e with printf "%b\n" ...

The above mentioned are Bash/GNU extensions and are not part of POSIX.
Using shells like dash or non-GNU coreutils may produce errors.
They have been replaced with POSIX-compatible alternatives.

Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---

I have made sure to only change the files that specifically have the
/bin/sh shebang.
I have referred to https://mywiki.wooledge.org/Bashism for information
on what is and what isn't POSIX-compliant.

 tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh   | 10 +++++-----
 tools/testing/selftests/kexec/kexec_common_lib.sh     |  2 +-
 tools/testing/selftests/kexec/test_kexec_file_load.sh |  2 +-
 tools/testing/selftests/net/veth.sh                   | 10 +++++-----
 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh   |  2 +-
 tools/testing/selftests/zram/zram_lib.sh              |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
index 3f45512fb512..00416248670f 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_v1_hp.sh
@@ -11,24 +11,24 @@ skip_test() {
 	exit 4 # ksft_skip
 }
 
-[[ $(id -u) -eq 0 ]] || skip_test "Test must be run as root!"
+[ $(id -u) -eq 0 ] || skip_test "Test must be run as root!"
 
 # Find cpuset v1 mount point
 CPUSET=$(mount -t cgroup | grep cpuset | head -1 | awk -e '{print $3}')
-[[ -n "$CPUSET" ]] || skip_test "cpuset v1 mount point not found!"
+[ -n "$CPUSET" ] || skip_test "cpuset v1 mount point not found!"
 
 #
 # Create a test cpuset, put a CPU and a task there and offline that CPU
 #
 TDIR=test$$
-[[ -d $CPUSET/$TDIR ]] || mkdir $CPUSET/$TDIR
+[ -d $CPUSET/$TDIR ] || mkdir $CPUSET/$TDIR
 echo 1 > $CPUSET/$TDIR/cpuset.cpus
 echo 0 > $CPUSET/$TDIR/cpuset.mems
 sleep 10&
 TASK=$!
 echo $TASK > $CPUSET/$TDIR/tasks
 NEWCS=$(cat /proc/$TASK/cpuset)
-[[ $NEWCS != "/$TDIR" ]] && {
+[ $NEWCS != "/$TDIR" ] && {
 	echo "Unexpected cpuset $NEWCS, test FAILED!"
 	exit 1
 }
@@ -38,7 +38,7 @@ sleep 0.5
 echo 1 > /sys/devices/system/cpu/cpu1/online
 NEWCS=$(cat /proc/$TASK/cpuset)
 rmdir $CPUSET/$TDIR
-[[ $NEWCS != "/" ]] && {
+[ $NEWCS != "/" ] && {
 	echo "cpuset $NEWCS, test FAILED!"
 	exit 1
 }
diff --git a/tools/testing/selftests/kexec/kexec_common_lib.sh b/tools/testing/selftests/kexec/kexec_common_lib.sh
index 641ef05863b2..b65616ea67f8 100755
--- a/tools/testing/selftests/kexec/kexec_common_lib.sh
+++ b/tools/testing/selftests/kexec/kexec_common_lib.sh
@@ -96,7 +96,7 @@ get_secureboot_mode()
 	local secureboot_mode=0
 	local system_arch=$(get_arch)
 
-	if [ "$system_arch" == "ppc64le" ]; then
+	if [ "$system_arch" = "ppc64le" ]; then
 		get_ppc64_secureboot_mode
 		secureboot_mode=$?
 	else
diff --git a/tools/testing/selftests/kexec/test_kexec_file_load.sh b/tools/testing/selftests/kexec/test_kexec_file_load.sh
index c9ccb3c93d72..072e03c8b1c3 100755
--- a/tools/testing/selftests/kexec/test_kexec_file_load.sh
+++ b/tools/testing/selftests/kexec/test_kexec_file_load.sh
@@ -226,7 +226,7 @@ get_secureboot_mode
 secureboot=$?
 
 # Are there pe and ima signatures
-if [ "$(get_arch)" == 'ppc64le' ]; then
+if [ "$(get_arch)" = 'ppc64le' ]; then
 	pe_signed=0
 else
 	check_for_pesig
diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 6bb7dfaa30b6..e86f102f9028 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -137,7 +137,7 @@ __change_channels()
 	local i
 
 	while true; do
-		printf -v cur '%(%s)T'
+		cur=$(printf '%(%s)T')
 		[ $cur -le $end ] || break
 
 		for i in `seq 1 $CPUS`; do
@@ -157,7 +157,7 @@ __send_data() {
 	local end=$1
 
 	while true; do
-		printf -v cur '%(%s)T'
+		cur=$(printf '%(%s)T')
 		[ $cur -le $end ] || break
 
 		ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 1000 -M 300 -D $BM_NET_V4$DST
@@ -166,7 +166,7 @@ __send_data() {
 
 do_stress() {
 	local end
-	printf -v end '%(%s)T'
+	cur=$(printf '%(%s)T')
 	end=$((end + $STRESS))
 
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 3 tx 3
@@ -198,8 +198,8 @@ do_stress() {
 
 usage() {
 	echo "Usage: $0 [-h] [-s <seconds>]"
-	echo -e "\t-h: show this help"
-	echo -e "\t-s: run optional stress tests for the given amount of seconds"
+	printf "%b\n" "\t-h: show this help"
+	printf "%b\n" "\t-s: run optional stress tests for the given amount of seconds"
 }
 
 STRESS=0
diff --git a/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
index 874c11953bb6..18fdf88936f0 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
@@ -36,7 +36,7 @@ done
 
 eeh_disable_vfs
 
-if [ "$tested" == 0 ] ; then
+if [ "$tested" = 0 ] ; then
 	echo "No VFs with EEH aware drivers found, skipping"
 	exit $KSELFTESTS_SKIP
 fi
diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..923dbeb64eaf 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -37,7 +37,7 @@ kernel_gte()
 
 	if [ $kernel_major -gt $major ]; then
 		return 0
-	elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
+	elif [ $kernel_major -eq $major && $kernel_minor -ge $minor ]; then
 		return 0
 	fi
 
-- 
2.34.1


