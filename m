Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA94108DC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 00:52:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBmKh0MWQz306y
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Sep 2021 08:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LTNEcwqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com
 (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=len.baker@gmx.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LTNEcwqH; 
 dkim-atps=neutral
X-Greylist: delayed 327 seconds by postgrey-1.36 at boromir;
 Sun, 19 Sep 2021 00:27:45 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBY7j70T2z2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Sep 2021 00:27:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631975253;
 bh=UmWycZcizNYid4Z+392DMeF7EKIyi4qx+X3CFcO1uDE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LTNEcwqHoicB6S3EzdhMflcb194eSf/OYle96RWjuj98QwFdKxRTUTgtnzN/He7QJ
 Y0gX7XYKfZUaCFjcvoAKMaPmltEbKs+tAKE/t+3pt3mlc/3R2AHa8Dw1TnWu6BofVw
 KhMNtSf3+3jwaTxBiVBM8zylrOUT1BOuqP34k0cY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MdebB-1n0O0n1DxB-00ZjGv; Sat, 18 Sep 2021 16:21:52 +0200
From: Len Baker <len.baker@gmx.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] KVM: PPC: Replace zero-length array with flexible array member
Date: Sat, 18 Sep 2021 16:21:38 +0200
Message-Id: <20210918142138.17709-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nUjxkWAcJOBgMwjffXAt1QuuDOCIXUU/JKmzX9iUDs9pGqz2aHN
 98GDDCSWE9bq+l3Sk5BPYQ5vXYhDBd6i6m9oBE/LNW0YxvO/oLjzioqf/Ji0uzBVOm9chr0
 LL9bRwvN7Fce6JyKqT87QUtYysU10VZEQcZZKM2WuxjcBrS1kJvveJZIa+QYFSTgKVzdzcF
 5QICgt5PO1IAWzYmd7a8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WO31V6xA/Xk=:I080RTcFCOVxx+0dMUiNAU
 Jk4mlMxo5mJhmH8jxJTyFYS7jnqWMy0Ft3PeKZ/ZwZU6VSUZpJxmO53RD5jaD9yHrBFeAmCwS
 3UzRKE9rGgUu758st8R1cl8CBlNoQfU4DBL5RniPiEVlueaj0pDdWdZpMRsq+HUj6opEAXQp+
 x0hzvueVtIUc8Bc0e9DeORVZ4cdqvObD6tRwnXYwTsOoqLKcqdo8T4SyUOqMODdkM091by+zm
 Au70KyAsaxDKGdSiFivjPsLjogR0y+cFnXcu38AmEX5jxjfOkC0Ko4nvAH5OyxSV0LqpWjtFi
 G9fDgseLkDsKOVlB1PPUaa29DZxGlshimk19e6rpwhJVnja1DTsBaKfD/hroQcYEjP5hIk4ET
 uFLr7i0+CEVienKPGcsiETKygFMOjLMfcwLdtRc93EWV7d0GLS01B/2nWwooV7+DAH5d5QpPL
 exKPrZjStcezkCLCX+X6+apOfXqCgYy+acGREaMQz+oDOiWzXg+f6zMf2WVdQjlFslUd8QM2l
 3T4sNmqReQjj9FumjaBAFfXbNMzciNCjVlxd5KH9yPISESgmqnXepqwQ36wjFj9E6QM/TPxvw
 Nw1priRvLS91kPK8A9qCoVcP0Ydyt6bbTnpG1w1N8rFDcc00F1IaLzFYuw1gHXHLPgYaB337c
 AXZjewC43nbvheu8K712etBzJqDkfTGrcFvJRotNDkcfZu7VuRh7h5N6Z8lSlScWxMjlsvUIS
 7OhMTYH1sGzHvQ97PvsAPRnplLXBFhUsndr3plGuzDlAQj7KiFktX+sGG8e3WKR2GKJLu5dWc
 07pCWJhagDjWvj124LzYjAiExodedR+yOtrsbHgOpK8Yur7nucHkRrqDr9P1j/sklxPraVoED
 obeY5AoeHGLtaZqsr0qS2z1Ru21QBlakf94um9ygDo2VmgTWcnLdikli1T04SOmfYJ7cZlATB
 1oEotH/FeRGKCa6KfM/qObRZEKGS7PNRL2GVA/e2cnOkfHAXF7pkIzolAbO7Gawkq6u4K1nbQ
 fLWAAd7nkIdlJ8EBsJu4nvJXaqLEOtSDZFghxf+5d3A2JUgt6/tvCJ864V6g1zYIzCuX3r7wx
 3G8Zs3ZC3LzyPs=
X-Mailman-Approved-At: Sun, 19 Sep 2021 08:51:35 +1000
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Len Baker <len.baker@gmx.com>,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use "flexible array members" [1] for these cases. The
older style of one-element or zero-length arrays should no longer be
used[2].

Also, make use of the struct_size() helper in kzalloc().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-le=
ngth-and-one-element-arrays

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 arch/powerpc/include/asm/kvm_host.h | 2 +-
 arch/powerpc/kvm/book3s_64_vio.c    | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/as=
m/kvm_host.h
index 080a7feb7731..3aed653373a5 100644
=2D-- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -190,7 +190,7 @@ struct kvmppc_spapr_tce_table {
 	u64 size;		/* window size in pages */
 	struct list_head iommu_tables;
 	struct mutex alloc_lock;
-	struct page *pages[0];
+	struct page *pages[];
 };

 /* XICS components, defined in book3s_xics.c */
diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64=
_vio.c
index 6365087f3160..d42b4b6d4a79 100644
=2D-- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -295,8 +295,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		return ret;

 	ret =3D -ENOMEM;
-	stt =3D kzalloc(sizeof(*stt) + npages * sizeof(struct page *),
-		      GFP_KERNEL);
+	stt =3D kzalloc(struct_size(stt, pages, npages), GFP_KERNEL);
 	if (!stt)
 		goto fail_acct;

=2D-
2.25.1

