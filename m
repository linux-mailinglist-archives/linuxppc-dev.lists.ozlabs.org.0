Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 084161D1E16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 20:54:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MkPP2KX9zDqjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 04:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Hl5KliNg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl5KliNg; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MkM95TSBzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 04:52:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589395967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=wHSBbB5/QZT/EwoeOOweY77s6h/009zkbzY0iSlBYP8=;
 b=Hl5KliNg4qQzUnYPVH7Wqp/eS41pyypOIZ7VRVKPUQ+EQL771Z4MFD7dRZjurIZ8vQFt7y
 rjalnhMsr6XT+9BNTYhuiV6QqOpVTaayMbxGI2/En3nVeOTTTzuHIHOsawActAXIDBH8Kx
 OvduGoLhHiwU4pinJis5vMTp0WTY5p8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589395967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=wHSBbB5/QZT/EwoeOOweY77s6h/009zkbzY0iSlBYP8=;
 b=Hl5KliNg4qQzUnYPVH7Wqp/eS41pyypOIZ7VRVKPUQ+EQL771Z4MFD7dRZjurIZ8vQFt7y
 rjalnhMsr6XT+9BNTYhuiV6QqOpVTaayMbxGI2/En3nVeOTTTzuHIHOsawActAXIDBH8Kx
 OvduGoLhHiwU4pinJis5vMTp0WTY5p8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-fXpxRmKdMJiMWtSbmhH0oA-1; Wed, 13 May 2020 14:52:45 -0400
X-MC-Unique: fXpxRmKdMJiMWtSbmhH0oA-1
Received: by mail-pg1-f200.google.com with SMTP id g1so312169pgk.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 11:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wHSBbB5/QZT/EwoeOOweY77s6h/009zkbzY0iSlBYP8=;
 b=k/PizjXahgT4VeVAb9HW22wtmnMCKgnOp1F3x7DKbJWWwHm5LuvhBWICz8CAfc5T3X
 IfRMEkZB3pyEXPSq0047X6W8yQsmdKyig1NoAgv/6y8E2ZkgiGJl6oHq2cYQcQfXbMtA
 7/3u4b+UP2sLOYEOhL1CSI/oREf/sDjBnNtBFDpOlo8pB5S3++vue36uznOenmS06ou/
 K/Ng3z4Bt8b0AxfGgiO51PgHCneSJF4rDHEdyzov++FPTqd7ijU6BgoSyDyLOEmT9KFk
 F3lc22ipkfKV+LZhCfzRhzuhod05fwFRuvP2eXebtj8Cu+S8mnA4yDDu99idB2jj73OM
 4RRg==
X-Gm-Message-State: AOAM532C1hhb+EGuWeB/Q9V3n4Pd/V3z690xVu19kXXMo/uDl3sbGkQ8
 KaICdwn5i/aH7K3enn/TC3PhS24kq7FF+D2uxhWo5/ceS5ZWk8rkHs4FXHBNuMZ+xY77DXRU5zN
 /poCFmlvV6iZQLThXc7ADrvRXXg==
X-Received: by 2002:aa7:82d4:: with SMTP id f20mr638964pfn.253.1589395964884; 
 Wed, 13 May 2020 11:52:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Sglv3QSN2AQ8L8vX+EbHi2Jv4mN3LxBZJj8ZVFGF26HEK+cSiLoq/r1EcEne4FxQ9u0lwQ==
X-Received: by 2002:aa7:82d4:: with SMTP id f20mr638933pfn.253.1589395964561; 
 Wed, 13 May 2020 11:52:44 -0700 (PDT)
Received: from localhost ([122.177.166.225])
 by smtp.gmail.com with ESMTPSA id d2sm230168pfa.164.2020.05.13.11.52.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 11:52:43 -0700 (PDT)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v6 1/2] crash_core,
 vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
Date: Thu, 14 May 2020 00:22:36 +0530
Message-Id: <1589395957-24628-2-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 bhsharma@redhat.com, kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Boris Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 bhupesh.linux@gmail.com, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Right now user-space tools like 'makedumpfile' and 'crash' need to rely
on a best-guess method of determining value of 'MAX_PHYSMEM_BITS'
supported by underlying kernel.

This value is used in user-space code to calculate the bit-space
required to store a section for SPARESMEM (similar to the existing
calculation method used in the kernel implementation):

  #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)

Now, regressions have been reported in user-space utilities
like 'makedumpfile' and 'crash' on arm64, with the recently added
kernel support for 52-bit physical address space, as there is
no clear method of determining this value in user-space
(other than reading kernel CONFIG flags).

As per suggestion from makedumpfile maintainer (Kazu), it makes more
sense to append 'MAX_PHYSMEM_BITS' to vmcoreinfo in the core code itself
rather than in arch-specific code, so that the user-space code for other
archs can also benefit from this addition to the vmcoreinfo and use it
as a standard way of determining 'SECTIONS_SHIFT' value in user-land.

A reference 'makedumpfile' implementation which reads the
'MAX_PHYSMEM_BITS' value from vmcoreinfo in a arch-independent fashion
is available here:

While at it also update vmcoreinfo documentation for 'MAX_PHYSMEM_BITS'
variable being added to vmcoreinfo.

'MAX_PHYSMEM_BITS' defines the maximum supported physical address
space memory.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Tested-by: John Donnelly <john.p.donnelly@oracle.com>
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 5 +++++
 kernel/crash_core.c                            | 1 +
 2 files changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
index e4ee8b2db604..2a632020f809 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -93,6 +93,11 @@ It exists in the sparse memory mapping model, and it is also somewhat
 similar to the mem_map variable, both of them are used to translate an
 address.
 
+MAX_PHYSMEM_BITS
+----------------
+
+Defines the maximum supported physical address space memory.
+
 page
 ----
 
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 9f1557b98468..18175687133a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -413,6 +413,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
 	VMCOREINFO_STRUCT_SIZE(mem_section);
 	VMCOREINFO_OFFSET(mem_section, section_mem_map);
+	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
 #endif
 	VMCOREINFO_STRUCT_SIZE(page);
 	VMCOREINFO_STRUCT_SIZE(pglist_data);
-- 
2.7.4

