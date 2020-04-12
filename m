Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E451A60BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 23:38:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490lVT1mzxzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 07:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmx.co.uk (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=alex.dewar@gmx.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.co.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=L1Zz+FBS; 
 dkim-atps=neutral
X-Greylist: delayed 333 seconds by postgrey-1.36 at bilbo;
 Mon, 13 Apr 2020 01:51:19 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490bnz0RtkzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 01:51:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586706666;
 bh=Ozo3Pc+S3y/l2oIB0mqBuzQkGUe1bcJdHUx4viCHUBo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=L1Zz+FBSRviVdjwHuyyvATJup/xPK2SuxWHOcI6CRYqOOBcb5xy0oL+ZZuUmuGWQp
 H7cB2wRIeuqJe3EkmUY4R+592ca8W5R6Ukl5fXpj3Kjoz/A716JIvPro6o7loiUOuX
 ybcB3pV//V6D7WQOgnFTcCOWXSCKmmoHFElfKdfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([82.19.195.159]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MmlTC-1ixuAX3jOw-00jqWo; Sun, 12 Apr 2020 17:45:24 +0200
From: Alex Dewar <alex.dewar@gmx.co.uk>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S: Remove unneeded NULL check before kfree()
Date: Sun, 12 Apr 2020 16:45:09 +0100
Message-Id: <20200412154510.36496-1-alex.dewar@gmx.co.uk>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zvL24rS43N3XslrqBtPvrvM5md1EmfOJKzhOuGBfpkdurmKL1sy
 uTI3dwu+5jue0RbfeTpwSienBHxg8f8T3xXFOQLLczXuLOaoONOFEHKMYK2NLTSgSwLm7VA
 vPUpyMYOVgqJbwZXqSP4pW2KOvNV69AGK3HL1VFG+GVx2I55airIC82U+LZtruRyUGAVd9f
 Axncb1CsQHTVM9/rg3zow==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NIVryeOfWqU=:zkG+usDpHXdVVciC/00VPS
 yNFVg6ZPKynHDCplWY3XkwfEmmZTLBiivAYSApDbtAH43RsaYpgdE8gD7Ikf3orcEoFHcthK/
 II0XVr1gjc4cAKG+sc9B5Vw5Q4j4BhXOWhPAEL47tZZDOOF7pqrHdYe7d1yUxDqMgpDUaHxzv
 duf6q9k7IlQRFN4mSx4982DykNy21tD0n2zvZeIBptPwlhLHDgxaCIriXzY/An4KLVug+JFLM
 En61B9N6Ak4mOQnogFQmflZzH5s3bTjEBTNYLLhgy6q9AvIqxqneAzrlfsLRU2LMYnJzoNsLr
 mUebpR7Qk2cRoChKaRXDFS3e+CaasMEWYi+t7UNQxmff4b4WIuWNhA6GetYBI5IcmKpCwPc+S
 d/l9W9A+xjzfaSvO/GSFhhpcBXWUNnSH4G/K/nH8kYj9LF9tRRcFwxl8QZghZO3Zx0ZH4gSq7
 ggShfm+P7HzJiuEry+O/wa5sHsPuTPFepCKsQWQ0Q8A7MTlpm85M1/Ca+pQaHm4DAjTe+3gZr
 KfsPOQsO8XMNG70Fi7yQmkoW7BZ347/uX8OiVu8AzGEWbQgBpGeWymXnSWyXiyb9f3tzHJ+A+
 SjmNscmyeebFqihFoGxHa6arEC5tJpIR4Dtqq1OOuY1N71vMIKetj3Au06JFWg3tVdzTgEDzi
 PRgN8PoAgGKsTswPqpgxp6HW/z2SCFGXXGw0xd2us5Jk6H84e+0VyGGm/Jiok9yhyUwoHbDvQ
 4fRnaxFN6kTp7SLqFOendayqX8t39aMuheRPpr+Vof4XMkDr1W07Bjp2LudRJcg2j3eO5N6My
 EsDfksPmITGMOh7cCg34SYLz3vvCQ/K/cOfr83iLL/mAExtM04+0I4hgg/+hBNNgzaJaqoqkY
 org72oWhY15rpjoRbTr7naiM4o8axKrtz7ibGHOp5y4bIjnVrIckl9zOWy9VR93GRg5LG6bxJ
 iAT5JUn7y8kAkdc4nGqCGhPiM0JpNLX6DAlyTw7ZHpmAn8/1y44Msq2hkT9VHyNNjvUEkgQme
 vY/6idMgk7LTw6BXltAa8Y8/q2Ya8pxuxATlD028TRszi03gYlc2j410h8AnYgiHSE0qiA9tN
 0oz2koLTgLtsztrTDAHe6YmvBxQjvPk6Bd4RbU84XFvqyZZzzmSFJbpBJ9dr9/IqlUTQ71E98
 /txsAXs0x0b8Yj7XimjTu7YXBSa5x4XIcRFR/nfpX1qe91RQlb0imWQ7wWl8KyuuOlShqocWo
 +VRI7njatvUIiZOyB
X-Mailman-Approved-At: Mon, 13 Apr 2020 07:36:57 +1000
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
Cc: Alex Dewar <alex.dewar@gmx.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kfree() already checks for NULL arguments, so this check is reduntant.
Remove it.

Signed-off-by: Alex Dewar <alex.dewar@gmx.co.uk>
=2D--
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s=
_hv_nested.c
index dc97e5be76f61..cad324312040b 100644
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
2.26.0

