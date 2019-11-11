Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88114F72B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 12:05:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BShf4GGdzF4GP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 22:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="CxpkZizN"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BSfZ72GCzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 22:03:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573470211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/y8p7TWJ4+9dx0qZYntYI0vqqca78jHSFlqFEn+6Y9I=;
 b=CxpkZizNkV3iIjlPIF8m0iAl/PSBwLDfvdzWdroSQf3UYptIETu512VHVoHQocvY+8PUe2
 60vwVpyi0hexNGYLdX83w6UyIACyMBm97ZC2Sa2XjyPXrQ2CsAyjQxV2rWmP9GWEGlwylg
 yXJ5guAC1Rv6hTZz/Cmqx/b9/9fc20A=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-6HpxqJn3Mo-4zxwZqIjciA-1; Mon, 11 Nov 2019 03:01:43 -0500
Received: by mail-pf1-f198.google.com with SMTP id a1so12068281pfn.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 00:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D7Q1sNAJK7KGCeC1/osi4u/yd8LMbojW2DcAg7eyhwk=;
 b=iMXmAZBZMh+h+o5XWHZU20JYScX++SGNuus5fMgmPSHXWtVdFeAemjfyxWtQuA/0p0
 PXFZEABzhpbpo0GWSFXB3WBtpZLlDJyjlDTSQuYF2HnBmIgGvrLxbIElO0r2ao6cEW9f
 WwD8mr5VjzVCsoxK0Ln7Bhlq72OC79fGT+Px6JT6SRiAAz9KCC6L+/oH+klbruvSyZkc
 1xCJR0Bb3vzfHBucEypdo7RvTVJyXiZmFPYCdsCdPiI9ZrMUdAakK0w3absbLtHVdL0t
 fAmlJaNszLDVHN6svp2YV3yLCY0Y+3CyTs6bWIeOqQht8lr/eEcOUz9P/Z2DcKJu9BWI
 dYow==
X-Gm-Message-State: APjAAAVlzQL1J+6XVkLlf5Jf4ZMDWCcGgkd0AlaVG4OoFRwSBdC8mhM9
 fnnR3cnwaBMPh290HB5yV2P5W0CorRYwaBw5HgOGa57SUxL5jjH9cTNSKG0ACH1Z/Omug/J8wW6
 i8a6oWtUhl2QDP4Cqik49RivYoQ==
X-Received: by 2002:a62:fcd2:: with SMTP id e201mr404504pfh.52.1573459301444; 
 Mon, 11 Nov 2019 00:01:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/PM/uE1YEEDp1OQcYhDW64ur/c96jF9ficCBtta087Mx43bjXxmhjovhzV8sTDdZdS3kXpw==
X-Received: by 2002:a62:fcd2:: with SMTP id e201mr404459pfh.52.1573459301055; 
 Mon, 11 Nov 2019 00:01:41 -0800 (PST)
Received: from localhost ([122.177.0.15])
 by smtp.gmail.com with ESMTPSA id r33sm12736180pjb.5.2019.11.11.00.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Nov 2019 00:01:39 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] crash_core,
 vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
Date: Mon, 11 Nov 2019 13:31:20 +0530
Message-Id: <1573459282-26989-2-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
References: <1573459282-26989-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: 6HpxqJn3Mo-4zxwZqIjciA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
 Steve Capper <steve.capper@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 bhsharma@redhat.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 kexec@lists.infradead.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
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

[0]. https://github.com/bhupesh-sharma/makedumpfile/blob/remove-max-phys-me=
m-bit-v1/arch/ppc64.c#L471

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 kernel/crash_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 9f1557b98468..18175687133a 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -413,6 +413,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 =09VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
 =09VMCOREINFO_STRUCT_SIZE(mem_section);
 =09VMCOREINFO_OFFSET(mem_section, section_mem_map);
+=09VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
 #endif
 =09VMCOREINFO_STRUCT_SIZE(page);
 =09VMCOREINFO_STRUCT_SIZE(pglist_data);
--=20
2.7.4

