Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169A10CF48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 21:34:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P8Wm3ZVmzDr9Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 07:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGfa3lcM"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P8KM447JzDr80
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:25:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574972740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNq9Cl1u8a4Res9gMqZVglO/lwiENzme0qL73M9MY10=;
 b=iGfa3lcM+x4ZdaCCNlh9J0QKx8CfIQaMWmsreOv1wzDUPyQvJIROUzQZngJy8YJ4lLIbQU
 +K3kAwICKk8CPxWeTSvZ2dc9oaHWS3h8ohFVVJ3twZ+d2ZDKaiN6N2Lowt0sD1sfTbBO01
 1mlrqy7NpVb+FSHX7w+c4j27dMcSJvo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-nN1RGhWIPuS-vOLodZVnMg-1; Thu, 28 Nov 2019 15:25:38 -0500
Received: by mail-pj1-f71.google.com with SMTP id w8so13402634pjh.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 12:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EGXp9xk2iujKm5hWzUI7x5fii/ZV0bMMwslmLu+YaOk=;
 b=aUAZ2zCi6Pg7Rcl9xCk6LIeDwllYF7Y3kG+oOVP7QxeyS5/ySsWnDVTTKfPYbfvsl+
 nvkRmlLPDsvLs4foJFxeAF8zwOefgE1FeQQq1XfrtQqeWOgf2GvQgcI/gaqi710ot0pL
 cuPxX2RlYD3468t+OodS9mjFdvEyS3525Weqyynx/HxrMMWjMt9tTH13L7tdypuI0TVQ
 kFVvfN6zijd3tIa66m96l0S14xa5wXMVT0Lx0DhmcvHqo6nE0Wd/NMawIDh3OMOobKA5
 cEZA/D134Rze/WU/LGr9MrZsinQoBdUSgqfVfPq6THykH0b/3EhTLzh/2/2nS6ZFJXT5
 M50A==
X-Gm-Message-State: APjAAAVoDEP2WOlKqBhsHUFsn3FL/J1a4PS0Qm3FJ9+WdqmLvE84PMaT
 uH2RBJtEqargcMu7f/2Dci5GXlKEbkKX1Np9DUfPORZHRk51RbAviJYRWZlaiDCXu5pelmD/JSI
 6xGhIaJ9f5ISk+uxioEjgSRcabg==
X-Received: by 2002:aa7:9f08:: with SMTP id g8mr55602066pfr.59.1574972737773; 
 Thu, 28 Nov 2019 12:25:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZd0aFye0vSy1NxsGtsRRJBkuncMDWAD+zRH7F+esJn7Za4gqNzi7+zhDEogE6OWw66etLDg==
X-Received: by 2002:aa7:9f08:: with SMTP id g8mr55602046pfr.59.1574972737583; 
 Thu, 28 Nov 2019 12:25:37 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id 21sm22106551pfy.67.2019.11.28.12.25.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Nov 2019 12:25:36 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] Documentation/vmcoreinfo: Add documentation for
 'MAX_PHYSMEM_BITS'
Date: Fri, 29 Nov 2019 01:55:15 +0530
Message-Id: <1574972716-25858-3-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: nN1RGhWIPuS-vOLodZVnMg-1
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

