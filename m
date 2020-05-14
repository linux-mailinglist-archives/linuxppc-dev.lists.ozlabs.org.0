Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 705481D24D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 03:42:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MvRn5chWzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 11:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lc+IzdjH; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MvQG1352zDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 11:41:09 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id z25so1066207otq.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Gwi1amuy7KmlRrZXpu7R53lQlYuXBRQwVN722bHwVo=;
 b=lc+IzdjHgofC9GpdnYLB766AylzEmWJ3dxnOWAfnmoJh8DxpdM0Y2aF31crHQwhcbm
 z1xua6HABodw0j/aQ74OsTssWzuyAxbcbJxAgKpR+1uMNIQOP7coqOMawqLDklyTiDWG
 1/smD154RXAQ6qeQVF5YofQdlFH4khbbefc1BlhCW7K3BB/8x+/8UtVAUIk/pwc0fwoo
 +W2wOMSUsMsS+x1f+BUGr/c55qGm8QouPkDWUNpPdAWicyBcqOPSg3s6FtICi3SI548u
 zVLUXccgPRipRND+FqHyMu/373l9zvx/YQv7MUSYfT43Fpn7G6qV6zY7iCITmc8SY8xc
 vnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Gwi1amuy7KmlRrZXpu7R53lQlYuXBRQwVN722bHwVo=;
 b=AtwIIBPxuSWOoPBOWRMfmhQ5tixTHy2cvDLz1UhPRzrJDQFx6T6x2I4YAInycPFMwB
 oxTjh6Oh7o5Dp73L6CKIfmZOIVPF1FVZ8qdeV3mQfi0YcBvPx+JhAWNr61ZUb5LeFFR9
 O7OWrH39qnl2IYMLm++gENn5YNPoUxk3U4TqqEGwUuGsVZEur7C4+e5QpGceIJG9cAqe
 RuOfNxkdhrLPpQU5qqXn+pMt5SZOAi++8Mf2AziK44j7Qdcjnq6D6PP6BDLKEkLQnM0v
 tYe9fueC9ao7YXrAKud9BAQYMb294vj2hVPF63gBWhkUQmK1WZndzMrX+GhiseXWZNuq
 dXoQ==
X-Gm-Message-State: AOAM5314BcHPpnGp5PHRn11ZwV+SOY7UQOkriOR/V2ILwz33dpFGRr60
 HRx+2BgJDbJYY4XmN5bnYwMHWONKVcSrPNmbmM1tC3CZ/QM=
X-Google-Smtp-Source: ABdhPJx7efDhAv75fU88pvURejgWY61IOWlpPAw75Q97B8P8qG1QfRDTyxjsQmgoY8j9jJ4isbH5wVBeWGuH+NYBPdM=
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr1915437oth.155.1589420466294;
 Wed, 13 May 2020 18:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-24-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-24-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 14 May 2020 11:40:55 +1000
Message-ID: <CACzsE9oZeCbz5_3tCrLjriPgNDfTpykDtjUf9fFsfsfMCn+JZw@mail.gmail.com>
Subject: Re: [PATCH v8 23/30] powerpc: Add prefixed instructions to
 instruction data type
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Balamuruhan S <bala24@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi mpe,
Relating to your message on [PATCH v8 16/30] powerpc: Define and use
__get_user_instr{,inatomic}() - could you please take this.

diff --git a/arch/powerpc/include/asm/uaccess.h
b/arch/powerpc/include/asm/uaccess.h
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -106,6 +106,24 @@ static inline int __access_ok(unsigned long addr,
unsigned long size,
     __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))

 #ifdef __powerpc64__
+#define get_user_instr(x, ptr)                 \
+({                            \
+    long __gui_ret = 0;                \
+    unsigned long __gui_ptr = (unsigned long)ptr;    \
+    struct ppc_inst __gui_inst;            \
+    unsigned int prefix, suffix;            \
+    __gui_ret = get_user(prefix, (unsigned int __user *)__gui_ptr);    \
+    if (!__gui_ret && (prefix >> 26) == OP_PREFIX) {    \
+        __gui_ret = get_user(suffix,        \
+                       (unsigned int __user *)__gui_ptr + 1);    \
+        __gui_inst = ppc_inst_prefix(prefix, suffix);    \
+    } else {                    \
+        __gui_inst = ppc_inst(prefix);        \
+    }                        \
+    (x) = __gui_inst;                \
+    __gui_ret;                    \
+})
+
 #define __get_user_instr(x, ptr)            \
 ({                            \
     long __gui_ret = 0;                \
@@ -142,6 +160,8 @@ static inline int __access_ok(unsigned long addr,
unsigned long size,
     __gui_ret;                    \
 })
 #else
+#define get_user_instr(x, ptr) \
+    get_user((x).val, (u32 *)(ptr))
 #define __get_user_instr(x, ptr) \
     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
 #define __get_user_instr_inatomic(x, ptr) \
