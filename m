Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26186A7F0B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 11:15:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NdSs11M8zDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 19:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="WOAkbL6n"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NdQk1KnMzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 19:13:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1567588367;
 bh=erboD3okc2cClzFRELGO4rO07/1hczP8QgGYkYnwFaU=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=WOAkbL6nemQCnAKhlfN71WX5s/KI+KSX273lV8fId0t6q6vG2cjiwgbEvMQAKk+rp
 cIVvVvtGLkjSr2Dv21KE6t9zx6itwrzTIcdU3ywMdONzVOFQalVy6lZfP9+kbrUHyt
 bIWu7a8Nu08FklM1i4BWPTchouPALGNqrQBcyTPo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.100.89]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M9os0-1huU3b2UW0-00B6Fx; Wed, 04
 Sep 2019 11:12:47 +0200
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] KVM: PPC: Book3S HV: Delete an unnecessary check before
 kfree() in __kvmhv_nested_page_fault()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <238d3e33-5222-3829-742a-ced4e71a56cd@web.de>
Date: Wed, 4 Sep 2019 11:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ruk5g4k+2Npqheqv76K9p4Y/EhFKIzXoFngCcIprZ674l05qb33
 m3ZNzJB47m/nIhkBXJXWh/zVWjQjl1UTQ5lCUCyyNfFRkUkZj/107JpMCh5XfA6gFjbVo0k
 mMX23zPElxytM97Rl3WCgxshCT1v5OQHx1PJYUmC7tQdsBkvx5oukyKTXeFr1mA6XN2+rHo
 r2HUaDoPjBIVxWQ+k24ew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1GQFJUF5KYU=:5y0LaXse5CQ17Us/5UXa4v
 nSlGH4V1B6uSKjxzTgtxJSjAjuz0DeRvDwCQy3vaKCVGUm8+oHS5I2Q5QzzodYKNAAK4DT0UY
 zCudCqSPHXbLERtX4NG04HRCuWsZpVvw+7WJbVe2T/JniwZtB+HRT45COpOIAxnmMFxgmUbsQ
 V+9eiZ9//+/QGWVI2doYT+S5mKTcf/W0mc3SyiaYR6k0RUlO4+f/R6fpCsK98cZG12RkJyUAB
 TIHHqN6icIE6id+kA3frjLd10WuS+J+0RmQFd/WcfTetIKtI10Fi30rCm7Hrhh3GpaHmzUTVG
 VpYr4Fj8nk0DOu0CYUYNz3rRE+iLLYe3eSmnhfN0p/gJ4D5g3AhB3q7NjHsKteObKY09w0f6G
 wVvnQ4ceAj5MywPCHj3TPAf3LT/v9kr7v4vnwYdahnaySzKMhzx7tLYgRPJoDpwTlYj8i7bef
 kkBjs/Nz4JVvuhzIsPZQJMnf2zmWqO2byKUVVd5KTM6o+WZoJZEqWReUJ5gnmOOrgVU702SlU
 b0MfVNoJLfjixKmXXtP+Itsacb6FDBTqQY6dkeh2soXaKCyz9op1o+mgL8UD7GNw9hZye00PX
 nHFfNnT9Xr6LkPF3NkdJ4NupmLvfZ5RULdETRMEFIPoje9uSmr+7soNEXcyn8HurIGep6EXD8
 lgPAiIM6m0GWqKHKmLAqgaHmprShAreKVDRRF8uj/kB0GEsY97dsDukhgBwJD2dr6nXObDaGO
 6vae5+UxaU6O5NYz5J8DkPUypXH0mC2N5EAsKXZwTrdw0IoVOGQPc28NmqFWxGkqaVpOqDyxH
 zJSQImeppEAW5wUXR79mhonrU6aXpqHjWks1RhDqZ1/ZG/f+1OpbVI/vTfpX/MXow0me9ZYC2
 8kFegk54PJ/Vl1g1IcqhtY4lu4vdalqtVjfWkF3/e6jHkr+E99R1Unih3P6vvsUdejj+BPEFx
 V/KOg379ndToY+W3dWL8e+sEmwB4rLLVPXIREIh9Xs6PbwEVi+ueUyLBTqs7m3pLFJ91jwuzj
 1b/a2mQKxz0jTWE+atPFbVohUauD/Wg1RgclyVAkPoOAxQIPGxKxcEdd3IoA9bYLc9zZBXLvr
 AMdpOAjqSUc4iYilrJhrUYSJGcOnUsQdPN4c+giAtVILtcVITU3xTqSd2zaPsPG6CmBB0dnqz
 i/5cpsCOLJhiB3v0SP9j47NiFDh+xF77rLjELN6Yk9lCKYDQ==
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Sep 2019 11:00:20 +0200

The kfree() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s=
_hv_nested.c
index 735e0ac6f5b2..36d21090a713 100644
=2D-- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1416,8 +1416,7 @@ static long int __kvmhv_nested_page_fault(struct kvm=
_run *run,
 	rmapp =3D &memslot->arch.rmap[gfn - memslot->base_gfn];
 	ret =3D kvmppc_create_pte(kvm, gp->shadow_pgtable, pte, n_gpa, level,
 				mmu_seq, gp->shadow_lpid, rmapp, &n_rmap);
-	if (n_rmap)
-		kfree(n_rmap);
+	kfree(n_rmap);
 	if (ret =3D=3D -EAGAIN)
 		ret =3D RESUME_GUEST;	/* Let the guest try again */

=2D-
2.23.0

