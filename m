Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCB10DA7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:13:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pm096wcPzDqvw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xn5WL/5f"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Plj516wnzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 06:59:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575057590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNq9Cl1u8a4Res9gMqZVglO/lwiENzme0qL73M9MY10=;
 b=Xn5WL/5fcfHfHYGqaCb56Nms5mGTDrFImjM5lMm9SPXQiMR8avov3MQm2U377R69ly1Wy9
 MdemmGd+QMX7FJ0PDFZXUte1tfpdJIyVAQA55VJxFVRlm6gKm+RWhumSwxDngartSAHXsA
 7ngXgIAdFVzheLr4v9LmUhyKoV3PdIU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-2ch9DHyGMeiNC7BcN5_3kw-1; Fri, 29 Nov 2019 14:59:49 -0500
Received: by mail-pg1-f199.google.com with SMTP id f18so17058106pgh.18
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 11:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EGXp9xk2iujKm5hWzUI7x5fii/ZV0bMMwslmLu+YaOk=;
 b=I9xCNn+iPtyYgdMQj46GrXhse15SBXVqgGcEZ/nGxR/CvZxOrPacKGym2G1ErBmAJZ
 LNZASwYWlpY1Jlu/jerpSr+IBWRnTbYs/+/fnWqNBNt02oeYdY0oppNWaeKPhN2eA3g/
 Y9MO+SDgeIdlvqo4YRmLcHjMsNQpFr69mn7D4F67+THxsCdfTBwKxEZ9Jc6esJvIJFYr
 o/J/abph3g7xqs70eZNWRBIGEn7s2dwq9niMsKE0tEQWu+CKEuvilYJa2Pp/tNrcb+0N
 My/b9fum6IRoKlYi//SvrAcUnuvqj33mzn2We0aR/jCLQ9MhKqhidRhq/NiGzZlH8sf/
 qbvA==
X-Gm-Message-State: APjAAAVX4ky4JDDKmkC5087WLGz762kIHGP1VdMrrfNJ19RtsrhV63Js
 GUCYRTFgaOcidgaTPn1lX0Iq66T8y/6H2JnxWml+NB0EFn2BC62xm+x22c0dTDhNCBdl/KxixUa
 7aK3gQ+R6XO5V5PxjQv49l6R8Fw==
X-Received: by 2002:a17:90a:dc81:: with SMTP id
 j1mr3729520pjv.29.1575057588119; 
 Fri, 29 Nov 2019 11:59:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPVcE/XW8sUFbfhtiOj/O3Z62tRbLgdRo5GLkRP1HykyImTD8scVfMGcKn/WmLBQBtuJQ40Q==
X-Received: by 2002:a17:90a:dc81:: with SMTP id
 j1mr3729508pjv.29.1575057587944; 
 Fri, 29 Nov 2019 11:59:47 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id 67sm15725516pfw.82.2019.11.29.11.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 11:59:47 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 4/5] Documentation/vmcoreinfo: Add documentation for
 'MAX_PHYSMEM_BITS'
Date: Sat, 30 Nov 2019 01:29:18 +0530
Message-Id: <1575057559-25496-5-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: 2ch9DHyGMeiNC7BcN5_3kw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>, linux-doc@vger.kernel.org,
 Will Deacon <will.deacon@arm.com>, bhsharma@redhat.com, x86@kernel.org,
 kexec@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 Boris Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Dave Anderson <anderson@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add documentation for 'MAX_PHYSMEM_BITS' variable being added to
vmcoreinfo.

'MAX_PHYSMEM_BITS' defines the maximum supported physical address
space memory.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: James Morse <james.morse@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
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
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation=
/admin-guide/kdump/vmcoreinfo.rst
index 007a6b86e0ee..447b64314f56 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -93,6 +93,11 @@ It exists in the sparse memory mapping model, and it is =
also somewhat
 similar to the mem_map variable, both of them are used to translate an
 address.
=20
+MAX_PHYSMEM_BITS
+----------------
+
+Defines the maximum supported physical address space memory.
+
 page
 ----
=20
--=20
2.7.4

