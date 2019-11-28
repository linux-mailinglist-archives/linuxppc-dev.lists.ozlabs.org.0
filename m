Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F35F810CF4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 21:37:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P8ZP60DfzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 07:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="EaH4yQhB"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P8KX5KwmzDr7m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 07:25:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574972747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41xNMejmkDpiENDKO7RxAxz9cPSeln8z2A1ifqUYAvQ=;
 b=EaH4yQhBoQMM0oaKY8In+fTWksTcfvJCOKGZsLMqlL0HtNRZumTbgztojcbvn+qTey523w
 gz3ZcWAOFOi4ZlfKW8TlPaoFi+ZLruJXDiB8tpHxGejU/3w4cF0qNwM2vzkjz/+7P3h983
 FUBKtOYcnFsWWpcW+NDzfUuzh59qGp4=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-hDUMrjp7Pi2xEWh7j0yTqA-1; Thu, 28 Nov 2019 15:25:42 -0500
Received: by mail-pg1-f199.google.com with SMTP id m13so15219425pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 12:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TnU1CF4ydXp0Re/7xQPqByhi17OoIqWu96aUm7ilAL8=;
 b=q2YjEKCr2WvS1ygu3ts3eNQQdUCmdPfb8glPGhEXe+C63HzrC0swq1leBSoufo/sUE
 5lmcS7HDMQdn/XgjQRH5rP4LQn0MuOuGCIDId2wQqEhpsxbLc2SiAHPj1HXhIfVviN+w
 5OUJa0TNWiArCtqx6ahVkhGzMWDak0rXUj1vpwiOdoDwwYeJHYQgUI7JKzix0HuoXohj
 9LCFZhj3eacQnzw4MjP62oRI2bnnB0Hr74hF2AoIo2MM0B5ud79qMqfJN1WvIryhVKXn
 N8ug2ycb1ZYKk+BVPuGk1Sq2xhxx0XkEFrzRHNSSI1JdYrkPXzX/Bw9cJO9QbADyjUb9
 znhA==
X-Gm-Message-State: APjAAAXeXP0l3omRddfZD3v6G1z/rN7of+8e5qtFkMixVLVW55zZLOuQ
 TkKPtWTRqxwwjJKcG56jVko4KuI8DQ1qtcKQbNbWJocR9NUprxwnenMbYivfZph25rz55slzWjI
 VHvitmp0sS7VF7DfbYusXM2JP7w==
X-Received: by 2002:a17:90a:3463:: with SMTP id
 o90mr14440649pjb.4.1574972741096; 
 Thu, 28 Nov 2019 12:25:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1994kyjpL8nA7jbNA2MDbvleaYMa6ZgrsQMiMtjPLDmyjZ21lIhTP8RXhXz67xc7yDAqxlg==
X-Received: by 2002:a17:90a:3463:: with SMTP id
 o90mr14440628pjb.4.1574972740900; 
 Thu, 28 Nov 2019 12:25:40 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id c184sm22569924pfc.159.2019.11.28.12.25.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Nov 2019 12:25:40 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] Documentation/vmcoreinfo: Add documentation for
 'TCR_EL1.T1SZ'
Date: Fri, 29 Nov 2019 01:55:16 +0530
Message-Id: <1574972716-25858-4-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
References: <1574972716-25858-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: hDUMrjp7Pi2xEWh7j0yTqA-1
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-doc@vger.kernel.org,
 Will Deacon <will@kernel.org>, bhsharma@redhat.com, x86@kernel.org,
 kexec@lists.infradead.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 James Morse <james.morse@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Anderson <anderson@redhat.com>, bhupesh.linux@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add documentation for TCR_EL1.T1SZ variable being added to
vmcoreinfo.

It indicates the size offset of the memory region addressed by TTBR1_EL1
and hence can be used for determining the vabits_actual value.

Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/admin-guide/kdump/vmcoreinfo.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst b/Documentation=
/admin-guide/kdump/vmcoreinfo.rst
index 447b64314f56..f9349f9d3345 100644
--- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
+++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
@@ -398,6 +398,12 @@ KERNELOFFSET
 The kernel randomization offset. Used to compute the page offset. If
 KASLR is disabled, this value is zero.
=20
+TCR_EL1.T1SZ
+------------
+
+Indicates the size offset of the memory region addressed by TTBR1_EL1
+and hence can be used for determining the vabits_actual value.
+
 arm
 =3D=3D=3D
=20
--=20
2.7.4

