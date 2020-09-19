Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4925270BBC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 10:11:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btk1v4DC1zDqfL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VliAdCAK; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtjwC1F2DzDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 18:06:49 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id b124so4953430pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9iH7lg3YkHOWr7NTqH/dXox+CFNwDp9U5uBDltp9opg=;
 b=VliAdCAKA8262/f1rFGSxP8xylGXaZO4FcA+nCHPcdNqzcUPuWcsjFUnaLb/PJdGDc
 77LDfBN6skG3zcIHXXKVxcVAm5eMB9le2+2lsMUje1wbpOCIZh2A4ZLSie9ILwBOpC9K
 4vvx0i4xKcWt+EOoZlwSsPar86nskR8syAyuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9iH7lg3YkHOWr7NTqH/dXox+CFNwDp9U5uBDltp9opg=;
 b=TSL9RqTwdlrLGY8RsiQnkjio/do3nneUitiDOtyMJTGxDN9wbdIAkTJnzCNLbmpFwL
 SB6Zk/Qr0j7AYC4gzMEne65phIX46CuiPmjFQUqvleElu2AMy7cG11ZnA7slG3MX5C6A
 6fACnwylM8khUrSMXO5oNyVlfPm+Iomd4a1mx/sg+IxUsfZdc32dl7G2nYCz4F1mVkSd
 ei1lhzAVq+x+n52Sys8H245HsKsDvgLmGYVqXpdQ8jFxRHAV04VpHmZFtn8eewOi1c0Q
 S6QNLPB1USXqJISzUqxGVWOa3G3y14nYQ0+EROe5h57uum0mXi/aQrW68TX1n7c4uH0I
 1N0A==
X-Gm-Message-State: AOAM532EAyKB5i538EPd9g0sVmqGqDZQOFrA5TSpA6Er+7cuKljQ03fC
 12jVvB+BPc59pYj1ewxvJysuUg==
X-Google-Smtp-Source: ABdhPJxqwI/NRVwSlA1Y4+c6UzNBZYDGK/U+ZUNMSqUez01WLw6CEsVrOzXeoFKh2YifcS+xdf+aPg==
X-Received: by 2002:aa7:87da:0:b029:13c:1611:66bf with SMTP id
 i26-20020aa787da0000b029013c161166bfmr35672458pfo.10.1600502806153; 
 Sat, 19 Sep 2020 01:06:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id gj6sm4896682pjb.10.2020.09.19.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:06:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] selftests/seccomp: Refactor change_syscall()
Date: Sat, 19 Sep 2020 01:06:33 -0700
Message-Id: <20200919080637.259478-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v1: https://lore.kernel.org/lkml/20200912110820.597135-1-keescook@chromium.org
v2:
- Took Acked patches into -next
- refactored powerpc syscall setting implementation
- refactored clone3 args implementation

Hi,

This finishes the refactoring of the seccomp selftest logic used in
for ptrace syscall number/return handling for powerpc. Additionally
fixes clone3 (which seccomp depends on for testing) to run under MIPS
where an old struct clone_args has become visible.

(FWIW, I expect to take these via the seccomp tree.)

Thanks,

Kees Cook (4):
  selftests/seccomp: Record syscall during ptrace entry
  selftests/seccomp: Allow syscall nr and ret value to be set separately
  selftests/seccomp: powerpc: Set syscall return during ptrace syscall
    exit
  selftests/clone3: Avoid OS-defined clone_args

 tools/testing/selftests/clone3/clone3.c       |  45 +++----
 .../clone3/clone3_cap_checkpoint_restore.c    |   4 +-
 .../selftests/clone3/clone3_clear_sighand.c   |   2 +-
 .../selftests/clone3/clone3_selftests.h       |  24 ++--
 .../testing/selftests/clone3/clone3_set_tid.c |   4 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 120 ++++++++++++++----
 6 files changed, 131 insertions(+), 68 deletions(-)

-- 
2.25.1

