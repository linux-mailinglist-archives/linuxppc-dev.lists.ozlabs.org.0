Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F06F36B259
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 13:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTN470NVKz2yys
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 21:30:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=coA7t6ZU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=maennich@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=coA7t6ZU; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTLRh6QQMz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 20:17:17 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id n127so17858018wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 03:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8+5RmGaKx5Tt6qhKXUKXBTfFBE8HCr3VUmHINr25V7Q=;
 b=coA7t6ZU+3D3rzonl2MD8DtCSIxY3Bhr4uKsu96mtDdzfd1ReGK6wCZtVh38ADMexc
 h0iVGJEbrn8P6LyrozH4sDaKslxXLK0zCaGUMo+2rH5MQkagWl25RZRfRiQ64WRP6j8Z
 S5BMEvU9z3yuqIaqKcSwNUSWYp8KvdUTE/q5unzz04xJK+hpibQiiS3sL7aRWXrgqXa7
 rz7Mm1vD68LG1OBJeXHCGzk+Cafabfw0o6DCvXYZ60tdQ2uzZXztGBnggqfYRT9S2QQv
 fO5Iq5fyEsYMu54iVrhMLQty7HKqWSkdq8XmUOL4gMGVdswNg6+e71e996Lm3mlZZFJP
 Bx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8+5RmGaKx5Tt6qhKXUKXBTfFBE8HCr3VUmHINr25V7Q=;
 b=fnF/HNBSjEkbQvfFHCLGoqsEFUboqo8H5vGpDDlLCtrgq8pDDEqrcYDtLPn0Zvn6SR
 2FhLM6oNB3HvL/ebf21xOnt72k2LvBiOC0DhDYTPPh0F793bhZMVOfOFZAc4xrUkJkiS
 8W80th87AgDqUqxzE3Uh0EguNJd6koMklXYzy6HshMe5BmBjr2vIrH4qi9iBh+/Qqy5Q
 w0MwGCwrzWRzHu0DESRVuSx0FkIFO0xLVbHGUh9rkzpxnfsJ/5784MyKB4bNxmRqwYCE
 VtFUWRJB4/wMS2sKUV8EIpC6YQ7OdeEzvkQZ4Ordlw4DYwKFoqJfaScvNnCW0DS9m+UE
 +PZw==
X-Gm-Message-State: AOAM532Ws6uSGl/WfhCF0dt13LN82d0Jxa4KtPZs7s8hXceng7IySoOW
 HVVPIbmZqUmmkEBpvX2dIxajHw==
X-Google-Smtp-Source: ABdhPJwYsZ5Bdm0jMDlAvLoRue+X2IuYqd6A0q8UkP92NgRfMr63EtUQ2jnm3b8u++7Sr4Bji8w4vg==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr20538092wmb.27.1619432229857; 
 Mon, 26 Apr 2021 03:17:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:de72:8b77:f30e:ff1e])
 by smtp.gmail.com with ESMTPSA id a2sm20837694wrt.82.2021.04.26.03.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 03:17:09 -0700 (PDT)
