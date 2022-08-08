Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC958C924
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1c4y4LsJz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=MAJJpLOm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=MAJJpLOm;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1c4J0xdCz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964159;
	bh=0M5qpS13eLgzHYee8MKVxWGYrt0iQg2yqGtZwU3aGdU=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=MAJJpLOmv5dP4WWUjz3+3k/mV957rgW3/oPnz3WDvdF55JVzYl9+4da4nUIyEQde5
	 fp4ZpNL1yylkjW4WMjOYsxEI1SbQVi0Y0V6evCsQBgpPvCz4S3PP29D3vBuNI8w955
	 FdyD3hHW46JGuDTJWIudpTSlqEiAzvjdMRSuiaUg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1oJ7ci0mt9-007QkE; Mon, 08
 Aug 2022 15:09:19 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline() implementation
Date: Mon,  8 Aug 2022 15:09:17 +0200
Message-Id: <20220808130917.30760-5-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qbhdCVDdOCub1ozqXacRBFmeXEK1oHZl6SIb4aOtZAfxd9npLiz
 JIPE+2fdpNF9wfsoTc1Fq05gbMQbVssIrx529rpnx38ZZwh/bdchIpZuTlXNOU8kORBr51N
 OUttWVrlobZJh72zp3/GOjg13qfmgf2jAdXfTwFqcswpTzOPz3Zb1y+E+QxB5Dq5yNsGa2L
 /AiGHtqfm1EdEzr6qa2PA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UBgKY5ubY/o=:y4mAM+/YC+hjlH357pzhLS
 S1Oo26dgQQi0G3GNPLIWloPIzSYdEv9y+fkRy5kKq6Tapjmbzqd1PMccmB4swJ7gkoS1VPHsv
 B+/aK5aoO9wR1huwRixwjHFzFW9X8bXaaCBe3tfJgOzHfGM/x6I4UzK8y7/gSjSKV3bNioc4d
 a23nO7jfFxECak1p9CgZc913l8erOrMSXdvRqbOyPa+NScOFlMnCIXJiN2JQP9vOuFyBpbUCd
 eNwWTHyTDWQ+TPta9DeTql3pDf9MrSx/ekuzbLuXnxvcnlV6/QKPt8G745S8Ig7pcKDIZA3Hb
 keRlQimwz0qP23/7C7kNx3ttYi+EEpKwTPp+mW64ic366tf8+14YNjE/4l7hghbSJIG3fsF/m
 4F6w1QQfKgT8rPxu8Xm+UKVQb/kN+jnPmpWZQc8QB/QTk6TGeNu9usIZGvpqTsA6B4EjFfcVy
 c+xgsWyLN0iVsIte/kRAKjFiLBWTxJPMu/FOAxAEViXUxdYB8blZUMkaG2PeBtnTyFbqf6PtT
 m/ppniqaQYyVUvgk1Xvv29qBG+gGuTEOqnL314HzgwFp4woejXDpeTePfROdyGY9+Lru4yJKY
 CEYAH7dJAlK2Xs4Snrq3hpQIcEwLUqH1g7VahcqtkZV0Q69KnpmxUaEDgyBLfu5qCRv+JIDNj
 HvlJXR9n8yTIf6Fey5BpfmI7EGOzQ/mssNzrWX8MzX0cDupVg+Cbk1hlgPkl+cwaCXTOWlOz5
 m+OPAHfwa77r5nTBke2ofYJ51SkCtHh0ukFqur0Lzvt2Cg6BRQvQpHT9asgfRbd7tVlOmTJwf
 8kl4XJDBAq0Qf/BxMmbHkYrEDZm1I04+HUjy7j58P5LiUZuLMWceAiFVHUTPOHg4Zj7hfLugL
 VLIgvAOwrOqjINCRrmkB6V/lN8vbnrRcaTfxGAYfFmdm0zPIOFJLFbRadQE//zskDBdh4+vCD
 SV8OZMvI+eCduWQJUXhMjp2yp7kTN9+hRq/abYJqStonqK9U1M54jkuhk3A+PXjDPkfM5SN8W
 7Hf8quu804dluN9yRLhnD3XHGCEErG9sCGDZ9CfjBhkqy0qrOm6zTa5bJd/swDqzUCx9Bp/Hm
 LWtAFNsvYuYAvaE6CcXszUWJFsPIxTycLTSZDmdOHyy1A9d0bv5bV1Xfg==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The process program name and command line is now shown in generic code
in dump_stack_print_info(), so drop the arc-specific implementation.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 arch/arc/kernel/troubleshoot.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot=
.c
index 7654c2e42dc0..9807e590ee55 100644
=2D-- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -51,29 +51,6 @@ static void print_regs_callee(struct callee_regs *regs)
 		regs->r24, regs->r25);
 }

-static void print_task_path_n_nm(struct task_struct *tsk)
-{
-	char *path_nm =3D NULL;
-	struct mm_struct *mm;
-	struct file *exe_file;
-	char buf[ARC_PATH_MAX];
-
-	mm =3D get_task_mm(tsk);
-	if (!mm)
-		goto done;
-
-	exe_file =3D get_mm_exe_file(mm);
-	mmput(mm);
-
-	if (exe_file) {
-		path_nm =3D file_path(exe_file, buf, ARC_PATH_MAX-1);
-		fput(exe_file);
-	}
-
-done:
-	pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : "?");
-}
-
 static void show_faulting_vma(unsigned long address)
 {
 	struct vm_area_struct *vma;
@@ -176,7 +153,6 @@ void show_regs(struct pt_regs *regs)
 	 */
 	preempt_enable();

-	print_task_path_n_nm(tsk);
 	show_regs_print_info(KERN_INFO);

 	show_ecr_verbose(regs);
=2D-
2.37.1

