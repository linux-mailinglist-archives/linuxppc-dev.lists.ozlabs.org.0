Return-Path: <linuxppc-dev+bounces-17479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KS4L+K2pGkepwUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 23:00:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35E1D1C51
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 23:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPGFT5ldLz2xR4;
	Mon, 02 Mar 2026 08:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772402397;
	cv=none; b=lmwLTeLnrhsaTcmTmP33WJARHS0GIdU90fNb6kRirxbVvFx99hfFfUw1cNDxooAbiaUcm1WAdh2RY1v8/MWzCnxiKzyYLi9AX+AFiPCL6DWYI5Rh+KVtxAzHamAuZqKe87jLezCrqvUUULuJbBcgX7ZV3r5lhY2mlG7G+Cl5dRtdjmfZYKQh/yGhTCsXeHpLGJK/ynLTVN1rS3Jg/coBSUC271r5JSE/BPk/fizLSvSN2oCPw/0fGdtTPkWu1bkQ9mSLKvMDuvB2Cv5Jo/GNH1D8dp0XrJ7Hnw5LdNsySyG5dkLtJJbDiw4Xunuvyr78+M4sF7lfKKicyNa9MZzPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772402397; c=relaxed/relaxed;
	bh=XdF90L2tMXaU2D2ZcWRZkQORWHdME4B3q+DTo4zCDx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VeXuop/SIAt4Vn/if5jPCLdQn06zn/Nsu/NZh6RCZ3sc9bnVArruILISSsgLhC/fSf/BcZzNAaaI1GVzGPv1C4uKMcn/JgTAY6rB/MB8WYdCSV+Hyv/FG061ykKcjr3vyFGbT3rocihY/hFgFynAKkT69VmGByE176d9x4+m4MlPo1jvn5h1pWwh8ZuWGNszVG+hM1xs67BPdogRVMMscnOiTTjGlN62i/QBhHVlxgg18KqLI6KOti6EOYR+UxU1/uSuzGzC5Jm+Z2jVWGeKNZS6Rm8ur55LPB42svylIyYMKx6BWfVe7w31ME/ViW4blQMfGp8v9I57vsDkrh6crg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Je7+RY/5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Je7+RY/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPGFS4G3Kz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 08:59:55 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-436309f1ad7so3015591f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 13:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402393; x=1773007193; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdF90L2tMXaU2D2ZcWRZkQORWHdME4B3q+DTo4zCDx4=;
        b=Je7+RY/585VDkos3pLyUHRS+hYOn1zLEa4J91PbIqN1B2ckhw44DcsYd1ftGPIHr0w
         fnawfoxJiMHwN7aNeHyW8PbGaSHsP/vi/xeyPnNORaAZmUfOi/us3QfuZ5IGh++xwzqy
         ZXk9B88ApXK7rToW8rq3G93r1r7RuCFx1uDDT8oGNwy+JGZsNdDD0E1jgusscx9sPh9X
         vldYK/tFIwkRPYICSOjJhGSl7NegNB+RKin8Ed3LPXQVZ8h1MJHWf1XVbWVfhEh1Xfr/
         e+/KH7YUWWsEvPyyvBrLjuTI9YUTg3GOqqi1bZacK+Sq5HO9PeuXTVJnVteb6IN/wUfA
         JzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402393; x=1773007193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XdF90L2tMXaU2D2ZcWRZkQORWHdME4B3q+DTo4zCDx4=;
        b=kj8I4a8+s34zQU+5XwVMOS7z/6IDUy+qN9SLYKllRBt0jYPx4YrdTAq3i4y62Wszeg
         O7taF3XuFHvrfSDx4OLQxtLng60IT63BX+VJNjud39QU3O3twbv5jNPuNWrvC4ueR4Fq
         dfzVjJzp/kX9za5n54cEFpO5YDVGu3+nCykIY2ZI35HgCmHdsjtf6TDvYmWU39a+8QZ4
         FJfl6QcVpSm266sRuTr+kSMK4IbuZSZHiyFXK20vnDGYIzCsTuIyCqwCfKpxEW6fCxiY
         7mQGdW1cxo5kYCXBVCMBvRR70X512YqY8ErFZzSgWM1LOnXnRRhLbbiuaYyKTl9RSwzL
         qWYw==
X-Forwarded-Encrypted: i=1; AJvYcCWyBc8ict/VbjFdO3nIDEicZhKCm/FBwhnBwKOdkAOrFnLpfiDkGesxPpBGH372XIUjuN02NhbhCvbJHYE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwePSI0IYdaDXz7LQbG/sniDgSWDEdufa+vHTLfVngYdp3p4jYl
	OiY7CxWNaqNu8zsd+DMDhOu+RmdvZhz/F98w7QkS0lWsyCHRowYwsZnd
X-Gm-Gg: ATEYQzy2iM4lIaAUsL0aVDEUuodXbMzC5UIlkYSIoll+gqSQ9NIGqL+rL8Bc/ZixNDC
	xsNcetu0tPYeM1zwKhMqPg7WNmNJHjCifXseJ2lI7WhDVDg7Q9NJollZNjdFC679fZqs4TrlBt4
	StZn+XnEYEFoOXp03yE3McR9oXrg0s6E7bDsmLSNbAA3fslJq5FWldpWoVaBeKANau6PQEUqlBL
	eRmfxTQaOoZjUKgdQSuJbKHZoDtOU5PYnFbCIXxKGjD5Dompt4Eib3XiPjJTbq5a1dp03QG6HHe
	0UWfhUY0Mn1N0E9HPldh/eFsVTzCz37fn+BbCZoNLnAoR711NNMS9nllNW2y3vamf2TC/xhyCyz
	3PgKA5loSszPOBddWYgc8mknLBdk2WBSnT+W1ygqS0x3LBinixjcrNUT7ChjECf/whfzDYulF/b
	OIcEIWePrJLzWYOZgYhUjazBApWX1s/MHt5OBIngOScZ75vhT7kZf+4bDqIlUF35p4