Date: Mon, 26 Apr 2021 11:17:08 +0100
From: Matthias Maennich <maennich@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: replace LANG=C with LC_ALL=C
Message-ID: <YIaTJE5iZ75eGSSO@google.com>
References: <20210424114841.394239-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210424114841.394239-1-masahiroy@kernel.org>
X-Mailman-Approved-At: Mon, 26 Apr 2021 21:30:07 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 linux-kernel@vger.kernel.org, mptcp@lists.01.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, netdev@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 24, 2021 at 08:48:41PM +0900, Masahiro Yamada wrote:
>LANG gives a weak default to each LC_* in case it is not explicitly
>defined. LC_ALL, if set, overrides all other LC_* variables.
>
>  LANG  <  LC_CTYPE, LC_COLLATE, LC_MONETARY, LC_NUMERIC, ...  <  LC_ALL
>
>This is why documentation such as [1] suggests to set LC_ALL in build
>scripts to get the deterministic result.
>
>LANG=C is not strong enough to override LC_* that may be set by end
>users.
>
>[1]: https://reproducible-builds.org/docs/locales/
>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
>
> arch/powerpc/boot/wrapper                          | 2 +-
> scripts/nsdeps                                     | 2 +-
> scripts/recordmcount.pl                            | 2 +-
> scripts/setlocalversion                            | 2 +-
> scripts/tags.sh                                    | 2 +-
> tools/testing/selftests/net/mptcp/mptcp_connect.sh | 2 +-
> usr/gen_initramfs.sh                               | 2 +-
> 7 files changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>index 41fa0a8715e3..cdb796b76e2e 100755
>--- a/arch/powerpc/boot/wrapper
>+++ b/arch/powerpc/boot/wrapper
>@@ -191,7 +191,7 @@ if [ -z "$kernel" ]; then
>     kernel=vmlinux
> fi
>
>-LANG=C elfformat="`${CROSS}objdump -p "$kernel" | grep 'file format' | awk '{print $4}'`"
>+LC_ALL=C elfformat="`${CROSS}objdump -p "$kernel" | grep 'file format' | awk '{print $4}'`"
> case "$elfformat" in
>     elf64-powerpcle)	format=elf64lppc	;;
>     elf64-powerpc)	format=elf32ppc	;;
>diff --git a/scripts/nsdeps b/scripts/nsdeps
>index e8ce2a4d704a..04c4b96e95ec 100644
>--- a/scripts/nsdeps
>+++ b/scripts/nsdeps
>@@ -44,7 +44,7 @@ generate_deps() {
> 		for source_file in $mod_source_files; do
> 			sed '/MODULE_IMPORT_NS/Q' $source_file > ${source_file}.tmp
> 			offset=$(wc -l ${source_file}.tmp | awk '{print $1;}')
>-			cat $source_file | grep MODULE_IMPORT_NS | LANG=C sort -u >> ${source_file}.tmp
>+			cat $source_file | grep MODULE_IMPORT_NS | LC_ALL=C sort -u >> ${source_file}.tmp
> 			tail -n +$((offset +1)) ${source_file} | grep -v MODULE_IMPORT_NS >> ${source_file}.tmp
> 			if ! diff -q ${source_file} ${source_file}.tmp; then
> 				mv ${source_file}.tmp ${source_file}
>diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
>index 867860ea57da..0a7fc9507d6f 100755
>--- a/scripts/recordmcount.pl
>+++ b/scripts/recordmcount.pl
>@@ -497,7 +497,7 @@ sub update_funcs
> #
> # Step 2: find the sections and mcount call sites
> #
>-open(IN, "LANG=C $objdump -hdr $inputfile|") || die "error running $objdump";
>+open(IN, "LC_ALL=C $objdump -hdr $inputfile|") || die "error running $objdump";
>
> my $text;
>
>diff --git a/scripts/setlocalversion b/scripts/setlocalversion
>index bb709eda96cd..db941f6d9591 100755
>--- a/scripts/setlocalversion
>+++ b/scripts/setlocalversion
>@@ -126,7 +126,7 @@ scm_version()
> 	fi
>
> 	# Check for svn and a svn repo.
>-	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
>+	if rev=$(LC_ALL=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
> 		rev=$(echo $rev | awk '{print $NF}')
> 		printf -- '-svn%s' "$rev"
>
>diff --git a/scripts/tags.sh b/scripts/tags.sh
>index fd96734deff1..db8ba411860a 100755
>--- a/scripts/tags.sh
>+++ b/scripts/tags.sh
>@@ -326,5 +326,5 @@ esac
>
> # Remove structure forward declarations.
> if [ -n "$remove_structs" ]; then
>-    LANG=C sed -i -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' $1
>+    LC_ALL=C sed -i -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' $1
> fi
>diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.sh b/tools/testing/selftests/net/mptcp/mptcp_connect.sh
>index 10a030b53b23..1d2a6e7b877c 100755
>--- a/tools/testing/selftests/net/mptcp/mptcp_connect.sh
>+++ b/tools/testing/selftests/net/mptcp/mptcp_connect.sh
>@@ -273,7 +273,7 @@ check_mptcp_disabled()
> 	ip netns exec ${disabled_ns} sysctl -q net.mptcp.enabled=0
>
> 	local err=0
>-	LANG=C ip netns exec ${disabled_ns} ./mptcp_connect -t $timeout -p 10000 -s MPTCP 127.0.0.1 < "$cin" 2>&1 | \
>+	LC_ALL=C ip netns exec ${disabled_ns} ./mptcp_connect -t $timeout -p 10000 -s MPTCP 127.0.0.1 < "$cin" 2>&1 | \
> 		grep -q "^socket: Protocol not available$" && err=1
> 	ip netns delete ${disabled_ns}
>
>diff --git a/usr/gen_initramfs.sh b/usr/gen_initramfs.sh
>index 8ae831657e5d..63476bb70b41 100755
>--- a/usr/gen_initramfs.sh
>+++ b/usr/gen_initramfs.sh
>@@ -147,7 +147,7 @@ dir_filelist() {
> 	header "$1"
>
> 	srcdir=$(echo "$1" | sed -e 's://*:/:g')
>-	dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | LANG=C sort)
>+	dirlist=$(find "${srcdir}" -printf "%p %m %U %G\n" | LC_ALL=C sort)
>
> 	# If $dirlist is only one line, then the directory is empty
> 	if [  "$(echo "${dirlist}" | wc -l)" -gt 1 ]; then
>-- 
>2.27.0
>
