Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476F67C114
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 00:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2L4h1rSQz3fLX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 10:43:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A/+QvJNX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=37bzrywykdnigif2bz4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A/+QvJNX;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Kwc1H2xz3ch0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 10:36:16 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5065604854eso1289657b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r6gsGOWqmWqPTUheNVBr3Q9nvHWl0lLSYR4b+5IyM2U=;
        b=A/+QvJNXy/d2vUI7IPHDHgHrWDO5jed44nN4fWVgpwvqVaJ31sqqH7bmSeeRmlNRUe
         R8yZL4gzTLe9/1VGW0HvHObu5bU15WhlNXVFuvCtXS1G895lG29e5Fcqxn2GSCvSAWbL
         a8+HubzPqRrnoptHqtaiUWYzGkX+Bc9oxqltwaro1OAtno0UicpOEKYTqlPtF+8tMqyj
         yl/bjmJVeg0LR1s+57cLzBKsRlrrNOMebK53a2LFqIWNe7pEp/2Pdvl38JYqyOXxSvMk
         fAnMfk21t3L3pUqNrcRKGWlBkL42c9QvZGZGpHK8jyyUU6ou7Oa+/eZkY6FyQAx511UH
         LrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6gsGOWqmWqPTUheNVBr3Q9nvHWl0lLSYR4b+5IyM2U=;
        b=Zjog1rrL3FCvWsJO4YrBsfrUE2lc4s/uXhBOjLEm1O6oD7nt2pfC1ncAzz4QeXQNpk
         QSegtWoxX4Nvf6e2T+d9IV7VTU3M7XshBLUtc2TFbr2Fq0Pa61JFTjhC2kL/T0CgfuG3
         bw8BDyxRt3nPe9/YuVFg+NVRlVPkOqIwzoQZmI9R+n6m8AG3PG14unrBi3NQzMEjNcw3
         OL/Y8SPnrV0nTn6mgouIEQxlYV2JQY7Pr3BpapogBlKiWYKnbNWiPXNaazcQWxSgF8AI
         e33FEwcgvw3OoFR+rk3HmmCWZdj0/nCR6pLX/62AhJRRY9JO9xU8jpK+8a9phpPAAGUV
         jZKw==
X-Gm-Message-State: AFqh2kpsvPvsCPppNCE5Ij25MWIdgiS2KIjK3ydxyc+zi3+nTzeleC9x
	+Ba3OY47Wfnx1wRQWTV/YW/i1Dz+JYE=
X-Google-Smtp-Source: AMrXdXu2jHtIhTXjXhL9uqm1GdxSUteqsFjlccKLo1OvqKsStZdC9fM8D9TZdXuT4x0gDFJ1URuxrGbnlWU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f7b0:20e8:ce66:f98])
 (user=surenb job=sendgmr) by 2002:a05:6902:1148:b0:803:6201:640a with SMTP id
 p8-20020a056902114800b008036201640amr1801877ybu.141.1674689773846; Wed, 25
 Jan 2023 15:36:13 -0800 (PST)
Date: Wed, 25 Jan 2023 15:35:54 -0800
In-Reply-To: <20230125233554.153109-1-surenb@google.com>
Mime-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230125233554.153109-8-surenb@google.com>
Subject: [PATCH v3 7/7] mm: export dump_mm()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@t
 echsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmap_assert_write_locked() is used in vm_flags modifiers. Because
mmap_assert_write_locked() uses dump_mm() and vm_flags are sometimes
modified from inside a module, it's necessary to export dump_mm()
function.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/debug.c b/mm/debug.c
index 9d3d893dc7f4..96d594e16292 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -215,6 +215,7 @@ void dump_mm(const struct mm_struct *mm)
 		mm->def_flags, &mm->def_flags
 	);
 }
+EXPORT_SYMBOL(dump_mm);
 
 static bool page_init_poisoning __read_mostly = true;
 
-- 
2.39.1

