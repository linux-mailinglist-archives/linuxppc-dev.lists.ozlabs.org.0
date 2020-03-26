Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BE194995
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 21:53:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pHJC0vH9zDr3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 07:53:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--courbet.bounces.google.com
 (client-ip=2a00:1450:4864:20::34a; helo=mail-wm1-x34a.google.com;
 envelope-from=3wqj8xgckdisr396qt8v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--courbet.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cz8v/be9; dkim-atps=neutral
Received: from mail-wm1-x34a.google.com (mail-wm1-x34a.google.com
 [IPv6:2a00:1450:4864:20::34a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p4Ky0gM5zDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:38:54 +1100 (AEDT)
Received: by mail-wm1-x34a.google.com with SMTP id w12so2112266wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=8yqBrfdJM+UOOeS4se8770yNMpiUTGHQoT5T8DP4qB8=;
 b=cz8v/be9ZLdMPE+hQeq2vnACmD7uqiN8Lq6TKluF0QZdRurVUMGO/Nkjigif91QwY5
 3olUJsW79QJtQwo5MICQlAayampaZfYhnd5DOxSPhJlu6zUUdJM4An/CEtBX5syjwFrG
 bFnI62fgBXnQKzFiADNm0p+P0J0/oahYLaUiZInfTgRUpLv+HtnQmtyNYbeQ+PWoZQQK
 IYDBtpV7vZAFYxyrL9CbgSFM7vWPsht7QzsRMnfxoDLktjlvax679zqjDQ4VWW+T+eBz
 0A3H7eBt/5Jv9KIkWdE4h5ZCPUq39MtsDrxg0UgLD53g4NY0vJV698NDiz7G7dKZr725
 4Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=8yqBrfdJM+UOOeS4se8770yNMpiUTGHQoT5T8DP4qB8=;
 b=FoaxnSgXM5LdmXG+b7GxaTAHG3Dvgdv5kVUyE4MqIANsQTZjo+iNCllgKbN7qfdehW
 fdn2ZQqORVFdmx2d0DCHKYg98hBYHPqACcyxvhL/BqqI0Zvol6SLIpb4l4PSIkHO4CeC
 8mVmtMym2nKVGPtyHhYZWTxWECk3iHjWFn6rbfxZBfxO1JcDIR2Femz8ayYykZCfRBta
 Yr6CM46KPRKGAm92xH2xYILhfeTcVPoauUqAa3bMr0DyXN1NBoBWJOjjlBKSN2LFcC6L
 mDxvDfEoAcoc0jTjjKYtpouPCApWg4FSfx+zDInnvZQxlyazAzcwWAG7HJtHE7PWwrm2
 GSaA==
X-Gm-Message-State: ANhLgQ2Ke+JuND6RokJnUk4QaeY16GyoNIt6PWUNh8QVdGEDQUuc/K9V
 zZ6v89lcDFwg3bJR6MU/lupf8QJGR4bj
X-Google-Smtp-Source: ADFU+vtfeWdsMSn3bw0z8r9AjHsg1/TKeAFFpdNBrMjpIkIssmcXGEq6QCd9HvQD+cKah5CpMN25OCh4DKvH
X-Received: by 2002:adf:a2d8:: with SMTP id t24mr9044184wra.366.1585226330006; 
 Thu, 26 Mar 2020 05:38:50 -0700 (PDT)
Date: Thu, 26 Mar 2020 13:38:39 +0100
In-Reply-To: <20200323114207.222412-1-courbet@google.com>
Message-Id: <20200326123841.134068-1-courbet@google.com>
Mime-Version: 1.0
References: <20200323114207.222412-1-courbet@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH]     x86: Alias memset to __builtin_memset.
From: Clement Courbet <courbet@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 27 Mar 2020 07:51:41 +1100
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
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
 Borislav Petkov <bp@alien8.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Clement Courbet <courbet@google.com>, Joe Perches <joe@perches.com>,
 Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I discussed with the original authors who added freestanding to our
build. It turns out that it was added globally but this was just to
to workaround powerpc not compiling under clang, but they felt the
fix was appropriate globally.

Now Nick has dug up https://lkml.org/lkml/2019/8/29/1300, which
advises against freestanding. Also, I've did some research and
discovered that the original reason for using freestanding for
powerpc has been fixed here:
https://lore.kernel.org/linuxppc-dev/20191119045712.39633-3-natechancellor@gmail.com/

I'm going to remove -ffreestanding from downstream, so we don't really need
this anymore, sorry for waisting people's time.

I wonder if the freestanding fix from the aforementioned patch is really needed
though. I think that clang is actually right to point out the issue.
I don't see any reason why setjmp()/longjmp() are declared as taking longs
rather than ints. The implementation looks like it only ever propagates the
value (in longjmp) or sets it to 1 (in setjmp), and we only ever call longjmp
with integer parameters. But I'm not a PowerPC expert, so I might
be misreading the code.


So it seems that we could just remove freestanding altogether and rewrite the
code to:

diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
index 279d03a1eec6..7941ae68fe21 100644
--- a/arch/powerpc/include/asm/setjmp.h
+++ b/arch/powerpc/include/asm/setjmp.h
@@ -12,7 +12,9 @@

 #define JMP_BUF_LEN    23
-extern long setjmp(long *);
-extern void longjmp(long *, long);
+typedef long * jmp_buf;
+
+extern int setjmp(jmp_buf);
+extern void longjmp(jmp_buf, int);

I'm happy to send a patch for this, and get rid of more -ffreestanding.
Opinions ?
