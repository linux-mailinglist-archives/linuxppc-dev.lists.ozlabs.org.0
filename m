Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC8472FBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:48:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCPWx0h7yz2yXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:48:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IV2309X7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IV2309X7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=IV2309X7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=IV2309X7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCPWB3zVGz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 01:47:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639406864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8hcGLH+T0gUqYBZFFXWjQPxtS91IvQDULYdbE3ot/k=;
 b=IV2309X7lLP0zIPOKI6ekGIqcuquVYpCj+Pcte1D0J7GC6yDea6NM9oEmjbaz9wUBxf03Q
 2T34m191hBq+7wvaRlgWpXxIELevXZCo7oo9RwtbMMpr/wdVjFIOsj0yagh1A088cxMnWr
 c1H/Aw/Py/zrUcSeI2BHIHCkGeOR/Ks=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639406864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8hcGLH+T0gUqYBZFFXWjQPxtS91IvQDULYdbE3ot/k=;
 b=IV2309X7lLP0zIPOKI6ekGIqcuquVYpCj+Pcte1D0J7GC6yDea6NM9oEmjbaz9wUBxf03Q
 2T34m191hBq+7wvaRlgWpXxIELevXZCo7oo9RwtbMMpr/wdVjFIOsj0yagh1A088cxMnWr
 c1H/Aw/Py/zrUcSeI2BHIHCkGeOR/Ks=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-555-9wIZez-5M_q3bF3-Ad2WFQ-1; Mon, 13 Dec 2021 09:47:42 -0500
X-MC-Unique: 9wIZez-5M_q3bF3-Ad2WFQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 p7-20020a05622a00c700b002b2f6944e7dso23379549qtw.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 06:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8hcGLH+T0gUqYBZFFXWjQPxtS91IvQDULYdbE3ot/k=;
 b=zDLAxQsLpDW4+CUTbf1k0w1p7BNocfqhDS4No6fEKRzeMckSqJoGCtYRUwPBMrje7Q
 825vfImDqCFHGO7K4OyXGGCPJfkOXEYGA8/2TCDGHrcFgDI59QDvj4RxNj3p6YheKb5h
 PNtiqSbS0OyOD+mYp9b414yfAPuKEM83WyfUWwUqzCZ2KLExeGd+tOh3oLsjmmDyVD3k
 tMcmjKdPTpofyDcVfvYM90v4mmC/a5XWQOLYEGGXeDj+8UssDm5O70XMaF45vwsBYzr/
 iNhdysBj7AJ/Yy7qqFdSFhExZxEQvm6En+DGIGrMtk7L8Aahb5Puabfvou2el0kclDS7
 kE4g==
X-Gm-Message-State: AOAM530ELqI7FwoxRlgcHcdy2O+3u04GW05jAXQ2tH/Suc7OvMoqMgqp
 e+hzw0Q8/BSNzM1Z60y8Xea0upu8dDczRUzbvhkIxnLSPqNjEQGP859E5uUw9v8//Ek8tEOXhNN
 C+HcTqoVUytfvKXuF1UBOyyF/aA==
X-Received: by 2002:a05:620a:1a8d:: with SMTP id
 bl13mr33725405qkb.200.1639406862157; 
 Mon, 13 Dec 2021 06:47:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1pytTz0rFDYInzO60wUAQXH29a2E/VAmEu6qrge4tTzr5qgfYjG6Yp5J6Sqb4lCXlwrm7qw==
X-Received: by 2002:a05:620a:1a8d:: with SMTP id
 bl13mr33725367qkb.200.1639406861848; 
 Mon, 13 Dec 2021 06:47:41 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id o17sm6004570qkp.89.2021.12.13.06.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 06:47:41 -0800 (PST)
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Russell Currey <ruscur@russell.cc>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Message-ID: <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
Date: Mon, 13 Dec 2021 09:47:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/13/21 2:42 AM, Christophe Leroy wrote:
> 
> Hello Joe,
> 
> I'm implementing LIVEPATCH on PPC32 and I wanted to test with 
> STRICT_MODULE_RWX enabled so I took your branch as suggested, but I'm 
> getting the following errors on build. What shall I do ?
> 
>    CALL    scripts/checksyscalls.sh
>    CALL    scripts/atomic/check-atomics.sh
>    CHK     include/generated/compile.h
>    KLP     lib/livepatch/test_klp_convert1.ko
> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length 
> beyond nr_entries
> 
> klp-convert: Unable to load user-provided sympos
> make[2]: *** [scripts/Makefile.modfinal:79: 
> lib/livepatch/test_klp_convert1.ko] Error 255
>    KLP     lib/livepatch/test_klp_convert2.ko
> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length 
> beyond nr_entries
> 
> klp-convert: Unable to load user-provided sympos
> make[2]: *** [scripts/Makefile.modfinal:79: 
> lib/livepatch/test_klp_convert2.ko] Error 255
>    KLP     lib/livepatch/test_klp_convert_sections.ko
> klp-convert: section .rela.klp.module_relocs.test_klp_convert_mod length 
> beyond nr_entries
> 
> klp-convert: Unable to load user-provided sympos
> make[2]: *** [scripts/Makefile.modfinal:79: 
> lib/livepatch/test_klp_convert_sections.ko] Error 255
> make[2]: Target '__modfinal' not remade because of errors.
> make[1]: *** [scripts/Makefile.modpost:145: __modpost] Error 2
> make: *** [Makefile:1770: modules] Error 2
> 

Hi Christophe,

Interesting failure mode.  That's klp-convert complaining that it found
more relocations in a .klp.module_relocs.<objname> section than
expected, i.e. nr_entries = sec->size / sizeof(struct klp_module_reloc).

A few possibilities: the ELF sec->size was incorrectly set/read by
build/libelf (I doubt that).  Or maybe the layout/size of struct
klp_module_reloc is not consistent between kernel and userspace (I'm
more suspicious of this).

Can you post a copy of the build's symbols.klp and
lib/livepatch/test_klp_convert1.tmp.ko somewhere?  I should be able to
start debug with those files.

Thanks,
-- 
Joe