X-Received: by 2002:a05:6000:18a6:b0:439:b886:20cd with SMTP id ffacd0b85a97d-439b886219amr989086f8f.16.1772402392592;
        Sun, 01 Mar 2026 13:59:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a523sm22434797f8f.19.2026.03.01.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:59:52 -0800 (PST)
Date: Sun, 1 Mar 2026 21:59:50 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Andre Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] uaccess: Fix build of scoped user access with const
 pointer
Message-ID: <20260301215950.2fef5722@pumpkin>
In-Reply-To: <CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
References: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
	<CAHk-=wixyP1mzyVcpZqQZd_xbabZQ873KVph3L-EkrNZGv3Ygw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:chleroy@kernel.org,m:tglx@linutronix.de,m:linux-kernel@vger.kernel.org,m:christophe.leroy@csgroup.eu,m:mathieu.desnoyers@efficios.com,m:andrew.cooper3@citrix.com,m:lkp@intel.com,m:linux@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:x86@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:hca@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:Julia.Lawall@inria.fr,m:nicolas.palix@imag.fr,m:peterz@infradead.org,m:dvhart@infradead.org,m:dave@stgolabs.net,m:andrealmeid@igalia.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17479-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linutronix.de,vger.kernel.org,csgroup.eu,efficios.com,citrix.com,intel.com,armlinux.org.uk,lists.infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,lists.ozlabs.org,dabbelt.com,inria.fr,imag.fr,infradead.org,stgolabs.net,igalia.com,zeniv.linux.org.uk,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CD35E1D1C51
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 12:01:08 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 1 Mar 2026 at 11:34, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > -       for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
> > +       for (void __user *_tmpptr = (void __user *)                                     \
> > +                                   __scoped_user_access_begin(mode, uptr, size, elbl); \  
> 
> Why are you casting this return value? Wouldn't it be a lot better to
> just make the types be the CORRECT ones?
> 
> I didn't test this, so maybe I'm missing something, but why isn't that
> just doing
> 
>         for (auto _tmpptr = __scoped_user_access_begin(mode, uptr,
> size, elbl);         \
> 
> instead? No cast, just a "use the right type automatically".
> 
> That macro actually does something similar just a few lines later, in
> that the innermost loop uses
> 
>          for (const typeof(uptr) uptr = _tmpptr; !done; done = true)
> 
> which picks up the type automatically from the argument (and then it
> uses the argument both for the type and name, which is horrendously
> confusing, but that's a separate thing).
> 
> Does that simple "auto" approach break something else?

This is what I needed to do:
(Note that is pre-dates 'auto', but it should work.)
Send at 21:56 on dec 20.

If a 'const struct foo __user *ptr' is used for the address passed
to scoped_user_read_access() then you get a warning/error
uaccess.h:691:1: error: initialization discards 'const' qualifier
    from pointer target type [-Werror=discarded-qualifiers]
for the
    void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl)
assignment.

Fix by using typeof(uptr) in that assignment and changing the 'read' functions
to use 'const void __user *ptr' rather than 'void __user *ptr'.

Fixes: e497310b4ffb "(uaccess: Provide scoped user access regions)"
Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1f3804245c06..c5d5f2d395bc 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -650,32 +650,32 @@ static inline void user_access_restore(unsigned long flags) { }
 #define user_rw_access_end()		user_access_end()
 
 /* Scoped user access */
-#define USER_ACCESS_GUARD(_mode)				\
-static __always_inline void __user *				\
-class_user_##_mode##_begin(void __user *ptr)			\
+#define USER_ACCESS_GUARD(_mode, type)				\
+static __always_inline type __user *				\
+class_user_##_mode##_begin(type __user *ptr)			\
 {								\
 	return ptr;						\
 }								\
 								\
 static __always_inline void					\
-class_user_##_mode##_end(void __user *ptr)			\
+class_user_##_mode##_end(type __user *ptr)			\
 {								\
 	user_##_mode##_access_end();				\
 }								\
 								\
-DEFINE_CLASS(user_ ##_mode## _access, void __user *,		\
+DEFINE_CLASS(user_ ##_mode## _access, type __user *,		\
 	     class_user_##_mode##_end(_T),			\
-	     class_user_##_mode##_begin(ptr), void __user *ptr)	\
+	     class_user_##_mode##_begin(ptr), type __user *ptr)	\
 								\
 static __always_inline class_user_##_mode##_access_t		\
-class_user_##_mode##_access_ptr(void __user *scope)		\
+class_user_##_mode##_access_ptr(type __user *scope)		\
 {								\
 	return scope;						\
 }
 
-USER_ACCESS_GUARD(read)
-USER_ACCESS_GUARD(write)
-USER_ACCESS_GUARD(rw)
+USER_ACCESS_GUARD(read, const void)
+USER_ACCESS_GUARD(write, void)
+USER_ACCESS_GUARD(rw, void)
 #undef USER_ACCESS_GUARD
 
 /**
@@ -752,7 +752,7 @@ USER_ACCESS_GUARD(rw)
  */
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 for (bool done = false; !done; done = true)						\
-	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
+	for (typeof(uptr) _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
 	     !done; done = true)							\
 		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
 			/* Force modified pointer usage within the scope */		\
-- 
2.39.5

	David

> 
>                    Linus


