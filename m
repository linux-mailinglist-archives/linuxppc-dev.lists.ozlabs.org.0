Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9D1F635F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 10:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jGpd18CwzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 18:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MEbAXRgO; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jGml4VR8zDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 18:12:21 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id p5so5124997wrw.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 01:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUiKHVOoF7ZJ8wmYqv/EYMT0xBNo94MONSSmPtqQvA4=;
 b=MEbAXRgO0MQVR2F0fIZQNqz2FB/AJS6wntOpGny86mtKUPRYnONkoxK6UM09b2jFOq
 Mw2MQLsYe6hsesCsJutBua51Te81CgWQOsvxX00UbHsLcNF7Id3vIPPHoXkLd1GZs3YO
 KBGnBH45D2lhJQ/5YSlw+p4ofvZab94WQfkmWjpJL5Pvv8uA5CswRQj60eKBBEFbngmF
 t2xV91VrgKR4M8vk2vHL4Xyw9NR0JUdTIKbJzLp5MHEfpZJNY5ewscz7HcCWzelvWm7C
 TohzWS8wwx2UbEp3v8sosGgOdwu5gdR8E5lTVydIdv5yLwCiDs8vOsORtmT9rzgHUu+g
 dsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kUiKHVOoF7ZJ8wmYqv/EYMT0xBNo94MONSSmPtqQvA4=;
 b=K209MFUQjYPsMT2DoNlwsrztNXmIYgBrfNILyWDdUh/wekgAHRqFcnyB2Tjc8ntHqI
 5KRZZnTryIR+QQEmF27wp1RLqTRn0viBTYstiHIZdf4PV1yDfEpbQ3G1ijRg0kgsQRYb
 TnussDTX0IyWuCAnaam/i1y0Zfp8hNpBqZo/5cabBt5jeFg9NUBUlHLqP/YBs5jF8cns
 rrHNPx0RfOpn1RSSV2z0S0vozFFSdneSLwfVj4lHD0m6m5c3jQlvqhJoygax3RWvVRwM
 7qx5SFCt7AaLD3k/ipLv9Ns4o2T1N50+mloTL6kcQkSfC4nc/x1i0EEi3GZpwMvB6EV+
 wbyw==
X-Gm-Message-State: AOAM5331uTAK/jE3EYqnjCakiy/dgY9ImuL5sbWGV7womTDe29J44+FU
 LZmDM5XLOqeMarrA6LNXS4n5foIx
X-Google-Smtp-Source: ABdhPJzW2MewmfkeF39bRIJHVdmLK2NgXFIW32JkzPi0SIpm3PlmXIMuGPVl4AQ6q8FKsAidHGFkpg==
X-Received: by 2002:adf:fd4f:: with SMTP id h15mr8051524wrs.397.1591863136557; 
 Thu, 11 Jun 2020 01:12:16 -0700 (PDT)
Received: from bobo.ibm.com (193-116-110-116.tpgi.com.au. [193.116.110.116])
 by smtp.gmail.com with ESMTPSA id w17sm3604826wra.71.2020.06.11.01.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:12:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Linux powerpc new system call instruction and ABI
Date: Thu, 11 Jun 2020 18:12:01 +1000
Message-Id: <20200611081203.995112-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: libc-dev@lists.llvm.org, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks to everyone who has given feedback on the proposed new system
call instruction and ABI, I think it has reached agreement and the
implementation can be merged into Linux.

I have a hacked glibc implementation (that doesn't do all the right
HWCAP detection and misses a few things) that I've tested several things
including some kernel selftests (involving signals and syscalls) with.

System Call Vectored (scv) ABI
==============================

The scv instruction is introduced with POWER9 / ISA3, it comes with an
rfscv counter-part. The benefit of these instructions is performance
(trading slower SRR0/1 with faster LR/CTR registers, and entering the
kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR 
updates. The scv instruction has 128 levels (not enough to cover the Linux
system call space).

Assignment and advertisement
----------------------------
The proposal is to assign scv levels conservatively, and advertise them
with HWCAP feature bits as we add support for more.

Linux has not enabled FSCR[SCV] yet, so executing the scv instruction will
cause the kernel to log a "SCV facility unavilable" message, and deliver a
SIGILL with ILL_ILLOPC to the process. Linux has defined a HWCAP2 bit
PPC_FEATURE2_SCV for SCV support, but does not set it.

This change allocates the zero level ('scv 0'), advertised with
PPC_FEATURE2_SCV, which will be used to provide normal Linux system
calls (equivalent to 'sc').

Attempting to execute scv with other levels will cause a SIGILL to be
delivered the same as before, but will not log a "SCV facility unavailable"
message (because the processor facility is enabled).

Calling convention
------------------
The proposal is for scv 0 to provide the standard Linux system call ABI 
with the following differences from sc convention[1]:

- lr is to be volatile across scv calls. This is necessary because the 
  scv instruction clobbers lr. From previous discussion, this should be 
  possible to deal with in GCC clobbers and CFI.

- cr1 and cr5-cr7 are volatile. This matches the C ABI and would allow the
  kernel system call exit to avoid restoring the volatile cr registers
  (although we probably still would anyway to avoid information leaks).

- Error handling: The consensus among kernel, glibc, and musl is to move to
  using negative return values in r3 rather than CR0[SO]=1 to indicate error,
  which matches most other architectures, and is closer to a function call.

Notes
-----
- r0,r4-r8 are documented as volatile in the ABI, but the kernel patch as
  submitted currently preserves them. This is to leave room for deciding
  which way to go with these. Some small benefit was found by preserving
  them[1] but I'm not convinced it's worth deviating from the C function
  call ABI just for this. Release code should follow the ABI.

Previous discussions:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/208691.html
https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/209268.html

[1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/syscall64-abi.rst
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-April/209263.html

The following patches to add scv support to Linux are posted to

 https://lists.ozlabs.org/pipermail/linuxppc-dev/

Nicholas Piggin (2):
  powerpc/64s/exception: treat NIA below __end_interrupts as soft-masked
  powerpc/64s: system call support for scv/rfscv instructions

Thanks,
Nick

-- 
2.23.0

